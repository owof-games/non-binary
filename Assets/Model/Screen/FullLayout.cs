using UnityEngine;
using System;

[Serializable]
public class FullLayout : IEquatable<FullLayout>
{
    [Serializable]
    public struct MultiUnityOfMeasureRects
    {
        //
        // Summary:
        //      Coordinates of this rect where (0,0) = bottom left scene coordinates and
        //      (1,1) = top right scene coordinates
        public Rect Percentage;
        //
        // Summary:
        //      Cooordinates of this rect in pixels where bottom left = (0,0) and
        //      top right = (screen width, screen height)
        public Rect Screen;
        //
        // Summary:
        //      Coordinates of this rect in world coordinates, with z = 0. Since we are in
        //      orthographic projections, any z between near and far plane is correct.
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
    public MultiUnityOfMeasureRects Scene;
    public MultiUnityOfMeasureRects Screen;

    private MultiUnityOfMeasureRects CreateMultiUnityOfMeasureRects(Size size, Rect cameraFocus, Rect percentage)
    {
        var pw = size.ProportionalWidth;
        var ph = size.ProportionalHeight;
        var deltaX = (size.Width - pw) / 2;
        var deltaY = (size.Height - ph) / 2;
        float xPercentageToScreen(float x) => (x - cameraFocus.xMin) / cameraFocus.width * pw + deltaX;
        float yPercentageToScreen(float y) => (y - cameraFocus.yMin) / cameraFocus.height * ph + deltaY;
        var result = new MultiUnityOfMeasureRects()
        {
            Percentage = percentage,
            Screen = Rect.MinMaxRect(
                xPercentageToScreen(percentage.xMin),
                yPercentageToScreen(percentage.yMin),
                xPercentageToScreen(percentage.xMax),
                yPercentageToScreen(percentage.yMax)
            )
        };
        var bottomLeft = Camera.main.ScreenToWorldPoint(new Vector3(result.Screen.xMin, result.Screen.yMin, 0));
        var topRight = Camera.main.ScreenToWorldPoint(new Vector3(result.Screen.xMax, result.Screen.yMax, 0));
        // Debug.Log(string.Format("giving world x={0}, y={1}, w={2}, h={3}", bottomLeft.x, bottomLeft.y, topRight.x - bottomLeft.x, topRight.y - bottomLeft.y));
        result.World = Rect.MinMaxRect(bottomLeft.x, bottomLeft.y, topRight.x, topRight.y);
        // Debug.Log(string.Format("because of this xMin={0}, yMin={1}, xMax={2}, yMax={3}", result.World.xMin, result.World.yMin, result.World.xMax, result.World.yMax));
        return result;
    }

    public FullLayout(Size size, Rect cameraFocus, Rect percentageLeftSideText, Rect percentageRightSideText, Rect percentageStreet, Rect percentageMainText)
    {
        if (!Camera.main)
        {
            return;
        }
        LeftSideText = CreateMultiUnityOfMeasureRects(size, cameraFocus, percentageLeftSideText);
        RightSideText = CreateMultiUnityOfMeasureRects(size, cameraFocus, percentageRightSideText);
        Street = CreateMultiUnityOfMeasureRects(size, cameraFocus, percentageStreet);
        MainText = CreateMultiUnityOfMeasureRects(size, cameraFocus, percentageMainText);
        Scene = CreateMultiUnityOfMeasureRects(size, cameraFocus, new Rect(0, 0, 1, 1));
        Screen = CreateMultiUnityOfMeasureRects(size, cameraFocus, cameraFocus);
    }

    public bool Equals(FullLayout other)
    {
        return LeftSideText.Equals(other.LeftSideText) && RightSideText.Equals(other.RightSideText) &&
            Street.Equals(other.Street) && MainText.Equals(other.MainText) && Scene.Equals(other.Scene) &&
            Screen.Equals(other.Screen);
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
        return HashCode.Combine(LeftSideText, RightSideText, Street, MainText, Scene, Screen);
    }
}
