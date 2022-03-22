using UnityEngine;
using UnityAtoms.BaseAtoms;


public class MusicManager : BehaviourManager
{
    #region lifecycle management

    protected override void ManagerAwake()
    {
        InitializeFadeout();
    }

    private void Update()
    {
        UpdateForFadeout();
    }

    #endregion

    #region audio clips management

    [System.Serializable]
    public struct AudioEntry
    {
        public string Name;
        public AudioClip AudioClip;
    }

    public AudioEntry[] Entries;

    #endregion

    #region fadeout / fadein management

    public StringVariable BackgroundMusicName;

    private AudioSource _AudioSource;

    public float FadeOutDuration = 1f;

    private float? _SwitchedAudioAt = null;

    private AudioClip _NextAudioClip;

    private void InitializeFadeout()
    {
        _AudioSource = GetComponent<AudioSource>();
        UpdateBackgroundMusic(BackgroundMusicName.Value);
    }

    public void UpdateBackgroundMusic(string name)
    {
        _NextAudioClip = null;
        foreach (var audioEntry in Entries)
        {
            if (audioEntry.Name == name)
            {
                _NextAudioClip = audioEntry.AudioClip;
            }
        }
        if (_AudioSource.clip == null && _NextAudioClip != null)
        {
            // no audio: immediately switch
            _AudioSource.clip = _NextAudioClip;
            _AudioSource.Play();
        }
        else
        {
            // book the audio switch later
            _SwitchedAudioAt = Time.time;
        }
    }

    private void UpdateForFadeout()
    {
        // is a fadeout in progress?
        if (_SwitchedAudioAt.HasValue)
        {
            // compute fadeout volume
            var startTime = _SwitchedAudioAt.Value;
            var t = (Time.time - startTime) / FadeOutDuration;
            _AudioSource.volume = Mathf.Lerp(1, 0, t);
            // have we reached the end of the fadeout?
            if (t >= 1)
            {
                // mark the fadeout as completed and go to the next audio clip
                _SwitchedAudioAt = null;
                _AudioSource.clip = _NextAudioClip;
                if (_NextAudioClip)
                {
                    _AudioSource.volume = 1f;
                    _AudioSource.Play();
                }
            }
        }
    }

    #endregion
}
