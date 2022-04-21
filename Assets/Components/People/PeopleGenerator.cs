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

    [SerializeField]
    private FloatReference _Padding;

    private float _NextGenerationTime = 0f;

    private bool _HasValidBindings
    {
        get
        {
            return PeoplePercentage != -1 &&
                FullLayout.Screen.Screen.width != 0 &&
                FullLayout.Screen.Screen.height != 0;
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
    }

    public FullLayout FullLayout { private get; set; }

    private void _GeneratePerson()
    {
        // choose next generation time
        _NextGenerationTime = Time.time +
            1f / Mathf.Lerp(_MinPeoplePerSecond.Value, _MaxPeoplePerSecond.Value, PeoplePercentage);
        var xMin = _LeftSide ? FullLayout.LeftSideText.World.xMax : FullLayout.Street.World.xMax;
        var xMax = _LeftSide ? FullLayout.Street.World.xMin : FullLayout.RightSideText.World.xMin;
        var padding = (xMax - xMin) * _Padding.Value;
        xMin += padding;
        xMax -= padding;
        var yMin = FullLayout.Scene.World.yMin - FullLayout.Scene.World.height * 0.2f; // move it just a bit down to hide the generation
        var yMax = FullLayout.Scene.World.yMax + FullLayout.Scene.World.height * 0.2f; // move it just a bit up to hide the generation
        // generate a person in a random position
        var x = Random.Range(xMin, xMax);
        var y = _GoingDown ? yMax : yMin;
        // this.Verbose("Generating a person: minXPercentage = {0}, maxXPercentage = {1}, minX = {2}, maxX = {3}, vMin = {4}, vMax = {5}, x = {6}, y = {7}",
        //     minXPercentage, maxXPercentage, minX, maxX, vMin, vMax, x, y);
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
        var y = person.transform.position.y;
        var minY = FullLayout.MainText.World.yMin - FullLayout.MainText.World.height * 0.2f;
        var maxY = FullLayout.Scene.World.yMax + FullLayout.Scene.World.height * 0.2f;
        if ((_GoingDown && y < minY) || (!_GoingDown && y > maxY))
        {
            person.SetActive(false);
            _CurrentlyGoing.Dequeue();
            _Pool.Enqueue(person);
        }
    }

    #region alpha

    [SerializeField]
    private Material _Material;

    public Material Material { get => _Material; }

    private void Awake()
    {
        _Material = Instantiate(_Material);
    }

    #endregion
}
