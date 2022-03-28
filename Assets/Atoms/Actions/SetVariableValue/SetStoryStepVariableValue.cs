using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Set variable value Action of type `StoryStep`. Inherits from `SetVariableValue&lt;StoryStep, StoryStepPair, StoryStepVariable, StoryStepConstant, StoryStepReference, StoryStepEvent, StoryStepPairEvent, StoryStepVariableInstancer&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-purple")]
    [CreateAssetMenu(menuName = "Unity Atoms/Actions/Set Variable Value/StoryStep", fileName = "SetStoryStepVariableValue")]
    public sealed class SetStoryStepVariableValue : SetVariableValue<
        StoryStep,
        StoryStepPair,
        StoryStepVariable,
        StoryStepConstant,
        StoryStepReference,
        StoryStepEvent,
        StoryStepPairEvent,
        StoryStepStoryStepFunction,
        StoryStepVariableInstancer>
    { }
}
