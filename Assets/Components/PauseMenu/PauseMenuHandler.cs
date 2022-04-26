using UnityEngine;
using UnityEngine.EventSystems;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;
using TMPro;

public class PauseMenuHandler : MonoBehaviour
{
    public GameObject MainMenu;
    public GameObject MainMenuFirstSelected;
    public GameObject ExitSubMenu;
    public GameObject ExitSubMenuFirstSelected;
    public StringVariable ActionMapVariable;

    private string _InitialActionMap;
    public TextMeshProUGUI Test;


    private void OnEnable()
    {
        SetInitialState();
        Time.timeScale = 0;
        _InitialActionMap = ActionMapVariable.Value;
        ActionMapVariable.Value = "";
        this.Info("enabled");
    }

    private void OnDisable()
    {
        Time.timeScale = 1;
        ActionMapVariable.Value = _InitialActionMap;
        this.Info("disabled");
    }

    private void Update()
    {
        Test.text = Time.timeScale.ToString();
    }

    public void OnExit()
    {
        MainMenu.SetActive(false);
        ExitSubMenu.SetActive(true);
        EventSystem.current.SetSelectedGameObject(ExitSubMenuFirstSelected);
    }

    public void OnExitNo()
    {
        SetInitialState();
    }

    public void OnExitYes()
    {
        Application.Quit();
    }

    private void SetInitialState()
    {
        MainMenu.SetActive(true);
        ExitSubMenu.SetActive(false);
        EventSystem.current.SetSelectedGameObject(MainMenuFirstSelected);
    }
}

