using UnityEngine;
using TMPro;
using UnityAtoms.BaseAtoms;

public class StoryChoiceForTextHandler : MonoBehaviour
{
    private TextMeshProUGUI _Text;

    private StoryStep _LastStoryStep;

    [SerializeField]
    private ColorReference _FColor;

    [SerializeField]
    private ColorReference _MColor;

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
            _Text.text = _LastStoryStep.Kind == StoryStepKind.Choice ?
                TextHelpers.TransformGenderTags(_LastStoryStep.Text, _MColor.Value, _FColor.Value) :
                "";
        }
    }
}
