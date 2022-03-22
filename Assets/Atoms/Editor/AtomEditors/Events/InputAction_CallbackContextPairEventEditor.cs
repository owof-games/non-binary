#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;
using UnityEngine.InputSystem;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `InputAction_CallbackContextPair`. Inherits from `AtomEventEditor&lt;InputAction_CallbackContextPair, InputAction_CallbackContextPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(InputAction_CallbackContextPairEvent))]
    public sealed class InputAction_CallbackContextPairEventEditor : AtomEventEditor<InputAction_CallbackContextPair, InputAction_CallbackContextPairEvent> { }
}
#endif
