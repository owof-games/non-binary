using UnityEngine;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `InputAction.CallbackContext`. Inherits from `AtomEventReferenceListener&lt;InputAction.CallbackContext, InputAction_CallbackContextEvent, InputAction_CallbackContextEventReference, InputAction_CallbackContextUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/InputAction_CallbackContext Event Reference Listener")]
    public sealed class InputAction_CallbackContextEventReferenceListener : AtomEventReferenceListener<
        InputAction.CallbackContext,
        InputAction_CallbackContextEvent,
        InputAction_CallbackContextEventReference,
        InputAction_CallbackContextUnityEvent>
    { }
}
