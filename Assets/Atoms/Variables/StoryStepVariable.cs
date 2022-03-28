using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Variable of type `StoryStep`. Inherits from `EquatableAtomVariable&lt;StoryStep, StoryStepPair, StoryStepEvent, StoryStepPairEvent, StoryStepStoryStepFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-lush")]
    [CreateAssetMenu(menuName = "Unity Atoms/Variables/StoryStep", fileName = "StoryStepVariable")]
    public sealed class StoryStepVariable : EquatableAtomVariable<StoryStep, StoryStepPair, StoryStepEvent, StoryStepPairEvent, StoryStepStoryStepFunction>
    {
    }
}
