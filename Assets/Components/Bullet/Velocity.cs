using UnityEngine;
using RG.LogLibrary;

public class Velocity : MonoBehaviour
{
    private Rigidbody _Rigidbody;

    [SerializeField]
    private Vector2 _InitialVelocity;

    private Vector2 _CurrentVelocity;

    [System.Serializable]
    public struct VelocityStep
    {
        public float Time;
        public Vector2 NewVelocity;
    }

    [SerializeField]
    private VelocityStep[] _VelocitySteps;

    [SerializeField]
    private float _RotationRadius = 0;

    [SerializeField]
    private float _AngularSpeed = 0;

    [SerializeField]
    private float _InitialAngle = 0;

    private void Awake()
    {
        _Rigidbody = GetComponent<Rigidbody>();
    }

    private float _StartingTime = -1;

    private void Start()
    {
        _CurrentVelocity = _InitialVelocity;
        _StartingTime = Time.time;
        UpdateVelocity();
    }

    private int _CurrentStep = -1;

    private void FixedUpdate()
    {
        var relativeTime = Time.time - _StartingTime;
        if (_VelocitySteps != null &&
            _CurrentStep < _VelocitySteps.Length - 1 &&
            relativeTime >= _VelocitySteps[_CurrentStep + 1].Time)
        {
            this.Info("got to step {0} because relative time is {1}", _CurrentStep + 1, relativeTime);
            _CurrentVelocity = _VelocitySteps[_CurrentStep + 1].NewVelocity;
            _CurrentStep++;
        }
        UpdateVelocity();
    }

    private void UpdateVelocity()
    {
        var v = _CurrentVelocity;
        v.x += -_RotationRadius * _AngularSpeed * Mathf.Sin(_AngularSpeed * Time.time + _InitialAngle);
        v.y += _RotationRadius * _AngularSpeed * Mathf.Cos(_AngularSpeed * Time.time + _InitialAngle);
        _Rigidbody.velocity = new Vector3(
            v.x, v.y, 0
        ); ;
    }
}
