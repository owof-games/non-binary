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
    private StreetVisualizationParameters _StreetVisualizationParameters;

    private float _MainTextHeight;

    private float _SpacingBottom;

    private Size _ScreenSize;

    public void OnMainTextSizeChanged(Vector2 mainTextSize)
    {
        _MainTextHeight = mainTextSize.y;
        UpdateRect();
    }

    public void OnSpacingBottomChanged(float spacingBottom)
    {
        _SpacingBottom = spacingBottom;
        UpdateRect();
    }

    public void OnScreenSizeChanged(Size newSize)
    {
        _ScreenSize = newSize;
        UpdateRect();
    }

    private void UpdateRect()
    {
        this.Verbose("Computing bounding box with size {0}x{1} (proportional size: {2}x{3}), spacing bottom {4} and main text height {5}",
            _ScreenSize.Width, _ScreenSize.Height, _ScreenSize.ProportionalWidth, _ScreenSize.ProportionalHeight,
            _SpacingBottom, _MainTextHeight);
        if (_ScreenSize.Width == 0 || _ScreenSize.Height == 0)
        {
            // skip initial 0x0 value
            return;
        }
        // compute the bottom left and top right corner of the rectangle (in world position) where we can move
        var z = transform.position.z;
        var dx = (_ScreenSize.Width - _ScreenSize.ProportionalWidth) / 2;
        var dy = (_ScreenSize.Height - _ScreenSize.ProportionalHeight) / 2;
        var dx2 = _ScreenSize.ProportionalWidth * (1 - _StreetVisualizationParameters.WidthFactor) / 2;
        var bottomTextSpacePercentage = _SpacingBottom + _MainTextHeight;
        var dy2 = _ScreenSize.ProportionalHeight * bottomTextSpacePercentage;
        var blWorldPosition = Camera.main.ScreenToWorldPoint(new Vector3(
            dx + dx2, dy + dy2, z
        ));
        var trWorldPosition = Camera.main.ScreenToWorldPoint(new Vector3(
            _ScreenSize.Width - dx - dx2, _ScreenSize.Height - dy, z
        ));
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
