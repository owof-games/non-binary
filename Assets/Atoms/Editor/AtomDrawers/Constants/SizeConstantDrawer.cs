#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Constant property drawer of type `Size`. Inherits from `AtomDrawer&lt;SizeConstant&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(SizeConstant))]
    public class SizeConstantDrawer : VariableDrawer<SizeConstant> { }
}
#endif
