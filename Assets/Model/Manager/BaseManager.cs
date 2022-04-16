using System;
using System.Collections.Generic;
using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

public abstract class BaseManager : ScriptableObject
{
    private static readonly List<string> _RegisteredManagers = new List<string>();

    private readonly List<Action> _UnregisterActions = new List<Action>();

    protected void RegisterTo<T>(AtomEvent<T> atomEvent, Action<T> handler)
    {
        atomEvent.Register(handler);
        _UnregisterActions.Add(() => atomEvent.Unregister(handler));
    }

    protected void RegisterTo(VoidEvent atomEvent, Action handler)
    {
        atomEvent.Register(handler);
        _UnregisterActions.Add(() => atomEvent.Unregister(handler));
    }

    void OnEnable()
    {
        var name = GetType().FullName;
        if (_RegisteredManagers.IndexOf(name) < 0)
        {
            hideFlags = HideFlags.DontUnloadUnusedAsset;
            _RegisteredManagers.Add(name);
            OnEnableManager();
        }
    }

    protected virtual void OnEnableManager() { }

    void OnDisable()
    {
        foreach (var unregisterAction in _UnregisterActions)
        {
            unregisterAction();
        }
    }
}
