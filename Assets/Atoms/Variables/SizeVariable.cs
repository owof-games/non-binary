using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Variable of type `Size`. Inherits from `EquatableAtomVariable&lt;Size, SizePair, SizeEvent, SizePairEvent, SizeSizeFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/Size", fileName = "SizeVariable")]
    public sealed class SizeVariable : EquatableAtomVariable<Size, SizePair, SizeEvent, SizePairEvent, SizeSizeFunction>
    {
    }
}
