using System.Collections;
using UnityEngine;
using UnityEngine.Playables;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class ShowHideHints : MonoBehaviour
{
    [SerializeField]
    private FloatReference _HasMovedDelay;

    private bool _HasMoved;

    [SerializeField]
    private PlayableDirector _ShowDirector;


    [SerializeField]
    private PlayableDirector _HideDirector;

    [SerializeField]
    private VoidEvent _StartStoryEvent;

    void Start()
    {
        this.Verbose("starting");
        StartCoroutine(WaitToShowHints());
    }

    private bool _ShowingHints;

    private IEnumerator WaitToShowHints()
    {
        this.Verbose("waiting for {0} seconds", _HasMovedDelay.Value);
        yield return new WaitForSeconds(_HasMovedDelay);
        this.Verbose("checking if it moved...");
        if (!_HasMoved)
        {
            this.Verbose("has not moved: start animation");
            _ShowingHints = true;
            _ShowDirector.Play();
        }
        else
        {
            this.Verbose("has moved already.");
        }
    }

    public void OnDirectionsChanged(Vector2 direction)
    {
        if (!_HasMoved && direction.magnitude != 0)
        {
            _HasMoved = true;
            if (_ShowingHints)
            {
                this.Verbose("has moved and was showing hints: hide them");
                _ShowDirector.Stop();
                _HideDirector.Play();
                _ShowingHints = false;
            }
            this.Verbose("raising start story event");
            _StartStoryEvent.Raise();
        }
    }
}
