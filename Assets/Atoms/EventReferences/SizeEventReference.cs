using System;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `Size`. Inherits from `AtomEventReference&lt;Size, SizeVariable, SizeEvent, SizeVariableInstancer, SizeEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class SizeEventReference : AtomEventReference<
        Size,
        SizeVariable,
        SizeEvent,
        SizeVariableInstancer,
        SizeEventInstancer>, IGetEvent 
    { }
}
