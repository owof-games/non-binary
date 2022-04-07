using UnityEngine;
using RG.LogLibrary;

public class BoundingBox : MonoBehaviour
{
    [SerializeField]
    private BoxCollider _TopBoundingBox;

    [SerializeField]
    private BoxCollider _BottomBoundingBox;

    [SerializeField]
    private BoxCollider _LeftBoundingBox;

    [SerializeField]
    private BoxCollider _RightBoundingBox;

    [SerializeField]
    [Range(0, 1)]
    private float _BottomBoundingBoxPosition = 1f;

    private float _LastBottomBoundingBoxPosition;

    private FullLayout _FullLayout;
    public void SetFullLayout(FullLayout newFullLayout)
    {
        _FullLayout = newFullLayout;
        UpdateRect();
    }

    private void Awake()
    {
        _LastBottomBoundingBoxPosition = _BottomBoundingBoxPosition;
    }

    private void Update()
    {
        if (_LastBottomBoundingBoxPosition != _BottomBoundingBoxPosition)
        {
            _LastBottomBoundingBoxPosition = _BottomBoundingBoxPosition;
            UpdateRect();
        }
    }

    private void UpdateRect()
    {
        // this.Verbose("Computing bounding box with size {0}x{1} (proportional size: {2}x{3}), spacing bottom {4} and main text height {5}",
        //     _ScreenSize.Width, _ScreenSize.Height, _ScreenSize.ProportionalWidth, _ScreenSize.ProportionalHeight,
        //     _SpacingBottom, _MainTextHeight);
        // if (_ScreenSize.Width == 0 || _ScreenSize.Height == 0)
        // {
        //     // skip initial 0x0 value
        //     return;
        // }
        // // compute the bottom left and top right corner of the rectangle (in world position) where we can move
        var z = transform.position.z;
        // var dx = (_ScreenSize.Width - _ScreenSize.ProportionalWidth) / 2;
        // var dy = (_ScreenSize.Height - _ScreenSize.ProportionalHeight) / 2;
        // var dx2 = _ScreenSize.ProportionalWidth * (1 - _StreetVisualizationParameters.WidthFactor) / 2;
        // var bottomTextSpacePercentage = _SpacingBottom + _MainTextHeight;
        // var dy2 = _ScreenSize.ProportionalHeight * bottomTextSpacePercentage;
        // var blWorldPosition = Camera.main.ScreenToWorldPoint(new Vector3(
        //     dx + dx2, dy + dy2, z
        // ));
        // var trWorldPosition = Camera.main.ScreenToWorldPoint(new Vector3(
        //     _ScreenSize.Width - dx - dx2, _ScreenSize.Height - dy, z
        // ));
        var streetWorldRect = _FullLayout.Street.World;
        var mainTextWorldRect = _FullLayout.MainText.World;
        var blWorldPosition = new Vector2(streetWorldRect.xMin,
            Mathf.Lerp(streetWorldRect.yMin, mainTextWorldRect.yMax, _BottomBoundingBoxPosition)
        );
        var trWorldPosition = new Vector2(streetWorldRect.xMax, streetWorldRect.yMax);
        var width = trWorldPosition.x - blWorldPosition.x;
        var height = trWorldPosition.y - blWorldPosition.y;
        var xCenter = (trWorldPosition.x + blWorldPosition.x) / 2;
        var yCenter = (trWorldPosition.y + blWorldPosition.y) / 2;
        // change colliders
        const float thickness = 1f;
        const float colliderZSize = 10f;
        _LeftBoundingBox.center = new Vector3(blWorldPosition.x - thickness / 2, yCenter, z);
        _LeftBoundingBox.size = new Vector3(thickness, height, colliderZSize);
        _RightBoundingBox.center = new Vector3(trWorldPosition.x + thickness / 2, yCenter, z);
        _RightBoundingBox.size = new Vector3(thickness, height, colliderZSize);
        _TopBoundingBox.center = new Vector3(xCenter, trWorldPosition.y + thickness / 2, z);
        _TopBoundingBox.size = new Vector3(width, thickness, colliderZSize);
        _BottomBoundingBox.center = new Vector3(xCenter, blWorldPosition.y - thickness / 2, z);
        _BottomBoundingBox.size = new Vector3(width, thickness, colliderZSize);
    }
}
