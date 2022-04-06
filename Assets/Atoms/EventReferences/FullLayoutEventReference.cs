using System;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `FullLayout`. Inherits from `AtomEventReference&lt;FullLayout, FullLayoutVariable, FullLayoutEvent, FullLayoutVariableInstancer, FullLayoutEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class FullLayoutEventReference : AtomEventReference<
        FullLayout,
        FullLayoutVariable,
        FullLayoutEvent,
        FullLayoutVariableInstancer,
        FullLayoutEventInstancer>, IGetEvent 
    { }
}
