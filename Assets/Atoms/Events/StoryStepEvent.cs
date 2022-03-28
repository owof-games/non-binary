using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `StoryStep`. Inherits from `AtomEvent&lt;StoryStep&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/StoryStep", fileName = "StoryStepEvent")]
    public sealed class StoryStepEvent : AtomEvent<StoryStep>
    {
    }
}
