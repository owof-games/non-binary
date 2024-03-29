using UnityEngine;
using UnityAtoms.BaseAtoms;

public class Bullets : MonoBehaviour
{
    [SerializeField]
    private string _BulletTag;

    [SerializeField]
    private FloatVariable _AlphaMultiplier;

    [SerializeField]
    private float _Alpha;

    private float _LastValue;

    private void Start()
    {
        _LastValue = _AlphaMultiplier.Value;
    }

    private void Update()
    {
        if (_Alpha != _LastValue)
        {
            _LastValue = _Alpha;
            _AlphaMultiplier.Value = _Alpha;
        }
    }

    public void ResetBullets()
    {
        foreach (var bullet in GameObject.FindGameObjectsWithTag(_BulletTag))
        {
            Destroy(bullet);
        }
        _Alpha = 1;
        _AlphaMultiplier.Value = 1;
    }
}
