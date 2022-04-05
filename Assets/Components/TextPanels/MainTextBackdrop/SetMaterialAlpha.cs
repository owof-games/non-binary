using System.Collections;
using System.Collections.Generic;
using UnityEngine.UI;
using UnityEngine;
using System;

public class SetMaterialAlpha : MonoBehaviour
{
    [SerializeField]
    private float _Alpha = 1f;

    private float _LastAlpha = 1f;

    private Material _Material;

    private const string _ColorPropertyName = "_BaseColor";

    private void Awake()
    {
        var rawImage = GetComponent<RawImage>();
        _Material = rawImage.material;
        _LastAlpha = _Material.GetColor(_ColorPropertyName).a;
    }

    void Update()
    {
        if (_Alpha != _LastAlpha)
        {
            var color = _Material.GetColor(_ColorPropertyName);
            color.a = _Alpha;
            _Material.SetColor(_ColorPropertyName, color);
            _LastAlpha = color.a;
        }
    }
}
