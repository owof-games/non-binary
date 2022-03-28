using System;
using System.Collections.Generic;
using UnityEngine;

public class BehaviourManager : MonoBehaviour
{
    private void Awake()
    {
        if (DestroyIfExists())
        {
            ManagerAwake();
            DontDestroyOnLoad(gameObject);
        }
    }

    protected virtual void ManagerAwake() { }

    private static readonly HashSet<Type> _ExistingInstances = new HashSet<Type>();

    bool DestroyIfExists()
    {
        var myType = GetType();
        if (_ExistingInstances.Contains(myType))
        {
            Destroy(gameObject);
            return false;
        }
        else
        {
            _ExistingInstances.Add(myType);
            return true;
        }
    }
}
