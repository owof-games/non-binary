using System;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `LocalizationInfo`. Inherits from `AtomEventReference&lt;LocalizationInfo, LocalizationInfoVariable, LocalizationInfoEvent, LocalizationInfoVariableInstancer, LocalizationInfoEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class LocalizationInfoEventReference : AtomEventReference<
        LocalizationInfo,
        LocalizationInfoVariable,
        LocalizationInfoEvent,
        LocalizationInfoVariableInstancer,
        LocalizationInfoEventInstancer>, IGetEvent 
    { }
}
