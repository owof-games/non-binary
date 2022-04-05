using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class DestroyOnCollision : MonoBehaviour
{
    public bool Dying = false;

    private float _StartedDyingAt;

    private Transform _Target;

    private Vector2 _StartingRelativePosition;

    private float _InitialScale;

    public FloatReference DeathDuration;

    public VoidEvent Hit;

    private void OnTriggerEnter(Collider other)
    {
        if (!Dying)
        {
            var playerHit = other.gameObject.GetComponent<PlayerHit>();
            if (!playerHit)
            {
                this.Warning("Somehow triggered against a non-player object");
                return;
            }
            if (playerHit.BeingHit)
            {
                return;
            }
            Dying = true;
            _StartedDyingAt = Time.time;
            _Target = other.gameObject.transform;
            _StartingRelativePosition = transform.position - other.gameObject.transform.position;
            _InitialScale = transform.localScale.x;
            Hit.Raise();
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
            transform.position = _Target.position + relativePosition;
            var newScale = Mathf.Lerp(_InitialScale, 0, delta);
            transform.localScale = new Vector3(newScale, newScale, newScale);
        }
    }
}
