using System.Collections;
using UnityEngine;
using UnityAtoms.BaseAtoms;

public class PlayerHit : MonoBehaviour
{
    public bool BeingHit { get; private set; }

    public FloatReference HitDuration;

    private Material _Material;

    private float _CurrentAlpha = 1;

    [SerializeField]
    private ParticleSystem _HitParticleSystem;

    private void Awake()
    {
        _Material = GetComponentInChildren<MeshRenderer>().material;
    }

    public void OnHit()
    {
        BeingHit = true;
        _CurrentAlpha /= 2;
        _Material.SetFloat("_Alpha", _CurrentAlpha);
        StartCoroutine(ResetBeginHit());
        _HitParticleSystem.Play();
    }

    private IEnumerator ResetBeginHit()
    {
        yield return new WaitForSeconds(HitDuration.Value);
        BeingHit = false;
    }
}
