using UnityEngine;
using TMPro;
using UnityAtoms;

public class StoryTitleHandler : MonoBehaviour
{
    private TextMeshProUGUI _TextMeshPro;

    private void Awake()
    {
        _TextMeshPro = GetComponent<TextMeshProUGUI>();
    }

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        if (storyStep.Kind == StoryStepKind.Text && storyStep.IsTitle)
        {
            _TextMeshPro.enabled = true;
            _TextMeshPro.text = storyStep.Text;
        }
        else
        {
            _TextMeshPro.enabled = false;
        }
    }
}
