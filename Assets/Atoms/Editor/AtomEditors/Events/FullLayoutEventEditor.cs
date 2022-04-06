#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `FullLayout`. Inherits from `AtomEventEditor&lt;FullLayout, FullLayoutEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(FullLayoutEvent))]
    public sealed class FullLayoutEventEditor : AtomEventEditor<FullLayout, FullLayoutEvent> { }
}
#endif
