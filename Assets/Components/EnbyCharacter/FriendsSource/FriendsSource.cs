using UnityEngine;
using UnityEngine.Playables;
using System.Collections;

public class FriendsSource : MonoBehaviour
{
    public GameObject Friend;

    private Coroutine _GenerateFriendsCoroutine = null;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        if (storyStep.IsBulletHell && storyStep.BulletHellName == "finale")
        {
            GetComponent<PlayableDirector>().Play();
            _GenerateFriendsCoroutine = StartCoroutine(GenerateFriends());
        }
        else if (_GenerateFriendsCoroutine != null)
        {
            StopCoroutine(_GenerateFriendsCoroutine);
            _GenerateFriendsCoroutine = null;
        }
    }

    public FullLayout FullLayout { private get; set; }

    public float SpeedFactor;

    public float TimeBetweenFriends;

    public void SetTimeBetweenFriends(float value)
    {
        TimeBetweenFriends = value;
    }

    public bool Paused { get; set; }

    public float StreetSpacePadding = 0.1f;

    private IEnumerator GenerateFriends()
    {
        while (true)
        {
            if (!Paused)
            {
                // compute starting position
                var streetWorldRect = FullLayout.Street.World;
                var position = new Vector3(
                    Random.Range(
                        streetWorldRect.xMin + streetWorldRect.width * StreetSpacePadding,
                        streetWorldRect.xMax - streetWorldRect.width * StreetSpacePadding),
                    streetWorldRect.yMax + 1,
                    transform.position.z
                );
                // instantiate as child
                var go = Instantiate(Friend, position, Quaternion.identity, transform);
                // set speed
                go.GetComponent<Rigidbody>().velocity = new Vector3(0, -streetWorldRect.height * SpeedFactor, 0);
                // set rotation animation
                var r = go.GetComponent<Rotate>();
                r.RotationVector = new Vector3(
                    Random.Range(0, 270),
                    Random.Range(0, 270),
                    Random.Range(0, 270)
                );
                // define aspect
                var sp = go.GetComponent<ShapeParameters>();
                sp.Height = Random.Range(0f, 1f);
                sp.Hue1 = Random.Range(0f, 1f);
                sp.Hue2 = Random.Range(0f, 1f);
                sp.InnerRadius = Random.Range(0f, 1f);
                sp.Torque = Random.Range(0f, 1f);
                go.transform.localScale = Random.Range(0.9f, 1.1f) * go.transform.localScale;
                // program their destruction when they're way off screen
                StartCoroutine(DestroyAfter(go, 1.5f / SpeedFactor));
            }
            // wait a bit
            yield return new WaitForSeconds(TimeBetweenFriends);
        }
    }

    private IEnumerator DestroyAfter(GameObject go, float time)
    {
        yield return new WaitForSeconds(time);
        Destroy(go);
    }
}
