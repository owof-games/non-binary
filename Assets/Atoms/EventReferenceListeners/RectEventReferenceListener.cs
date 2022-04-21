using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `Rect`. Inherits from `AtomEventReferenceListener&lt;Rect, RectEvent, RectEventReference, RectUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/Rect Event Reference Listener")]
    public sealed class RectEventReferenceListener : AtomEventReferenceListener<
        Rect,
        RectEvent,
        RectEventReference,
        RectUnityEvent>
    { }
}
