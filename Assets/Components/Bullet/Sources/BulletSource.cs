using System;
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

    public abstract IEnumerable<Description> Descriptions { get; }
}