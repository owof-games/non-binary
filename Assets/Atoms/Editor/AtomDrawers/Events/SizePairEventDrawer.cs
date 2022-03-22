#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `SizePair`. Inherits from `AtomDrawer&lt;SizePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(SizePairEvent))]
    public class SizePairEventDrawer : AtomDrawer<SizePairEvent> { }
}
#endif
