using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

namespace RG.LogLibrary
{
    using UnityEngine;

    [CreateAssetMenu(fileName = "Configuration", menuName = "log/Create Logging Configuration", order = 0)]
    public class Configuration : ScriptableObject
    {
        public enum OverrideLevel
        {
            Inherit = 0,
            Yes = 1,
            No = 2,
        }

        [Serializable]
        public struct Override
        {
            public string Path;
            public OverrideLevel IsVerboseEnabled;
            public OverrideLevel IsInfoEnabled;
            public OverrideLevel IsWarningEnabled;
            public OverrideLevel IsErrorEnabled;
        }

        public bool RootVerboseEnabled = false;
        public bool RootInfoEnabled = false;
        public bool RootWarningEnabled = true;
        public bool RootErrorEnabled = true;

        public Override[] Overrides;
    }
}
