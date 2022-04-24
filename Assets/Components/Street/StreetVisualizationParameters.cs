using System.Collections.Generic;
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

    public List<string> MyLog = new List<string>();

    private void Awake()
    {
        var i = 0;
        try
        {
            // get the material
            var renderer = GetComponent<Renderer>();
            i++;
            _Material = renderer.material;
            i++;
            // save the texture size
            var texture = _Material.GetTexture("_StreetTexture");
            i++;
            _TextureWidth = texture.width;
            i++;
            _TextureHeight = texture.height;
            i++;
            // foreach (var vertex in GetComponent<MeshFilter>().mesh.vertices)
            // {
            //     this.Info("vertex: {0},{1},{2}", vertex.x, vertex.y, vertex.z);
            // }
            UpdateLayout();
        }
        catch (System.Exception e)
        {
            MyLog.Add($"exception in awake [{i}]: {e}");
            throw;
        }
    }

    public Material MyMaterial { get => _Material; }

    private void Update()
    {
        try
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
        catch (System.Exception e)
        {
            MyLog.Add("exception in update: " + e.ToString());
            throw;
        }
    }

    private FullLayout _FullLayout = null;

    public void OnFullLayoutChanged(FullLayout fullLayout)
    {
        _FullLayout = fullLayout;
        UpdateLayout();
    }

    private void UpdateLayout()
    {
        try
        {
            if (_Material == null || _FullLayout == null || _FullLayout.Screen.World.width == 0 || _FullLayout.Screen.World.height == 0)
            {
                return;
            }
            // Debug.Log("svp: updating position");
            // scale to cover the whole screen
            transform.position = new Vector3(
                _FullLayout.Scene.World.center.x,
                _FullLayout.Scene.World.center.y,
                transform.position.z
            );
            // Debug.Log("svp: updating local scale");
            transform.localScale = new Vector3(
                _FullLayout.Scene.World.width,
                _FullLayout.Scene.World.height,
                1
            );
            // width factor to get the actual width occupied by the street
            // Debug.Log("svp: setting width factor");
            _Material.SetFloat("_WidthFactor", _FullLayout.Street.Percentage.width);
            // number of vertical repeats
            // Debug.Log("svp: setting vertical repeatss");
            var repeats = _TextureWidth * _FullLayout.Scene.Screen.height / (_FullLayout.Street.Percentage.width * _TextureHeight * _FullLayout.Scene.Screen.width);
            _Material.SetFloat("_NumVerticalRepeats", repeats);
            // Debug.Log("svp: done!");
        }
        catch (System.Exception e)
        {
            Debug.LogException(e);
            MyLog.Add("exception in updatelayout: " + e.ToString());
            throw;
        }
    }
}
