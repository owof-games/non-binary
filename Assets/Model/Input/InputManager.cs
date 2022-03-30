using UnityEngine;
using UnityEngine.SceneManagement;
using UnityEngine.InputSystem;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

[CreateAssetMenu(fileName = "InputManager", menuName = "non-binary/Create Input Manager", order = 1)]
public class InputManager : BaseManager
{
    public BaseLogger BaseLogger;

    public InputActionAsset InputActionAsset;

    private InputActionMap _CurrentlyEnabledInputActionMap = null;

    public StringVariable ActionMapVariable;

    public StringEvent ActionMapVariableChanged;

    public InputAction_CallbackContextEvent NextEntry;

    public InputAction_CallbackContextEvent PreviousEntry;

    public InputAction_CallbackContextEvent Directions;
    public InputAction_CallbackContextEvent DirectionsCanceled;

    public InputAction_CallbackContextEvent NextLine;

    protected override void OnEnableManager()
    {
        var menuActionMap = GetInputActionMap("MenuActionMap");
        GetInputAction(menuActionMap, "PreviousEntry").performed += PreviousEntry.Raise;
        GetInputAction(menuActionMap, "NextEntry").performed += NextEntry.Raise;

        var movementActionMap = GetInputActionMap("MovementActionMap");
        GetInputAction(movementActionMap, "Directions").performed += Directions.Raise;
        GetInputAction(movementActionMap, "Directions").canceled += DirectionsCanceled.Raise;
        GetInputAction(movementActionMap, "NextLine").performed += OnNextLinePerformed;
        GetInputAction(movementActionMap, "NextLine").canceled += OnNextLineRaised; //NextLine.Raise; // canceled = onkeyup

        RegisterTo(ActionMapVariableChanged, EnableCurrentActionMap);
        EnableCurrentActionMap(ActionMapVariable.Value);
    }

    private bool _IgnoreNextNextLinePerformed = false; // hack
    private bool _NextLinePerformedReceived = false;

    private void OnNextLinePerformed(InputAction.CallbackContext _)
    {
        if (ActionMapVariable.Value == "MovementActionMap" && !_IgnoreNextNextLinePerformed)
        {
            BaseLogger.Info(this, "received NextLine (performed); remember it.");
            _NextLinePerformedReceived = true;
        }
        else if (_IgnoreNextNextLinePerformed)
        {
            BaseLogger.Info(this, "received NextLine (performed) but we must ignore the next \"nextline\" performed");
            _IgnoreNextNextLinePerformed = false;
        }
        else
        {
            BaseLogger.Info(this, "received NextLine (performed) but we are not in the right action map!!!");
        }
    }

    private void OnNextLineRaised(InputAction.CallbackContext item)
    {
        // there's some weird bug where disabling MenuActionMap raises the MovementActionMap's NextLine canceled event (?!)
        if (ActionMapVariable.Value == "MovementActionMap" && _NextLinePerformedReceived)
        {
            BaseLogger.Info(this, "received NextLine event, we are in the right action map and we previously received a perform.");
            _NextLinePerformedReceived = false;
            NextLine.Raise(item);
        }
        else if (!_NextLinePerformedReceived)
        {
            BaseLogger.Info(this, "received NextLine event but we did not received a performed!!!");
        }
        else
        {
            BaseLogger.Info(this, "received NextLine event but we are not in the right action map!!!");
        }
    }

    private void EnableCurrentActionMap(string actionMapName)
    {
        BaseLogger.Info(this, $"setting action map from {_CurrentlyEnabledInputActionMap?.name} to {actionMapName}");
        if (_CurrentlyEnabledInputActionMap?.name == "ChoiceActionMap" &&
            actionMapName == "MovementActionMap")
        {
            // hack
            BaseLogger.Info(this, "will ignore next NextLine.performed");
            _IgnoreNextNextLinePerformed = true;
        }
        _CurrentlyEnabledInputActionMap?.Disable();
        if (actionMapName != "")
        {
            _CurrentlyEnabledInputActionMap = GetInputActionMap(actionMapName, false);
            _CurrentlyEnabledInputActionMap?.Enable();
        }
    }

    private InputActionMap GetInputActionMap(string actionMapName, bool throwIfNotFound = true)
    {
        return InputActionAsset.FindActionMap(actionMapName, throwIfNotFound);
    }

    private InputAction GetInputAction(InputActionMap actionMap, string actionName)
    {
        return actionMap.FindAction(actionName, throwIfNotFound: true);
    }
}
