#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Size`. Inherits from `AtomEventEditor&lt;Size, SizeEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(SizeEvent))]
    public sealed class SizeEventEditor : AtomEventEditor<Size, SizeEvent> { }
}
#endif
