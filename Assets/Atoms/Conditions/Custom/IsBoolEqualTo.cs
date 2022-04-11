using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

// Set the icon you will see in the editor
[EditorIcon("atom-icon-sand")]

// Set the path in the asset creation menu
[CreateAssetMenu(menuName = "Unity Atoms/Conditions/Bool/IsBoolEqualTo", fileName = "IsBoolEqualTo")]
public class IsBoolEqualTo : BoolCondition
{
    [SerializeField]
    private bool _Value;

    public override bool Call(bool value)
    {
        return value == _Value;
    }
}
