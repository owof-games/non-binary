using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "BulletSourceGenderBender", menuName = "non-binary/BulletSource/Create Gender Bender", order = 0)]
public class BulletSourceGenderBender : BulletSource
{
    [SerializeField]
    private BulletSource _BulletSource;

    public BulletSource BulletSource { get => _BulletSource; set { _BulletSource = value; } }

    public bool IsBlue;

    public override IEnumerable<Description> Descriptions
    {
        get
        {
            foreach (var description in _BulletSource.Descriptions)
            {
                var d = description.Clone();
                d.IsPink = !IsBlue;
                yield return d;
            }
        }
    }
}
