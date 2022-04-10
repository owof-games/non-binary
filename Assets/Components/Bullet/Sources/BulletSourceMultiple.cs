using System.Linq;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "BulletSourceMultiple", menuName = "non-binary/BulletSource/Create Multiple", order = 0)]
public class BulletSourceMultiple : BulletSource
{
    [System.Serializable]
    public struct BulletSourceBlock
    {
        public BulletSource BulletSource;
        public float DeltaTime;
    }

    [SerializeField]
    private BulletSourceBlock[] _BulletSourceBlocks;

    public override Description[] Descriptions
    {
        get
        {
            var descriptions = new List<Description>();

            var t = 0f;
            foreach (var bulletSourceBlock in _BulletSourceBlocks)
            {
                t += bulletSourceBlock.DeltaTime;
                var blockDescriptions = bulletSourceBlock.BulletSource.Descriptions;
                foreach (var description in blockDescriptions)
                {
                    description.DeltaTime += t;
                }
                descriptions.AddRange(blockDescriptions);
            }

            return descriptions.ToArray();
        }
    }
}
