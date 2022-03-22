using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Set variable value Action of type `Size`. Inherits from `SetVariableValue&lt;Size, SizePair, SizeVariable, SizeConstant, SizeReference, SizeEvent, SizePairEvent, SizeVariableInstancer&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-purple")]
    [CreateAssetMenu(menuName = "Unity Atoms/Actions/Set Variable Value/Size", fileName = "SetSizeVariableValue")]
    public sealed class SetSizeVariableValue : SetVariableValue<
        Size,
        SizePair,
        SizeVariable,
        SizeConstant,
        SizeReference,
        SizeEvent,
        SizePairEvent,
        SizeSizeFunction,
        SizeVariableInstancer>
    { }
}
