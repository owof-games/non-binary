using UnityEngine;
using UnityEngine.UI;

public class RescaleImageDensity : MonoBehaviour
{
    public Image[] Images;

    public float ScreenWidthReference = 1920f;

    private void Awake()
    {
        var scalingFactor = Screen.width / ScreenWidthReference;
        foreach (var image in Images)
        {
            image.pixelsPerUnitMultiplier /= scalingFactor;
        }
    }
}
