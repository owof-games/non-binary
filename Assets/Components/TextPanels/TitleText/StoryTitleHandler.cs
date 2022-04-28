using System.Text;
using UnityEngine;
using TMPro;
using UnityAtoms.BaseAtoms;

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

    private string _Text = null;

    private float? _StartAnimationTime = null;

    public FloatReference SingleLetterFadeInTime;

    public FloatReference NumLettersFadeInPerSecond;

    public FloatReference InitialFadeInDelay;

    private static string SplitBr(string text)
    {
        return text.Replace("<br/>", "\n");
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
            _Text = SplitBr(_StoryStep.Text);
            _StringBuilder = new StringBuilder(_StoryStep.Text.Length * "<color=#ffffff>x</color>".Length);
            TextIsFadingIn.Value = true;
            _StartAnimationTime = Time.time;
        }
        else
        {
            _Text = null;
            _TextMeshPro.enabled = false;
        }
    }

    private StringBuilder _StringBuilder = null;

    public BoolVariable TextIsFadingIn;

    private void Update()
    {
        if (_StartAnimationTime.HasValue)
        {
            float dt = Time.time - _StartAnimationTime.Value - InitialFadeInDelay;
            _StringBuilder.Clear();
            var timeBetweenLetters = 1f / NumLettersFadeInPerSecond;
            float lastX = 0;
            for (var i = 0; i < _Text.Length; i++)
            {
                var x = (dt - i * timeBetweenLetters) / SingleLetterFadeInTime;
                _StringBuilder.Append("<color=#");
                var color = Color.Lerp(Color.black, Color.white, x);
                _StringBuilder.Append(ColorUtility.ToHtmlStringRGB(color));
                _StringBuilder.Append(">");
                _StringBuilder.Append(_Text[i]);
                _StringBuilder.Append("</color>");
                lastX = x;
            }
            _TextMeshPro.text = _StringBuilder.ToString();
            if (lastX >= 1)
            {
                TextIsFadingIn.Value = false;
                _StartAnimationTime = null;
            }
        }
    }

    public void OnSkipToFadeInTextEnd()
    {
        if (_StartAnimationTime.HasValue)
        {
            // move the beginning of the animation so far back that it will surely complete at the next frame
            _StartAnimationTime = 0;
        }
    }
}
