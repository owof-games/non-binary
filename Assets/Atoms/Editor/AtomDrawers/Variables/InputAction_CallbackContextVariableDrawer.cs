#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `InputAction.CallbackContext`. Inherits from `AtomDrawer&lt;InputAction_CallbackContextVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(InputAction_CallbackContextVariable))]
    public class InputAction_CallbackContextVariableDrawer : VariableDrawer<InputAction_CallbackContextVariable> { }
}
#endif
