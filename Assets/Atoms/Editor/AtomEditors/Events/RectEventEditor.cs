#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;
using UnityEngine;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Rect`. Inherits from `AtomEventEditor&lt;Rect, RectEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(RectEvent))]
    public sealed class RectEventEditor : AtomEventEditor<Rect, RectEvent> { }
}
#endif
