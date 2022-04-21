using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Variable of type `Rect`. Inherits from `EquatableAtomVariable&lt;Rect, RectPair, RectEvent, RectPairEvent, RectRectFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/Rect", fileName = "RectVariable")]
    public sealed class RectVariable : EquatableAtomVariable<Rect, RectPair, RectEvent, RectPairEvent, RectRectFunction>
    {
    }
}
