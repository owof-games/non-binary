#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Constant property drawer of type `FullLayout`. Inherits from `AtomDrawer&lt;FullLayoutConstant&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(FullLayoutConstant))]
    public class FullLayoutConstantDrawer : VariableDrawer<FullLayoutConstant> { }
}
#endif
