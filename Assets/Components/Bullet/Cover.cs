using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Cover : MonoBehaviour
{
    [SerializeField]
    private bool _IsLeftCover;

    [SerializeField]
    private Size _NewSize;

    public void SetNewSize(Size newSize)
    {
        _NewSize = newSize;
        UpdateSize();
    }

    [SerializeField]
    private float _StreetWidth;

    public void SetStreetWidth(float streetWidth)
    {
        _StreetWidth = streetWidth;
        UpdateSize();
    }

    private void UpdateSize()
    {
        var screenLeftX1 = _NewSize.Width - _NewSize.ProportionalWidth;
        var screenLeftX2 = (_NewSize.Width - _NewSize.ProportionalWidth * _StreetWidth) / 2;
        var screenRightX1 = _NewSize.Width - screenLeftX2;
        var screenRightX2 = _NewSize.Width - screenLeftX1;
        var worldSpaceLeft1 = Camera.main.ScreenToWorldPoint(new Vector3(screenLeftX1, 0, 0));
        var worldSpaceLeft2 = Camera.main.ScreenToWorldPoint(new Vector3(screenLeftX2, _NewSize.Height, 0));
        var worldSpaceRight1 = Camera.main.ScreenToWorldPoint(new Vector3(screenRightX1, 0, 0));
        var worldSpaceRight2 = Camera.main.ScreenToWorldPoint(new Vector3(screenRightX2, _NewSize.Height, 0));
        var c1 = _IsLeftCover ? worldSpaceLeft1 : worldSpaceRight1;
        var c2 = _IsLeftCover ? worldSpaceLeft2 : worldSpaceRight2;
        transform.position = new Vector3(
            (c2.x + c1.x) / 2,
            (c2.y + c1.y) / 2,
            transform.position.z
        );
        transform.localScale = new Vector3(
            c2.x - c1.x,
            c2.y - c1.y,
            1
        );
    }
}
