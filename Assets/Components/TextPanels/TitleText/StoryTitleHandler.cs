using UnityEngine;
using TMPro;

public class StoryTitleHandler : MonoBehaviour
{
    private TextMeshProUGUI _TextMeshPro;

    private StoryStep _StoryStep;

    private void Awake()
    {
        _TextMeshPro = GetComponent<TextMeshProUGUI>();
        UpdateTMPro();
    }

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        _StoryStep = storyStep;
        UpdateTMPro();
    }
    private void UpdateTMPro()
    {
        if (!_TextMeshPro)
        {
            return;
        }
        if (_StoryStep.Kind == StoryStepKind.Text && _StoryStep.IsTitle)
        {
            _TextMeshPro.enabled = true;
            _TextMeshPro.text = _StoryStep.Text;
        }
        else
        {
            _TextMeshPro.enabled = false;
        }
    }
}
