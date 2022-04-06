using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Value List of type `FullLayout`. Inherits from `AtomValueList&lt;FullLayout, FullLayoutEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-piglet")]
    [CreateAssetMenu(menuName = "Unity Atoms/Value Lists/FullLayout", fileName = "FullLayoutValueList")]
    public sealed class FullLayoutValueList : AtomValueList<FullLayout, FullLayoutEvent> { }
}
