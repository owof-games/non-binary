using System.Collections;
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

            foreach (var bulletSourceBlock in _BulletSourceBlocks)
            {
                var blockDescriptions = bulletSourceBlock.BulletSource.Descriptions;
                foreach (var description in blockDescriptions)
                {
                    description.DeltaTime += bulletSourceBlock.DeltaTime;
                }
                descriptions.AddRange(blockDescriptions);
            }

            return descriptions.ToArray();
        }
    }
}
