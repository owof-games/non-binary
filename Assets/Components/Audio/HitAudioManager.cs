using UnityEngine;
using UnityAtoms.BaseAtoms;

[CreateAssetMenu(fileName = "HitAudioManager", menuName = "non-binary/Create Hit Audio Manager", order = 0)]
public class HitAudioManager : BaseManager
{
    public VoidEvent HitEvent;
    public StringEvent PlaySFX;

    public string SFXHitName;

    protected override void OnEnableManager()
    {
        RegisterTo(HitEvent, OnHitEvent);
    }

    private void OnHitEvent()
    {
        PlaySFX.Raise(SFXHitName);
    }
}