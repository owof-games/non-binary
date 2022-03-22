#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `LocalizationInfoPair`. Inherits from `AtomDrawer&lt;LocalizationInfoPairEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(LocalizationInfoPairEvent))]
    public class LocalizationInfoPairEventDrawer : AtomDrawer<LocalizationInfoPairEvent> { }
}
#endif
