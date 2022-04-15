using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class Velocity : MonoBehaviour
{
    private Rigidbody _Rigidbody;

    private DestroyOnCollision _DestroyOnCollision;

    [SerializeField]
    private Vector2 _InitialVelocity;

    #region prediction parameters

    /*
    the movement parameters are:
    t0: the absolute time at the beginning of the movement
    c: the rotation center at time t0
    r: the distance from the rotation center at time t0
    a0: the angle from the rotation center at time t0
    o: the angular speed
    v: the linear velocity coponent
    the formula to compute the position of a bullet at time t (relative to t0) is thus:
    x = c + r * [cos, sin](o*t + a0) + t * v
    */

    private Vector2 _V;

    private Vector2 _C;

    private float _R;

    private float _O;

    private float _A0;

    private float _T0;

    private void SetupPredictionParameters(Vector2 v, Vector2 c, float r, float o, float a0, float t0)
    {
        _V = v;
        _C = c;
        _R = r;
        _O = o;
        _A0 = a0;
        _T0 = t0;
    }

    #endregion

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
    private float _MaxRotationAngle = 0;

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
        var relativeInitialPosition = _InitialPosition - _RotationCenter;
        SetupPredictionParameters(
            _InitialVelocity,
            _RotationCenter,
            relativeInitialPosition.magnitude,
            _AngularSpeed,
            Mathf.Atan2(relativeInitialPosition.y, relativeInitialPosition.x),
            Time.time
        );

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
            this.Info("got to step {0} because relative time is {1} and the step time is {2}", _CurrentStep + 1, relativeTime, _VelocitySteps[_CurrentStep + 1].Time);
            _CurrentStep++;
            SetupPredictionParameters(
                _VelocitySteps[_CurrentStep].NewVelocity,
                _C + (Time.time - _T0) * _V,
                _R,
                _O,
                _A0,
                Time.time
            );
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
        // get the current position
        Vector2 currentPosition = transform.position;
        // predict the new position at time + dt
        var dt = Time.fixedDeltaTime;
        var t = Time.time - _T0 + dt;
        Vector2 predictedPosition = PredictPositionAt(t);
        // compute the velocity necessary to get there
        var v = (predictedPosition - currentPosition) / dt;
        _Rigidbody.velocity = v;
        // reverse angular direction if needed
        if (_MaxRotationAngle > 0)
        {
            var a = PredictAngleAt(t);
            // this.Verbose("checking current angle {0} vs a0 {1} and max rotation angle")
            if (Mathf.Abs(a - _A0) >= Mathf.Deg2Rad * _MaxRotationAngle)
            {
                SetupPredictionParameters(
                    _VelocitySteps[_CurrentStep].NewVelocity,
                    _C + (Time.time - _T0) * _V,
                    _R,
                    -_O,
                    a,
                    Time.time
                );
            }
        }
    }

    private Vector2 PredictPositionAt(float t)
    {
        var a = PredictAngleAt(t);
        var predictedPosition = _C + _R * new Vector2(Mathf.Cos(a), Mathf.Sin(a)) + t * _V;
        return predictedPosition;
    }

    private float PredictAngleAt(float t)
    {
        return _O * t + _A0;
    }

    [System.Serializable]
    public class Description
    {
        public Vector2 InitialVelocity;

        public VelocityStep[] VelocitySteps;

        public Vector2 RotationCenter;

        public float AngularSpeed;

        public float MaxRotationAngle;

        public Vector2 InitialPosition;

        public float LifeDuration;
    }

    public void Setup(Description description)
    {
        _InitialVelocity = description.InitialVelocity;
        _VelocitySteps = description.VelocitySteps;
        _RotationCenter = description.RotationCenter;
        _AngularSpeed = description.AngularSpeed;
        _MaxRotationAngle = description.MaxRotationAngle;
        _InitialPosition = description.InitialPosition;
        _LifeDuration = description.LifeDuration;
    }

    #region dying

    private float _AlphaMultiplier = 1;

    public void OnAlphaMultiplierChanged(float alphaMultiplier)
    {
        _AlphaMultiplier = alphaMultiplier;
        if (_DyingTime < 0)
        {
            SetMaterialAlpha(1);
        }
        // if dying, the dying animation will handle it
    }

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
        alpha *= _AlphaMultiplier;
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
        // if (Time.frameCount % 240 == 0)
        // {
        //     this.Info("_LifeDuration = {0}", _LifeDuration);
        // }
        if (_LifeDuration < 0)
        {
            return;
        }
        var startDeathAnimationTime = _StartingTime + _LifeDuration - _DyingAnimationDuration;
        // if (Time.frameCount % 240 == 0)
        // {
        //     this.Info("time is {0} and _StartingTime = {1} + _LifeDuration = {2} - _DyingAnimationDuration = {3} => {4}",
        //     Time.time, _StartingTime, _LifeDuration, _DyingAnimationDuration.Value, startDeathAnimationTime);
        // }
        if (Time.time >= startDeathAnimationTime)
        {
            this.Info("starting to die!");
            _DyingTime = Time.time;
        }
    }

    #endregion
}
