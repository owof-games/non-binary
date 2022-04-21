using UnityEngine;
using UnityAtoms;
using RG.LogLibrary;

public class StreetVisualizationParameters : MonoBehaviour
{
    private Material _Material;

    private float _TextureWidth;
    private float _TextureHeight;

    // public float WidthFactor = 0.2f;

    public float FadeLevel = 0f;

    public float Speed = 1f;
    private float _DeltaV = 0;

    // public SizeVariable ScreenSize;

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
        UpdateLayout();
    }

    private void Update()
    {

        // fade level
        _Material.SetFloat("_FadeLevel", FadeLevel);
        // animate V position
        _DeltaV += Time.deltaTime * Speed;
        while (_DeltaV > 1)
        {
            _DeltaV -= 1;
        }
        _Material.SetFloat("_DeltaV", _DeltaV);
    }

    private FullLayout _FullLayout;

    public void OnFullLayoutChanged(FullLayout fullLayout)
    {
        _FullLayout = fullLayout;
        UpdateLayout();
    }

    private void UpdateLayout()
    {
        if (_Material == null || _FullLayout.Screen.World.width == 0 || _FullLayout.Screen.World.height == 0)
        {
            return;
        }
        // scale to cover the whole screen
        transform.position = new Vector3(
            _FullLayout.Scene.World.center.x,
            _FullLayout.Scene.World.center.y,
            transform.position.z
        );
        transform.localScale = new Vector3(
            _FullLayout.Scene.World.width,
            _FullLayout.Scene.World.height,
            1
        );
        // width factor to get the actual width occupied by the street
        _Material.SetFloat("_WidthFactor", _FullLayout.Street.Percentage.width);
        // number of vertical repeats
        var repeats = _TextureWidth * _FullLayout.Scene.Screen.height / (_FullLayout.Street.Percentage.width * _TextureHeight * _FullLayout.Scene.Screen.width);
        _Material.SetFloat("_NumVerticalRepeats", repeats);
    }
}
