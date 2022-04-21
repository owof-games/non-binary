using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `RectPair`. Inherits from `AtomEvent&lt;RectPair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/RectPair", fileName = "RectPairEvent")]
    public sealed class RectPairEvent : AtomEvent<RectPair>
    {
    }
}
