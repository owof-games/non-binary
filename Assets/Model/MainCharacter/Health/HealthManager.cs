using System;
using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

[CreateAssetMenu(fileName = "HealthManager", menuName = "non-binary/Create Health Manager", order = 0)]
public class HealthManager : BaseManager
{
    [SerializeField]
    private BoolVariable _Invincible;

    [SerializeField]
    private VoidEvent _StartStory;

    [SerializeField]
    private StoryStepEvent _StoryStepChanged;

    [SerializeField]
    private IntEvent _Hit;

    [SerializeField]
    private VoidEvent _ZeroHealthReached;

    [SerializeField]
    private IntVariable _StartHealth;

    [SerializeField]
    private IntVariable _Health;

    [SerializeField]
    private IntReference _MinHealthOutsideBulletHells;

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
        RegisterTo(_StoryStepChanged, OnStoryStepChanged);
        RegisterTo(_Hit, OnHit);
        RegisterTo(_HealthChanged, OnHealthChanged);
    }

    private StoryStep _StoryStep;

    private void OnStoryStepChanged(StoryStep obj)
    {
        _StoryStep = obj;
        _Invincible.Value = _StoryStep.IsBulletHell && _StoryStep.BulletHellName == "finale";
    }

    private void OnStartStory()
    {
        _Health.Value = _StartHealth.Value;
        UpdateHealthPercentage();
    }

    private void OnHit(int damage)
    {
        if (!_Invincible.Value)
        {
            var min = _StoryStep.IsBulletHell ? 0 : _MinHealthOutsideBulletHells;
            _Health.Value = Math.Max(min, _Health.Value - damage);
        }
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
