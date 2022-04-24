using System.Collections;
using UnityEngine;

public class DisableAfter : MonoBehaviour
{
    public float TimeToDisable = 2f;

    private void OnEnable()
    {
        StartCoroutine(DisableAt());
    }


    public IEnumerator DisableAt()
    {
        yield return new WaitForSeconds(TimeToDisable);
        gameObject.SetActive(false);
    }
}
