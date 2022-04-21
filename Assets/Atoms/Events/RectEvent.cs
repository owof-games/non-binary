using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event of type `Rect`. Inherits from `AtomEvent&lt;Rect&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-cherry")]
    [CreateAssetMenu(menuName = "Unity Atoms/Events/Rect", fileName = "RectEvent")]
    public sealed class RectEvent : AtomEvent<Rect>
    {
    }
}
