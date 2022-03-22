using UnityEngine;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Value List of type `InputAction.CallbackContext`. Inherits from `AtomValueList&lt;InputAction.CallbackContext, InputAction_CallbackContextEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-piglet")]
    [CreateAssetMenu(menuName = "Unity Atoms/Value Lists/InputAction_CallbackContext", fileName = "InputAction_CallbackContextValueList")]
    public sealed class InputAction_CallbackContextValueList : AtomValueList<InputAction.CallbackContext, InputAction_CallbackContextEvent> { }
}
