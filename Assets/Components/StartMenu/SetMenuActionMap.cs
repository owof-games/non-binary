using UnityEngine;
using UnityAtoms.BaseAtoms;

public class SetMenuActionMap : MonoBehaviour
{
    [SerializeField]
    private string _InitialValue;

    public StringVariable ActionMapVariable;

    private void Awake()
    {
        Debug.Log($"Setting action map to {_InitialValue}");
        ActionMapVariable.Value = _InitialValue;
    }
}
