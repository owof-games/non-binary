using UnityEngine;
using System;

[Serializable]
public class FullLayout : IEquatable<FullLayout>
{
    [Serializable]
    public struct MultiUnityOfMeasureRects
    {
        public Rect Percentage;
        public Rect Screen;
        public Rect World;

        public override bool Equals(object obj)
        {
            if (obj == null || GetType() != obj.GetType())
            {
                return false;
            }

            var r = (MultiUnityOfMeasureRects)obj;
            return Percentage.Equals(r.Percentage) && Screen.Equals(r.Screen) && World.Equals(r.World);
        }

        public override int GetHashCode()
        {
            return HashCode.Combine(Percentage, Screen, World);
        }
    }

    public MultiUnityOfMeasureRects LeftSideText;
    public MultiUnityOfMeasureRects RightSideText;
    public MultiUnityOfMeasureRects Street;
    public MultiUnityOfMeasureRects MainText;

    private MultiUnityOfMeasureRects CreateMultiUnityOfMeasureRects(Size size, Rect percentage)
    {
        var pw = size.ProportionalWidth;
        var ph = size.ProportionalHeight;
        var minX = (size.Width - pw) / 2;
        var minY = (size.Height - ph) / 2;
        var result = new MultiUnityOfMeasureRects()
        {
            Percentage = percentage,
            Screen = new Rect(minX + percentage.x * pw, minY + percentage.y * ph, percentage.width * pw, percentage.height * ph)
        };
        var bottomLeft = Camera.main.ScreenToWorldPoint(new Vector3(result.Screen.xMin, result.Screen.yMin, 0));
        var topRight = Camera.main.ScreenToWorldPoint(new Vector3(result.Screen.xMax, result.Screen.yMax, 0));
        // Debug.Log(string.Format("giving world x={0}, y={1}, w={2}, h={3}", bottomLeft.x, bottomLeft.y, topRight.x - bottomLeft.x, topRight.y - bottomLeft.y));
        result.World = new Rect(bottomLeft.x, bottomLeft.y, topRight.x - bottomLeft.x, topRight.y - bottomLeft.y);
        // Debug.Log(string.Format("because of this xMin={0}, yMin={1}, xMax={2}, yMax={3}", result.World.xMin, result.World.yMin, result.World.xMax, result.World.yMax));
        return result;
    }

    public FullLayout(Size size, Rect percentageLeftSideText, Rect percentageRightSideText, Rect percentageStreet, Rect percentageMainText)
    {
        if (!Camera.main)
        {
            return;
        }
        LeftSideText = CreateMultiUnityOfMeasureRects(size, percentageLeftSideText);
        RightSideText = CreateMultiUnityOfMeasureRects(size, percentageRightSideText);
        Street = CreateMultiUnityOfMeasureRects(size, percentageStreet);
        MainText = CreateMultiUnityOfMeasureRects(size, percentageMainText);
    }

    public bool Equals(FullLayout other)
    {
        return LeftSideText.Equals(other.LeftSideText) && RightSideText.Equals(other.RightSideText) &&
            Street.Equals(other.Street) && MainText.Equals(other.MainText);
    }

    public override bool Equals(object obj)
    {
        if (obj == null || GetType() != obj.GetType())
        {
            return false;
        }

        return Equals((FullLayout)obj);
    }

    public override int GetHashCode()
    {
        return HashCode.Combine(LeftSideText, RightSideText, Street, MainText);
    }
}
