using System.Threading;
using System.Threading.Tasks;
using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;
using UnityEngine.InputSystem;
using RG.LogLibrary;
using System;

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
            // SetActionMap("ChoiceActionMap");
            ActionMapVariable.Value = "ChoiceActionMap";
        }
        else if (storyStep.Kind == StoryStepKind.Text)
        {
            BaseLogger.Info(this, "setting action map variable to ChoiceActionMap");
            // SetActionMap("MovementActionMap");
            ActionMapVariable.Value = "MovementActionMap";
        }
    }

    // private void SetActionMap(string value)
    // {
    //     var thread = new Thread(SetActionMapShortly);
    //     thread.Start(value);
    // }

    // private void SetActionMapShortly(object value)
    // {
    //     Thread.Sleep(1000);
    //     void action()
    //     {
    //         ActionMapVariable.Value = (string)value;
    //     }
    //     if (UnityMainThreadDispatcher.Exists())
    //     {
    //         UnityMainThreadDispatcher.Instance().Enqueue(action);
    //     }
    //     else
    //     {
    //         action();
    //     }
    // }

}
