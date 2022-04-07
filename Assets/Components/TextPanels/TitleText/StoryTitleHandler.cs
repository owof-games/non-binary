using UnityEngine;
using TMPro;
using UnityAtoms;

public class StoryTitleHandler : MonoBehaviour
{
    public TextMeshProUGUI TextMeshPro;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        if (storyStep.Kind == StoryStepKind.Text && storyStep.IsTitle)
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
