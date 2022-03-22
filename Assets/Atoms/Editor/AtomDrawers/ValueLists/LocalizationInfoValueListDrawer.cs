#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Value List property drawer of type `LocalizationInfo`. Inherits from `AtomDrawer&lt;LocalizationInfoValueList&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(LocalizationInfoValueList))]
    public class LocalizationInfoValueListDrawer : AtomDrawer<LocalizationInfoValueList> { }
}
#endif
