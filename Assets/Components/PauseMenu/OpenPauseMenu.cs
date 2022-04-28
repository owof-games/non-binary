using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Playables;
using UnityAtoms.BaseAtoms;

public class OpenPauseMenu : MonoBehaviour
{
    private PlayableDirector _PlayableDirector;

    public BoolReference CanOpenPauseMenu;

    private GameObject _CurrentlySelectedGameObject;

    private void Awake()
    {
        _PlayableDirector = GetComponent<PlayableDirector>();
    }

    public void OnOpenPauseMenu()
    {
        if (CanOpenPauseMenu.Value)
        {
            _CurrentlySelectedGameObject = EventSystem.current.currentSelectedGameObject;
            _PlayableDirector.Play();
        }
    }

    public void ResumeSelectedGameObject()
    {
        EventSystem.current.SetSelectedGameObject(_CurrentlySelectedGameObject);
        _CurrentlySelectedGameObject = null;
    }
}
