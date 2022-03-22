using System;
using UnityEngine;
using UnityEngine.InputSystem;
namespace UnityAtoms
{
    /// <summary>
    /// IPair of type `&lt;InputAction.CallbackContext&gt;`. Inherits from `IPair&lt;InputAction.CallbackContext&gt;`.
    /// </summary>
    [Serializable]
    public struct InputAction_CallbackContextPair : IPair<InputAction.CallbackContext>
    {
        public InputAction.CallbackContext Item1 { get => _item1; set => _item1 = value; }
        public InputAction.CallbackContext Item2 { get => _item2; set => _item2 = value; }

        [SerializeField]
        private InputAction.CallbackContext _item1;
        [SerializeField]
        private InputAction.CallbackContext _item2;

        public void Deconstruct(out InputAction.CallbackContext item1, out InputAction.CallbackContext item2) { item1 = Item1; item2 = Item2; }
    }
}