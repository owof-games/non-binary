using UnityEngine;

public class TimeScaling : MonoBehaviour
{
    [SerializeField]
    [Range(0, 1)]
    private float _TimeScale = 1;

    // Update is called once per frame
    void Update()
    {
        Time.timeScale = _TimeScale;
    }
}
