#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Rect`. Inherits from `AtomDrawer&lt;RectEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(RectEvent))]
    public class RectEventDrawer : AtomDrawer<RectEvent> { }
}
#endif
