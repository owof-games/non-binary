using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.EventSystems;
using UnityAtoms.BaseAtoms;
using TMPro;

public class ButtonColor : MonoBehaviour
{
    public ColorReference TextColorSelected;
    public ColorReference TextColorUnselected;
    [Range(0, 1)]
    public float Alpha = 1f;

    private TextMeshProUGUI _Text;

    private void Awake()
    {
        _Text = GetComponentInChildren<TextMeshProUGUI>();
    }

    private void Update()
    {
        var selected = EventSystem.current.currentSelectedGameObject == gameObject;
        var color = selected ? TextColorSelected.Value : TextColorUnselected.Value;
        color.a = Alpha;
        _Text.color = color;
    }
}
