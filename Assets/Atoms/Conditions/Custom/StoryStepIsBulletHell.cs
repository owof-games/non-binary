using UnityEngine;
using UnityAtoms;
using UnityAtoms.BaseAtoms;

// Set the icon you will see in the editor
[EditorIcon("atom-icon-sand")]

// Set the path in the asset creation menu
[CreateAssetMenu(menuName = "Unity Atoms/Conditions/StoryStep/Is Bullet Hell?", fileName = "StoryStepIsBulletHell")]
public class StoryStepIsBulletHell : StoryStepCondition
{
    public string BulletHellName;

    public override bool Call(StoryStep value)
    {
        return value.IsBulletHell && value.BulletHellName == BulletHellName;
    }
}
