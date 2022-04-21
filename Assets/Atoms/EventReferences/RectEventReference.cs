using System;
using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Event Reference of type `Rect`. Inherits from `AtomEventReference&lt;Rect, RectVariable, RectEvent, RectVariableInstancer, RectEventInstancer&gt;`.
    /// </summary>
    [Serializable]
    public sealed class RectEventReference : AtomEventReference<
        Rect,
        RectVariable,
        RectEvent,
        RectVariableInstancer,
        RectEventInstancer>, IGetEvent 
    { }
}
