using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `Size`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(SizeVariable))]
    public sealed class SizeVariableEditor : AtomVariableEditor<Size, SizePair> { }
}
