using UnityEngine;
using System.Collections;

public class FriendsSource : MonoBehaviour
{
    public GameObject Friend;

    private Coroutine _GenerateFriendsCoroutine = null;

    public void OnStoryStepChanged(StoryStep storyStep)
    {
        if (storyStep.IsBulletHell && storyStep.BulletHellName == "finale")
        {
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

    public float StreetSpacePadding = 0.1f;

    private IEnumerator GenerateFriends()
    {
        while (true)
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
            // define aspect
            var sp = go.GetComponent<ShapeParameters>();
            sp.Height = Random.Range(0f, 1f);
            sp.Hue1 = Random.Range(0f, 1f);
            sp.Hue2 = Random.Range(0f, 1f);
            sp.InnerRadius = Random.Range(0f, 1f);
            sp.Torque = Random.Range(0f, 1f);
            go.transform.localScale = Random.Range(0.9f, 1.1f) * go.transform.localScale;
            // wait a bit
            yield return new WaitForSeconds(TimeBetweenFriends);
        }
    }
}
