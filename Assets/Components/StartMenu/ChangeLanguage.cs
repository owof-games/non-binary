using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityAtoms;

public class ChangeLanguage : MonoBehaviour
{
    public LocalizationInfoVariable LocalizationInfoVariable;

    public void OnChooseLanguage(int languageNumber)
    {
        var currentValue = LocalizationInfoVariable.Value;
        switch (languageNumber)
        {
            case 0:
                currentValue.Current = LocalizationInfo.Languages.Italian;
                break;
            case 1:
                currentValue.Current = LocalizationInfo.Languages.English;
                break;
            default:
                return;
        }
        LocalizationInfoVariable.Value = currentValue;
    }
}
