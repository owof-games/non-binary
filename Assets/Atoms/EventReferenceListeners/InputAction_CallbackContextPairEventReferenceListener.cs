using UnityEngine;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `InputAction_CallbackContextPair`. Inherits from `AtomEventReferenceListener&lt;InputAction_CallbackContextPair, InputAction_CallbackContextPairEvent, InputAction_CallbackContextPairEventReference, InputAction_CallbackContextPairUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/InputAction_CallbackContextPair Event Reference Listener")]
    public sealed class InputAction_CallbackContextPairEventReferenceListener : AtomEventReferenceListener<
        InputAction_CallbackContextPair,
        InputAction_CallbackContextPairEvent,
        InputAction_CallbackContextPairEventReference,
        InputAction_CallbackContextPairUnityEvent>
    { }
}
