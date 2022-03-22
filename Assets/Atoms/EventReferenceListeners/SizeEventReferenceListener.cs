using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `Size`. Inherits from `AtomEventReferenceListener&lt;Size, SizeEvent, SizeEventReference, SizeUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/Size Event Reference Listener")]
    public sealed class SizeEventReferenceListener : AtomEventReferenceListener<
        Size,
        SizeEvent,
        SizeEventReference,
        SizeUnityEvent>
    { }
}
