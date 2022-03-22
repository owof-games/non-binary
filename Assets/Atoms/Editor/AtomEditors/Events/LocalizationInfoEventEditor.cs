#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `LocalizationInfo`. Inherits from `AtomEventEditor&lt;LocalizationInfo, LocalizationInfoEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(LocalizationInfoEvent))]
    public sealed class LocalizationInfoEventEditor : AtomEventEditor<LocalizationInfo, LocalizationInfoEvent> { }
}
#endif
