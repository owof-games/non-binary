using System.Text.RegularExpressions;
using UnityAtoms.BaseAtoms;
using UnityEngine;
using RG.LogLibrary;

public class WordBullets : MonoBehaviour
{
    public FullLayout FullLayout { private get; set; }

    [SerializeField]
    private GameObject _PinkBullet;

    [SerializeField]
    private GameObject _BlueBullet;

    [SerializeField]
    private GameObject _MainCharacter;

    [SerializeField]
    private FloatReference _WordBulletSpeed;

    [SerializeField]
    private StringEvent _PlaySFX;

    [SerializeField]
    private float _ExtraRotationM;

    [SerializeField]
    private float _ExtraRotationF;

    public void OnStoryStepChanged(StoryStep newStoryStep)
    {
        if (newStoryStep.Kind == StoryStepKind.Text)
        {
            var mBullets = newStoryStep.NumMTags;
            var fBullets = newStoryStep.NumFTags;
            for (var i = 0; i < mBullets; i++)
            {
                LaunchBullet(_BlueBullet, FullLayout.Street.World.xMin, FullLayout.LeftSideText.World.yMin, FullLayout.LeftSideText.World.yMax, _ExtraRotationM);
            }
            for (var i = 0; i < fBullets; i++)
            {
                LaunchBullet(_PinkBullet, FullLayout.Street.World.xMax, FullLayout.RightSideText.World.yMin, FullLayout.RightSideText.World.yMax, _ExtraRotationF);
            }
        }
    }

    private void LaunchBullet(GameObject bullet, float x, float yMin, float yMax, float r)
    {
        var y = Random.Range(yMin, yMax);
        this.Info("Launching a bullet with x = {0} and y between {1} and {2} (using {3})", x, yMin, yMax, y);
        var startPosition = new Vector3(x, y, _MainCharacter.transform.position.z);
        var direction = _MainCharacter.transform.position - startPosition;
        var r2 = Mathf.Rad2Deg * Mathf.Atan2(direction.y, direction.x);
        var fullQuaternion = Quaternion.AngleAxis(r + r2, Vector3.forward);
        // instantiate
        var go = Instantiate(bullet, startPosition, fullQuaternion, transform);
        // setup
        var velocityComponent = go.GetComponent<Velocity>();
        velocityComponent.Setup(new Velocity.Description()
        {
            InitialVelocity = _WordBulletSpeed.Value * direction.normalized,
            InitialPosition = startPosition
        });
        // emit a sound to attract attention
        _PlaySFX.Raise("hit");
    }
}