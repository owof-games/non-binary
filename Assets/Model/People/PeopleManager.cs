using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using System;

[CreateAssetMenu(fileName = "PeopleManager", menuName = "non-binary/Create People Manager", order = 0)]
public class PeopleManager : BaseManager
{
    public FloatVariable PeoplePercentage;

    public BoolVariable PeopleVisible;

    public StoryStepPairEvent StoryStepChanged;

    protected override void OnEnableManager()
    {
        RegisterTo(StoryStepChanged, OnStoryStepChanged);
    }

    private void OnStoryStepChanged(StoryStepPair storyStepPair)
    {
        var storyStep = storyStepPair.Item1;
        if (storyStep.ShowPeople)
        {
            PeopleVisible.Value = true;
        }
        if (storyStep.Completion != -1)
        {
            PeoplePercentage.Value = storyStep.Completion / 100f;
        }
        if (storyStep.AlmostThere)
        {
            PeoplePercentage.Value = 1;
        }
        if (storyStepPair.Item2.IsBulletHell && !storyStepPair.Item1.IsBulletHell)
        {
            PeoplePercentage.Value = 0;
        }
    }
}