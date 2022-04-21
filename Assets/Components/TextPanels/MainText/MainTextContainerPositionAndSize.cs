using UnityEngine;

public class MainTextContainerPositionAndSize : MonoBehaviour
{
    // private Vector2 _MainTextSize;

    // private float _SpacingBottom;

    private RectTransform _RectTransform;

    private FullLayout _FullLayout;

    private void Awake()
    {
        _RectTransform = GetComponent<RectTransform>();
        UpdateRect();
    }

    // public void OnMainTextSizeChanged(Vector2 mainTextSize)
    // {
    //     _MainTextSize = mainTextSize;
    //     UpdateRect();
    // }

    // public void OnSpacingBottomChanged(float spacingBottom)
    // {
    //     _SpacingBottom = spacingBottom;
    //     UpdateRect();
    // }

    public void OnFullLayoutChanged(FullLayout fullLayout)
    {
        _FullLayout = fullLayout;
        UpdateRect();
    }

    private void UpdateRect()
    {
        if (_RectTransform == null || _FullLayout == null)
        {
            return;
        }
        _RectTransform.anchorMin = new Vector2(_FullLayout.Scene.Percentage.xMin, _FullLayout.Scene.Percentage.yMin);
        _RectTransform.anchorMax = new Vector2(_FullLayout.Scene.Percentage.xMax, _FullLayout.MainText.Percentage.yMax);
    }
}
