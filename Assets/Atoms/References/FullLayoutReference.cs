using System;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Reference of type `FullLayout`. Inherits from `EquatableAtomReference&lt;FullLayout, FullLayoutPair, FullLayoutConstant, FullLayoutVariable, FullLayoutEvent, FullLayoutPairEvent, FullLayoutFullLayoutFunction, FullLayoutVariableInstancer, AtomCollection, AtomList&gt;`.
    /// </summary>
    [Serializable]
    public sealed class FullLayoutReference : EquatableAtomReference<
        FullLayout,
        FullLayoutPair,
        FullLayoutConstant,
        FullLayoutVariable,
        FullLayoutEvent,
        FullLayoutPairEvent,
        FullLayoutFullLayoutFunction,
        FullLayoutVariableInstancer>, IEquatable<FullLayoutReference>
    {
        public FullLayoutReference() : base() { }
        public FullLayoutReference(FullLayout value) : base(value) { }
        public bool Equals(FullLayoutReference other) { return base.Equals(other); }
    }
}
