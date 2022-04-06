#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `FullLayout`. Inherits from `AtomDrawer&lt;FullLayoutEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(FullLayoutEvent))]
    public class FullLayoutEventDrawer : AtomDrawer<FullLayoutEvent> { }
}
#endif
