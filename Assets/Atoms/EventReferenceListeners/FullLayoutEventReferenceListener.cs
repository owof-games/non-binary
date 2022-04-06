using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `FullLayout`. Inherits from `AtomEventReferenceListener&lt;FullLayout, FullLayoutEvent, FullLayoutEventReference, FullLayoutUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/FullLayout Event Reference Listener")]
    public sealed class FullLayoutEventReferenceListener : AtomEventReferenceListener<
        FullLayout,
        FullLayoutEvent,
        FullLayoutEventReference,
        FullLayoutUnityEvent>
    { }
}
