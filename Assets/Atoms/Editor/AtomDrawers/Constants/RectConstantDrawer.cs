#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Constant property drawer of type `Rect`. Inherits from `AtomDrawer&lt;RectConstant&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(RectConstant))]
    public class RectConstantDrawer : VariableDrawer<RectConstant> { }
}
#endif
