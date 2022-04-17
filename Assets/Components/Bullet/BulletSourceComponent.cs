using System.Collections.Generic;
using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class BulletSourceComponent : MonoBehaviour
{
    [System.Serializable]
    public struct BulletSourceEntry
    {
        public string Name;
        public BulletSource BulletSource;
    }

    [SerializeField]
    private BulletSourceEntry[] _BulletSources;

    private List<BulletSource> _PlayedBulletSources = new List<BulletSource>();

    [SerializeField]
    private GameObject _PinkBullet;

    [SerializeField]
    private GameObject _BlueBullet;

    private float? _StartingTime;

    [SerializeField]
    private VoidEvent _NextLineEvent;

    [SerializeField]
    private IntConstant _DesignScreenWidth;

    [SerializeField]
    private IntConstant _StandardBulletDamage;

    public void StartBulletHell()
    {
        _StartingTime = Time.time;
    }

    public void OnStoryStepChanged(StoryStep newStoryStep)
    {
        if (newStoryStep.ShowStreet)
        {
            // we're at the beginning: reset the list
            _PlayedBulletSources.Clear();
        }
        if (newStoryStep.IsBulletHell)
        {
            string bulletHellName = newStoryStep.BulletHellName;
            foreach (var bulletSourceEntry in _BulletSources)
            {
                if (bulletSourceEntry.Name == bulletHellName)
                {
                    _CurrentBulletDescriptionEnumerable = bulletSourceEntry.BulletSource.Descriptions.GetEnumerator();
                    RefillDescriptions();
                    _StartingTime = Time.time;
                    _PlayedBulletSources.Add(bulletSourceEntry.BulletSource);
                    this.Info("setup bullet hell {0} at time {1}",
                        bulletSourceEntry.Name, _StartingTime);
                    return;
                }
            }
            this.Error("Could not find bullet source with name {0}", newStoryStep.BulletHellName);
        }
    }

    private List<BulletSource.Description> _Descriptions = null;

    private const int _MaxDescriptionQueueLength = 50;

    private IEnumerator<BulletSource.Description> _CurrentBulletDescriptionEnumerable = null;

    private bool _CurrentBulletDescriptionEnumerableFinished = false;

    private void RefillDescriptions()
    {
        if (_Descriptions == null)
        {
            _Descriptions = new List<BulletSource.Description>();
        }
        this.Info("refill: starting with {0} elements in queue", _Descriptions.Count);
        var hasMore = true;
        while (_Descriptions.Count < _MaxDescriptionQueueLength &&
            (hasMore = _CurrentBulletDescriptionEnumerable.MoveNext()))
        {
            _Descriptions.Add(_CurrentBulletDescriptionEnumerable.Current);
        }
        _CurrentBulletDescriptionEnumerableFinished = !hasMore;
        this.Info("refill finished with {0} elements in queue and enumable finished? {1}",
            _Descriptions.Count, _CurrentBulletDescriptionEnumerableFinished);
        _Descriptions.Sort((value1, value2) =>
        {
            return value1.DeltaTime.CompareTo(value2.DeltaTime);
        });
    }

    public Size ScreenSize
    {
        private get; set;
    }

    float _DeathOfLastBullet = 0;

    private void Update()
    {
        if (!_StartingTime.HasValue ||
            _Descriptions == null ||
            _CurrentBulletDescriptionEnumerable == null)
        {
            return;
        }
        if (_StartingTime.HasValue &&
            _CurrentBulletDescriptionEnumerableFinished &&
            _Descriptions.Count == 0 &&
            Time.time > _DeathOfLastBullet)
        {
            this.Info("Bullet hell finished!");
            StopBulletHell();
            _NextLineEvent.Raise();
            return;
        }
        var relativeTime = Time.time - _StartingTime;
        var ratio = ((float)ScreenSize.ProportionalWidth) / _DesignScreenWidth.Value;
        while (_Descriptions.Count > 0 &&
            relativeTime >= _Descriptions[0].DeltaTime)
        {
            var xScale = ScreenSize.ProportionalWidth;
            var yScale = ScreenSize.ProportionalHeight;
            var transformationMatrix = Matrix4x4.TRS(
                new Vector3((ScreenSize.Width - ScreenSize.ProportionalWidth) / 2,
                (ScreenSize.Height - ScreenSize.ProportionalHeight) / 2,
                0),
                Quaternion.identity,
                new Vector3(xScale, yScale, 1)
            );
            var description = _Descriptions[0];
            _DeathOfLastBullet = Mathf.Max(_DeathOfLastBullet, Time.time + description.LifeDuration);
            _Descriptions.RemoveAt(0);
            RefillDescriptions();
            // transform percentage coordinates in world space coordinates
            var initialPosition = GetWorldPosition(transformationMatrix, description.InitialPosition);
            var rotationCenter = GetWorldPosition(transformationMatrix, description.RotationCenter);
            description.InitialPosition = new Vector2(initialPosition.x, initialPosition.y);
            description.RotationCenter = new Vector2(rotationCenter.x, rotationCenter.y);
            for (int velocityStepIndex = 0; velocityStepIndex < description.VelocitySteps.Length; velocityStepIndex++)
            {
                var velocityStep = description.VelocitySteps[velocityStepIndex];
                var newVelocity = new Vector2(xScale * velocityStep.NewVelocity.x, yScale * velocityStep.NewVelocity.y) / ratio;
                this.Verbose("Transforming {0} into {1}", velocityStep.NewVelocity, newVelocity);
                velocityStep.NewVelocity = newVelocity;
                description.VelocitySteps[velocityStepIndex] = velocityStep;
            }
            // instantiate
            var go = Instantiate(description.IsPink ? _PinkBullet : _BlueBullet,
                new Vector3(description.InitialPosition.x, description.InitialPosition.y, transform.position.z),
                Quaternion.identity, transform);
            // setup
            var velocityComponent = go.GetComponent<Velocity>();
            velocityComponent.Setup(description);
            var destroyOnCollision = go.GetComponent<DestroyOnCollision>();
            destroyOnCollision.Damage = _StandardBulletDamage.Value;
        }
    }

    private Vector3 GetWorldPosition(Matrix4x4 transformationMatrix, Vector2 percentagePosition)
    {
        var actualScreenPosition = transformationMatrix.MultiplyPoint3x4(new Vector3(percentagePosition.x, percentagePosition.y, 0));
        var worldPosition = Camera.main.ScreenToWorldPoint(
            new Vector3(
                actualScreenPosition.x,
                actualScreenPosition.y,
                transform.position.z
            )
        );
        this.Info("Generating bullet at world position {0}, actual screen position {1}, percentage position {2}",
            worldPosition,
            actualScreenPosition,
            percentagePosition);
        return worldPosition;
    }

    public void StopBulletHell()
    {
        _StartingTime = null;
        _Descriptions = null;
        _CurrentBulletDescriptionEnumerable = null;
        _DeathOfLastBullet = 0;
    }
}
