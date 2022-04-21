#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Value List property drawer of type `Rect`. Inherits from `AtomDrawer&lt;RectValueList&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(RectValueList))]
    public class RectValueListDrawer : AtomDrawer<RectValueList> { }
}
#endif
