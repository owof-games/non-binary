using UnityEngine;
using TMPro;

public class StoryTextHandler : MonoBehaviour
{
    public TextMeshProUGUI TextMeshPro;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
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
