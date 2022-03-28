#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable property drawer of type `StoryStep`. Inherits from `AtomDrawer&lt;StoryStepVariable&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomPropertyDrawer(typeof(StoryStepVariable))]
    public class StoryStepVariableDrawer : VariableDrawer<StoryStepVariable> { }
}
#endif
