using System;
using UnityEngine;
using UnityEngine.EventSystems;
using TMPro;

public class StoryChoiceHandler : MonoBehaviour
{
    public GameObject[] Choices;

    private bool _ChoicesActive = false;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        if (storyStep.Kind == StoryStepKind.Choice && storyStep.Choices.Length == Choices.Length)
        {
            ActivateChoices(true);
            for (var i = 0; i < storyStep.Choices.Length; i++)
            {
                Choices[i].GetComponentInChildren<TextMeshProUGUI>().text = storyStep.Choices[i].Text;
            }
            _LastSelectedGameObject = Choices[0];
            EventSystem.current.SetSelectedGameObject(_LastSelectedGameObject);
        }
        else
        {
            ActivateChoices(false);
        }
    }

    private void ActivateChoices(bool value)
    {
        foreach (var rt in Choices)
        {
            rt.SetActive(value);
        }
        _ChoicesActive = value;
        if (!_ChoicesActive)
        {
            _LastSelectedGameObject = null;
        }
    }

    private GameObject _LastSelectedGameObject = null;

    private void Update()
    {
        if (!_ChoicesActive)
        {
            return;
        }
        var currentlySelected = EventSystem.current.currentSelectedGameObject;
        if (currentlySelected == null)
        {
            // if we deselected the last currently selected button, re-select it
            if (_LastSelectedGameObject != null)
            {
                EventSystem.current.SetSelectedGameObject(_LastSelectedGameObject);
            }
        }
        else if (Array.IndexOf(Choices, currentlySelected) >= 0)
        {
            // if one of our buttons is selected, save it
            _LastSelectedGameObject = EventSystem.current.currentSelectedGameObject;
        }
    }
}
