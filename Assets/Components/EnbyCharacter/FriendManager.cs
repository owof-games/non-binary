using UnityEngine;
using UnityAtoms.BaseAtoms;

public class FriendManager : MonoBehaviour
{
    public float AngularSpeed;

    public float Distance;

    public float FadeInDuration;

    public GameObject Friend;

    public GameObject Shield;

    public bool Enabled;

    public BoolVariable InvincibleVariable;

    private AlphaManagement _FriendAlphaManagement;

    private AlphaManagement _ShieldAlphaManagement;

    private void Start()
    {
        _FriendAlphaManagement = Friend.GetComponent<AlphaManagement>();
        _ShieldAlphaManagement = Shield.GetComponent<AlphaManagement>();
    }

    private float _StartFadeInTime;

    private bool _LastEnabled = false;

    private void Update()
    {
        Friend.SetActive(Enabled);
        Shield.SetActive(Enabled);

        if (_LastEnabled != Enabled)
        {
            _LastEnabled = Enabled;
            InvincibleVariable.Value = Enabled;
            _StartFadeInTime = Time.time;
        }

        var t = Mathf.Lerp(0, 1, (Time.time - _StartFadeInTime) / FadeInDuration);
        _FriendAlphaManagement.SetAlphaMultiplier("Friend", t);
        _ShieldAlphaManagement.SetAlphaMultiplier("Shield", t);

        if (Enabled)
        {
            var angle = -AngularSpeed * Time.time;
            var x = Mathf.Cos(angle);
            var y = Mathf.Sin(angle);
            Friend.transform.position = transform.position + Distance * Vector3.Scale(transform.localScale, new Vector3(x, y, 0));

            var angleDirection = angle - Mathf.PI / 2;
            Friend.transform.rotation = Quaternion.AngleAxis(
                Mathf.Rad2Deg * angleDirection,
                Vector3.forward
            );
        }
    }
}
