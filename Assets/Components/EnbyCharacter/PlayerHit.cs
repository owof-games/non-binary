using System.Collections;
using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class PlayerHit : MonoBehaviour
{
    public bool BeingHit { get; private set; }

    public FloatReference HitDuration;

    private Material _Material;

    [SerializeField]
    private ParticleSystem _HitParticleSystem;

    [SerializeField]
    private BoolReference _Invincible;

    private void Awake()
    {
        _Material = GetComponentInChildren<Renderer>().material;
    }

    public void OnHit()
    {
        if (!_Invincible.Value)
        {
            BeingHit = true;
            StartCoroutine(ResetBeginHit());
        }
        _HitParticleSystem.Play();
    }

    [SerializeField]
    private AnimationCurve _AlphaCurve;

    public void OnHealthPercentageChanged(float healthPercentage)
    {
        if (_Material)
        {
            _StartAlphaAnimation = Time.time;
            _StartAlpha = _Material.GetFloat("_Alpha");
            _DestinationAlpha = Mathf.Clamp01(_AlphaCurve.Evaluate(healthPercentage));
            this.Info("alpha animation: at {0}, {1} to {2}", _StartAlphaAnimation.Value, _StartAlpha, _DestinationAlpha);
        }
    }

    private IEnumerator ResetBeginHit()
    {
        yield return new WaitForSeconds(HitDuration.Value);
        BeingHit = false;
    }

    #region alpha

    private float? _StartAlphaAnimation;

    private float _StartAlpha;

    private float _DestinationAlpha;

    [SerializeField]
    private FloatReference _AlphaAnimationDuration;

    private void Update()
    {
        if (_StartAlphaAnimation.HasValue)
        {
            var t = (Time.time - _StartAlphaAnimation.Value) / _AlphaAnimationDuration.Value;
            var alpha = Mathf.Lerp(_StartAlpha, _DestinationAlpha, t);
            this.Verbose("setting alpha to {0}", alpha);
            _Material.SetFloat(
                "_Alpha",
                alpha
            );
            if (t >= 1)
            {
                this.Verbose("alpha animation finished");
                _StartAlphaAnimation = null;
            }
        }
    }

    #endregion
}
