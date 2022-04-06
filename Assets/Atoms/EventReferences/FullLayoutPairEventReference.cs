using System;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `FullLayoutPair`. Inherits from `AtomEventReference&lt;FullLayoutPair, FullLayoutVariable, FullLayoutPairEvent, FullLayoutVariableInstancer, FullLayoutPairEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class FullLayoutPairEventReference : AtomEventReference<
        FullLayoutPair,
        FullLayoutVariable,
        FullLayoutPairEvent,
        FullLayoutVariableInstancer,
        FullLayoutPairEventInstancer>, IGetEvent 
    { }
}
