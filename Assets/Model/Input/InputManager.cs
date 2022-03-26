using UnityEngine;
using UnityEngine.InputSystem;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

[CreateAssetMenu(fileName = "InputManager", menuName = "non-binary/Create Input Manager", order = 1)]
public class InputManager : BaseManager
{
    public InputActionAsset InputActionAsset;

    private InputActionMap _CurrentlyEnabledInputActionMap = null;

    public StringVariable ActionMapVariable;

    public StringEvent ActionMapVariableChanged;

    public InputAction_CallbackContextEvent NextEntry;

    public InputAction_CallbackContextEvent PreviousEntry;

    public InputAction_CallbackContextEvent Directions;
    public InputAction_CallbackContextEvent DirectionsCanceled;

    protected override void OnEnableManager()
    {
        var menuActionMap = GetInputActionMap("MenuActionMap");
        GetInputAction(menuActionMap, "PreviousEntry").performed += PreviousEntry.Raise;
        GetInputAction(menuActionMap, "NextEntry").performed += NextEntry.Raise;

        var movementActionMap = GetInputActionMap("MovementActionMap");
        GetInputAction(movementActionMap, "Directions").performed += Directions.Raise;
        GetInputAction(movementActionMap, "Directions").canceled += DirectionsCanceled.Raise;

        RegisterTo(ActionMapVariableChanged, EnableCurrentActionMap);
        EnableCurrentActionMap(ActionMapVariable.Value);
    }

    private void EnableCurrentActionMap(string actionMapName)
    {
        _CurrentlyEnabledInputActionMap?.Disable();
        _CurrentlyEnabledInputActionMap = GetInputActionMap(actionMapName, false);
        _CurrentlyEnabledInputActionMap?.Enable();
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
