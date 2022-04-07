using UnityEngine;
using UnityAtoms.BaseAtoms;

public class InitializeBackgroundMusic : MonoBehaviour
{
    public StringVariable BackgroundMusicNameVariable;
    public StringReference InitialBackgroundMusicName;

    private void Start()
    {
        BackgroundMusicNameVariable.Value = InitialBackgroundMusicName;
    }
}
