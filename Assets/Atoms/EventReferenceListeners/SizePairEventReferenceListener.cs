using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `SizePair`. Inherits from `AtomEventReferenceListener&lt;SizePair, SizePairEvent, SizePairEventReference, SizePairUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/SizePair Event Reference Listener")]
    public sealed class SizePairEventReferenceListener : AtomEventReferenceListener<
        SizePair,
        SizePairEvent,
        SizePairEventReference,
        SizePairUnityEvent>
    { }
}
