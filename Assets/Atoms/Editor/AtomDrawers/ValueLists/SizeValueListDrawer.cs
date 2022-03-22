#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Value List property drawer of type `Size`. Inherits from `AtomDrawer&lt;SizeValueList&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(SizeValueList))]
    public class SizeValueListDrawer : AtomDrawer<SizeValueList> { }
}
#endif
