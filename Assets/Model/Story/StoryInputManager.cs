using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine.InputSystem;
using RG.LogLibrary;

[CreateAssetMenu(fileName = "StoryInputManager", menuName = "non-binary/Create Story Input Manager", order = 1)]
public class StoryInputManager : BaseManager
{
    public BaseLogger BaseLogger;

    public InputAction_CallbackContextEvent InputNextLine;

    public VoidEvent StoryNextLine;

    public StoryStepEvent StoryStepChanged;

    public StringVariable ActionMapVariable;

    protected override void OnEnableManager()
    {
        RegisterTo(InputNextLine, OnInputNextLine);
        RegisterTo(StoryStepChanged, OnStoryStepChanged);
    }

    private void OnInputNextLine(InputAction.CallbackContext obj)
    {
        BaseLogger.Info(this, "received InputNextLine");
        StoryNextLine.Raise();
    }

    private void OnStoryStepChanged(StoryStep storyStep)
    {
        BaseLogger.Info(this, "received new story step: {0}", storyStep);
        if (storyStep.Kind == StoryStepKind.Choice)
        {
            BaseLogger.Info(this, "setting action map variable to ChoiceActionMap");
            ActionMapVariable.Value = "ChoiceActionMap";
        }
        else if (storyStep.Kind == StoryStepKind.Text)
        {
            BaseLogger.Info(this, "setting action map variable to ChoiceActionMap");
            ActionMapVariable.Value = "MovementActionMap";
        }
    }
}
