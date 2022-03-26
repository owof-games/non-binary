using UnityEngine;

namespace RG.LogLibrary
{
    public class Logger : MonoBehaviour
    {
        public Configuration Configuration;
        public string Path;

        private string _Color = null;

        private string GetColor()
        {
            if (_Color == null)
            {
                // get a random color from the hash of the path
                var hash = Path.GetHashCode();
                var r = hash % 256;
                hash >>= 8;
                var g = hash % 256;
                hash >>= 8;
                var b = hash % 256;
                var color = new Color(((float)r) / 256f, ((float)g) / 256f, ((float)b) / 256f);
                // convert to HSV
                Color.RGBToHSV(color, out float h, out float s, out _);
                // force a certain brightness
                float v = 0.75f;
                // save the color
                color = Color.HSVToRGB(h, s, v);
                _Color = ColorUtility.ToHtmlStringRGB(color);
                // Debug.Log($"Converting r={r}, g={g}, b={b} to h={h}, s={s}, v={oldV}, then moving v => 0.75 produces color={_Color}");
            }
            return _Color;
        }

        public void Log(Object context, Levels level, string message, params object[] args)
        {
            string bestPathMatch = "";
            Configuration.Override o = new Configuration.Override()
            {
                IsErrorEnabled = Configuration.OverrideLevel.Inherit,
                IsInfoEnabled = Configuration.OverrideLevel.Inherit,
                IsVerboseEnabled = Configuration.OverrideLevel.Inherit,
                IsWarningEnabled = Configuration.OverrideLevel.Inherit,
            };
            foreach (var ov in Configuration.Overrides)
            {
                if (Path.IndexOf(ov.Path) == 0 && ov.Path.Length > bestPathMatch.Length)
                {
                    bestPathMatch = ov.Path;
                    o = ov;
                }
            }

            bool defaultValue;
            Configuration.OverrideLevel overrideLevel;
            switch (level)
            {
                case Levels.Verbose:
                    defaultValue = Configuration.RootVerboseEnabled;
                    overrideLevel = o.IsVerboseEnabled;
                    break;
                case Levels.Info:
                    defaultValue = Configuration.RootInfoEnabled;
                    overrideLevel = o.IsInfoEnabled;
                    break;
                case Levels.Warning:
                    defaultValue = Configuration.RootWarningEnabled;
                    overrideLevel = o.IsWarningEnabled;
                    break;
                case Levels.Error:
                    defaultValue = Configuration.RootErrorEnabled;
                    overrideLevel = o.IsErrorEnabled;
                    break;
                default:
                    throw new System.Exception("Unknown log level");
            }

            var enabled = overrideLevel == Configuration.OverrideLevel.Inherit ?
                defaultValue :
                overrideLevel == Configuration.OverrideLevel.Yes;
            if (enabled)
            {
                Debug.LogFormat(
                    level == Levels.Warning ? LogType.Warning :
                    level == Levels.Error ? LogType.Error :
                    LogType.Log,
                    LogOption.None,
                    context,
                    $"<color=#{GetColor()}>{Path}</color> {message}",
                    args
                );
            }
        }

        public void Verbose(Object context, string message, params object[] args)
        {
            Log(context, Levels.Verbose, message, args);
        }

        public void Info(Object context, string message, params object[] args)
        {
            Log(context, Levels.Info, message, args);
        }

        public void Warning(Object context, string message, params object[] args)
        {
            Log(context, Levels.Warning, message, args);
        }

        public void Error(Object context, string message, params object[] args)
        {
            Log(context, Levels.Error, message, args);
        }
    }
}
