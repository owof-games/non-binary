using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `LocalizationInfo`. Inherits from `AtomEvent&lt;LocalizationInfo&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/LocalizationInfo", fileName = "LocalizationInfoEvent")]
    public sealed class LocalizationInfoEvent : AtomEvent<LocalizationInfo>
    {
    }
}
