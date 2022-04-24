using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

[CreateAssetMenu(fileName = "StreetAudioManager", menuName = "non-binary/Create Street Audio Manager", order = 0)]
public class StreetAudioManager : BaseManager
{
    public StringReference StreetMusicTag;

    public StringVariable BackgroundMusicName;

    public StoryStepEvent StoryStepChangedEvent;

    protected override void OnEnableManager()
    {
        RegisterTo(StoryStepChangedEvent, OnStoryStepChanged);
    }

    private void OnStoryStepChanged(StoryStep storyStep)
    {
        if (storyStep.IsTitle)
        {
            BackgroundMusicName.Value = StreetMusicTag;
        }
    }
}
