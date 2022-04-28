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

    // public VoidEvent LaunchWordBullets;

    // private bool _MustLaunchWordBullets;

    public BoolVariable TextIsFadingIn;

    public VoidEvent SkipToFadeInTextEnd;

    protected override void OnEnableManager()
    {
        RegisterTo(InputNextLine, OnInputNextLine);
        RegisterTo(StoryStepChanged, OnStoryStepChanged);
    }

    private bool _InBulletHell = false;

    private void OnInputNextLine(InputAction.CallbackContext obj)
    {
        BaseLogger.Info(this, "received InputNextLine");
        if (_InBulletHell)
        {
            BaseLogger.Info(this, "ignoring it because we are in a bullet hell!");

        }
        else if (TextIsFadingIn.Value)
        {
            SkipToFadeInTextEnd.Raise();
        }
        // else if (_MustLaunchWordBullets)
        // {
        //     _MustLaunchWordBullets = false;
        //     LaunchWordBullets.Raise();
        // }
        else
        {
            StoryNextLine.Raise();
        }
    }

    private void OnStoryStepChanged(StoryStep storyStep)
    {
        BaseLogger.Info(this, "received new story step: {0}", storyStep);
        _InBulletHell = storyStep.IsBulletHell;
        if (storyStep.Kind == StoryStepKind.Choice)
        {
            BaseLogger.Info(this, "setting action map variable to ChoiceActionMap");
            // SetActionMap("ChoiceActionMap");
            ActionMapVariable.Value = "ChoiceActionMap";
        }
        else if (storyStep.Kind == StoryStepKind.Text)
        {
            BaseLogger.Info(this, "setting action map variable to MovementActionMap");
            // SetActionMap("MovementActionMap");
            ActionMapVariable.Value = "MovementActionMap";
            // if (storyStep.NumMTags > 0 || storyStep.NumFTags > 0)
            // {
            // _MustLaunchWordBullets = true;
            // LaunchWordBullets.Raise();
            // }
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
