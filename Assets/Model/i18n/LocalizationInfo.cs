using System;

[Serializable]
public struct LocalizationInfo : IEquatable<LocalizationInfo>
{
    [Serializable]
    public enum Languages
    {
        Italian = 1,
        English = 2,
        Spanish = 3
    }

    public Languages Current;

    public bool Equals(LocalizationInfo other)
    {
        return Current == other.Current;
    }

    public override bool Equals(object obj)
    {
        return Equals((LocalizationInfo)obj);
    }

    public override int GetHashCode()
    {
        return Current.GetHashCode();
    }
}
