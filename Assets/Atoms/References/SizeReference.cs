using System;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Reference of type `Size`. Inherits from `EquatableAtomReference&lt;Size, SizePair, SizeConstant, SizeVariable, SizeEvent, SizePairEvent, SizeSizeFunction, SizeVariableInstancer, AtomCollection, AtomList&gt;`.
    /// </summary>
    [Serializable]
    public sealed class SizeReference : EquatableAtomReference<
        Size,
        SizePair,
        SizeConstant,
        SizeVariable,
        SizeEvent,
        SizePairEvent,
        SizeSizeFunction,
        SizeVariableInstancer>, IEquatable<SizeReference>
    {
        public SizeReference() : base() { }
        public SizeReference(Size value) : base(value) { }
        public bool Equals(SizeReference other) { return base.Equals(other); }
    }
}
