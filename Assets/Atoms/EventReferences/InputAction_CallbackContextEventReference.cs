using System;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `InputAction.CallbackContext`. Inherits from `AtomEventReference&lt;InputAction.CallbackContext, InputAction.CallbackContextVariable, InputAction_CallbackContextEvent, InputAction.CallbackContextVariableInstancer, InputAction_CallbackContextEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class InputAction_CallbackContextEventReference : AtomEventReference<
        InputAction.CallbackContext,
        InputAction_CallbackContextVariable,
        InputAction_CallbackContextEvent,
        InputAction_CallbackContextVariableInstancer,
        InputAction_CallbackContextEventInstancer>, IGetEvent
    { }
}
