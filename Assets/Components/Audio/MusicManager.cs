using System.Collections;
using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class MusicManager : BehaviourManager
{
    #region lifecycle management

    protected override void ManagerAwake()
    {
        InitializeFadeout();
        StartCoroutine(DebugAudioClips());
    }

    private IEnumerator DebugAudioClips()
    {
        for (; ; )
        {
            var i = 0;
            foreach (var audioSource in GetComponents<AudioSource>())
            {
                this.Verbose("{0}: clip {1}, {2}",
                    i++,
                    audioSource.clip ? audioSource.clip.name : "",
                    audioSource.isPlaying ? "playing" : "stopped"
                );
            }
            yield return new WaitForSeconds(2);
        }
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

    [System.Serializable]
    public struct AudioGroupEntry
    {
        public string Name;
        public AudioClip[] AudioClips;
    }

    public AudioGroupEntry[] SFXEntries;

    #endregion

    #region fadeout / fadein management

    public FloatReference TopVolume;

    private AudioSource _AudioSource;

    public float FadeOutDuration = 1f;

    private float? _SwitchedAudioAt = null;

    private AudioClip _NextAudioClip;

    private AudioSource[] _SFXAudioSources;

    public int NumSFXAudioSources = 3;

    private string _BackgroundMusicName;

    private void InitializeFadeout()
    {
        _AudioSource = GetComponent<AudioSource>();
        _SFXAudioSources = new AudioSource[NumSFXAudioSources];
        for (var i = 0; i < NumSFXAudioSources; i++)
        {
            _SFXAudioSources[i] = gameObject.AddComponent<AudioSource>();
            _SFXAudioSources[i].playOnAwake = false;
        }
        UpdateBackgroundMusic(_BackgroundMusicName);
    }

    public void OnSFX(string sfxName)
    {
        // look for the correct clip
        foreach (var audioEntry in SFXEntries)
        {
            if (audioEntry.Name == sfxName)
            {
                var clip = audioEntry.AudioClips[Random.Range(0, audioEntry.AudioClips.Length)];
                // play on a free sfx audio source
                for (var i = 0; i < NumSFXAudioSources; i++)
                {
                    var audioSource = _SFXAudioSources[i];
                    if (!audioSource.isPlaying)
                    {
                        audioSource.clip = clip;
                        this.Info("playing SFX {0}", clip.name);
                        audioSource.Play();
                        return;
                    }
                }
                this.Warning("skipped sfx '{0}' because there are no audio sources available", sfxName);
                return;
            }
        }
        this.Error("could not find sfx named '{0}'", sfxName);
    }

    public void UpdateBackgroundMusic(string name)
    {
        this.Verbose("UpdateBackgroundMusic({0})", name);
        _BackgroundMusicName = name;
        if (_AudioSource == null)
        {
            return;
        }
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
            _AudioSource.volume = TopVolume;
            this.Info("playing music (no audio => immediately switch) {0}", _NextAudioClip.name);
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
                this.Info("setting music (finished fadeout) {0}", _NextAudioClip.name);
                _AudioSource.clip = _NextAudioClip;
                if (_NextAudioClip)
                {
                    _AudioSource.volume = TopVolume;
                    _AudioSource.Play();
                }
            }
        }
    }

    #endregion
}
