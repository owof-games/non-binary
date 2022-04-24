using UnityEngine;

public class CreatePaws : MonoBehaviour
{
    public GameObject Paw;

    public float SizeFactor;

    private void GenerateRandomPaw()
    {
        var paw = Instantiate(Paw, transform);
        var rt = paw.GetComponent<RectTransform>();
        var x = Random.Range(0f, 1f);
        var y = Random.Range(0f, 1f);
        rt.anchorMin = new Vector2(x, y);
        rt.anchorMax = new Vector2(x, y);
        var sideLength = Mathf.Min(Screen.width, Screen.height) * SizeFactor;
        rt.offsetMin = new Vector2(-sideLength / 2, -sideLength / 2);
        rt.offsetMax = new Vector2(sideLength / 2, sideLength / 2);
    }

    public float Frequency = 0.3f;
    private float _LastTime = 0f;

    public void Update()
    {
        if (Time.time > _LastTime + Frequency)
        {
            GenerateRandomPaw();
            _LastTime = Time.time;
        }
    }
}
