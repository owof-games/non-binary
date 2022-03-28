using UnityEngine;
using UnityAtoms.BaseAtoms;

public class ChoiceButton : MonoBehaviour
{
    [SerializeField]
    private int _Index;

    public IntEvent MakeChoiceEvent;

    public void OnChoiceButtonClicked()
    {
        MakeChoiceEvent.Raise(_Index);
    }
}
