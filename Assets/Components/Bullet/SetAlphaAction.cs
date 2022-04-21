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
        SetValue();
    }

    private float _LastValue = 1;

    public void SetAlphaMultiplierValue(float value)
    {
        _LastValue = value;
        SetValue();
    }

    private void SetValue()
    {
        if (_AlphaManagement != null)
        {
            // Debug.Log("setting alpha to " + _LastValue.ToString(), this);
            _AlphaManagement.SetAlphaMultiplier(AlphaMultiplierName, _LastValue);
        }
    }
}
