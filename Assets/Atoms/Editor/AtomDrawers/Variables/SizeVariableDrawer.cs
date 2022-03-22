#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `Size`. Inherits from `AtomDrawer&lt;SizeVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(SizeVariable))]
    public class SizeVariableDrawer : VariableDrawer<SizeVariable> { }
}
#endif
