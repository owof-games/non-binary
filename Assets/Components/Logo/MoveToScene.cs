using UnityEngine;
using UnityEngine.SceneManagement;

public class MoveToScene : MonoBehaviour
{
    public string SceneName;

    public void MoveTo() {
        SceneManager.LoadScene(SceneName);
    }
}
