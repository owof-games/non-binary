using UnityEngine;
using UnityEngine.UI;
using RG.LogLibrary;

public class MainTextPositionAndSize : MonoBehaviour
{
    private Vector2 _MainTextSize;

    private float _SpacingBottom;

    private bool _MainTextBorder;

    private RectTransform _RectTransform;

    private Image _BorderImage;

    private void Awake()
    {
        _RectTransform = GetComponent<RectTransform>();
        _BorderImage = GetComponentInChildren<Image>();
        UpdateRect();
    }

    public void OnMainTextSizeChanged(Vector2 mainTextSize)
    {
        _MainTextSize = mainTextSize;
        UpdateRect();
    }

    public void OnSpacingBottomChanged(float spacingBottom)
    {
        _SpacingBottom = spacingBottom;
        UpdateRect();
    }

    public void OnMainTextBorderChanged(bool mainTextBorder)
    {
        _MainTextBorder = mainTextBorder;
        UpdateRect();
    }

    private void UpdateRect()
    {
        if (!_RectTransform)
        {
            return;
        }
        var spacingSide = (1 - _MainTextSize.x) / 2;
        this.Verbose("computing anchors from main text size = {0}, spacing bottom = {1}, so spacing side = {2}",
            _MainTextSize, _SpacingBottom, spacingSide);
        _RectTransform.anchorMin = new Vector2(
            spacingSide,
            _SpacingBottom / (_SpacingBottom + _MainTextSize.y)
        );
        _RectTransform.anchorMax = new Vector2(
            1 - spacingSide,
            1
        );
        _BorderImage.enabled = _MainTextBorder;
    }
}
