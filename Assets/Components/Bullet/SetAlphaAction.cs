using UnityEngine;

public class SetAlphaAction : MonoBehaviour
{
    public string AlphaMultiplierName;

    private AlphaManagement _AlphaManagement;

    private void Start()
    {
        if (!TryGetComponent(out _AlphaManagement))
        {
            throw new System.Exception("cannot find alpha management");
        }
    }

    public void SetAlphaMultiplierValue(float value)
    {
        Debug.Log("setting alpha to " + value.ToString(), this);
        _AlphaManagement.SetAlphaMultiplier(AlphaMultiplierName, value);
    }
}
