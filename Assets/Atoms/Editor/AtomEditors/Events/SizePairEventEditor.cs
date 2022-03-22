#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `SizePair`. Inherits from `AtomEventEditor&lt;SizePair, SizePairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(SizePairEvent))]
    public sealed class SizePairEventEditor : AtomEventEditor<SizePair, SizePairEvent> { }
}
#endif
