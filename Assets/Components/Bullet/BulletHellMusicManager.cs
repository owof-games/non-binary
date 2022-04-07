using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

[CreateAssetMenu(fileName = "BulletHellMusicManager", menuName = "non-binary/Create Bullet Hell Music Manager", order = 0)]
public class BulletHellMusicManager : BaseManager
{
    public StringVariable BackgroundMusicName;

    public StoryStepPairEvent StoryStepPairChanged;

    protected override void OnEnableManager()
    {
        RegisterTo(StoryStepPairChanged, OnStoryStepPairChanged);
    }

    private void OnStoryStepPairChanged(StoryStepPair storyStepPair)
    {
        var from = storyStepPair.Item2;
        var to = storyStepPair.Item1;
        if (to.AlmostThere)
        {
            BackgroundMusicName.Value = "";
        }
        else if (to.IsBulletHell)
        {
            BackgroundMusicName.Value = "bullet_hell_" + storyStepPair.Item1.BulletHellName;
        }
        else if (from.IsBulletHell && !to.IsBulletHell)
        {
            BackgroundMusicName.Value = "street";
        }
    }
}