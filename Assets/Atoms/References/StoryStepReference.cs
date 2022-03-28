using System;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Reference of type `StoryStep`. Inherits from `EquatableAtomReference&lt;StoryStep, StoryStepPair, StoryStepConstant, StoryStepVariable, StoryStepEvent, StoryStepPairEvent, StoryStepStoryStepFunction, StoryStepVariableInstancer, AtomCollection, AtomList&gt;`.
    /// </summary>
    [Serializable]
    public sealed class StoryStepReference : EquatableAtomReference<
        StoryStep,
        StoryStepPair,
        StoryStepConstant,
        StoryStepVariable,
        StoryStepEvent,
        StoryStepPairEvent,
        StoryStepStoryStepFunction,
        StoryStepVariableInstancer>, IEquatable<StoryStepReference>
    {
        public StoryStepReference() : base() { }
        public StoryStepReference(StoryStep value) : base(value) { }
        public bool Equals(StoryStepReference other) { return base.Equals(other); }
    }
}
