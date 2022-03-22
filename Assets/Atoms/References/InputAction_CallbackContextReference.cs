using System;
using UnityAtoms.BaseAtoms;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Reference of type `InputAction.CallbackContext`. Inherits from `AtomReference&lt;InputAction.CallbackContext, InputAction_CallbackContextPair, InputAction_CallbackContextConstant, InputAction_CallbackContextVariable, InputAction_CallbackContextEvent, InputAction_CallbackContextPairEvent, InputAction_CallbackContextInputAction_CallbackContextFunction, InputAction_CallbackContextVariableInstancer, AtomCollection, AtomList&gt;`.
    /// </summary>
    [Serializable]
    public sealed class InputAction_CallbackContextReference : AtomReference<
        InputAction.CallbackContext,
        InputAction_CallbackContextPair,
        InputAction_CallbackContextConstant,
        InputAction_CallbackContextVariable,
        InputAction_CallbackContextEvent,
        InputAction_CallbackContextPairEvent,
        InputAction_CallbackContextInputAction_CallbackContextFunction,
        InputAction_CallbackContextVariableInstancer>, IEquatable<InputAction_CallbackContextReference>
    {
        public InputAction_CallbackContextReference() : base() { }
        public InputAction_CallbackContextReference(InputAction.CallbackContext value) : base(value) { }
        public bool Equals(InputAction_CallbackContextReference other) { return base.Equals(other); }
        protected override bool ValueEquals(InputAction.CallbackContext other)
        {
            throw new NotImplementedException();
        }
    }
}
