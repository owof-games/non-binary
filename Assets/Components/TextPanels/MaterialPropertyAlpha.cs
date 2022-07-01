using UnityEngine;
using UnityEngine.UI;
using TMPro;

public class MaterialPropertyAlpha : MonoBehaviour
{
    [SerializeField]
    private float _Alpha = 1f;

    private float _LastAlpha = 1f;

    // [SerializeField]
    private Material _Material = null;

    private RawImage _RawImage = null;

    [SerializeField]
    private string _ColorPropertyName = "_FaceColor";

    private void InitializeMaterial()
    {
        if (TryGetComponent<Renderer>(out var renderer))
        {
            _Material = Instantiate(renderer.material);
            renderer.material = _Material;
        }
        else if (TryGetComponent<RawImage>(out var rawImage))
        {
            _RawImage = rawImage;
            // _Material = rawImage.material;
            // _Material = Instantiate(_Material);
            // rawImage.material = _Material;
        }
        else if (TryGetComponent<TextMeshProUGUI>(out var tmpro))
        {
            _Material = tmpro.fontMaterial;
            _Material = Instantiate(_Material);
            tmpro.fontMaterial = _Material;
        }
        else
        {
            var renderer2 = GetComponent<CanvasRenderer>();
            var material = renderer2.GetMaterial(0);
            Debug.LogError("Cannot find material", this);
            _Material = Instantiate(material);
            renderer2.SetMaterial(_Material, 0);
        }
        if (_Material != null)
        {
            _LastAlpha = _Material.GetColor(_ColorPropertyName).a;
        }
        else
        {
            _LastAlpha = _RawImage.color.a;
        }
    }

    void Update()
    {
        if (!_Material)
        {
            InitializeMaterial();
        }
        if (_Alpha != _LastAlpha)
        {
            if (_Material != null)
            {
                var color = _Material.GetColor(_ColorPropertyName);
                color.a = _Alpha;
                _Material.SetColor(_ColorPropertyName, color);
            }
            else
            {
                var color = _RawImage.color;
                color.a = _Alpha;
                _RawImage.color = color;
            }
            _LastAlpha = _Alpha;
        }
    }
}
