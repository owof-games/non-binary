using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `LocalizationInfo`. Inherits from `AtomEventReferenceListener&lt;LocalizationInfo, LocalizationInfoEvent, LocalizationInfoEventReference, LocalizationInfoUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/LocalizationInfo Event Reference Listener")]
    public sealed class LocalizationInfoEventReferenceListener : AtomEventReferenceListener<
        LocalizationInfo,
        LocalizationInfoEvent,
        LocalizationInfoEventReference,
        LocalizationInfoUnityEvent>
    { }
}
