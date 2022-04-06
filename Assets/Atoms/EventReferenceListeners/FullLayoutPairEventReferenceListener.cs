using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `FullLayoutPair`. Inherits from `AtomEventReferenceListener&lt;FullLayoutPair, FullLayoutPairEvent, FullLayoutPairEventReference, FullLayoutPairUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/FullLayoutPair Event Reference Listener")]
    public sealed class FullLayoutPairEventReferenceListener : AtomEventReferenceListener<
        FullLayoutPair,
        FullLayoutPairEvent,
        FullLayoutPairEventReference,
        FullLayoutPairUnityEvent>
    { }
}
