using System;
using UnityEngine;

public class AlphaManagement : MonoBehaviour
{
    private Material _Material;

    private float[] _AlphaMultipliers;

    private string[] _AlphaMultiplierNames;

    private static T[] Expand<T>(T[] source, T newValue)
    {
        if (source != null)
        {
            var newArray = new T[source.Length + 1];
            Array.Copy(source, newArray, source.Length);
            newArray[source.Length] = newValue;
            return newArray;
        }
        else
        {
            return new T[] { newValue };
        }
    }

    public void SetAlphaMultiplier(string name, float value)
    {
        var idx = _AlphaMultiplierNames != null ? Array.IndexOf(_AlphaMultiplierNames, name) : -1;
        if (idx < 0)
        {
            _AlphaMultiplierNames = Expand(_AlphaMultiplierNames, name);
            _AlphaMultipliers = Expand(_AlphaMultipliers, value);
            UpdateMaterialAlpha();
        }
        else if (_AlphaMultipliers[idx] != value)
        {
            _AlphaMultipliers[idx] = value;
            UpdateMaterialAlpha();
        }
    }

    private void Start()
    {
        var mr = GetComponent<MeshRenderer>();
        _Material = mr.material;
        _Material = Instantiate(_Material);
        mr.material = _Material;
        UpdateMaterialAlpha();
    }

    private void UpdateMaterialAlpha()
    {
        if (_Material == null)
        {
            return;
        }
        var alpha = 1f;
        if (_AlphaMultipliers != null)
        {
            foreach (var multiplier in _AlphaMultipliers)
            {
                alpha *= multiplier;
            }
        }
        var c = _Material.GetColor("_BaseColor");
        c.a = alpha;
        _Material.SetColor("_BaseColor", c);
    }
}
