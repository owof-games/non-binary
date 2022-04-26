using System;
using System.Collections;
using System.Linq;
using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

[CreateAssetMenu(fileName = "StoryManager", menuName = "non-binary/Create Story Manager", order = 1)]
public class StoryManager : BaseManager
{
    public TextAsset InkJSONAsset;

    private StoryCache _CachedStoryManager;

    private Ink.Runtime.Story _Story { get => _CachedStoryManager.GetStory(InkJSONAsset); }

    public StoryStepVariable StoryStepVariable;

    public VoidEvent NextLine;

    public StringEvent StartKnotEvent;

    public StringEvent GoToKnotEvent;

    public IntEvent MakeChoiceEvent;

    public VoidEvent StartStory;

    public BoolVariable IsAMAB;

    public BaseLogger BaseLogger;

    protected override void OnEnableManager()
    {
        // create a story manager that is sensitive to the ink json asset
        _CachedStoryManager = new StoryCache();
        _CachedStoryManager.NewStoryObjectCreated += NewStoryObjectCreated;
        // Debug.Log("story: get");
        _CachedStoryManager.GetStory(InkJSONAsset); // force creation
        // Debug.Log("story: got");

        // register to events
        // RegisterTo(IsFemaleChanged, OnIsFemaleChanged);
        RegisterTo(NextLine, OnNextLine);
        RegisterTo(StartKnotEvent, OnStartKnot);
        RegisterTo(GoToKnotEvent, OnGoToKnot);
        RegisterTo(MakeChoiceEvent, OnMakeChoice);
        RegisterTo(StartStory, OnStartStory);
        _StoryStarted = false;

        // start reading the first line - maybe this should be run by some kind of global initializator through events?
        // UnityMainThreadDispatcher.EventuallyEnqueue(Initialize());
    }

    private bool _StoryStarted = false;

    private void OnStartStory(UnityAtoms.Void obj)
    {
        BaseLogger.Info(this, "received a StartStory event");
        _StoryStarted = true;
        // OnNextLine();
    }

    private void NewStoryObjectCreated()
    {
        // TODO
        // _Story.variablesState["gender_femmina"] = _LastGenderValue;
        // Debug.Log("story: new story object created");
        _Story.ObserveVariable("gender", GenderChanged);
        // OnNextLine(true);
        UnityMainThreadDispatcher.EventuallyEnqueue(Initialize());
    }

    private IEnumerator Initialize()
    {
        BaseLogger.Info(this, "initializing in a little while...");
        yield return new WaitForSeconds(0.1f);
        BaseLogger.Info(this, "ok, initializing.");
        OnNextLine(true);
    }

    private void GenderChanged(string variableName, object newValue)
    {
        var gender = (int)newValue;
        IsAMAB.Value = gender == 2;
    }

    private void OnStartKnot(string knot)
    {
        BaseLogger.Info(this, "Moving to knot {0}", knot);
        _Story.ChoosePathString(knot);
        OnNextLine();
    }

    private void OnGoToKnot(string knot)
    {
        _Story.ChoosePathString(knot);
    }

    private void OnNextLine()
    {
        OnNextLine(false);
    }

    private void OnNextLine(bool force)
    {
        BaseLogger.Info(this, "OnNextLine with _StoryStarted={0}", _StoryStarted);
        if (!_StoryStarted && !force)
        {
            BaseLogger.Info(this, "Asked for a new line, but story must still start");
        }
        else if (_Story.canContinue)
        {
            BaseLogger.Info(this, "OnNextLine: canContinue");
            _Story.Continue();
            ParseStoryStep();
        }
        else if (_Story.currentChoices.Count > 0)
        {
            BaseLogger.Info(this, "OnNextLine: but we are on a choice");
            throw new Exception("Cannot read next line on a choice!");
        }
        else
        {
            BaseLogger.Info(this, "OnNextLine: no more content");
            StoryStepVariable.Value = new StoryStep();
        }
    }

    private void OnMakeChoice(int choiceIndex)
    {
        BaseLogger.Info(this, "OnMakeChoice");
        if (_Story.currentChoices.Count < choiceIndex - 1)
        {
            throw new Exception($"Cannot make choice n. {choiceIndex}: I currently have {_Story.currentChoices.Count} choices.");
        }
        _Story.ChooseChoiceIndex(choiceIndex);
        _Story.Continue();
        ParseStoryStep();
    }

    private void ParseStoryStep()
    {
        BaseLogger.Info(this,
            "ParseStoryStep: current choices count = {0}, tags = {2}, text = {1}.",
            _Story.currentChoices.Count, _Story.currentText.Trim(), string.Join(", ", _Story.currentTags));
        if (_Story.currentChoices.Count == 0)
        {
            StoryStepVariable.Value = new StoryStep(
                _Story.currentText.Trim(),
                _Story.currentTags
            );
            BaseLogger.Verbose(this, "ParseStoryStep: text node, setting to {0}", StoryStepVariable.Value);
            // if (StoryStepVariable.Value.Kind == StoryStepKind.Marker)
            // {
            //     // immediately go on after sending the notifications
            //     BaseLogger.Verbose(this, "ParseStoryStep: advancing because it is a marker");
            //     OnNextLine();
            // }
        }
        else
        {
            StoryStepVariable.Value = new StoryStep(
                _Story.currentText.Trim(),
                (from choice in _Story.currentChoices
                 select new StoryStep.Choice()
                 {
                     Index = choice.index,
                     Text = choice.text
                 }).ToArray(),
                _Story.currentTags
            );
            BaseLogger.Verbose(this, "ParseStoryStep: choice node, setting to {0}", StoryStepVariable.Value);
        }
    }
}
