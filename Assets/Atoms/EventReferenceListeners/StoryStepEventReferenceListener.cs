using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference Listener of type `StoryStep`. Inherits from `AtomEventReferenceListener&lt;StoryStep, StoryStepEvent, StoryStepEventReference, StoryStepUnityEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-orange")]
    [AddComponentMenu("Unity Atoms/Listeners/StoryStep Event Reference Listener")]
    public sealed class StoryStepEventReferenceListener : AtomEventReferenceListener<
        StoryStep,
        StoryStepEvent,
        StoryStepEventReference,
        StoryStepUnityEvent>
    { }
}
