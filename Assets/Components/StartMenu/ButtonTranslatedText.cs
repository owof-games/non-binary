using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using TMPro;

public class ButtonTranslatedText : MonoBehaviour
{
    public StringConstant ItalianText;
    public StringConstant EnglishText;

    private TextMeshProUGUI _Text = null;
    public LocalizationInfoVariable LocalizationInfoVariable;
    public LocalizationInfoEvent LocalizationInfoChanged;

    private void OnLocalizationInfoChanged(LocalizationInfo localizationInfo)
    {
        UpdateText();
    }

    private void UpdateText()
    {
        if (_Text != null && ItalianText && EnglishText)
        {
            _Text.text = LocalizationInfoVariable.Value.Current == LocalizationInfo.Languages.Italian ?
                ItalianText.Value :
                EnglishText.Value;
        }
    }

    public void OnTextUpdated()
    {
        UpdateText();
    }

    // Start is called before the first frame update
    void Awake()
    {
        _Text = GetComponentInChildren<TextMeshProUGUI>();
        UpdateText();
    }

    private void OnEnable()
    {
        LocalizationInfoChanged.Register(this.OnLocalizationInfoChanged);
    }

    private void OnDisable()
    {
        LocalizationInfoChanged.Unregister(this.OnLocalizationInfoChanged);
    }

}
