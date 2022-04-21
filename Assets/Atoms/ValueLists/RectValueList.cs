using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Value List of type `Rect`. Inherits from `AtomValueList&lt;Rect, RectEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-piglet")]
    [CreateAssetMenu(menuName = "Unity Atoms/Value Lists/Rect", fileName = "RectValueList")]
    public sealed class RectValueList : AtomValueList<Rect, RectEvent> { }
}
