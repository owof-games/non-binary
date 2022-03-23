using System;
using System.Collections.Generic;
using UnityEngine;

public class BehaviourManager : MonoBehaviour
{
    private void Awake()
    {
        DestroyIfExists();
        ManagerAwake();
    }

    protected virtual void ManagerAwake() { }

    private static readonly HashSet<Type> _ExistingInstances = new HashSet<Type>();

    void DestroyIfExists()
    {
        var myType = GetType();
        if (_ExistingInstances.Contains(myType))
        {
            Destroy(gameObject);
        }
        else
        {
            _ExistingInstances.Add(myType);
        }
    }
}
