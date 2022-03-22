using UnityEngine;
using UnityAtoms;
using RG.LogLibrary;

public class ScreenProportionsManager : BehaviourManager
{
    public SizeVariable ScreenSize;

    private void Start()
    {
        this.Info("ScreenSize.Value.Width = {0}; Screen.width = {1}", ScreenSize.Value.Width, Screen.width);
    }

    void Update()
    {
        if (ScreenSize.Value.Width != Screen.width || ScreenSize.Value.Height != Screen.height)
        {
            this.Info("Setting new screen size to {0}x{1}", Screen.width, Screen.height);
            ScreenSize.Value = new Size()
            {
                Width = Screen.width,
                Height = Screen.height
            };
        }

    }
}
