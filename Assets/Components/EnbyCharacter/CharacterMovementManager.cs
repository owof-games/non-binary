using UnityEngine;
using UnityEngine.InputSystem;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class CharacterMovementManager : BehaviourManager
{
    public StringVariable ActionMapVariable;

    public Vector2Variable VelocityVariable;

    public float Speed = 1f;

    private float _CurrentWidth = 0;

    protected override void ManagerAwake()
    {
        ActionMapVariable.Value = "MovementActionMap";
    }

    public void OnDirectionsChanged(InputAction.CallbackContext callbackContext)
    {
        VelocityVariable.Value = Speed * _CurrentWidth * callbackContext.ReadValue<Vector2>() / 100;
    }

    public void OnDirectionsCanceled(InputAction.CallbackContext _)
    {
        VelocityVariable.Value = Vector2.zero;
    }

    public void OnScreenSizeChanged(Size newSize)
    {
        _CurrentWidth = newSize.ProportionalWidth;
        this.Info("Current width is: {0}", _CurrentWidth);
    }
}
