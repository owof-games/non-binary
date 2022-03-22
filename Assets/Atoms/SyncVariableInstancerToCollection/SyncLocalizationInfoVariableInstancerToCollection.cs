using UnityEngine;
using UnityAtoms.BaseAtoms;

namespace UnityAtoms
{
    /// <summary>
    /// Adds Variable Instancer's Variable of type LocalizationInfo to a Collection or List on OnEnable and removes it on OnDestroy. 
    /// </summary>
    [AddComponentMenu("Unity Atoms/Sync Variable Instancer to Collection/Sync LocalizationInfo Variable Instancer to Collection")]
    [EditorIcon("atom-icon-delicate")]
    public class SyncLocalizationInfoVariableInstancerToCollection : SyncVariableInstancerToCollection<LocalizationInfo, LocalizationInfoVariable, LocalizationInfoVariableInstancer> { }
}
