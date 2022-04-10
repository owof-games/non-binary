using UnityEngine;

public static class TextHelpers
{
    public static string TransformGenderTags(string text, Color m, Color f, float t = 1, Color? baseColor = null)
    {
        var realBaseColor = baseColor ?? Color.white;
        var realM = Color.Lerp(realBaseColor, m, t);
        var realF = Color.Lerp(realBaseColor, f, t);

        return text
            .Replace("<m>", $"<color=#{ColorUtility.ToHtmlStringRGB(realM)}>")
            .Replace("<f>", $"<color=#{ColorUtility.ToHtmlStringRGB(realF)}>")
            .Replace("</m>", "</color>")
            .Replace("</f>", "</color>");
    }
}