using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Variable Instancer of type `StoryStep`. Inherits from `AtomVariableInstancer&lt;StoryStepVariable, StoryStepPair, StoryStep, StoryStepEvent, StoryStepPairEvent, StoryStepStoryStepFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/StoryStep Variable Instancer")]
    public class StoryStepVariableInstancer : AtomVariableInstancer<
        StoryStepVariable,
        StoryStepPair,
        StoryStep,
        StoryStepEvent,
        StoryStepPairEvent,
        StoryStepStoryStepFunction>
    { }
}
