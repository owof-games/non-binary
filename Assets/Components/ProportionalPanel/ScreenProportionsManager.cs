using System.Collections;
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

    public void OnStartGame()
    {
        // give a little "shake" to the screen: this is a dirty fix to a bug on game restart that calculates the coordinates wrong
        StartCoroutine(ShakeScreen());
    }

    public IEnumerator ShakeScreen()
    {
        yield return new WaitForSeconds(0.1f);
        ScreenSize.Value = new Size()
        {
            Width = Screen.width + 1,
            Height = Screen.height
        };
        yield return new WaitForSeconds(0.1f);
        ScreenSize.Value = new Size()
        {
            Width = Screen.width,
            Height = Screen.height
        };
    }
}
