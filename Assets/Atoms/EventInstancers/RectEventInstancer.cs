using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Instancer of type `Rect`. Inherits from `AtomEventInstancer&lt;Rect, RectEvent&gt;`.
    /// </summary>
    [EditorIcon("atom-icon-sign-blue")]
    [AddComponentMenu("Unity Atoms/Event Instancers/Rect Event Instancer")]
    public class RectEventInstancer : AtomEventInstancer<Rect, RectEvent> { }
}
