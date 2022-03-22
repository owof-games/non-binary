using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `SizePair`. Inherits from `AtomEvent&lt;SizePair&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/SizePair", fileName = "SizePairEvent")]
    public sealed class SizePairEvent : AtomEvent<SizePair>
    {
    }
}
