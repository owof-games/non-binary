using System.Collections.Generic;
using System.Linq;
using UnityEngine;
using RG.LogLibrary;

[CreateAssetMenu(fileName = "BulletSourceCompound", menuName = "non-binary/BulletSource/Create Compound", order = 0)]
public class BulletSourceCompound : BulletSource
{
    [SerializeField]
    private BaseLogger _BaseLogger;

    [SerializeField]
    private Vector2[] _Positions;

    [SerializeField]
    private Vector2 _AutomaticTranslation = new Vector2(0, 0);

    [SerializeField]
    private Vector2 _AutomaticScaling = new Vector2(1, 1);

    [SerializeField]
    private Quaternion _AutomaticRotation = Quaternion.identity;

    [SerializeField]
    private BulletSourceCompound _TakePositionsFrom = null;

    [SerializeField]
    private Vector2 _LocalTranslation = new Vector2(0, 0);

    [SerializeField]
    private Vector2 _LocalScaling = new Vector2(1, 1);

    [SerializeField]
    private Quaternion _LocalRotation = Quaternion.identity;

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

    private Matrix4x4 GetTRSMatrix()
    {
        if (_TakePositionsFrom != null)
        {
            return _TakePositionsFrom.GetTRSMatrix();
        }
        else
        {
            if (!_TRSMatrix.HasValue)
            {
                _TRSMatrix = Matrix4x4.TRS(_AutomaticTranslation, _AutomaticRotation, _AutomaticScaling);
            }
            return _TRSMatrix.Value;
        }
    }

    private Matrix4x4? _LocalTRSMatrix = null;

    private Matrix4x4 GetLocalTRSMatrix()
    {
        if (!_LocalTRSMatrix.HasValue)
        {
            _LocalTRSMatrix = Matrix4x4.TRS(_LocalTranslation, _LocalRotation, _LocalScaling);
        }
        return _LocalTRSMatrix.Value;
    }

    private Vector2 GetPosition(int positionIndex)
    {
        Vector2 pos = _TakePositionsFrom != null ?
             _TakePositionsFrom.GetPosition(positionIndex) :
            GetTRSMatrix().MultiplyPoint3x4(_Positions[positionIndex]);
        return GetLocalTRSMatrix().MultiplyPoint3x4(pos);
    }

    private Vector2 GetRotationCenter()
    {
        return (GetLocalTRSMatrix() * (_TakePositionsFrom != null ?
             _TakePositionsFrom.GetTRSMatrix() :
            GetTRSMatrix())).MultiplyPoint3x4(_RotationCenter);
    }

    private int _NumPositions
    {
        get => _TakePositionsFrom != null ? _TakePositionsFrom._NumPositions : _Positions.Length;
    }

    private Vector2 GetRadialCenter(VelocityStep velocityStep)
    {
        return (GetLocalTRSMatrix() * GetTRSMatrix()).MultiplyPoint3x4(velocityStep.RadialCenter);
    }

    private float GetPlanarX(VelocityStep velocityStep)
    {
        var v = new Vector2(velocityStep.PlanarX, 0);
        var v2 = GetTRSMatrix().MultiplyPoint3x4(v);
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

    public override IEnumerable<Description> Descriptions
    {
        get
        {
            // compute total duration
            var lifetime = Enumerable.Sum(from velocityStep in _VelocitySteps select velocityStep.Duration);
            // create a description for each particle position
            var descriptions = new Description[_NumPositions];
            for (var positionIndex = 0; positionIndex < _NumPositions; positionIndex++)
            {
                var position = GetPosition(positionIndex);
                var rotationCenter = GetRotationCenter();
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
                    RotationCenter = rotationCenter,
                    AngularSpeed = _AbsoluteRotationSpeed,
                    InitialPosition = position,
                    VelocitySteps = MyVelocitySteps,
                    LifeDuration = lifetime
                };
            }
            if (_AbsoluteRotationSpeed != 0 && _BaseLogger != null && _BaseLogger.Configuration != null)
            {
                _BaseLogger.Verbose(this, "some info about rotation:");
                for (var i = 0; i < descriptions.Length; i++)
                {
                    _BaseLogger.Verbose(this, "position = {0}, rotation center = {1}", descriptions[i].InitialPosition, descriptions[i].RotationCenter);
                }
            }
            return descriptions;
        }
    }
}
