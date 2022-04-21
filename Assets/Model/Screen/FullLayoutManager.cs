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
    private RectEvent _CameraFocusChanged;
    private Rect _CameraFocus;


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
        RegisterTo(_CameraFocusChanged, OnXChanged<Rect>(newCameraFocus => { _CameraFocus = newCameraFocus; }));
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
        var actualCameraFocus = UpdateCamera();
        var percentageLeftSideText = new Rect(_SideTextPadding, 1 - _SpacingTop - _SideTextSize.y, _SideTextSize.x, _SideTextSize.y);
        var percentageRightSideText = new Rect(1 - _SideTextPadding - _SideTextSize.x, percentageLeftSideText.y, percentageLeftSideText.width, percentageLeftSideText.height);
        var percentageStreet = new Rect((1 - _StreetWidth) / 2, 0, _StreetWidth, 1);
        var percentageMainText = new Rect((1 - _MainTextSize.x) / 2, _SpacingBottom, _MainTextSize.x, _MainTextSize.y);
        BaseLogger.Info(this, "Computing layout with size = {0}", _Size);
        FullLayoutVariable.Value = new FullLayout(_Size, actualCameraFocus, percentageLeftSideText, percentageRightSideText, percentageStreet, percentageMainText);
    }

    private const float _InitialOrthographicSize = 5f;

    private Rect UpdateCamera()
    {
        if (_CameraFocus.width == 0 || _CameraFocus.height == 0 || Camera.main == null)
        {
            return new Rect(0, 0, 1, 1);
        }
        // compute the actual camera focus rectangle following the current aspect ratio - since focus is given in scene coordinates, it must be 1:1
        var currentProportions = _CameraFocus.width / _CameraFocus.height;
        var width = currentProportions > 1 ? _CameraFocus.height : _CameraFocus.width;
        var height = currentProportions > 1 ? _CameraFocus.height : _CameraFocus.width;
        var xCenter = (_CameraFocus.xMin + _CameraFocus.xMax) / 2;
        var yCenter = (_CameraFocus.yMin + _CameraFocus.yMax) / 2;
        var actualCameraFocus = new Rect(xCenter - width / 2, yCenter - height / 2, width, height);
        // compute the camera parameters to focus
        float xSceneToWorld(float x) => Size.Ratio * _InitialOrthographicSize * (2 * x - 1);
        float ySceneToWorld(float y) => _InitialOrthographicSize * (2 * y - 1);
        var worldCameraCenter = new Vector2(xSceneToWorld(xCenter), ySceneToWorld(yCenter));
        var worldCameraHalfHeight = (ySceneToWorld(actualCameraFocus.yMax) - ySceneToWorld(actualCameraFocus.yMin)) / 2;
        // Debug.Log("From actual camera focus " + actualCameraFocus.ToString() + " setting center to " + worldCameraCenter.ToString() + " and height to " + worldCameraHalfHeight.ToString());
        // set the camera focus
        Camera.main.transform.position = new Vector3(worldCameraCenter.x, worldCameraCenter.y, Camera.main.transform.position.z);
        Camera.main.orthographicSize = worldCameraHalfHeight;
        // return the computed actual camera focus
        return actualCameraFocus;
    }
}