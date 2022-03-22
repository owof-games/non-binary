#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Value List property drawer of type `InputAction.CallbackContext`. Inherits from `AtomDrawer&lt;InputAction_CallbackContextValueList&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(InputAction_CallbackContextValueList))]
    public class InputAction_CallbackContextValueListDrawer : AtomDrawer<InputAction_CallbackContextValueList> { }
}
#endif
