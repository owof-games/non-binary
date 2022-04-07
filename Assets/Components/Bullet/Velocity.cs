using UnityEngine;
using UnityAtoms.BaseAtoms;
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

    private Material _Material;

    private void Start()
    {
        _CurrentVelocity = _InitialVelocity;
        _StartingTime = Time.time;
        var mr = GetComponent<MeshRenderer>();
        _Material = mr.material;
        _Material = Instantiate(_Material);
        mr.material = _Material;
        SetMaterialAlpha(1);
        UpdateVelocity();
    }

    private int _CurrentStep = -1;

    [SerializeField]
    private FloatReference _DyingAnimationDuration;

    private void FixedUpdate()
    {
        if (_DestroyOnCollision.Dying)
        {
            return;
        }
        if (_DyingTime > 0)
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

    private void Update()
    {
        CheckLifetime();
        HandleDying();
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

        public float LifeDuration;
    }

    public void Setup(Description description)
    {
        _InitialVelocity = description.InitialVelocity;
        _VelocitySteps = description.VelocitySteps;
        _RotationCenter = description.RotationCenter;
        _AngularSpeed = description.AngularSpeed;
        _InitialPosition = description.InitialPosition;
        _LifeDuration = description.LifeDuration;
    }

    #region dying

    private float _DyingTime = -1;

    private float _LifeDuration = -1;

    private void HandleDying()
    {
        if (_DyingTime > 0)
        {
            var t = (Time.time - _DyingTime) / _DyingAnimationDuration;
            if (t >= 1)
            {
                this.Info("destroying!");
                Destroy(gameObject);
            }
            else
            {
                var alpha = Mathf.Lerp(1, 0, t);
                SetMaterialAlpha(alpha);
            }
        }
    }

    private void SetMaterialAlpha(float alpha)
    {
        var c = _Material.GetColor("_BaseColor");
        c.a = alpha;
        _Material.SetColor("_BaseColor", c);
    }

    private void CheckLifetime()
    {
        if (_DyingTime > 0)
        {
            return;
        }
        if (Time.frameCount % 240 == 0)
        {
            this.Info("_LifeDuration = {0}", _LifeDuration);
        }
        if (_LifeDuration < 0)
        {
            return;
        }
        var startDeathAnimationTime = _StartingTime + _LifeDuration - _DyingAnimationDuration;
        if (Time.frameCount % 240 == 0)
        {
            this.Info("time is {0} and _StartingTime = {1} + _LifeDuration = {2} - _DyingAnimationDuration = {3} => {4}",
            Time.time, _StartingTime, _LifeDuration, _DyingAnimationDuration.Value, startDeathAnimationTime);
        }
        if (Time.time >= startDeathAnimationTime)
        {
            this.Info("starting to die!");
            _DyingTime = Time.time;
        }
    }

    #endregion
}
