using System.Collections;
using UnityEngine;
using UnityEngine.Playables;
using UnityAtoms.BaseAtoms;

public class StartEnterEditModeTimeline : MonoBehaviour
{
    public float TimeBeforeStartingEditMode = 5f;

    public MeshRenderer MainCharacter;

    public StringVariable ActionMap;

    public FullLayout FullLayout { private get; set; }

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        if (storyStep.IsCharacterCreation)
        {
            StartCoroutine(GoToEditMode());
        }
    }

    private IEnumerator GoToEditMode()
    {
        yield return new WaitForSeconds(TimeBeforeStartingEditMode);
        // stop movement input
        ActionMap.Value = "";
        // choose the focus
        var meshBoundingBox = MainCharacter.bounds;
        var minBallPercentage = Rect.PointToNormalized(FullLayout.Scene.World, meshBoundingBox.min);
        var maxBallPercentage = Rect.PointToNormalized(FullLayout.Scene.World, meshBoundingBox.max);
        var w = maxBallPercentage.x - minBallPercentage.x;
        var h = maxBallPercentage.y - minBallPercentage.y;
        var focusRect = new Rect(
            minBallPercentage.x - w * 1.5f / 4f,
            minBallPercentage.y - h * 2.5f / 4f,
            w * 16f / 4f,
            h * 9f / 4f
        );
        GetComponent<SetCameraFocus>().Value2 = focusRect;
        // play the animation
        GetComponent<PlayableDirector>().Play();
    }
}
