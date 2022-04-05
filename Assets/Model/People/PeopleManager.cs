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

    private void OnStoryStepChanged(StoryStep obj)
    {
        if (obj.ShowPeople)
        {
            PeopleVisible.Value = true;
        }
        if (obj.Completion != -1)
        {
            PeoplePercentage.Value = obj.Completion / 100f;
        }
    }
}