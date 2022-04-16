using System.Collections;
using UnityEngine;
using UnityEngine.EventSystems;

public class ForceSquareImages : MonoBehaviour
{
    private RectTransform _RectTransform;

    [SerializeField]
    private float _Ratio = 1f;

    [SerializeField]
    private float _SidePadding = 0f;
    [SerializeField]
    private bool _IsRightSide = true;
    [SerializeField]
    private float _TopPadding = 0f;
    [SerializeField]
    private float _BottomPadding = 0f;

    private float _LastParentHeight = -1;

    protected void Awake()
    {
        _RectTransform = GetComponent<RectTransform>();
        // CheckSize();
    }

    // protected override void OnTransformParentChanged()
    // {
    //     CheckSize();
    // }

    // private void CheckSize()
    // {
    //     StartCoroutine(CheckSizeAfterOneFrame());
    // }

    private void Update()
    {
        var currentParentHeight = ((RectTransform)_RectTransform.parent).rect.height;
        if (_LastParentHeight != currentParentHeight)
        {
            _LastParentHeight = currentParentHeight;
            StartCoroutine(CheckSizeAfterOneFrame());
        }
    }

    private IEnumerator CheckSizeAfterOneFrame()
    {
        // Canvas.ForceUpdateCanvases();
        yield return null;
        // check if we have to correct the aspect ratio
        var size = _RectTransform.rect;
        if (Mathf.Approximately(size.x / size.y, _Ratio))
        {
            yield break;
        }
        // we do
        var name = _IsRightSide ? "right: " : "left: ";
        var sidePadding = _LastParentHeight * _SidePadding / 100;
        var topPadding = _LastParentHeight * _TopPadding / 100;
        var bottomPadding = _LastParentHeight * _BottomPadding / 100;
        var height = _LastParentHeight - topPadding - bottomPadding;
        var sidePaddingAndWidth = sidePadding + height / _Ratio;
        _RectTransform.offsetMin = new Vector2(_IsRightSide ? -sidePaddingAndWidth : sidePadding, bottomPadding);
        _RectTransform.offsetMax = new Vector2(_IsRightSide ? -sidePadding : sidePaddingAndWidth, -topPadding);
    }
}
