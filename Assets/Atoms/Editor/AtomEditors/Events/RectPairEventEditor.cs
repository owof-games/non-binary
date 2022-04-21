#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;
using UnityEngine;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `RectPair`. Inherits from `AtomEventEditor&lt;RectPair, RectPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(RectPairEvent))]
    public sealed class RectPairEventEditor : AtomEventEditor<RectPair, RectPairEvent> { }
}
#endif
