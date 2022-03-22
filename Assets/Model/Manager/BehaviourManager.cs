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

    private static HashSet<Type> ExistingInstances = new HashSet<Type>();

    void DestroyIfExists()
    {
        var myType = GetType();
        if (ExistingInstances.Contains(myType))
        {
            Destroy(gameObject);
        }
        else
        {
            ExistingInstances.Add(myType);
        }
    }
}
