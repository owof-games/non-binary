using UnityEngine;
using UnityAtoms;
using RG.LogLibrary;

public class StreetVisualizationParameters : MonoBehaviour
{
    private Material _Material;

    private float _TextureWidth;
    private float _TextureHeight;

    public float WidthFactor = 0.2f;

    public float Speed = 1f;
    private float _DeltaV = 0;

    public SizeVariable ScreenSize;

    private void Awake()
    {
        // get the material
        var renderer = GetComponent<Renderer>();
        _Material = renderer.material;
        // save the texture size
        var texture = _Material.GetTexture("_StreetTexture");
        _TextureWidth = texture.width;
        _TextureHeight = texture.height;
        //
        foreach (var vertex in GetComponent<MeshFilter>().mesh.vertices)
        {
            this.Info("vertex: {0},{1},{2}", vertex.x, vertex.y, vertex.z);
        }
    }

    private void Update()
    {
        var ss = ScreenSize.Value;
        // resize texture
        var dx = (ss.Width - ss.ProportionalWidth) / 2;
        var dy = (ss.Height - ss.ProportionalHeight) / 2;
        var blWorldPosition = Camera.main.ScreenToWorldPoint(new Vector3(
            dx, dy, transform.position.z
        ));
        var trWorldPosition = Camera.main.ScreenToWorldPoint(new Vector3(
            ss.Width - dx, ss.Height - dy, transform.position.z
        ));
        var quadWidth = trWorldPosition.x - blWorldPosition.x;
        var quadHeight = trWorldPosition.y - blWorldPosition.y;
        transform.localScale = new Vector3(
            quadWidth,
            quadHeight,
            1
        );
        // width factor, weighting the actual screen space
        var realWidthFactor = ss.ProportionalWidth * WidthFactor / ss.Width;
        _Material.SetFloat("_WidthFactor", realWidthFactor);
        // number of vertical repeats
        var repeats = _TextureWidth * Screen.height / (WidthFactor * _TextureHeight * Screen.width);
        _Material.SetFloat("_NumVerticalRepeats", repeats);
        // animate V position
        _DeltaV += Time.deltaTime * Speed;
        while (_DeltaV > 1)
        {
            _DeltaV -= 1;
        }
        _Material.SetFloat("_DeltaV", _DeltaV);
    }
}
