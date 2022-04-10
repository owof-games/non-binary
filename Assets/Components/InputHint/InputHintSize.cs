using UnityEngine;
using UnityAtoms;
using System;

public class InputHintSize : MonoBehaviour
{
    private RectTransform _RectTransform;

    private void Awake()
    {
        _RectTransform = GetComponent<RectTransform>();
        UpdateRT();
    }

    private FullLayout _FullLayout;

    public void OnFullLayoutChange(FullLayout fullLayout)
    {
        _FullLayout = fullLayout;
        UpdateRT();
    }

    private void UpdateRT()
    {
        if (_RectTransform == null)
        {
            return;
        }
        var streetRect = _FullLayout.Street.Percentage;
        _RectTransform.anchorMin = new Vector2(streetRect.xMin, streetRect.yMin);
        _RectTransform.anchorMax = new Vector2(streetRect.xMax, streetRect.yMax);
    }
}
