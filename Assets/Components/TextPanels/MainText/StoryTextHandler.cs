using UnityEngine;
using TMPro;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class StoryTextHandler : MonoBehaviour
{
    public TextMeshProUGUI TextMeshPro;

    [SerializeField]
    private StoryStepVariable _StoryStepVariable;

    [SerializeField]
    private ColorReference _FColor;

    [SerializeField]
    private ColorReference _MColor;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        this.Info("Received a storystep: {0}", storyStep);
        this.Info("Actual storyStep: {0}", _StoryStepVariable.Value);
        if (storyStep.Kind == StoryStepKind.Text)
        {
            TextMeshPro.enabled = true;
            TextMeshPro.text = TextHelpers.TransformGenderTags(storyStep.Text, _MColor.Value, _FColor.Value);
        }
        else
        {
            TextMeshPro.enabled = false;
        }
    }
}
