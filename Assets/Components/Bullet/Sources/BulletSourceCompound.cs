using UnityEngine;

[CreateAssetMenu(fileName = "BulletSourceCompound", menuName = "non-binary/BulletSource/Create Compound", order = 0)]
public class BulletSourceCompound : BulletSource
{
    [SerializeField]
    private Vector2[] _Positions;

    [SerializeField]
    private Vector2 _AutomaticTranslation = new Vector2(0, 0);

    [SerializeField]
    private Vector2 _AutomaticScaling = new Vector2(1, 1);

    [SerializeField]
    public enum VelocityStepType
    {
        Uniform,
        Radial,
        Planar
    }

    [System.Serializable]
    public struct VelocityStep
    {
        public float Duration;
        public VelocityStepType Type;
        public float Magnitude;
        public Vector2 UniformDirection; // only if uniform
        public Vector2 RadialCenter; // only if radial
        public float PlanarX; // only if planar
    }

    [SerializeField]
    private VelocityStep[] _VelocitySteps;

    [SerializeField]
    private Vector2 _RotationCenter;

    [SerializeField]
    private float _AbsoluteRotationSpeed;

    [SerializeField]
    private float _MaxRotationAngle;

    [SerializeField]
    private bool _IsPink;

    private Matrix4x4? _TRSMatrix = null;

    private void InitializeTRSMatrix()
    {
        if (!_TRSMatrix.HasValue)
        {
            _TRSMatrix = Matrix4x4.TRS(_AutomaticTranslation, Quaternion.identity, _AutomaticScaling);
        }
    }
    private Vector2 GetPosition(int positionIndex)
    {
        InitializeTRSMatrix();
        return _TRSMatrix.Value.MultiplyPoint3x4(_Positions[positionIndex]);
    }

    private Vector2 GetRadialCenter(VelocityStep velocityStep)
    {
        InitializeTRSMatrix();
        return _TRSMatrix.Value.MultiplyPoint3x4(velocityStep.RadialCenter);
    }

    private float GetPlanarX(VelocityStep velocityStep)
    {
        InitializeTRSMatrix();
        var v = new Vector2(velocityStep.PlanarX, 0);
        var v2 = _TRSMatrix.Value.MultiplyPoint3x4(v);
        return v2.x;
    }
    private Vector2 GetVelocity(int positionIndex, int velocityStepIndex)
    {
        var position = GetPosition(positionIndex);
        var velocityStep = _VelocitySteps[velocityStepIndex];
        return velocityStep.Type switch
        {
            VelocityStepType.Uniform => velocityStep.Magnitude * velocityStep.UniformDirection.normalized,
            VelocityStepType.Radial => velocityStep.Magnitude * (position - GetRadialCenter(velocityStep)),
            VelocityStepType.Planar => new Vector2(position.x > GetPlanarX(velocityStep) ? velocityStep.Magnitude : -velocityStep.Magnitude, 0),
            _ => throw new System.Exception("Unknown velocity step type"),
        };
    }

    public override Description[] Descriptions
    {
        get
        {
            // create a description for each particle position
            var descriptions = new Description[_Positions.Length];
            for (var positionIndex = 0; positionIndex < _Positions.Length; positionIndex++)
            {
                var position = GetPosition(positionIndex);
                // create a velocity description for each step
                var MyVelocitySteps = new Velocity.VelocityStep[_VelocitySteps.Length];
                var velocityStepIndex = 0;
                var currentTime = 0f;
                foreach (var velocityStep in _VelocitySteps)
                {
                    MyVelocitySteps[velocityStepIndex] = new Velocity.VelocityStep()
                    {
                        Time = currentTime,
                        NewVelocity = GetVelocity(positionIndex, velocityStepIndex)
                    };
                    velocityStepIndex++;
                    currentTime += velocityStep.Duration;
                }
                descriptions[positionIndex] = new Description()
                {
                    IsPink = _IsPink,
                    DeltaTime = 0,
                    InitialVelocity = GetVelocity(positionIndex, 0),
                    RotationCenter = _RotationCenter,
                    AngularSpeed = _AbsoluteRotationSpeed,
                    InitialPosition = position,
                    VelocitySteps = MyVelocitySteps
                };
            }
            return descriptions;
        }
    }
}
