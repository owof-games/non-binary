using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `LocalizationInfoPair`. Inherits from `AtomEvent&lt;LocalizationInfoPair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/LocalizationInfoPair", fileName = "LocalizationInfoPairEvent")]
    public sealed class LocalizationInfoPairEvent : AtomEvent<LocalizationInfoPair>
    {
    }
}
