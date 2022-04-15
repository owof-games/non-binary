using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "BulletSourceSingle", menuName = "non-binary/BulletSource/Create Single", order = 0)]
public class BulletSourceSingle : BulletSource
{
    public Description SingleBulletDescription;

    public override IEnumerable<Description> Descriptions
    {
        get
        {
            return new Description[] { SingleBulletDescription.Clone() };
        }
    }
}
