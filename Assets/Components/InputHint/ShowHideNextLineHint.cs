using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Playables;
using UnityAtoms.BaseAtoms;

public class ShowHideNextLineHint : MonoBehaviour
{
    public FloatReference HasMovedDelay;

    private Animator _Animator;

    private void Awake()
    {
        _Animator = GetComponent<Animator>();
    }

    public void OnStartStory()
    {
        StartCoroutine(WaitToShowHint());
    }

    private bool _HasNextLineHappened = false;

    public void OnNextLine()
    {
        _HasNextLineHappened = true;
        _Animator.SetTrigger("hide");
    }

    private IEnumerator WaitToShowHint()
    {
        yield return new WaitForSeconds(HasMovedDelay);
        if (!_HasNextLineHappened)
        {
            _Animator.SetTrigger("show");
        }
    }
}
