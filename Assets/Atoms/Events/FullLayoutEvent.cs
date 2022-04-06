using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `FullLayout`. Inherits from `AtomEvent&lt;FullLayout&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/FullLayout", fileName = "FullLayoutEvent")]
    public sealed class FullLayoutEvent : AtomEvent<FullLayout>
    {
    }
}
