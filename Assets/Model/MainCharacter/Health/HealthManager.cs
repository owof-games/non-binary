using UnityEngine;
using UnityAtoms.BaseAtoms;
using System;

[CreateAssetMenu(fileName = "HealthManager", menuName = "non-binary/Create Health Manager", order = 0)]
public class HealthManager : BaseManager
{
    [SerializeField]
    private VoidEvent _StartStory;

    [SerializeField]
    private VoidEvent _Hit;

    [SerializeField]
    private VoidEvent _ZeroHealthReached;

    [SerializeField]
    private IntConstant _HealthStandard;

    [SerializeField]
    private IntConstant _HealthStory;

    [SerializeField]
    private IntVariable _StartHealth;

    [SerializeField]
    private IntVariable _Health;

    [SerializeField]
    private IntEvent _HealthChanged;

    [SerializeField]
    private FloatVariable _HealthPercentage;

    [SerializeField]
    private StringVariable _ActionMapVariable;

    [SerializeField]
    private StringVariable _BackgroundMusicName;

    protected override void OnEnableManager()
    {
        RegisterTo(_StartStory, OnStartStory);
        RegisterTo(_Hit, OnHit);
        RegisterTo(_HealthChanged, OnHealthChanged);
    }

    private void OnStartStory()
    {
        _StartHealth.Value = _HealthStandard.Value;
        _Health.Value = _StartHealth.Value;
        UpdateHealthPercentage();
    }

    private void OnHit()
    {
        _Health.Value--;
    }

    private void OnHealthChanged(int obj)
    {
        UpdateHealthPercentage();
    }

    private void UpdateHealthPercentage()
    {
        if (_Health.Value < 0)
        {
            _Health.Value = 0;
        }
        _HealthPercentage.Value = ((float)_Health.Value) / _StartHealth.Value;
        if (_Health.Value == 0)
        {
            _ZeroHealthReached.Raise();
            _ActionMapVariable.Value = "";
            _BackgroundMusicName.Value = "";
        }
    }
}
