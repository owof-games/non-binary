using UnityEngine;
using RG.LogLibrary;
using UnityAtoms;

public class KeepProportions : MonoBehaviour
{
    private RectTransform _RectTransform;

    public SizeReference InitialScreenSize;

    private void Start()
    {
        _RectTransform = GetComponent<RectTransform>();
        OnScreenSizeChanged(InitialScreenSize.Value);
    }

    public void OnScreenSizeChanged(Size screenSize)
    {
        if (screenSize.Width != 0 && screenSize.Height != 0)
        {
            this.Info("screen size changed to {0}x{1}; proportional size is now {2}x{3}",
                screenSize.Width, screenSize.Height, screenSize.ProportionalWidth, screenSize.ProportionalHeight);
            _RectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Horizontal, screenSize.ProportionalWidth);
            _RectTransform.SetSizeWithCurrentAnchors(RectTransform.Axis.Vertical, screenSize.ProportionalHeight);
        }
        else
        {
            this.Verbose("skipping initial 0x0 size value");
        }
    }
}
