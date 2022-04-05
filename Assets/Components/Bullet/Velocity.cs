using UnityEngine;
using RG.LogLibrary;

public class Velocity : MonoBehaviour
{
    private Rigidbody _Rigidbody;

    private DestroyOnCollision _DestroyOnCollision;

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
    private Vector2 _RotationCenter;

    [SerializeField]
    private float _AngularSpeed = 0;

    [SerializeField]
    private Vector2 _InitialPosition;

    private void Awake()
    {
        _Rigidbody = GetComponent<Rigidbody>();
        _DestroyOnCollision = GetComponent<DestroyOnCollision>();
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
        if (_DestroyOnCollision.Dying)
        {
            return;
        }
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
        var startVector = _InitialPosition - _RotationCenter;
        var rotationRadius = startVector.magnitude;
        var initialAngle = Mathf.Atan2(startVector.y, startVector.x);
        v.x += -rotationRadius * _AngularSpeed * Mathf.Sin(_AngularSpeed * Time.time + initialAngle);
        v.y += rotationRadius * _AngularSpeed * Mathf.Cos(_AngularSpeed * Time.time + initialAngle);
        _Rigidbody.velocity = new Vector3(
            v.x, v.y, 0
        );
    }

    [System.Serializable]
    public class Description
    {
        public Vector2 InitialVelocity;

        public VelocityStep[] VelocitySteps;

        public Vector2 RotationCenter;

        public float AngularSpeed;

        public Vector2 InitialPosition;
    }

    public void Setup(Description description)
    {
        _InitialVelocity = description.InitialVelocity;
        _VelocitySteps = description.VelocitySteps;
        _RotationCenter = description.RotationCenter;
        _AngularSpeed = description.AngularSpeed;
        _InitialPosition = description.InitialPosition;
    }
}
