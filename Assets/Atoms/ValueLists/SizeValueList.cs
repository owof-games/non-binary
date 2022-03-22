using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Value List of type `Size`. Inherits from `AtomValueList&lt;Size, SizeEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-piglet")]
    [CreateAssetMenu(menuName = "Unity Atoms/Value Lists/Size", fileName = "SizeValueList")]
    public sealed class SizeValueList : AtomValueList<Size, SizeEvent> { }
}
