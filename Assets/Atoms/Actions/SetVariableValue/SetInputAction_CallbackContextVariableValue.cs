using UnityEngine;
using UnityAtoms.BaseAtoms;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Set variable value Action of type `InputAction.CallbackContext`. Inherits from `SetVariableValue&lt;InputAction.CallbackContext, InputAction_CallbackContextPair, InputAction_CallbackContextVariable, InputAction_CallbackContextConstant, InputAction_CallbackContextReference, InputAction_CallbackContextEvent, InputAction_CallbackContextPairEvent, InputAction_CallbackContextVariableInstancer&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-purple")]
    [CreateAssetMenu(menuName = "Unity Atoms/Actions/Set Variable Value/InputAction_CallbackContext", fileName = "SetInputAction_CallbackContextVariableValue")]
    public sealed class SetInputAction_CallbackContextVariableValue : SetVariableValue<
        InputAction.CallbackContext,
        InputAction_CallbackContextPair,
        InputAction_CallbackContextVariable,
        InputAction_CallbackContextConstant,
        InputAction_CallbackContextReference,
        InputAction_CallbackContextEvent,
        InputAction_CallbackContextPairEvent,
        InputAction_CallbackContextInputAction_CallbackContextFunction,
        InputAction_CallbackContextVariableInstancer>
    { }
}
