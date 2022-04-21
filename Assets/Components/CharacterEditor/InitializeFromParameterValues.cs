using UnityEngine;
using UnityEngine.UI;

public class InitializeFromParameterValues : MonoBehaviour
{
    public ShapeParameters ShapeParameters;

    public Slider PSlider;
    public Slider HeightSlider;
    public Slider Hue1Slider;
    public Slider Hue2Slider;
    public Slider InnerRadiusSlider;
    public Slider TorqueSlider;

    private void Start()
    {
        PSlider.value = ShapeParameters.Shape == ShapeParameters.AvailableShapes.P222 ? 0 :
            ShapeParameters.Shape == ShapeParameters.AvailableShapes.P223 ? 1 :
            2;
        HeightSlider.value = ShapeParameters.Height;
        Hue1Slider.value = ShapeParameters.Hue1 * 20;
        Hue2Slider.value = ShapeParameters.Hue2 * 20;
        InnerRadiusSlider.value = ShapeParameters.InnerRadius;
        TorqueSlider.value = ShapeParameters.Torque;
    }
}
