using UnityEngine;
using TMPro;
using UnityAtoms.BaseAtoms;

public class SetTextColor : MonoBehaviour
{
    public ColorReference Color;

    private void Start()
    {
        GetComponent<TextMeshProUGUI>().color = Color.Value;
    }
}
