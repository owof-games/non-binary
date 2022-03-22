using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Set variable value Action of type `LocalizationInfo`. Inherits from `SetVariableValue&lt;LocalizationInfo, LocalizationInfoPair, LocalizationInfoVariable, LocalizationInfoConstant, LocalizationInfoReference, LocalizationInfoEvent, LocalizationInfoPairEvent, LocalizationInfoVariableInstancer&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-purple")]
    [CreateAssetMenu(menuName = "Unity Atoms/Actions/Set Variable Value/LocalizationInfo", fileName = "SetLocalizationInfoVariableValue")]
    public sealed class SetLocalizationInfoVariableValue : SetVariableValue<
        LocalizationInfo,
        LocalizationInfoPair,
        LocalizationInfoVariable,
        LocalizationInfoConstant,
        LocalizationInfoReference,
        LocalizationInfoEvent,
        LocalizationInfoPairEvent,
        LocalizationInfoLocalizationInfoFunction,
        LocalizationInfoVariableInstancer>
    { }
}
