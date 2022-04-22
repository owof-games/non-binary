using UnityEngine;
using UnityEngine.EventSystems;
using UnityAtoms.BaseAtoms;

public class SelectOnAwakeIf : MonoBehaviour
{
    public GameObject FirstControlIfTrue;
    public GameObject FirstControlIfFalse;
    public BoolReference Condition;

    private void Awake()
    {
        EventSystem.current.SetSelectedGameObject(Condition.Value ? FirstControlIfTrue : FirstControlIfFalse);
    }
}
