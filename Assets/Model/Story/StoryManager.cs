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

    public IntEvent MakeChoiceEvent;

    public BaseLogger BaseLogger;

    protected override void OnEnableManager()
    {
        // create a story manager that is sensitive to the ink json asset
        _CachedStoryManager = new StoryCache();
        _CachedStoryManager.NewStoryObjectCreated += NewStoryObjectCreated;

        // register to events
        // RegisterTo(IsFemaleChanged, OnIsFemaleChanged);
        RegisterTo(NextLine, OnNextLine);
        RegisterTo(StartKnotEvent, OnStartKnot);
        RegisterTo(MakeChoiceEvent, OnMakeChoice);

        // start reading the first line - maybe this should be run by some kind of global initializator through events?
        UnityMainThreadDispatcher.EventuallyEnqueue(Initialize());
    }

    private IEnumerator Initialize()
    {
        BaseLogger.Info(this, "initializing in a little while...");
        yield return new WaitForSeconds(0.1f);
        BaseLogger.Info(this, "ok, initializing.");
        OnNextLine();
    }

    private void NewStoryObjectCreated()
    {
        // TODO
        // _Story.variablesState["gender_femmina"] = _LastGenderValue;
    }

    private void OnStartKnot(string knot)
    {
        _Story.ChoosePathString(knot);
        OnNextLine();
    }

    private void OnNextLine()
    {
        BaseLogger.Info(this, "OnNextLine");
        if (_Story.canContinue)
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