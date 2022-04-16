using UnityEngine;
using UnityAtoms.BaseAtoms;

public class ChangeDifficulty : MonoBehaviour
{
    [SerializeField]
    private IntReference _HealthStandard;

    [SerializeField]
    private IntReference _HealthStory;

    [SerializeField]
    private IntVariable _StartHealth;

    private void Awake()
    {
        _StartHealth.Value = _HealthStandard.Value;
    }

    public void OnChangeDifficulty(int difficultyIndex)
    {
        _StartHealth.Value = difficultyIndex switch
        {
            0 => _HealthStandard.Value,
            1 => _HealthStory.Value,
            _ => throw new System.Exception("Unknown difficulty index " + difficultyIndex.ToString()),
        };
    }
}
