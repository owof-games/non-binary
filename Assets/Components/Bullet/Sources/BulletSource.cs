using UnityEngine;

public abstract class BulletSource : ScriptableObject
{
    [System.Serializable]
    public class Description : Velocity.Description
    {
        public float DeltaTime;

        public bool IsPink;
    }

    public abstract Description[] Descriptions { get; }
}