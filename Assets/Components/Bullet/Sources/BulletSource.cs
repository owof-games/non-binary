using System.Collections.Generic;
using UnityEngine;

public abstract class BulletSource : ScriptableObject
{
    [System.Serializable]
    public class Description : Velocity.Description
    {
        public float DeltaTime;

        public bool IsPink;

        public Description Clone()
        {
            var d = (Description)MemberwiseClone();
            d.VelocitySteps = (Velocity.VelocityStep[])d.VelocitySteps.Clone();
            return d;
        }
    }

    // returns a (potentially infinite) enumerable of bullet descriptions.
    // the list is almost-ordered, meaning that some entries could be out of order but in general every single entry should not be far away from its position
    public abstract IEnumerable<Description> Descriptions { get; }
}