using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ShapeParameters : MonoBehaviour
{
    private Material _Material;

    public enum AvailableShapes
    {
        P222,
        P223,
        P332,
    }

    public Renderer Mesh;

    private AvailableShapes? _PreviousShape = null;

    public AvailableShapes Shape = AvailableShapes.P222;

    private float? _PreviousHeight = null;

    [Range(0, 1)]
    public float Height = 0;

    private float? _PreviousHue1 = null;
    [Range(0, 1)]
    public float Hue1;

    private float? _PreviousHue2 = null;
    [Range(0, 1)]
    public float Hue2;

    private float? _PreviousInnerRadius = null;
    [Range(0, 1)]
    public float InnerRadius;

    private float? _PreviousTorque = null;
    [Range(0, 1)]
    public float Torque;

    private void Awake()
    {
        _Material = Mesh.material;
    }

    // Update is called once per frame
    void Update()
    {
        if (!_PreviousShape.HasValue || _PreviousShape.Value != Shape)
        {
            Vector4 p1 = Vector4.zero, p2 = Vector4.zero, p3 = Vector4.zero, p4 = Vector4.zero, p5 = Vector4.zero, p6 = Vector4.zero;
            switch (Shape)
            {
                case AvailableShapes.P222:
                    p1 = new Vector4(0, 0, 1, 0);
                    p2 = new Vector4(0, Mathf.PI / 2, 1, 0);
                    p3 = new Vector4(Mathf.PI / 2, 0, 1, 0);
                    break;
                case AvailableShapes.P223:
                    p1 = new Vector4(0, 0, 1, 0);
                    p2 = new Vector4(0, Mathf.PI / 3, 1, 0);
                    p3 = new Vector4(0, 2 * Mathf.PI / 3, 1, 0);
                    p4 = new Vector4(Mathf.PI / 2, 0, 1, 0);
                    break;
                case AvailableShapes.P332:
                    p1 = new Vector4(0, 0, 1, 0);
                    p2 = new Vector4(0, Mathf.PI / 3, 1, 0);
                    p3 = new Vector4(0, 2 * Mathf.PI / 3, 1, 0);
                    p4 = new Vector4(Mathf.PI / 3, Mathf.PI / 6, 1, 0);
                    p5 = new Vector4(2 * Mathf.PI / 3, Mathf.PI / 6, 1, 0);
                    // p6 = new Vector4(Mathf.PI / 3, -Mathf.PI / 3, 1, 0);
                    break;
            }
            _Material.SetVector("_P1", p1);
            _Material.SetVector("_P2", p2);
            _Material.SetVector("_P3", p3);
            _Material.SetVector("_P4", p4);
            _Material.SetVector("_P5", p5);
            _Material.SetVector("_P6", p6);
            _PreviousShape = Shape;
        }
        if (!_PreviousHeight.HasValue || _PreviousHeight.Value != Height)
        {
            _Material.SetFloat("_Height", Height);
            _PreviousHeight = Height;
        }
        if (!_PreviousInnerRadius.HasValue || _PreviousInnerRadius.Value != InnerRadius)
        {
            _Material.SetFloat("_InnerRadius", InnerRadius);
            _PreviousInnerRadius = InnerRadius;
        }
        if (!_PreviousTorque.HasValue || _PreviousTorque.Value != Torque)
        {
            _Material.SetFloat("_Theta", Torque);
            _PreviousTorque = Torque;
        }
        if (!_PreviousHue1.HasValue || _PreviousHue1.Value != Hue1)
        {
            SetMaterialHue(Hue1, "_BaseColor");
            _PreviousHue1 = Hue1;
        }
        if (!_PreviousHue2.HasValue || _PreviousHue2.Value != Hue2)
        {
            SetMaterialHue(Hue2, "_TopColor");
            _PreviousHue2 = Hue2;
        }
    }

    private void SetMaterialHue(float newValue, string name)
    {
        var newColor = Color.HSVToRGB(newValue, 1, 1);
        _Material.SetColor(name, newColor);
    }
}
