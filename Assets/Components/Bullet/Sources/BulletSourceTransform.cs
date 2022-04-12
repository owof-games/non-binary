using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "BulletSourceTransform", menuName = "non-binary/BulletSource/Create Transform", order = 0)]
public class BulletSourceTransform : BulletSource
{
    public BulletSource BulletSource;

    [System.Serializable]
    public class Operation
    {
        public Vector2 Scale;
        public float Rotate;
        public Vector2 Translate;
    }

    public List<Operation> Operations = new List<Operation>();

    public override Description[] Descriptions
    {
        get
        {
            var fullTransform = Matrix4x4.identity;
            var rsTransform = Matrix4x4.identity;
            foreach (var operation in Operations)
            {
                var t = new Vector3(operation.Translate.x, operation.Translate.y, 0);
                var r = Quaternion.AngleAxis(operation.Rotate, Vector3.forward);
                var s = new Vector3(operation.Scale.x, operation.Scale.y, 1);
                var rs = Matrix4x4.TRS(Vector3.zero, r, s);
                var trs = Matrix4x4.Translate(t) * rs;
                rsTransform = rs * rsTransform;
                fullTransform = trs * fullTransform;
            }
            var descriptions = BulletSource.Descriptions;
            foreach (var description in descriptions)
            {
                description.InitialPosition = fullTransform.MultiplyPoint3x4(description.InitialPosition);
                for (var i = 0; i < description.VelocitySteps.Length; i++)
                {
                    description.VelocitySteps[i].NewVelocity = rsTransform.MultiplyPoint3x4(description.VelocitySteps[i].NewVelocity);
                }
            }
            return descriptions;
        }
    }
}
