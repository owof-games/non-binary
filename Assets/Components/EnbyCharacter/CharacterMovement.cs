using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityAtoms.BaseAtoms;

public class CharacterMovement : MonoBehaviour
{
    public Vector2Variable VelocityVariable;

    private Rigidbody _Rigidbody;

    private void Awake()
    {
        _Rigidbody = GetComponent<Rigidbody>();
        UpdateVelocity(VelocityVariable.Value);
    }

    public void UpdateVelocity(Vector2 velocity)
    {
        if (_Rigidbody != null)
        {
            _Rigidbody.velocity = velocity;
        }
    }
}
