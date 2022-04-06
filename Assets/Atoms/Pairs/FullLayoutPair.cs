using System;
using UnityEngine;
namespace UnityAtoms
{
    /// <summary>
    /// IPair of type `&lt;FullLayout&gt;`. Inherits from `IPair&lt;FullLayout&gt;`.
    /// </summary>
    [Serializable]
    public struct FullLayoutPair : IPair<FullLayout>
    {
        public FullLayout Item1 { get => _item1; set => _item1 = value; }
        public FullLayout Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private FullLayout _item1;
        [SerializeField]
        private FullLayout _item2;

        public void Deconstruct(out FullLayout item1, out FullLayout item2) { item1 = Item1; item2 = Item2; }
    }
}