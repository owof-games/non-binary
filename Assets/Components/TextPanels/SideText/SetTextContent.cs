using System.Linq;
using UnityEngine;
using TMPro;

public class SetTextContent : MonoBehaviour
{
    private string _CurrentText = "";

    private TextMeshProUGUI _TextMesh;

    [SerializeField]
    private bool _IsM;

    private void Awake()
    {
        _TextMesh = GetComponent<TextMeshProUGUI>();
        UpdateFromCurrentText();
    }

    public void OnStoryStepChanged(StoryStep newStoryStep)
    {
        if (newStoryStep.Kind == StoryStepKind.Text)
        {
            var words = _IsM ? newStoryStep.MWords : newStoryStep.FWords;
            Debug.Log(string.Format("Found {0} words in this step", words.Count));
            if (words.Count > 0)
            {
                _CurrentText += " " + string.Join(" ", words.Select(w => w.ToLower()));
                UpdateFromCurrentText();
            }
        }
    }

    private void UpdateFromCurrentText()
    {
        _TextMesh.text = _CurrentText;
    }
}
