using System;
using UnityEngine;
namespace UnityAtoms
{
    /// <summary>
    /// IPair of type `&lt;LocalizationInfo&gt;`. Inherits from `IPair&lt;LocalizationInfo&gt;`.
    /// </summary>
    [Serializable]
    public struct LocalizationInfoPair : IPair<LocalizationInfo>
    {
        public LocalizationInfo Item1 { get => _item1; set => _item1 = value; }
        public LocalizationInfo Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private LocalizationInfo _item1;
        [SerializeField]
        private LocalizationInfo _item2;

        public void Deconstruct(out LocalizationInfo item1, out LocalizationInfo item2) { item1 = Item1; item2 = Item2; }
    }
}