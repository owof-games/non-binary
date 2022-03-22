using UnityEngine;
using UnityEngine.EventSystems;
using RG.LogLibrary;

public class ButtonAudio : MonoBehaviour, ISelectHandler
{
    private AudioSource _AudioSource;

    // Start is called before the first frame update
    void Awake()
    {
        _AudioSource = GetComponent<AudioSource>();
    }

    public void PlayBeep()
    {
        _AudioSource.Play();
    }

    private static bool FirstSelection = true;

    public void OnSelect(BaseEventData eventData)
    {
        this.Info("Select button");
        if (FirstSelection)
        {
            FirstSelection = false;
        }
        else
        {
            PlayBeep();
        }
    }
}
