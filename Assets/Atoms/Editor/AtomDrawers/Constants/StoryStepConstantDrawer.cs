#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Constant property drawer of type `StoryStep`. Inherits from `AtomDrawer&lt;StoryStepConstant&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(StoryStepConstant))]
    public class StoryStepConstantDrawer : VariableDrawer<StoryStepConstant> { }
}
#endif
