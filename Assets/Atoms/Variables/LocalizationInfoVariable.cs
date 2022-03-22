using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Variable of type `LocalizationInfo`. Inherits from `EquatableAtomVariable&lt;LocalizationInfo, LocalizationInfoPair, LocalizationInfoEvent, LocalizationInfoPairEvent, LocalizationInfoLocalizationInfoFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/LocalizationInfo", fileName = "LocalizationInfoVariable")]
    public sealed class LocalizationInfoVariable : EquatableAtomVariable<LocalizationInfo, LocalizationInfoPair, LocalizationInfoEvent, LocalizationInfoPairEvent, LocalizationInfoLocalizationInfoFunction>
    {
    }
}
