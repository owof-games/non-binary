using System;
using UnityEngine;
namespace UnityAtoms
{
    /// <summary>
    /// IPair of type `&lt;Rect&gt;`. Inherits from `IPair&lt;Rect&gt;`.
    /// </summary>
    [Serializable]
    public struct RectPair : IPair<Rect>
    {
        public Rect Item1 { get => _item1; set => _item1 = value; }
        public Rect Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private Rect _item1;
        [SerializeField]
        private Rect _item2;

        public void Deconstruct(out Rect item1, out Rect item2) { item1 = Item1; item2 = Item2; }
    }
}