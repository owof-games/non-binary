using UnityEngine;

public class Rotate : MonoBehaviour
{
    public Vector3 RotationVector;

    public Transform Target;

    // Update is called once per frame
    void Update()
    {
        Target.transform.Rotate(Time.deltaTime * RotationVector);
    }

    public void ResetRotation()
    {
        transform.rotation = Quaternion.identity;
    }
}
