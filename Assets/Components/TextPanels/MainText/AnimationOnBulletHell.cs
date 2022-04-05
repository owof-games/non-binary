using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityAtoms;
using RG.LogLibrary;

public class AnimationOnBulletHell : MonoBehaviour
{
    public PlayableDirector PlayableDirector;

    public void OnStoryStepChanged(StoryStepPair storySteps)
    {
        this.Verbose("Received a story step change from {0} to {1}", storySteps.Item2, storySteps.Item1);
        if (!storySteps.Item2.IsBulletHell && storySteps.Item1.IsBulletHell)
        {
            this.Info("Starting animation!");
            PlayableDirector.Play();
        }
    }
}
