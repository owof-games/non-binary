using System;
using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Reference of type `Rect`. Inherits from `EquatableAtomReference&lt;Rect, RectPair, RectConstant, RectVariable, RectEvent, RectPairEvent, RectRectFunction, RectVariableInstancer, AtomCollection, AtomList&gt;`.
    /// </summary>
    [Serializable]
    public sealed class RectReference : EquatableAtomReference<
        Rect,
        RectPair,
        RectConstant,
        RectVariable,
        RectEvent,
        RectPairEvent,
        RectRectFunction,
        RectVariableInstancer>, IEquatable<RectReference>
    {
        public RectReference() : base() { }
        public RectReference(Rect value) : base(value) { }
        public bool Equals(RectReference other) { return base.Equals(other); }
    }
}
