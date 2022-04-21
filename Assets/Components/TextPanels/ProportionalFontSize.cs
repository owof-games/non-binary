using UnityEngine;
using UnityAtoms.BaseAtoms;
using TMPro;
using System;

public class ProportionalFontSize : MonoBehaviour
{
    [SerializeField]
    private IntConstant _DesignScreenWidth;

    private TextMeshProUGUI _TextMeshProUGUI;

    private float _FontSize;
    private float _FontSizeMin;
    private float _FontSizeMax;

    private void Awake()
    {
        _TextMeshProUGUI = GetComponent<TextMeshProUGUI>();
        _FontSize = _TextMeshProUGUI.fontSize;
        _FontSizeMin = _TextMeshProUGUI.fontSizeMin;
        _FontSizeMax = _TextMeshProUGUI.fontSizeMax;
        UpdateFontSize();
    }

    // private Size _ScreenSize;
    private FullLayout _FullLayout;

    // public void OnScreenSizeChanged(Size screenSize)
    // {
    //     _ScreenSize = screenSize;
    //     UpdateFontSize();
    // }
    public void OnFullLayoutChanged(FullLayout fullLayout)
    {
        _FullLayout = fullLayout;
        UpdateFontSize();
    }

    private void UpdateFontSize()
    {
        if (_TextMeshProUGUI != null && _FullLayout != null)
        {
            var ratio = (float)_FullLayout.Scene.Screen.width / _DesignScreenWidth.Value;
            _TextMeshProUGUI.fontSize = _FontSize * ratio;
            _TextMeshProUGUI.fontSizeMin = _FontSizeMin * ratio;
            _TextMeshProUGUI.fontSizeMax = _FontSizeMax * ratio;
        }
    }
}
