using UnityEditor;
using UnityAtoms.Editor;
using UnityEngine;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `Rect`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(RectVariable))]
    public sealed class RectVariableEditor : AtomVariableEditor<Rect, RectPair> { }
}
