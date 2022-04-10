using System.Collections;
using UnityEngine;
using UnityEngine.Playables;
using UnityAtoms.BaseAtoms;

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
        StartCoroutine(WaitToShowHints());
    }

    private bool _ShowingHints;

    private IEnumerator WaitToShowHints()
    {
        yield return new WaitForSeconds(_HasMovedDelay);
        if (!_HasMoved)
        {
            _ShowingHints = true;
            _ShowDirector.Play();
        }
    }

    public void OnDirectionsChanged(Vector2 direction)
    {
        if (!_HasMoved && direction.magnitude != 0)
        {
            _HasMoved = true;
            if (_ShowingHints)
            {
                _ShowDirector.Stop();
                _HideDirector.Play();
            }
            _StartStoryEvent.Raise();
        }
    }
}
