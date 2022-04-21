using UnityEngine;

public class AlwaysFaceCamera : MonoBehaviour
{
    public Vector3 WorldUp;

    private Vector3 _Flip = new Vector3(0, 180, 0);

    void Update()
    {
        if (Camera.main)
        {
            transform.LookAt(Camera.main.transform, WorldUp);
            transform.Rotate(_Flip);
        }
    }
}
