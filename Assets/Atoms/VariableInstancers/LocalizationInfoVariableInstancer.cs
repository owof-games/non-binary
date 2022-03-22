using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Variable Instancer of type `LocalizationInfo`. Inherits from `AtomVariableInstancer&lt;LocalizationInfoVariable, LocalizationInfoPair, LocalizationInfo, LocalizationInfoEvent, LocalizationInfoPairEvent, LocalizationInfoLocalizationInfoFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/LocalizationInfo Variable Instancer")]
    public class LocalizationInfoVariableInstancer : AtomVariableInstancer<
        LocalizationInfoVariable,
        LocalizationInfoPair,
        LocalizationInfo,
        LocalizationInfoEvent,
        LocalizationInfoPairEvent,
        LocalizationInfoLocalizationInfoFunction>
    { }
}
