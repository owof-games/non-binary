using UnityEngine;
using TMPro;
using UnityAtoms;
using RG.LogLibrary;

public class StoryTextHandler : MonoBehaviour
{
    public TextMeshProUGUI TextMeshPro;

    [SerializeField]
    private StoryStepVariable _StoryStepVariable;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        this.Info("Received a storystep: {0}", storyStep);
        this.Info("Actual storyStep: {0}", _StoryStepVariable.Value);
        if (storyStep.Kind == StoryStepKind.Text)
        {
            TextMeshPro.enabled = true;
            TextMeshPro.text = storyStep.Text;
        }
        else
        {
            TextMeshPro.enabled = false;
        }
    }
}
