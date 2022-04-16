using System.Collections.Generic;
using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

[CreateAssetMenu(fileName = "BulletSourceFinale", menuName = "non-binary/BulletSource/Create Finale", order = 0)]
public class BulletSourceFinale : BulletSource
{
    [SerializeField]
    private BaseLogger _BaseLogger;

    [SerializeField]
    private BulletSourceMultiple.HellModeDescription _HellModeDescription;

    [SerializeField]
    private List<BulletSource> _AFABBulletHells = new List<BulletSource>();

    [SerializeField]
    private List<BulletSource> _AMABBulletHells = new List<BulletSource>();

    [SerializeField]
    private BoolVariable _IsAMAB;

    public override IEnumerable<Description> Descriptions
    {
        get
        {
            var innerMultiple = CreateInstance<BulletSourceMultiple>();
            innerMultiple.BaseLogger = _BaseLogger;

            // initialize the blocks
            var bulletSourceBlocks = new List<BulletSourceMultiple.BulletSourceBlock>();
            var sources = _IsAMAB.Value ? _AMABBulletHells : _AFABBulletHells;
            foreach (var source in sources)
            {
                var bsm = GetBulletSourceMultiple(source);
                if (bsm != null)
                {
                    bulletSourceBlocks.AddRange(bsm.BulletSourceBlocks);
                }
            }
            innerMultiple.BulletSourceBlocks = bulletSourceBlocks.ToArray();

            // setup hell
            innerMultiple.HellModeDescriptionValue = _HellModeDescription;

            // wrap around gender bender to be sure of the correct color
            var innerGenderBender = CreateInstance<BulletSourceGenderBender>();
            innerGenderBender.BulletSource = innerMultiple;
            innerGenderBender.IsBlue = _IsAMAB.Value;

            // return enumerable
            return innerGenderBender.Descriptions;
        }
    }

    private BulletSourceMultiple GetBulletSourceMultiple(BulletSource bulletSource)
    {
        if (bulletSource is BulletSourceMultiple multiple)
        {
            return multiple;
        }
        else if (bulletSource is BulletSourceGenderBender bender)
        {
            return GetBulletSourceMultiple(bender.BulletSource);
        }
        else
        {
            return null;
        }
    }
}
