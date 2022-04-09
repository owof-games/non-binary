using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DisableMouseManager : BehaviourManager
{
    private void Update()
    {
        Cursor.visible = false;
    }
}
