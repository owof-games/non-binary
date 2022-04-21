using UnityEngine;
using UnityEngine.SceneManagement;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

public class RestartScene : MonoBehaviour
{
    public BoolVariable InvincibleVariable;

    public BoolVariable PeopleVisible;

    public RectVariable CameraFocus;

    public void Do()
    {
        InvincibleVariable.Value = false;
        PeopleVisible.Value = false;
        CameraFocus.Value = new Rect(0, 0, 1, 1);
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
}
