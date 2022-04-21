using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Set variable value Action of type `Rect`. Inherits from `SetVariableValue&lt;Rect, RectPair, RectVariable, RectConstant, RectReference, RectEvent, RectPairEvent, RectVariableInstancer&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-purple")]
    [CreateAssetMenu(menuName = "Unity Atoms/Actions/Set Variable Value/Rect", fileName = "SetRectVariableValue")]
    public sealed class SetRectVariableValue : SetVariableValue<
        Rect,
        RectPair,
        RectVariable,
        RectConstant,
        RectReference,
        RectEvent,
        RectPairEvent,
        RectRectFunction,
        RectVariableInstancer>
    { }
}
