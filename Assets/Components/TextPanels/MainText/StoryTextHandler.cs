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

    [SerializeField]
    private FloatReference _GenderedWordsAnimationDuration;

    private float? _StartAnimationTime = null;

    private string _LastText;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        this.Info("Received a storystep: {0}", storyStep);
        this.Info("Actual storyStep: {0}", _StoryStepVariable.Value);
        if (storyStep.Kind == StoryStepKind.Text && !storyStep.IsTitle)
        {
            TextMeshPro.enabled = true;
            _LastText = storyStep.Text;
            _StartAnimationTime = Time.time;
            // TextMeshPro.text = TextHelpers.TransformGenderTags(storyStep.Text, _MColor.Value, _FColor.Value);
        }
        else
        {
            TextMeshPro.enabled = false;
            _StartAnimationTime = null;
        }
    }

    private void Update()
    {
        if (_StartAnimationTime.HasValue)
        {
            var t = (Time.time - _StartAnimationTime.Value) / _GenderedWordsAnimationDuration;
            TextMeshPro.text = TextHelpers.TransformGenderTags(_LastText, _MColor.Value, _FColor.Value, t);
            if (t >= 1)
            {
                _StartAnimationTime = null;
            }
        }
    }
}
