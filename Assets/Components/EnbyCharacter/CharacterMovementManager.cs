using UnityEngine;
using UnityEngine.InputSystem;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

public class CharacterMovementManager : BehaviourManager
{
    public StringVariable ActionMapVariable;

    public Vector2Variable VelocityVariable;

    public float Speed = 1f;

    public FullLayoutReference FullLayout;

    protected override void ManagerAwake()
    {
        // should not be necessary, but we can't set input system's action map value with other logics because it has bugs
        ActionMapVariable.Value = "MovementActionMap";
    }

    public void OnDirectionsChanged(InputAction.CallbackContext callbackContext)
    {
        VelocityVariable.Value = Speed *
            FullLayout.Value.Screen.Screen.width *
            callbackContext.ReadValue<Vector2>()
            / 100;
    }

    public void OnDirectionsCanceled(InputAction.CallbackContext _)
    {
        VelocityVariable.Value = Vector2.zero;
    }
}
