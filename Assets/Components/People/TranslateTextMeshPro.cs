using UnityEngine;
using UnityAtoms.BaseAtoms;
using TMPro;

public class TranslateTextMeshPro : MonoBehaviour
{
    public StringConstant ItalianText;
    public StringConstant EnglishText;
    public StringConstant SpanishText;

    private TextMeshProUGUI _Text = null;

    private void Awake()
    {
        _Text = GetComponentInChildren<TextMeshProUGUI>();
        UpdateText();
    }

    private LocalizationInfo _LocalizationInfo;

    public void OnLocalizationInfoChanged(LocalizationInfo localizationInfo)
    {
        _LocalizationInfo = localizationInfo;
        UpdateText();
    }

    private static string SplitBr(string text)
    {
        return text.Replace("<br/>", "\n");
    }

    private void UpdateText()
    {
        if (_Text == null)
        {
            return;
        }
        _Text.text = SplitBr(_LocalizationInfo.Current switch
        {
            LocalizationInfo.Languages.Italian => ItalianText.Value,
            LocalizationInfo.Languages.English => EnglishText.Value,
            LocalizationInfo.Languages.Spanish => SpanishText.Value,
            _ => ""
        });
    }
}
