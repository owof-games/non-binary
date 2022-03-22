using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Variable Instancer of type `Size`. Inherits from `AtomVariableInstancer&lt;SizeVariable, SizePair, Size, SizeEvent, SizePairEvent, SizeSizeFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/Size Variable Instancer")]
    public class SizeVariableInstancer : AtomVariableInstancer<
        SizeVariable,
        SizePair,
        Size,
        SizeEvent,
        SizePairEvent,
        SizeSizeFunction>
    { }
}
