using System;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `InputAction_CallbackContextPair`. Inherits from `AtomEventReference&lt;InputAction_CallbackContextPair, InputAction.CallbackContextVariable, InputAction_CallbackContextPairEvent, InputAction.CallbackContextVariableInstancer, InputAction_CallbackContextPairEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class InputAction_CallbackContextPairEventReference : AtomEventReference<
        InputAction_CallbackContextPair,
        InputAction_CallbackContextVariable,
        InputAction_CallbackContextPairEvent,
        InputAction_CallbackContextVariableInstancer,
        InputAction_CallbackContextPairEventInstancer>, IGetEvent
    { }
}
