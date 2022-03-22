using System;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `LocalizationInfoPair`. Inherits from `AtomEventReference&lt;LocalizationInfoPair, LocalizationInfoVariable, LocalizationInfoPairEvent, LocalizationInfoVariableInstancer, LocalizationInfoPairEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class LocalizationInfoPairEventReference : AtomEventReference<
        LocalizationInfoPair,
        LocalizationInfoVariable,
        LocalizationInfoPairEvent,
        LocalizationInfoVariableInstancer,
        LocalizationInfoPairEventInstancer>, IGetEvent 
    { }
}
