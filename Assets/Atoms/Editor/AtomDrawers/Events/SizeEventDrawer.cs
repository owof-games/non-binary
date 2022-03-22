#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `Size`. Inherits from `AtomDrawer&lt;SizeEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(SizeEvent))]
    public class SizeEventDrawer : AtomDrawer<SizeEvent> { }
}
#endif
