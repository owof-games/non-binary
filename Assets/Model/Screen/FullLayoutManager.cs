using System;
using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

[CreateAssetMenu(fileName = "FullLayoutManager", menuName = "non-binary/Create Full Layout Manager", order = 0)]
public class FullLayoutManager : BaseManager
{
    [SerializeField]
    private SizeEvent _SizeChanged;
    private Size _Size;

    [SerializeField]
    private Vector2Event _MainTextSizeChanged;
    private Vector2 _MainTextSize;

    [SerializeField]
    private FloatEvent _SideTextPaddingChanged;
    private float _SideTextPadding;

    [SerializeField]
    private Vector2Event _SideTextSizeChanged;
    private Vector2 _SideTextSize;

    [SerializeField]
    private FloatEvent _SpacingBottomChanged;
    private float _SpacingBottom;

    [SerializeField]
    private FloatEvent _SpacingTopChanged;
    private float _SpacingTop;

    [SerializeField]
    private FloatEvent _StreetWidthChanged;
    private float _StreetWidth;

    [SerializeField]
    private VoidEvent _UpdateScreenCoordinates;

    public FullLayoutVariable FullLayoutVariable;

    public BaseLogger BaseLogger;

    protected override void OnEnableManager()
    {
        RegisterTo(_SizeChanged, OnXChanged<Size>(newSize => { _Size = newSize; }));
        RegisterTo(_MainTextSizeChanged, OnXChanged<Vector2>(newMainTextSize => { _MainTextSize = newMainTextSize; }));
        RegisterTo(_SideTextPaddingChanged, OnXChanged<float>(newSideTextPadding => { _SideTextPadding = newSideTextPadding; }));
        RegisterTo(_SideTextSizeChanged, OnXChanged<Vector2>(newSideTextSize => { _SideTextSize = newSideTextSize; }));
        RegisterTo(_SpacingBottomChanged, OnXChanged<float>(newSpacingBottom => { _SpacingBottom = newSpacingBottom; }));
        RegisterTo(_SpacingTopChanged, OnXChanged<float>(newSpacingTop => { _SpacingTop = newSpacingTop; }));
        RegisterTo(_StreetWidthChanged, OnXChanged<float>(newStreetWidth => { _StreetWidth = newStreetWidth; }));
        RegisterTo(_UpdateScreenCoordinates, UpdateFullLayout);
    }

    private Action<T> OnXChanged<T>(Action<T> setObj)
    {
        return (T obj) =>
        {
            setObj(obj);
            UpdateFullLayout();
        };
    }

    private void UpdateFullLayout()
    {
        var percentageLeftSideText = new Rect(_SideTextPadding, 1 - _SpacingTop - _SideTextSize.y, _SideTextSize.x, _SideTextSize.y);
        var percentageRightSideText = new Rect(1 - _SideTextPadding - _SideTextSize.x, percentageLeftSideText.y, percentageLeftSideText.width, percentageLeftSideText.height);
        var percentageStreet = new Rect((1 - _StreetWidth) / 2, 0, _StreetWidth, 1);
        var percentageMainText = new Rect((1 - _MainTextSize.x) / 2, _SpacingBottom, _MainTextSize.x, _MainTextSize.y);
        BaseLogger.Info(this, "Computing layout with size = {0}", _Size);
        FullLayoutVariable.Value = new FullLayout(_Size, percentageLeftSideText, percentageRightSideText, percentageStreet, percentageMainText);
    }
}