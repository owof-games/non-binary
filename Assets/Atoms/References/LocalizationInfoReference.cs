using System;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Reference of type `LocalizationInfo`. Inherits from `EquatableAtomReference&lt;LocalizationInfo, LocalizationInfoPair, LocalizationInfoConstant, LocalizationInfoVariable, LocalizationInfoEvent, LocalizationInfoPairEvent, LocalizationInfoLocalizationInfoFunction, LocalizationInfoVariableInstancer, AtomCollection, AtomList&gt;`.
    /// </summary>
    [Serializable]
    public sealed class LocalizationInfoReference : EquatableAtomReference<
        LocalizationInfo,
        LocalizationInfoPair,
        LocalizationInfoConstant,
        LocalizationInfoVariable,
        LocalizationInfoEvent,
        LocalizationInfoPairEvent,
        LocalizationInfoLocalizationInfoFunction,
        LocalizationInfoVariableInstancer>, IEquatable<LocalizationInfoReference>
    {
        public LocalizationInfoReference() : base() { }
        public LocalizationInfoReference(LocalizationInfo value) : base(value) { }
        public bool Equals(LocalizationInfoReference other) { return base.Equals(other); }
    }
}
