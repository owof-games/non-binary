#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `RectPair`. Inherits from `AtomDrawer&lt;RectPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(RectPairEvent))]
    public class RectPairEventDrawer : AtomDrawer<RectPairEvent> { }
}
#endif
