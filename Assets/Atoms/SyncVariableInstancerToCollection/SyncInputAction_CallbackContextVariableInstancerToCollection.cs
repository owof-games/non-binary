using UnityEngine;
using UnityAtoms.BaseAtoms;
using UnityEngine.InputSystem;

namespace UnityAtoms
{
    /// <summary>
    /// Adds Variable Instancer's Variable of type InputAction.CallbackContext to a Collection or List on OnEnable and removes it on OnDestroy. 
    /// </summary>
    [AddComponentMenu("Unity Atoms/Sync Variable Instancer to Collection/Sync InputAction_CallbackContext Variable Instancer to Collection")]
    [EditorIcon("atom-icon-delicate")]
    public class SyncInputAction_CallbackContextVariableInstancerToCollection : SyncVariableInstancerToCollection<InputAction.CallbackContext, InputAction_CallbackContextVariable, InputAction_CallbackContextVariableInstancer> { }
}
