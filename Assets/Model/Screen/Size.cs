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

    public override int GetHashCode()
    {
        return Width.GetHashCode() ^ Height.GetHashCode();
    }

    public override bool Equals(object obj)
    {
        // return obj is Size ? Equals((Size)obj) : base.Equals(obj);
        return obj is Size size ? Equals(size) : base.Equals(obj);
    }

    private const float _DesiredProportions = 16f / 9f;

    public int ProportionalWidth
    {
        get
        {
            var currentProportions = ((float)Width) / ((float)Height);
            if (currentProportions > _DesiredProportions)
            {
                // current screen is "larger" than what we want: height occupies the whole screen, width is computed
                return (int)(Height * _DesiredProportions);
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
            var currentProportions = ((float)Width) / ((float)Height);
            if (currentProportions > _DesiredProportions)
            {
                // current screen is "larger" than what we want: height occupies the whole screen, width is computed
                return Height;
            }
            else
            {
                // current screen is "higher" than what we want: width occupies the whole screen, height is computed
                return (int)(Width / _DesiredProportions);
            }

        }
    }
}
