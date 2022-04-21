using System;
using UnityEngine.Events;
using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// None generic Unity Event of type `Rect`. Inherits from `UnityEvent&lt;Rect&gt;`.
    /// </summary>
    [Serializable]
    public sealed class RectUnityEvent : UnityEvent<Rect> { }
}
