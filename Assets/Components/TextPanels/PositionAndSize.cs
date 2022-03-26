using UnityEngine;
using RG.LogLibrary;
using UnityEngine.UI;

public class PositionAndSize : MonoBehaviour
{
    private Vector2 _Size;

    private float _SidePadding;

    private float _TopPadding;

    private bool _SideTextBorder;

    private RectTransform _RectTransform;

    private Image _BorderImage;

    [SerializeField]
    private bool _Left;

    private void Awake()
    {
        this.Verbose("Awake");
        _RectTransform = GetComponent<RectTransform>();
        _BorderImage = GetComponentInChildren<Image>();
        UpdateRect();
    }

    public void OnSideTextSizeChanged(Vector2 size)
    {
        this.Verbose("Received Side Text Size Changed: {0}", size);
        _Size = size;
        UpdateRect();
    }

    public void OnSidePaddingChanged(float sidePadding)
    {
        this.Verbose("Received Side Padding Changed: {0}", sidePadding);
        _SidePadding = sidePadding;
        UpdateRect();
    }

    public void OnTopPaddingChanged(float topPadding)
    {
        this.Verbose("Received Top Padding Changed: {0}", topPadding);
        _TopPadding = topPadding;
        UpdateRect();
    }

    public void OnSideTextBorderChanged(bool sideTextBorder)
    {
        this.Verbose("Side Text Border Changed: {0}", sideTextBorder);
        _SideTextBorder = sideTextBorder;
        UpdateRect();
    }

    private void UpdateRect()
    {
        if (!_RectTransform)
        {
            return;
        }
        _RectTransform.anchorMin = new Vector2(
            _Left ? _SidePadding : 1 - _SidePadding - _Size.x,
            1 - _TopPadding - _Size.y
        );
        _RectTransform.anchorMax = new Vector2(
            _Left ? _SidePadding + _Size.x : 1 - _SidePadding,
            1 - _TopPadding
        );
        _BorderImage.enabled = _SideTextBorder;
        this.Verbose("Recomputed anchor min to {0} and anchor max to {1}", _RectTransform.anchorMin, _RectTransform.anchorMax);
    }
}
