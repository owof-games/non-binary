using UnityEngine;

public class SetPersonMaterialAlpha : MonoBehaviour
{
    [SerializeField]
    private float _Alpha;

    public void SetAlpha(float alpha)
    {
        _Alpha = alpha;
    }

    private PeopleGenerator _PeopleGenerator;

    private void Awake()
    {
        _PeopleGenerator = GetComponent<PeopleGenerator>();
    }

    private float _LastAlpha = -1;

    void Update()
    {
        if (_Alpha != _LastAlpha)
        {
            var color = _PeopleGenerator.Material.GetColor("_BaseColor");
            color.a = _Alpha;
            _PeopleGenerator.Material.SetColor("_BaseColor", color);
            _LastAlpha = _Alpha;
        }
    }

}
