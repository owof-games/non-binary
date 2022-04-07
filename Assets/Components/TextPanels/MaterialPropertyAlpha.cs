using UnityEngine;

public class MaterialPropertyAlpha : MonoBehaviour
{
    [SerializeField]
    private float _Alpha = 1f;

    private float _LastAlpha = 1f;

    [SerializeField]
    private Material _Material;

    [SerializeField]
    private string _ColorPropertyName = "_FaceColor";

    private void Awake()
    {
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
