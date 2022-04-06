using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `FullLayout`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(FullLayoutVariable))]
    public sealed class FullLayoutVariableEditor : AtomVariableEditor<FullLayout, FullLayoutPair> { }
}
