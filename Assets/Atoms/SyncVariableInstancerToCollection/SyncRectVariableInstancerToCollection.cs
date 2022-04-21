using UnityAtoms.BaseAtoms;
using UnityEngine;

namespace UnityAtoms
{
    /// <summary>
    /// Adds Variable Instancer's Variable of type Rect to a Collection or List on OnEnable and removes it on OnDestroy. 
    /// </summary>
    [AddComponentMenu("Unity Atoms/Sync Variable Instancer to Collection/Sync Rect Variable Instancer to Collection")]
    [EditorIcon("atom-icon-delicate")]
    public class SyncRectVariableInstancerToCollection : SyncVariableInstancerToCollection<Rect, RectVariable, RectVariableInstancer> { }
}
