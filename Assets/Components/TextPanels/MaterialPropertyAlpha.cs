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
            _Material = rawImage.material;
            _Material = Instantiate(_Material);
            rawImage.material = _Material;
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
        _LastAlpha = _Material.GetColor(_ColorPropertyName).a;
    }

    void Update()
    {
        if (!_Material)
        {
            InitializeMaterial();
        }
        if (_Alpha != _LastAlpha)
        {
            var color = _Material.GetColor(_ColorPropertyName);
            color.a = _Alpha;
            _Material.SetColor(_ColorPropertyName, color);
            _LastAlpha = color.a;
        }
    }
}
