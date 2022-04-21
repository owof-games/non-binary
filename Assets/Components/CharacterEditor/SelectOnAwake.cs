using UnityEngine;
using UnityEngine.EventSystems;

public class SelectOnAwake : MonoBehaviour
{
    public GameObject FirstControl;

    private void Awake()
    {
        EventSystem.current.SetSelectedGameObject(FirstControl);
    }
}
