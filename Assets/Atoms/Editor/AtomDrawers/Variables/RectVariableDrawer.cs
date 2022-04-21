#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `Rect`. Inherits from `AtomDrawer&lt;RectVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(RectVariable))]
    public class RectVariableDrawer : VariableDrawer<RectVariable> { }
}
#endif
