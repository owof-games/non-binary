using UnityEditor;
using UnityAtoms.Editor;

namespace UnityAtoms.Editor
{
    /// <summary>
    /// Variable Inspector of type `LocalizationInfo`. Inherits from `AtomVariableEditor`
    /// </summary>
    [CustomEditor(typeof(LocalizationInfoVariable))]
    public sealed class LocalizationInfoVariableEditor : AtomVariableEditor<LocalizationInfo, LocalizationInfoPair> { }
}
