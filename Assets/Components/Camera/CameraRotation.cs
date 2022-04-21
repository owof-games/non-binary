using UnityEngine;

public class CameraRotation : MonoBehaviour
{
    public Vector3 AroundPoint = new Vector3(0, 0, -1);

    public Vector3 StartingPoint = new Vector3(0, 0, -10);

    public Vector3 EulerAngles;

    private void Update()
    {
        var q = Quaternion.Euler(EulerAngles);
        var distanceVector = StartingPoint - AroundPoint;
        transform.SetPositionAndRotation(AroundPoint + q * distanceVector, q);
    }
}
