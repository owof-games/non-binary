using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `StoryStep`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(StoryStepVariable))]
    public sealed class StoryStepVariableEditor : AtomVariableEditor<StoryStep, StoryStepPair> { }
}
