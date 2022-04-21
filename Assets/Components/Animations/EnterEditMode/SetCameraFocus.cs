using UnityEngine;
using UnityAtoms;

public class SetCameraFocus : MonoBehaviour
{
    public Rect Value1;

    public Rect Value2;

    private float _LastT = 0;

    public float t = 0;

    public RectVariable CameraFocusVariable;

    private void Start()
    {
        RecordStartingCameraFocus();
    }

    public void RecordStartingCameraFocus()
    {
        Value1 = CameraFocusVariable.Value;
    }

    private void Update()
    {
        if (t != _LastT)
        {
            _LastT = t;
            CameraFocusVariable.Value = new Rect(
                Mathf.Lerp(Value1.xMin, Value2.xMin, t),
                Mathf.Lerp(Value1.yMin, Value2.yMin, t),
                Mathf.Lerp(Value1.width, Value2.width, t),
                Mathf.Lerp(Value1.height, Value2.height, t)
            );
            if (Mathf.Approximately(t, 1))
            {
                Value1 = Value2;
            }
        }
    }
}
