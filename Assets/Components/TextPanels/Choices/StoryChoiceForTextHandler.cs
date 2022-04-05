using UnityEngine;
using TMPro;
using RG.LogLibrary;
public class StoryChoiceForTextHandler : MonoBehaviour
{
    private TextMeshProUGUI _Text;

    private StoryStep _LastStoryStep;

    private void Awake()
    {
        _Text = GetComponent<TextMeshProUGUI>();
        UpdateText();
    }

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        _LastStoryStep = storyStep;
        UpdateText();
    }

    private void UpdateText()
    {
        if (_Text != null)
        {
            _Text.text = _LastStoryStep.Kind == StoryStepKind.Choice ? _LastStoryStep.Text : "";
        }
    }
}
