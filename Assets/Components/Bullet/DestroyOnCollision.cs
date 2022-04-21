using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;
using System;

public class DestroyOnCollision : MonoBehaviour
{
    public bool Dying = false;

    private float _StartedDyingAt;

    private Transform _Target;

    private Vector3 _AlternativeTargetPosition;

    private Vector2 _StartingRelativePosition;

    private float _InitialScale;

    public FloatReference DeathDuration;

    public IntReference MaxDamage;

    public int Damage;

    public IntEvent Hit;

    private void Start()
    {
        GetComponent<AlphaManagement>().SetAlphaMultiplier(
            "DamageAmountAlpha",
            (float)Damage / MaxDamage.Value
        );
    }

    private void OnTriggerEnter(Collider other)
    {
        if (!Dying)
        {
            var hitPlayer = true;
            if (!other.gameObject.TryGetComponent<PlayerHit>(out var playerHit))
            {
                hitPlayer = false;
                playerHit = other.gameObject.transform.parent.GetComponent<PlayerHit>();
            }
            if (playerHit != null && playerHit.BeingHit)
            {
                return;
            }
            Dying = true;
            _StartedDyingAt = Time.time;
            _InitialScale = transform.localScale.x;
            if (hitPlayer)
            {
                _Target = other.gameObject.transform;
            }
            else
            {
                _AlternativeTargetPosition = transform.position - (other.gameObject.transform.position - transform.position);
            }
            _StartingRelativePosition = transform.position - GetTargetPosition();
            if (playerHit != null)
            {
                playerHit.OnHit();
            }
            Hit.Raise(Damage);
        }
    }

    private Vector3 GetTargetPosition()
    {
        if (_Target != null)
        {
            return _Target.transform.position;
        }
        else
        {
            return _AlternativeTargetPosition;
        }
    }

    private void Update()
    {
        if (Dying)
        {
            var delta = (Time.time - _StartedDyingAt) / DeathDuration.Value;
            var relativePosition = Vector3.Lerp(
                _StartingRelativePosition,
                Vector3.zero,
                delta
            );
            transform.position = GetTargetPosition() + relativePosition;
            var newScale = Mathf.Lerp(_InitialScale, 0, delta);
            transform.localScale = new Vector3(newScale, newScale, newScale);
        }
    }
}
