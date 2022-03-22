#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Constant property drawer of type `InputAction.CallbackContext`. Inherits from `AtomDrawer&lt;InputAction_CallbackContextConstant&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(InputAction_CallbackContextConstant))]
    public class InputAction_CallbackContextConstantDrawer : VariableDrawer<InputAction_CallbackContextConstant> { }
}
#endif
