#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Value List property drawer of type `FullLayout`. Inherits from `AtomDrawer&lt;FullLayoutValueList&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(FullLayoutValueList))]
    public class FullLayoutValueListDrawer : AtomDrawer<FullLayoutValueList> { }
}
#endif
