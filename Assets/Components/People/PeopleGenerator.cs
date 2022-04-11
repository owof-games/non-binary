using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityAtoms.BaseAtoms;
using RG.LogLibrary;

public class PeopleGenerator : MonoBehaviour
{
    [SerializeField]
    private GameObject _Person;

    [SerializeField]
    private bool _GoingDown;

    [SerializeField]
    private bool _LeftSide;

    [SerializeField]
    private FloatReference _MinPeoplePerSecond;

    [SerializeField]
    private FloatReference _MaxPeoplePerSecond;

    [SerializeField]
    private FloatReference _Speed;

    public float PeoplePercentage { private get; set; } = -1f;

    public float SideTextPadding { private get; set; } = -1f;

    public Vector2 SideTextSize { private get; set; } = new Vector2(-1, -1);

    public float StreetWidth { private get; set; } = -1f;

    public Size ScreenSize { private get; set; } = new Size()
    {
        Width = -1,
        Height = -1
    };

    [SerializeField]
    private FloatReference _Padding;

    private float _NextGenerationTime = 0f;

    private bool _HasValidBindings
    {
        get
        {
            return PeoplePercentage != -1 &&
                SideTextPadding != -1 &&
                SideTextSize.x != -1 &&
                SideTextSize.y != -1 &&
                StreetWidth != -1 &&
                ScreenSize.Width > 0 &&
                ScreenSize.Height > 0;
        }
    }

    private readonly Queue<GameObject> _Pool = new Queue<GameObject>();

    private readonly Queue<GameObject> _CurrentlyGoing = new Queue<GameObject>();

    private void Update()
    {
        if (_NextGenerationTime <= Time.time && _HasValidBindings)
        {
            _GeneratePerson();
        }
        CheckRecycle();
        // UpdateAlpha();
    }

    private void _GeneratePerson()
    {
        // choose next generation time
        _NextGenerationTime = Time.time +
            1f / Mathf.Lerp(_MinPeoplePerSecond.Value, _MaxPeoplePerSecond.Value, PeoplePercentage);
        // compute minx and maxx in a [0;1] range
        var minXPercentage = SideTextPadding + SideTextSize.x;
        var maxXPercentage = (1 - StreetWidth) / 2;
        if (!_LeftSide)
        {
            // move to the right
            var newMinXPercentage = 1 - maxXPercentage;
            var newMaxXPercentage = 1 - minXPercentage;
            maxXPercentage = newMaxXPercentage;
            minXPercentage = newMinXPercentage;
        }
        var deltaPadding = (maxXPercentage - minXPercentage) * _Padding;
        minXPercentage += deltaPadding;
        maxXPercentage -= deltaPadding;
        // transform into screen coordinates
        var border = (ScreenSize.Width - ScreenSize.ProportionalWidth) / 2;
        var minX = border + ScreenSize.ProportionalWidth * minXPercentage;
        var maxX = border + ScreenSize.ProportionalWidth * maxXPercentage;
        // transform into world space
        var vMin = Camera.main.ScreenToWorldPoint(new Vector3(minX, -20, 0));
        var vMax = Camera.main.ScreenToWorldPoint(new Vector3(maxX, ScreenSize.Height, 0));
        // generate a person in a random position
        var x = Random.Range(vMin.x, vMax.x);
        var y = _GoingDown ? vMax.y : vMin.y;
        this.Verbose("Generating a person: minXPercentage = {0}, maxXPercentage = {1}, minX = {2}, maxX = {3}, vMin = {4}, vMax = {5}, x = {6}, y = {7}",
            minXPercentage, maxXPercentage, minX, maxX, vMin, vMax, x, y);
        GameObject person;
        var position = new Vector3(x, y, transform.position.z);
        if (_Pool.Count > 0)
        {
            person = _Pool.Dequeue();
            person.transform.position = position;
            person.SetActive(true);
        }
        else
        {
            person = Instantiate(_Person, position, Quaternion.identity, transform);
            if (!person.TryGetComponent<Renderer>(out var renderer))
            {
                renderer = person.GetComponentInChildren<Renderer>();
            }
            if (renderer == null)
            {
                this.Warning("Could not find a renderer in person game object");
            }
            else
            {
                renderer.material = _Material;
            }
        }
        _CurrentlyGoing.Enqueue(person);
        // set velocity in the right direction
        var rigidBody = person.GetComponent<Rigidbody>();
        rigidBody.velocity = new Vector3(0, _GoingDown ? -_Speed.Value : _Speed.Value, 0);
    }

    private void CheckRecycle()
    {
        if (_CurrentlyGoing.Count == 0)
        {
            return;
        }
        var person = _CurrentlyGoing.Peek();
        var screenPosition = Camera.main.WorldToScreenPoint(person.transform.position);
        var y = screenPosition.y;
        var yBorder = (ScreenSize.Height - ScreenSize.ProportionalHeight) / 2;
        var minY = yBorder;
        var maxY = ScreenSize.Height - yBorder;
        if ((_GoingDown && y < minY) || (_GoingDown && y > maxY))
        {
            person.SetActive(false);
            _CurrentlyGoing.Dequeue();
            _Pool.Enqueue(person);
        }
    }

    #region alpha

    // private float _StartAlpha = 0f;

    // private float _DestinationAlpha = 0f;

    // private float _StartFadeTime = 0f;

    // [SerializeField]
    // private AnimationCurve _FadeAnimationCurve;

    [SerializeField]
    private Material _Material;

    public Material Material { get => _Material; }

    private void Awake()
    {
        _Material = Instantiate(_Material);
        // SetMaterialAlpha(0);
    }

    // public void OnPeopleVisibleChanged(bool peopleVisible)
    // {
    //     _DestinationAlpha = peopleVisible ? 1f : 0f;
    //     if (_StartAlpha != _DestinationAlpha)
    //     {
    //         _StartFadeTime = Time.time;
    //         this.Info("Setting start time at {0}, start alpha = {1}, destination alpha = {2}",
    //             _StartFadeTime, _StartAlpha, _DestinationAlpha);
    //     }
    // }

    // private void UpdateAlpha()
    // {
    //     if (_StartAlpha != _DestinationAlpha)
    //     {
    //         var delta = Time.time - _StartFadeTime;
    //         var value = _FadeAnimationCurve.Evaluate(delta);
    //         var alpha = Mathf.Lerp(_StartAlpha, _DestinationAlpha, value);
    //         SetMaterialAlpha(alpha);
    //         if (_FadeAnimationCurve.keys[_FadeAnimationCurve.length - 1].time < delta)
    //         {
    //             this.Info("Got to final alpha.");
    //             _StartAlpha = _DestinationAlpha;
    //         }
    //     }
    // }

    #endregion
}
