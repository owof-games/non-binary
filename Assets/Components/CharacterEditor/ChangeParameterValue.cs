using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChangeParameterValue : MonoBehaviour
{
    public ShapeParameters ShapeParameters;

    public void OnPChanged(float newPValueFloat)
    {
        var newPValue = Mathf.RoundToInt(newPValueFloat);
        switch (newPValue)
        {
            case 0: ShapeParameters.Shape = ShapeParameters.AvailableShapes.P222; break;
            case 1: ShapeParameters.Shape = ShapeParameters.AvailableShapes.P223; break;
            case 2: ShapeParameters.Shape = ShapeParameters.AvailableShapes.P332; break;
        }
    }

    public void OnHeightChanged(float newValue)
    {
        ShapeParameters.Height = newValue;
    }

    public void OnHue1Changed(float newValue)
    {
        ShapeParameters.Hue1 = newValue / 20f;
    }

    public void OnHue2Changed(float newValue)
    {
        ShapeParameters.Hue2 = newValue / 20f;
    }

    public void OnInnerRadiusChanged(float newValue)
    {
        ShapeParameters.InnerRadius = newValue;
    }

    public void OnTorqueChanged(float newValue)
    {
        ShapeParameters.Torque = newValue;
    }
}
