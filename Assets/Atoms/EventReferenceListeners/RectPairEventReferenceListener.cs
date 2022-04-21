using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `RectPair`. Inherits from `AtomEventReferenceListener&lt;RectPair, RectPairEvent, RectPairEventReference, RectPairUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/RectPair Event Reference Listener")]
    public sealed class RectPairEventReferenceListener : AtomEventReferenceListener<
        RectPair,
        RectPairEvent,
        RectPairEventReference,
        RectPairUnityEvent>
    { }
}
