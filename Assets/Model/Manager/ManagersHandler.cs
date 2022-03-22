using System.Collections.Generic;
using UnityEngine;

[CreateAssetMenu(fileName = "ManagersHandler", menuName = "non-binary/Create Managers Handler", order = 0)]
public class ManagersHandler : ScriptableObject
{
    public List<BaseManager> Managers = new List<BaseManager>();
}
