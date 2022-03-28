using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Value List of type `StoryStep`. Inherits from `AtomValueList&lt;StoryStep, StoryStepEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-piglet")]
    [CreateAssetMenu(menuName = "Unity Atoms/Value Lists/StoryStep", fileName = "StoryStepValueList")]
    public sealed class StoryStepValueList : AtomValueList<StoryStep, StoryStepEvent> { }
}
