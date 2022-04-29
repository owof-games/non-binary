using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

[CreateAssetMenu(fileName = "HitAudioManager", menuName = "non-binary/Create Hit Audio Manager", order = 0)]
public class HitAudioManager : BaseManager
{
    public StoryStepVariable StoryStepVariable;
    public IntEvent HitEvent;
    public StringEvent PlaySFX;

    public string SFXHitName;

    [System.Serializable]
    public struct BulletHellException
    {
        public string BulletHellName;
        public string SFXHitName;
    }

    public BulletHellException[] BulletHellExceptions;

    protected override void OnEnableManager()
    {
        RegisterTo(HitEvent, OnHitEvent);
    }

    private void OnHitEvent(int _)
    {
        var name = SFXHitName;
        if (StoryStepVariable.Value.IsBulletHell && BulletHellExceptions != null)
        {
            foreach (var bulletHellException in BulletHellExceptions)
            {
                if (bulletHellException.BulletHellName == StoryStepVariable.Value.BulletHellName)
                {
                    name = bulletHellException.SFXHitName;
                    break;
                }
            }
        }
        PlaySFX.Raise(name);
    }
}