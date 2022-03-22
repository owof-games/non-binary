#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `InputAction_CallbackContextPair`. Inherits from `AtomDrawer&lt;InputAction_CallbackContextPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(InputAction_CallbackContextPairEvent))]
    public class InputAction_CallbackContextPairEventDrawer : AtomDrawer<InputAction_CallbackContextPairEvent> { }
}
#endif
