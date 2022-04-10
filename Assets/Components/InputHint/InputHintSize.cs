using UnityEngine;
using UnityAtoms;

public class InputHintSize : MonoBehaviour
{
    private RectTransform _RectTransform;

    private void Awake()
    {
        _RectTransform = GetComponent<RectTransform>();
    }

    public void OnFullLayoutChange(FullLayout fullLayout)
    {
        var streetRect = fullLayout.Street.Percentage;
        _RectTransform.anchorMin = new Vector2(streetRect.xMin, streetRect.yMin);
        _RectTransform.anchorMax = new Vector2(streetRect.xMax, streetRect.yMax);
    }
}
