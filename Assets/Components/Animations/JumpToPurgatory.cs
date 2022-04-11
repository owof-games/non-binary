using UnityEngine;
using UnityAtoms.BaseAtoms;

public class JumpToPurgatory : MonoBehaviour
{
    [SerializeField]
    private StringReference _PurgatoryKnotName;

    [SerializeField]
    private StringEvent _StartKnotEvent;

    public void Jump()
    {
        _StartKnotEvent.Raise(_PurgatoryKnotName.Value);
    }
}
