using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem;
using UnityAtoms.BaseAtoms;

public class CharacterMovementManager : BehaviourManager
{
    public StringVariable ActionMapVariable;

    public Vector2Variable VelocityVariable;

    public float Speed = 1f;

    protected override void ManagerAwake()
    {
        ActionMapVariable.Value = "MovementActionMap";
    }

    public void OnDirectionsChanged(InputAction.CallbackContext callbackContext)
    {
        VelocityVariable.Value = Speed * callbackContext.ReadValue<Vector2>();
    }

    public void OnDirectionsCanceled(InputAction.CallbackContext callbackContext)
    {
        VelocityVariable.Value = Vector2.zero;
    }
}
