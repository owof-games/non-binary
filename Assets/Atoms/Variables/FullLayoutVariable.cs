using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Variable of type `FullLayout`. Inherits from `EquatableAtomVariable&lt;FullLayout, FullLayoutPair, FullLayoutEvent, FullLayoutPairEvent, FullLayoutFullLayoutFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/FullLayout", fileName = "FullLayoutVariable")]
    public sealed class FullLayoutVariable : EquatableAtomVariable<FullLayout, FullLayoutPair, FullLayoutEvent, FullLayoutPairEvent, FullLayoutFullLayoutFunction>
    {
    }
}
