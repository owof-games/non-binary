using System;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.EventSystems;
using UnityEngine.Events;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class MultiChoiceButton : MonoBehaviour, ISelectHandler, IDeselectHandler
{
    [Serializable]
    public struct Choice
    {
        public StringConstant ItalianText;
        public StringConstant EnglishText;
    }

    public StringEvent ChoiceEvent;

    public UnityEvent<int> ChoiceChanged;

    public GameObject LeftArrow;

    private RawImage _LeftArrowRawImage;

    public GameObject RightArrow;

    private RawImage _RightArrowRawImage;

    public Choice[] Choices;

    private int _CurrentChoice = 0;

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
        _LeftArrowRawImage = LeftArrow.GetComponent<RawImage>();
        _RightArrowRawImage = RightArrow.GetComponent<RawImage>();
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
        LeftArrow.SetActive(_CurrentChoice > 0);
        RightArrow.SetActive(_CurrentChoice < Choices.Length - 1);

        // set the new text and update
        _ButtonTranslatedText.ItalianText = Choices[_CurrentChoice].ItalianText;
        _ButtonTranslatedText.EnglishText = Choices[_CurrentChoice].EnglishText;
        _ButtonTranslatedText.OnTextUpdated();

        // raise the change event
        ChoiceChanged.Invoke(_CurrentChoice);
    }

    // to be used as event listener
    public void NextChoice()
    {
        this.Info("received NextChoice");
        if (EventSystem.current.currentSelectedGameObject != this.gameObject)
        {
            this.Info("not the current selected object");
            return;
        }
        this.Info("_CurrentChoice was: {0}", _CurrentChoice);
        _CurrentChoice = Math.Min(Choices.Length - 1, _CurrentChoice + 1);
        this.Info("_CurrentChoice is now: {0}", _CurrentChoice);
        _ButtonAudio.PlayBeep();
        UpdateUI();
    }

    // to be used as event listener
    public void PreviousChoice()
    {
        this.Info("received PreviousChoice");
        if (EventSystem.current.currentSelectedGameObject != this.gameObject)
        {
            this.Info("not the current selected object");
            return;
        }
        this.Info("_CurrentChoice was: {0}", _CurrentChoice);
        _CurrentChoice = Math.Max(0, _CurrentChoice - 1);
        this.Info("_CurrentChoice is now: {0}", _CurrentChoice);
        _ButtonAudio.PlayBeep();
        UpdateUI();
    }

    private Color _CurrentBaseColor;

    public void OnSelect(BaseEventData eventData)
    {
        _CurrentBaseColor = ArrowSelectedColor.Value;
    }

    public void OnDeselect(BaseEventData eventData)
    {
        _CurrentBaseColor = ArrowUnselectedColor.Value;
    }

    private void SetArrowsColor()
    {
        var color = _CurrentBaseColor;
        color.a = _ButtonColor.Alpha;
        _LeftArrowRawImage.color = color;
        _RightArrowRawImage.color = color;
    }

    private void Update()
    {
        SetArrowsColor();
    }
}
