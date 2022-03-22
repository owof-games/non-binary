#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Constant property drawer of type `LocalizationInfo`. Inherits from `AtomDrawer&lt;LocalizationInfoConstant&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(LocalizationInfoConstant))]
    public class LocalizationInfoConstantDrawer : VariableDrawer<LocalizationInfoConstant> { }
}
#endif
