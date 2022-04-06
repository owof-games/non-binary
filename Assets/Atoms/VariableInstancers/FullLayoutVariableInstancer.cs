using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Variable Instancer of type `FullLayout`. Inherits from `AtomVariableInstancer&lt;FullLayoutVariable, FullLayoutPair, FullLayout, FullLayoutEvent, FullLayoutPairEvent, FullLayoutFullLayoutFunction&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-hotpink")]
    [AddComponentMenu("Unity Atoms/Variable Instancers/FullLayout Variable Instancer")]
    public class FullLayoutVariableInstancer : AtomVariableInstancer<
        FullLayoutVariable,
        FullLayoutPair,
        FullLayout,
        FullLayoutEvent,
        FullLayoutPairEvent,
        FullLayoutFullLayoutFunction>
    { }
}
