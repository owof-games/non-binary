using System;
using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `RectPair`. Inherits from `AtomEventReference&lt;RectPair, RectVariable, RectPairEvent, RectVariableInstancer, RectPairEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class RectPairEventReference : AtomEventReference<
        RectPair,
        RectVariable,
        RectPairEvent,
        RectVariableInstancer,
        RectPairEventInstancer>, IGetEvent 
    { }
}
