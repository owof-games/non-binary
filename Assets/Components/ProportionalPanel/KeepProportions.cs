using UnityEngine;
using RG.LogLibrary;
using UnityAtoms;

public class KeepProportions : MonoBehaviour
{
    private RectTransform _RectTransform;

    private FullLayout _FullLayout;

    private void Start()
    {
        _RectTransform = GetComponent<RectTransform>();
        UpdateSize();
    }

    public void OnFullLayoutChanged(FullLayout fullLayout)
    {
        _FullLayout = fullLayout;
        UpdateSize();
    }

    private void UpdateSize()
    {
        // check if the full rect is ready
        var screenCoords = _FullLayout.Scene.Screen;
        if (screenCoords.width == 0 || screenCoords.height == 0 || _RectTransform == null)
        {
            this.Verbose("skipping size update because we are not ready yet");
            return;
        }
        // reposition anchor
        var screenPercentage = _FullLayout.Screen.Percentage;
        var x = (0.5f - screenPercentage.xMin) / screenPercentage.width;
        var y = (0.5f - screenPercentage.yMin) / screenPercentage.height;
        var v = new Vector2(x, y);
        _RectTransform.anchorMin = v;
        _RectTransform.anchorMax = v;
        // resize rect
        _RectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, screenCoords.width);
        _RectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, screenCoords.height);
    }
}
