using UnityEngine;
using UnityEngine.UI;
using RG.LogLibrary;

public class MainTextPositionAndSize : MonoBehaviour
{
    private FullLayout _FullLayout = null;

    private bool _MainTextBorder;

    private RectTransform _RectTransform = null;

    private Image _BorderImage;

    private void Awake()
    {
        _RectTransform = GetComponent<RectTransform>();
        _BorderImage = GetComponentInChildren<Image>();
        UpdateRect();
    }

    public void OnFullLayoutChanged(FullLayout fullLayout)
    {
        _FullLayout = fullLayout;
        UpdateRect();
    }

    public void OnMainTextBorderChanged(bool mainTextBorder)
    {
        _MainTextBorder = mainTextBorder;
        UpdateRect();
    }

    private void UpdateRect()
    {
        if (_RectTransform == null ||
            _FullLayout == null ||
            _FullLayout.MainText.Percentage.yMax == _FullLayout.Scene.Percentage.yMin)
        {
            return;
        }
        _BorderImage.enabled = _MainTextBorder;
        // we are contained in a rect that stretches in width for the whole scene and in height from
        // the bottom of the scene to the top of the main rect; we must recompute our coordinates as
        // such
        this.Verbose("_FullLayout.MainText.Percentage.yMax = {0} - _FullLayout.Scene.Percentage.yMin = {1}",
            _FullLayout.MainText.Percentage.yMax, _FullLayout.Scene.Percentage.yMin);
        _RectTransform.anchorMin = new Vector2(
            _FullLayout.MainText.Percentage.xMin,
            (_FullLayout.MainText.Percentage.yMin - _FullLayout.Scene.Percentage.yMin) /
            (_FullLayout.MainText.Percentage.yMax - _FullLayout.Scene.Percentage.yMin)
        );
        _RectTransform.anchorMax = new Vector2(
            _FullLayout.MainText.Percentage.xMax,
            1
        );
    }
}
