using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Variable Instancer of type `Rect`. Inherits from `AtomVariableInstancer&lt;RectVariable, RectPair, Rect, RectEvent, RectPairEvent, RectRectFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/Rect Variable Instancer")]
    public class RectVariableInstancer : AtomVariableInstancer<
        RectVariable,
        RectPair,
        Rect,
        RectEvent,
        RectPairEvent,
        RectRectFunction>
    { }
}
