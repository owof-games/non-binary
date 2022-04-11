using UnityEngine;
using UnityEngine.SceneManagement;

public class LoadMenu : MonoBehaviour
{
    public void Do()
    {
        Debug.Log("cristo dio merda");
        SceneManager.LoadScene("StartMenuScene");
    }

    public void OnDioMerdaClick()
    {
        Do();
    }
}
