using UnityEngine;
using UnityAtoms;

public class ChangeLanguage : MonoBehaviour
{
    public LocalizationInfoVariable LocalizationInfoVariable;

    public StoryManager StoryManager;

    public TextAsset ItalianInkJSONAsset;

    public TextAsset EnglishInkJSONAsset;

    public void OnChooseLanguage(int languageNumber)
    {
        var currentValue = LocalizationInfoVariable.Value;
        switch (languageNumber)
        {
            case 0:
                currentValue.Current = LocalizationInfo.Languages.Italian;
                StoryManager.InkJSONAsset = ItalianInkJSONAsset;
                break;
            case 1:
                currentValue.Current = LocalizationInfo.Languages.English;
                StoryManager.InkJSONAsset = EnglishInkJSONAsset;
                break;
            default:
                return;
        }
        LocalizationInfoVariable.Value = currentValue;
    }
}
