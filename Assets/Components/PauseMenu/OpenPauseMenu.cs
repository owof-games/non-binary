using UnityEngine;
using UnityEngine.Playables;
using UnityAtoms.BaseAtoms;

public class OpenPauseMenu : MonoBehaviour
{
    private PlayableDirector _PlayableDirector;

    public BoolReference CanOpenPauseMenu;

    private void Awake()
    {
        _PlayableDirector = GetComponent<PlayableDirector>();
    }

    public void OnOpenPauseMenu()
    {
        if (CanOpenPauseMenu.Value)
        {
            _PlayableDirector.Play();
        }
    }
}
