using UnityEngine;
using TMPro;

public class TempDebug : MonoBehaviour
{
    public StreetVisualizationParameters StreetVisualizationParameters;

    public Renderer Renderer;

    private TextMeshProUGUI _Text;

    private void Awake()
    {
        _Text = GetComponent<TextMeshProUGUI>();
    }

    private void Update()
    {
        // _Text.text = $"from SVP: {StreetVisualizationParameters.MyMaterial.GetFloat("_FadeLevel")}, from renderer: {Renderer.material.GetFloat("_FadeLevel")}";
        var log = StreetVisualizationParameters.MyLog;
        _Text.text = $"{log.Count}: {(log.Count > 0 ? log[^1] : "")}";
    }
}
