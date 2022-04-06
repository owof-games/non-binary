#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `FullLayoutPair`. Inherits from `AtomEventEditor&lt;FullLayoutPair, FullLayoutPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(FullLayoutPairEvent))]
    public sealed class FullLayoutPairEventEditor : AtomEventEditor<FullLayoutPair, FullLayoutPairEvent> { }
}
#endif
