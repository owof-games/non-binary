using UnityEngine;
using UnityEngine.SceneManagement;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

public class RestartScene : MonoBehaviour
{
    public BoolVariable InvincibleVariable;

    public BoolVariable PeopleVisible;

    public RectVariable CameraFocus;

    public string RestartKnotName { private get; set; }

    public StringEvent StartKnotEvent;

    public StringVariable ActionMapVariable;

    public void Do()
    {
        InvincibleVariable.Value = false;
        PeopleVisible.Value = false;
        CameraFocus.Value = new Rect(0, 0, 1, 1);
        StartKnotEvent.Raise(RestartKnotName);
        ActionMapVariable.Value = "MovementActionMap";
        SceneManager.LoadScene(SceneManager.GetActiveScene().name);
    }
}
