using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;
using System;

public class ResetMainCharacter : MonoBehaviour
{
    private Vector3 _StartingCoordinates;

    [SerializeField]
    private Transform _MainCharacterTransform;

    [SerializeField]
    private IntVariable _Health;

    private int _StartHealth;

    private float _LastHealthValuePercentage;

    [SerializeField]
    private float _HealthValuePercentage;

    // Start is called before the first frame update
    void Start()
    {
        _StartingCoordinates = _MainCharacterTransform.position;
        _HealthValuePercentage = ((float)_Health.Value) / _StartHealth;
        _LastHealthValuePercentage = _HealthValuePercentage;
    }

    public void SetStartHealth(int startHealth)
    {
        _StartHealth = startHealth;
        UpdatePercentages();
    }

    public void SetHealthPercentage()
    {
        UpdatePercentages();
    }

    private void UpdatePercentages()
    {
        _HealthValuePercentage = ((float)_Health.Value) / _StartHealth;
        _LastHealthValuePercentage = _HealthValuePercentage;
    }

    public void ResetPosition()
    {
        _MainCharacterTransform.position = _StartingCoordinates;
    }

    private void Update()
    {
        if (float.IsNaN(_HealthValuePercentage))
        {
            return;
        }
        if (_LastHealthValuePercentage != _HealthValuePercentage)
        {
            var newValue = (int)Mathf.Round(_HealthValuePercentage * _StartHealth);
            _Health.Value = newValue;
            this.Verbose("Changing health from {0}% to {1}%; health = {2}",
                _LastHealthValuePercentage * 100, _HealthValuePercentage * 100, _Health.Value);
            _LastHealthValuePercentage = _HealthValuePercentage;
        }
    }
}
