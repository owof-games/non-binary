using UnityEngine;
using UnityAtoms.BaseAtoms;

[CreateAssetMenu(fileName = "MeasuresManager", menuName = "non-binary/Create Measures Manager", order = 1)]
public class MeasuresManager : BaseManager
{
    public Vector2Variable MainTextSize;
    public FloatVariable SideTextPadding;
    public Vector2Variable SideTextSize;
    public FloatVariable SpacingBottom;
    public FloatVariable SpacingTop;
    public FloatVariable StreetWidth;
    public BoolVariable MainTextBorder;
    public BoolVariable SideTextBorder;
}
