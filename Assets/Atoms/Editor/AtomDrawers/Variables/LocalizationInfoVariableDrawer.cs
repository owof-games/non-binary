#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `LocalizationInfo`. Inherits from `AtomDrawer&lt;LocalizationInfoVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(LocalizationInfoVariable))]
    public class LocalizationInfoVariableDrawer : VariableDrawer<LocalizationInfoVariable> { }
}
#endif
