using UnityEngine;

public class ReflectMainCharacterDragToCenter : MonoBehaviour
{
    public DragToCenter DragToCenter;
    public float T = 0;

    private void Update()
    {
        DragToCenter.T = T;
    }
}
