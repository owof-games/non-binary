using UnityEngine;

public class RescaleSlider : MonoBehaviour
{
    public float ScreenWidthReference = 1920f;

    public RectTransform HandleRectTransform;

    private void Awake()
    {
        // scale the width
        var scalingFactor = Screen.width / ScreenWidthReference;
        HandleRectTransform.offsetMin = new Vector2(
            HandleRectTransform.offsetMin.x * scalingFactor,
            HandleRectTransform.offsetMin.y
        );
        HandleRectTransform.offsetMax = new Vector2(
            HandleRectTransform.offsetMax.x * scalingFactor,
            HandleRectTransform.offsetMax.y
        );
    }
}
