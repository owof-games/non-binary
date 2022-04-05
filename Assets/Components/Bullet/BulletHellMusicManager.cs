using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using System;

[CreateAssetMenu(fileName = "BulletHellMusicManager", menuName = "non-binary/Create Bullet Hell Music Manager", order = 0)]
public class BulletHellMusicManager : BaseManager
{
    public StringVariable BackgroundMusicName;

    public StoryStepEvent StoryStepChanged;

    protected override void OnEnableManager()
    {
        RegisterTo(StoryStepChanged, OnStoryStepChanged);
    }

    private void OnStoryStepChanged(StoryStep obj)
    {
        if (obj.AlmostThere)
        {
            BackgroundMusicName.Value = "";
        }
        else if (obj.IsBulletHell)
        {
            BackgroundMusicName.Value = "bullet_hell_" + obj.BulletHellName;
        }
    }
}