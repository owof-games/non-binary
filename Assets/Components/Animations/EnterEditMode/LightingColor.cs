using UnityEngine;

public class LightingColor : MonoBehaviour
{
    public Color DestinationColor;

    [Range(0, 1)]
    public float T = 0;

    private float _LastT = 0;

    private void Update()
    {
        if (T != _LastT)
        {
            _LastT = T;
            RenderSettings.ambientLight = Color.Lerp(Color.white, DestinationColor, T);
        }
    }
}
