using UnityEngine;
using UnityAtoms;
using RG.LogLibrary;

public class ProportionalSize : MonoBehaviour
{
    public float SizeFactor = 0.05f;

    public SizeVariable InitialSize;

    private void Awake()
    {
        UpdateSize(InitialSize.Value);
    }

    public void UpdateSize(Size size)
    {
        var desiredWidth = size.Width * SizeFactor;
        var worldPos1 = Camera.main.ScreenToWorldPoint(new Vector3(
            0, 0, transform.position.z
        ));
        var worldPos2 = Camera.main.ScreenToWorldPoint(new Vector3(
            desiredWidth, 0, transform.position.z
        ));
        var worldWidth = worldPos2.x - worldPos1.x;
        this.Verbose("desired width is {0} (size.Width = {2}, SizeFactor = {3}): setting scale to {1}",
            desiredWidth, worldWidth, size.Width, SizeFactor);
        transform.localScale = new Vector3(worldWidth, worldWidth, worldWidth);
    }
}
