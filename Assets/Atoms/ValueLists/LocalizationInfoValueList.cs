using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Value List of type `LocalizationInfo`. Inherits from `AtomValueList&lt;LocalizationInfo, LocalizationInfoEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-piglet")]
    [CreateAssetMenu(menuName = "Unity Atoms/Value Lists/LocalizationInfo", fileName = "LocalizationInfoValueList")]
    public sealed class LocalizationInfoValueList : AtomValueList<LocalizationInfo, LocalizationInfoEvent> { }
}
