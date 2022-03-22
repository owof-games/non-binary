using UnityEngine;
using UnityAtoms.BaseAtoms;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Variable Instancer of type `InputAction.CallbackContext`. Inherits from `AtomVariableInstancer&lt;InputAction_CallbackContextVariable, InputAction_CallbackContextPair, InputAction.CallbackContext, InputAction_CallbackContextEvent, InputAction_CallbackContextPairEvent, InputAction_CallbackContextInputAction_CallbackContextFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/InputAction_CallbackContext Variable Instancer")]
    public class InputAction_CallbackContextVariableInstancer : AtomVariableInstancer<
        InputAction_CallbackContextVariable,
        InputAction_CallbackContextPair,
        InputAction.CallbackContext,
        InputAction_CallbackContextEvent,
        InputAction_CallbackContextPairEvent,
        InputAction_CallbackContextInputAction_CallbackContextFunction>
    { }
}
