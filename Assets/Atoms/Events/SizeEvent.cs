using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `Size`. Inherits from `AtomEvent&lt;Size&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/Size", fileName = "SizeEvent")]
    public sealed class SizeEvent : AtomEvent<Size>
    {
    }
}
