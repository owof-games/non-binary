using System.Linq;
using System.Collections.Generic;
using UnityEngine;
using TMPro;
using RG.LogLibrary;

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

    private string _LastWords;

    public void OnStoryStepChanged(StoryStep newStoryStep)
    {
        if (newStoryStep.Kind == StoryStepKind.Text)
        {
            var words = _IsM ? newStoryStep.MWords : newStoryStep.FWords;
            if (words.Count > 0)
            {
                _LastWords = string.Join(" ", words.Select(w => "<nobr>" + w.ToLower() + "</nobr>"));
                this.Info("next gendered words to add: {0}", _LastWords);
                OnLaunchWordBullets();
                return;
            }
        }
        _LastWords = "";
    }

    public void OnLaunchWordBullets()
    {
        _CurrentText = _CurrentText == "" ? _LastWords : _LastWords + " " + _CurrentText;
        UpdateFromCurrentText();
    }

    private void UpdateFromCurrentText()
    {
        _TextMesh.text = _CurrentText;
    }
}
