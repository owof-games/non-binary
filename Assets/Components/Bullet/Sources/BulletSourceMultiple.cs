using System.Linq;
using System.Collections.Generic;
using UnityEngine;
using RG.LogLibrary;

[CreateAssetMenu(fileName = "BulletSourceMultiple", menuName = "non-binary/BulletSource/Create Multiple", order = 0)]
public class BulletSourceMultiple : BulletSource
{
    [SerializeField]
    BaseLogger _BaseLogger;

    public BaseLogger BaseLogger { set { _BaseLogger = value; } }

    [System.Serializable]
    public struct BulletSourceBlock
    {
        public BulletSource BulletSource;
        public float DeltaTime;
    }

    [System.Serializable]
    public struct HellModeDescription
    {
        public bool Active;

        public bool JumpDirectlyToHellMode;

        public float InitialDelay;

        public float DelayFactor;

        public float MinimumForStage;

        public float MinimumDelayBetweenDescriptionsInStage;

        public float MinumumDelayBetweenStages;
    }

    [SerializeField]
    private HellModeDescription _HellModeDescription;

    public HellModeDescription HellModeDescriptionValue { set { _HellModeDescription = value; } }

    [SerializeField]
    private BulletSourceBlock[] _BulletSourceBlocks;

    public BulletSourceBlock[] BulletSourceBlocks { get { return _BulletSourceBlocks; } set { _BulletSourceBlocks = value; } }

    public override IEnumerable<Description> Descriptions
    {
        get
        {
            // always produce all the descriptions once, in order
            var t = 0f;

            if (!_HellModeDescription.JumpDirectlyToHellMode)
            {
                foreach (var bulletSourceBlock in _BulletSourceBlocks)
                {
                    t += bulletSourceBlock.DeltaTime;
                    var blockDescriptions = bulletSourceBlock.BulletSource.Descriptions;
                    if (_BaseLogger.Configuration != null)
                    {
                        _BaseLogger.Info(this, "generating block description with t = {0}", t);
                    }
                    var i = 0;
                    foreach (var description in blockDescriptions)
                    {
                        var d = description.Clone();
                        d.DeltaTime += t;
                        if (i++ == 0 && _BaseLogger.Configuration != null)
                        {
                            _BaseLogger.Verbose(this, "e.g.: first generated has deltatime = {0}", d.DeltaTime);
                        }
                        yield return d;
                    }
                }
            }

            // if hell mode is activated, then proceed generating random ones, always more frequently
            if (_HellModeDescription.Active)
            {
                if (_BaseLogger.Configuration != null)
                {
                    _BaseLogger.Info(this, "entering hell mode");
                }
                var allDescriptionsEnumerable = (
                    from bulletSourceBlock
                    in _BulletSourceBlocks
                    select bulletSourceBlock.BulletSource.Descriptions
                    ).ToArray();

                var delta = _HellModeDescription.InitialDelay;
                for (; ; )
                {
                    t += delta;
                    if (_BaseLogger.Configuration != null)
                    {
                        _BaseLogger.Info(this, "setting up description at time {0} (delta = {1})", t, delta);
                    }
                    var count = 0;
                    do
                    {
                        var microDeltaT = 0f;
                        var enumerable = allDescriptionsEnumerable[Random.Range(0, allDescriptionsEnumerable.Length)];
                        var i = 0;
                        foreach (var description in enumerable)
                        {
                            var d = description.Clone();
                            d.DeltaTime += t;
                            d.DeltaTime += microDeltaT;
                            count++;
                            if (i++ == 0 && _BaseLogger.Configuration != null)
                            {
                                _BaseLogger.Verbose(this, "e.g.: first generated has deltatime = {0}", d.DeltaTime);
                            }
                            yield return d;
                        }
                        microDeltaT += _HellModeDescription.MinimumDelayBetweenDescriptionsInStage;
                    } while (count < _HellModeDescription.MinimumForStage);
                    delta = Mathf.Max(delta * _HellModeDescription.DelayFactor, _HellModeDescription.MinumumDelayBetweenStages);
                }
            }
        }
    }
}
