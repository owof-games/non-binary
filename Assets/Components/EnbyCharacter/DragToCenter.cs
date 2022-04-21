using UnityEngine;

public class DragToCenter : MonoBehaviour
{
    private Vector3 _StartingPosition;

    public void RecordCurrentPosition()
    {
        _StartingPosition = transform.position;
    }

    public Vector3 Destination;

    public float T = 0;

    private float _LastT = 0;

    private void Update()
    {
        if (T != _LastT)
        {
            transform.position = Vector3.Lerp(_StartingPosition, Destination, T);
            _LastT = T;
        }
    }
}
