using UnityEngine;

public class TimeScaling : MonoBehaviour
{
    [SerializeField]
    [Range(0, 1)]
    private float _TimeScale = 1;

    private float _LastTimeScale = 1;

    private void OnEnable()
    {
        _LastTimeScale = _TimeScale;
    }

    // Update is called once per frame
    void Update()
    {
        if (_LastTimeScale != _TimeScale)
        {
            Time.timeScale = _TimeScale;
            _LastTimeScale = _TimeScale;
        }
    }
}
