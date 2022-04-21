using System;

[Serializable]
public struct Size : IEquatable<Size>
{
    public int Width;

    public int Height;

    public bool Equals(Size other)
    {
        return Width == other.Width && Height == other.Height;
    }

    public override bool Equals(object obj)
    {
        if (obj == null || GetType() != obj.GetType())
        {
            return false;
        }

        return Equals((Size)obj);
    }

    public override int GetHashCode()
    {
        return HashCode.Combine(Width.GetHashCode(), Height.GetHashCode());
    }

    public const float Ratio = 16f / 9f;

    public int ProportionalWidth
    {
        get
        {
            var currentProportions = (float)Width / Height;
            if (currentProportions > Ratio)
            {
                // current screen is "larger" than what we want: height occupies the whole screen, width is computed
                return (int)(Height * Ratio);
            }
            else
            {
                // current screen is "higher" than what we want: width occupies the whole screen, height is computed
                return Width;
            }

        }
    }

    public int ProportionalHeight
    {
        get
        {
            var currentProportions = (float)Width / Height;
            if (currentProportions > Ratio)
            {
                // current screen is "larger" than what we want: height occupies the whole screen, width is computed
                return Height;
            }
            else
            {
                // current screen is "higher" than what we want: width occupies the whole screen, height is computed
                return (int)(Width / Ratio);
            }

        }
    }

    public override string ToString()
    {
        return $"Size[Width = {Width}, Height = {Height}, ProportionalWidth = {ProportionalWidth}, ProportionalHeight = {ProportionalHeight}]";
    }
}
