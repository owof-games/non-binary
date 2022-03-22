#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `LocalizationInfoPair`. Inherits from `AtomEventEditor&lt;LocalizationInfoPair, LocalizationInfoPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(LocalizationInfoPairEvent))]
    public sealed class LocalizationInfoPairEventEditor : AtomEventEditor<LocalizationInfoPair, LocalizationInfoPairEvent> { }
}
#endif
