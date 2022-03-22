using UnityEngine;
using System;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Variable of type `InputAction.CallbackContext`. Inherits from `AtomVariable&lt;InputAction.CallbackContext, InputAction_CallbackContextPair, InputAction_CallbackContextEvent, InputAction_CallbackContextPairEvent, InputAction_CallbackContextInputAction_CallbackContextFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/InputAction_CallbackContext", fileName = "InputAction_CallbackContextVariable")]
    public sealed class InputAction_CallbackContextVariable : AtomVariable<InputAction.CallbackContext, InputAction_CallbackContextPair, InputAction_CallbackContextEvent, InputAction_CallbackContextPairEvent, InputAction_CallbackContextInputAction_CallbackContextFunction>
    {
        protected override bool ValueEquals(InputAction.CallbackContext other)
        {
            return false;
        }
    }
}
