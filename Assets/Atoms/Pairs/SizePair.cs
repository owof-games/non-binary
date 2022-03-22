using System;
using UnityEngine;
namespace UnityAtoms
{
    /// <summary>
    /// IPair of type `&lt;Size&gt;`. Inherits from `IPair&lt;Size&gt;`.
    /// </summary>
    [Serializable]
    public struct SizePair : IPair<Size>
    {
        public Size Item1 { get => _item1; set => _item1 = value; }
        public Size Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private Size _item1;
        [SerializeField]
        private Size _item2;

        public void Deconstruct(out Size item1, out Size item2) { item1 = Item1; item2 = Item2; }
    }
}