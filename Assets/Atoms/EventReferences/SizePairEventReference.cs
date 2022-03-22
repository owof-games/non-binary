using System;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `SizePair`. Inherits from `AtomEventReference&lt;SizePair, SizeVariable, SizePairEvent, SizeVariableInstancer, SizePairEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class SizePairEventReference : AtomEventReference<
        SizePair,
        SizeVariable,
        SizePairEvent,
        SizeVariableInstancer,
        SizePairEventInstancer>, IGetEvent 
    { }
}
