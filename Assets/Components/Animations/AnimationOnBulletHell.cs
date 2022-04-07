using UnityEngine;
using UnityEngine.Playables;
using UnityAtoms;
using RG.LogLibrary;

public class AnimationOnBulletHell : MonoBehaviour
{
    private PlayableDirector _PlayableDirector;

    public enum AnimationKind
    {
        [InspectorName("Entering a bullet hell")]
        OnEntering,
        [InspectorName("Exiting a bullet hell")]
        OnExiting
    }

    [SerializeField]
    private AnimationKind _AnimateOn;

    private void Awake()
    {
        _PlayableDirector = GetComponent<PlayableDirector>();
    }

    public void OnStoryStepChanged(StoryStepPair storySteps)
    {
        this.Verbose("moving from bullet hell = {0} to bullet hell = {1} and i'm set to {2}",
            storySteps.Item2.IsBulletHell, storySteps.Item1.IsBulletHell, _AnimateOn);
        var b = _AnimateOn == AnimationKind.OnEntering;
        if (storySteps.Item2.IsBulletHell != b && storySteps.Item1.IsBulletHell == b)
        {
            this.Verbose("triggered!");
            _PlayableDirector.Play();
        }
    }
}
