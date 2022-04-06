using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `FullLayoutPair`. Inherits from `AtomEvent&lt;FullLayoutPair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/FullLayoutPair", fileName = "FullLayoutPairEvent")]
    public sealed class FullLayoutPairEvent : AtomEvent<FullLayoutPair>
    {
    }
}
