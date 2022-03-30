using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MainTextContainerPositionAndSize : MonoBehaviour
{
    private Vector2 _MainTextSize;

    private float _SpacingBottom;

    private RectTransform _RectTransform;

    private void Awake()
    {
        _RectTransform = GetComponent<RectTransform>();
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

    private void UpdateRect()
    {
        if (!_RectTransform)
        {
            return;
        }
        _RectTransform.anchorMin = new Vector2(0, 0); // exceed to avoid rounding errors and not covering all street
        _RectTransform.anchorMax = new Vector2(1, _SpacingBottom + _MainTextSize.y);
    }
}
