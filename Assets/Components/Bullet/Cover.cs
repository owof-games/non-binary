using UnityEngine;

public class Cover : MonoBehaviour
{
    [SerializeField]
    private bool _IsLeftCover;

    public void UpdateSize(FullLayout fullLayout)
    {
        // Debug.Log("cover with street rect = " + fullLayout.Street.World.ToString());
        var wsMinX = _IsLeftCover ? fullLayout.Scene.World.xMin : fullLayout.Street.World.xMax;
        var wsMaxX = _IsLeftCover ? fullLayout.Street.World.xMin : fullLayout.Scene.World.xMax;
        var wsMinY = fullLayout.Scene.World.yMin;
        var wsMaxY = fullLayout.Scene.World.yMax;
        transform.position = new Vector3(
            (wsMaxX + wsMinX) / 2,
            (wsMaxY + wsMinY) / 2,
            transform.position.z
        );
        transform.localScale = new Vector3(
            wsMaxX - wsMinX,
            wsMaxY - wsMinY,
            1
        );
    }
}
