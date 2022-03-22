using UnityEditor;
using UnityAtoms.Editor;
using UnityEngine.InputSystem;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `InputAction.CallbackContext`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(InputAction_CallbackContextVariable))]
    public sealed class InputAction_CallbackContextVariableEditor : AtomVariableEditor<InputAction.CallbackContext, InputAction_CallbackContextPair> { }
}
