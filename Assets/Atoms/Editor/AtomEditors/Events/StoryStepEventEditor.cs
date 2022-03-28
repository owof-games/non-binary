#if UNITY_2019_1_OR_NEWER
using UnityEditor;
using UnityEngine.UIElements;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Event property drawer of type `StoryStep`. Inherits from `AtomEventEditor&lt;StoryStep, StoryStepEvent&gt;`. Only availble in `UNITY_2019_1_OR_NEWER`.
    /// </summary>
    [CustomEditor(typeof(StoryStepEvent))]
    public sealed class StoryStepEventEditor : AtomEventEditor<StoryStep, StoryStepEvent> { }
}
#endif
