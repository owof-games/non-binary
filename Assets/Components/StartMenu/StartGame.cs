using UnityEngine;
using UnityEngine.EventSystems;
using UnityEngine.Playables;
using UnityAtoms.BaseAtoms;

public class StartGame : MonoBehaviour
{
    public PlayableDirector PlayableDirector;

    public StringVariable ActionMapVariable;

    public StringVariable BackgroundMusicName;

    public void Play()
    {
        // disable automatic keyboard navigation
        EventSystem.current.sendNavigationEvents = false;
        // disable our custom commands (disable all action maps)
        ActionMapVariable.Value = "";
        // start animation
        PlayableDirector.Play();
    }

    public void NextScene()
    {
        // TEMPORARY: disable audio
        BackgroundMusicName.Value = "";
    }
}
