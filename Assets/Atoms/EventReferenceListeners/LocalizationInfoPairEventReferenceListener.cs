using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `LocalizationInfoPair`. Inherits from `AtomEventReferenceListener&lt;LocalizationInfoPair, LocalizationInfoPairEvent, LocalizationInfoPairEventReference, LocalizationInfoPairUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/LocalizationInfoPair Event Reference Listener")]
    public sealed class LocalizationInfoPairEventReferenceListener : AtomEventReferenceListener<
        LocalizationInfoPair,
        LocalizationInfoPairEvent,
        LocalizationInfoPairEventReference,
        LocalizationInfoPairUnityEvent>
    { }
}
