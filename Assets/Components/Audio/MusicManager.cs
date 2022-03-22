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

    private float? SwitchedAudioAt = null;

    private AudioClip NextAudioClip;

    private void InitializeFadeout()
    {
        _AudioSource = GetComponent<AudioSource>();
        UpdateBackgroundMusic(BackgroundMusicName.Value);
    }

    public void UpdateBackgroundMusic(string name)
    {
        NextAudioClip = null;
        foreach (var audioEntry in Entries)
        {
            if (audioEntry.Name == name)
            {
                NextAudioClip = audioEntry.AudioClip;
            }
        }
        if (_AudioSource.clip == null && NextAudioClip != null)
        {
            // no audio: immediately switch
            _AudioSource.clip = NextAudioClip;
            _AudioSource.Play();
        }
        else
        {
            // book the audio switch later
            SwitchedAudioAt = Time.time;
        }
    }

    private void UpdateForFadeout()
    {
        // is a fadeout in progress?
        if (SwitchedAudioAt.HasValue)
        {
            // compute fadeout volume
            var startTime = SwitchedAudioAt.Value;
            var t = (Time.time - startTime) / FadeOutDuration;
            _AudioSource.volume = Mathf.Lerp(1, 0, t);
            // have we reached the end of the fadeout?
            if (t >= 1)
            {
                // mark the fadeout as completed and go to the next audio clip
                SwitchedAudioAt = null;
                _AudioSource.clip = NextAudioClip;
                if (NextAudioClip)
                {
                    _AudioSource.volume = 1f;
                    _AudioSource.Play();
                }
            }
        }
    }

    #endregion
}
