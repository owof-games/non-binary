using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using System;

[CreateAssetMenu(fileName = "PeopleManager", menuName = "non-binary/Create People Manager", order = 0)]
public class PeopleManager : BaseManager
{
    public FloatVariable PeoplePercentage;

    public BoolVariable PeopleVisible;

    public StoryStepEvent StoryStepChanged;

    protected override void OnEnableManager()
    {
        RegisterTo(StoryStepChanged, OnStoryStepChanged);
    }

    private void OnStoryStepChanged(StoryStep storyStep)
    {
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
    }
}