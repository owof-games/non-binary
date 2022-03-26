using UnityEngine;
using System.Runtime.CompilerServices;

namespace RG.LogLibrary
{
    public static class LoggerStatic
    {
        private static readonly ConditionalWeakTable<MonoBehaviour, Logger> _Loggers = new ConditionalWeakTable<MonoBehaviour, Logger>();

        public static Logger GetLogger(this MonoBehaviour monoBehaviour)
        {
            return _Loggers.GetValue(monoBehaviour, ExtractLogger);
        }

        private static Logger ExtractLogger(MonoBehaviour monoBehaviour)
        {
            return monoBehaviour.GetComponent<Logger>();
        }

        public static void Log(this MonoBehaviour monoBehaviour, Levels level, string message, params object[] args)
        {
            GetLogger(monoBehaviour).Log(monoBehaviour, level, message, args);
        }

        public static void Verbose(this MonoBehaviour monoBehaviour, string message, params object[] args)
        {
            GetLogger(monoBehaviour).Verbose(monoBehaviour, message, args);
        }

        public static void Info(this MonoBehaviour monoBehaviour, string message, params object[] args)
        {
            GetLogger(monoBehaviour).Info(monoBehaviour, message, args);
        }

        public static void Warning(this MonoBehaviour monoBehaviour, string message, params object[] args)
        {
            GetLogger(monoBehaviour).Warning(monoBehaviour, message, args);
        }

        public static void Error(this MonoBehaviour monoBehaviour, string message, params object[] args)
        {
            GetLogger(monoBehaviour).Error(monoBehaviour, message, args);
        }
    }
}