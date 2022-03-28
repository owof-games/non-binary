using System;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `StoryStep`. Inherits from `AtomEventReference&lt;StoryStep, StoryStepVariable, StoryStepEvent, StoryStepVariableInstancer, StoryStepEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class StoryStepEventReference : AtomEventReference<
        StoryStep,
        StoryStepVariable,
        StoryStepEvent,
        StoryStepVariableInstancer,
        StoryStepEventInstancer>, IGetEvent 
    { }
}
