using System;
using UnityEngine.Events;

namespace UnityAtoms
{
    /// <summary>
    /// None generic Unity Event of type `StoryStep`. Inherits from `UnityEvent&lt;StoryStep&gt;`.
    /// </summary>
    [Serializable]
    public sealed class StoryStepUnityEvent : UnityEvent<StoryStep> { }
}
