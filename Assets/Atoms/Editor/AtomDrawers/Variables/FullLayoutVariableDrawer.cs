#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `FullLayout`. Inherits from `AtomDrawer&lt;FullLayoutVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(FullLayoutVariable))]
    public class FullLayoutVariableDrawer : VariableDrawer<FullLayoutVariable> { }
}
#endif
