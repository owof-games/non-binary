using UnityEngine;

namespace RG.LogLibrary
{
    public class Logger : MonoBehaviour
    {
        public Configuration Configuration;
        public string Path;

        private BaseLogger _InternalBaseLogger = null;
        private BaseLogger _BaseLogger
        {
            get
            {
                if (_InternalBaseLogger == null)
                {
                    _InternalBaseLogger = new BaseLogger
                    {
                        Configuration = Configuration,
                        Path = Path
                    };
                }
                return _InternalBaseLogger;
            }
        }

        public void Log(Object context, Levels level, string message, params object[] args)
        {
            _BaseLogger.Log(context, level, message, args);
        }

        public void Verbose(Object context, string message, params object[] args)
        {
            _BaseLogger.Verbose(context, message, args);
        }

        public void Info(Object context, string message, params object[] args)
        {
            _BaseLogger.Info(context, message, args);
        }

        public void Warning(Object context, string message, params object[] args)
        {
            _BaseLogger.Warning(context, message, args);
        }

        public void Error(Object context, string message, params object[] args)
        {
            _BaseLogger.Error(context, message, args);
        }
    }
}
