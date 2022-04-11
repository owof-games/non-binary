using System.Linq;
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

    [SerializeField]
    private GameObject _PinkBullet;

    [SerializeField]
    private GameObject _BlueBullet;

    private BulletSource.Description[] _Descriptions;

    private float? _TotalDuration;

    private float? _StartingTime;

    [SerializeField]
    private VoidEvent _NextLineEvent;

    [SerializeField]
    private IntConstant _DesignScreenWidth;

    public void StartBulletHell()
    {
        _StartingTime = Time.time;
    }

    public void OnStoryStepChanged(StoryStep newStoryStep)
    {
        if (newStoryStep.IsBulletHell)
        {
            string bulletHellName = newStoryStep.BulletHellName;
            foreach (var bulletSourceEntry in _BulletSources)
            {
                if (bulletSourceEntry.Name == bulletHellName)
                {
                    _Descriptions = bulletSourceEntry.BulletSource.Descriptions;
                    System.Array.Sort(_Descriptions, (value1, value2) =>
                    {
                        return value1.DeltaTime.CompareTo(value2.DeltaTime);
                    });
                    _StartingTime = Time.time;
                    _TotalDuration = Enumerable.Max(
                        from description
                        in _Descriptions
                        select description.DeltaTime + description.LifeDuration)
                        + 1;
                    _CurrentIndex = -1;
                    this.Info("setup bullet hell {0} at time {1} with total duration {2}",
                        bulletSourceEntry.Name, _StartingTime, _TotalDuration);
                    return;
                }
            }
            this.Error("Could not find bullet source with name ", newStoryStep.BulletHellName);
        }
    }

    private int _CurrentIndex = -1;

    public Size ScreenSize
    {
        private get; set;
    }

    private void Update()
    {
        if (!_StartingTime.HasValue || !_TotalDuration.HasValue)
        {
            return;
        }
        if (_StartingTime.HasValue && _TotalDuration.HasValue && Time.time > _StartingTime.Value + _TotalDuration.Value)
        {
            _StartingTime = null;
            _TotalDuration = null;
            _NextLineEvent.Raise();
            return;
        }
        var relativeTime = Time.time - _StartingTime;
        var ratio = ((float)ScreenSize.ProportionalWidth) / _DesignScreenWidth.Value;
        while (_CurrentIndex < _Descriptions.Length - 1 &&
            relativeTime >= _Descriptions[_CurrentIndex + 1].DeltaTime)
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
            _CurrentIndex++;
            var description = _Descriptions[_CurrentIndex];
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
        _TotalDuration = null;
    }
}
