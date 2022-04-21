using UnityEngine;
using UnityAtoms.BaseAtoms;
using TMPro;

public class TranslateTextMeshPro : MonoBehaviour
{
    public StringConstant ItalianText;
    public StringConstant EnglishText;

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

    private void UpdateText()
    {
        if (_Text == null)
        {
            return;
        }
        _Text.text = _LocalizationInfo.Current switch
        {
            LocalizationInfo.Languages.Italian => ItalianText.Value,
            LocalizationInfo.Languages.English => EnglishText.Value,
            _ => ""
        };
    }
}
