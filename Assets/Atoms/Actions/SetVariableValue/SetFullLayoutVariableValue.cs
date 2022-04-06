using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Set variable value Action of type `FullLayout`. Inherits from `SetVariableValue&lt;FullLayout, FullLayoutPair, FullLayoutVariable, FullLayoutConstant, FullLayoutReference, FullLayoutEvent, FullLayoutPairEvent, FullLayoutVariableInstancer&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-purple")]
    [CreateAssetMenu(menuName = "Unity Atoms/Actions/Set Variable Value/FullLayout", fileName = "SetFullLayoutVariableValue")]
    public sealed class SetFullLayoutVariableValue : SetVariableValue<
        FullLayout,
        FullLayoutPair,
        FullLayoutVariable,
        FullLayoutConstant,
        FullLayoutReference,
        FullLayoutEvent,
        FullLayoutPairEvent,
        FullLayoutFullLayoutFunction,
        FullLayoutVariableInstancer>
    { }
}
