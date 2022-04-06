#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `FullLayoutPair`. Inherits from `AtomDrawer&lt;FullLayoutPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(FullLayoutPairEvent))]
    public class FullLayoutPairEventDrawer : AtomDrawer<FullLayoutPairEvent> { }
}
#endif
