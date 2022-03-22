using System;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using UnityAtoms.BaseAtoms;

public class MultiChoiceButton : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    [Serializable]
    public struct Choice
    {
        public StringConstant ItalianText;
        public StringConstant EnglishText;
    }

    public UnityEvent<int> ChoiceChanged;

    public GameObject LeftArrow;

    private RawImage LeftArrowRawImage;

    public GameObject RightArrow;

    private RawImage RightArrowRawImage;

    public Choice[] Choices;

    private int CurrentChoice = 0;

    private ButtonTranslatedText _ButtonTranslatedText;

    private ButtonColor _ButtonColor;

    private ButtonAudio _ButtonAudio;

    public ColorReference ArrowSelectedColor;

    public ColorReference ArrowUnselectedColor;

    public void Awake()
    {
        _ButtonTranslatedText = GetComponent<ButtonTranslatedText>();
        _ButtonColor = GetComponent<ButtonColor>();
        _ButtonAudio = GetComponent<ButtonAudio>();
        LeftArrowRawImage = LeftArrow.GetComponent<RawImage>();
        RightArrowRawImage = RightArrow.GetComponent<RawImage>();
        UpdateUI();
        if (EventSystem.current.currentSelectedGameObject == this.gameObject)
        {
            OnSelect(null);
        }
        else
        {
            OnDeselect(null);
        }
    }

    private void UpdateUI()
    {
        // choose whether to show the arrows or not
        LeftArrow.SetActive(CurrentChoice > 0);
        RightArrow.SetActive(CurrentChoice < Choices.Length - 1);

        // set the new text and update
        _ButtonTranslatedText.ItalianText = Choices[CurrentChoice].ItalianText;
        _ButtonTranslatedText.EnglishText = Choices[CurrentChoice].EnglishText;
        _ButtonTranslatedText.OnTextUpdated();

        // raise the change event
        ChoiceChanged.Invoke(CurrentChoice);
    }

    // to be used as event listener
    public void NextChoice()
    {
        if (EventSystem.current.currentSelectedGameObject != this.gameObject)
        {
            return;
        }
        CurrentChoice = Math.Min(Choices.Length - 1, CurrentChoice + 1);
        _ButtonAudio.PlayBeep();
        UpdateUI();
    }

    // to be used as event listener
    public void PreviousChoice()
    {
        if (EventSystem.current.currentSelectedGameObject != this.gameObject)
        {
            return;
        }
        CurrentChoice = Math.Max(0, CurrentChoice - 1);
        _ButtonAudio.PlayBeep();
        UpdateUI();
    }

    private Color CurrentBaseColor;

    public void OnSelect(BaseEventData eventData)
    {
        CurrentBaseColor = ArrowSelectedColor.Value;
    }

    public void OnDeselect(BaseEventData eventData)
    {
        CurrentBaseColor = ArrowUnselectedColor.Value;
    }

    private void SetArrowsColor()
    {
        var color = CurrentBaseColor;
        color.a = _ButtonColor.Alpha;
        LeftArrowRawImage.color = color;
        RightArrowRawImage.color = color;
    }

    private void Update()
    {
        SetArrowsColor();
    }
}
