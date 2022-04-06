using UnityEngine;

public static class TextHelpers
{
    public static string TransformGenderTags(string text, Color m, Color f)
    {

        return text
            .Replace("<m>", $"<color=#{ColorUtility.ToHtmlStringRGB(m)}>")
            .Replace("<f>", $"<color=#{ColorUtility.ToHtmlStringRGB(f)}>")
            .Replace("</m>", "</color>")
            .Replace("</f>", "</color>");
    }
}