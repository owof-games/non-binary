using UnityEngine;
using RG.LogLibrary;
using UnityEngine.UI;

public class PositionAndSize : MonoBehaviour
{
    private bool _SideTextBorder;

    private RectTransform _RectTransform;

    private Image _BorderImage;

    private Rect _SideTextPercentageRect;

    [SerializeField]
    private bool _Left;

    private void Awake()
    {
        this.Verbose("Awake");
        _RectTransform = GetComponent<RectTransform>();
        _BorderImage = GetComponentInChildren<Image>();
        UpdateRect();
    }

    public void OnFullLayoutChanged(FullLayout fullLayout)
    {
        _SideTextPercentageRect = (_Left ? fullLayout.LeftSideText : fullLayout.RightSideText).Percentage;
    }

    public void OnSideTextBorderChanged(bool sideTextBorder)
    {
        this.Verbose("Side Text Border Changed: {0}", sideTextBorder);
        _SideTextBorder = sideTextBorder;
        UpdateRect();
    }

    private void UpdateRect()
    {
        if (!_RectTransform)
        {
            return;
        }
        _BorderImage.enabled = _SideTextBorder;
        _RectTransform.anchorMin = new Vector2(
            _SideTextPercentageRect.xMin,
            _SideTextPercentageRect.yMin
        );
        _RectTransform.anchorMax = new Vector2(
            _SideTextPercentageRect.xMax,
            _SideTextPercentageRect.yMax
        );
        this.Verbose("Recomputed anchor min to {0} and anchor max to {1}", _RectTransform.anchorMin, _RectTransform.anchorMax);
    }
}
