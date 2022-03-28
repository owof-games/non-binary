using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Instancer of type `StoryStep`. Inherits from `AtomEventInstancer&lt;StoryStep, StoryStepEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/StoryStep Event Instancer")]
    public class StoryStepEventInstancer : AtomEventInstancer<StoryStep, StoryStepEvent> { }
}
