#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Value List property drawer of type `StoryStep`. Inherits from `AtomDrawer&lt;StoryStepValueList&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(StoryStepValueList))]
    public class StoryStepValueListDrawer : AtomDrawer<StoryStepValueList> { }
}
#endif
