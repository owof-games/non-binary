using System;
using UnityEngine;
using Ink.Runtime;
using RG.LogLibrary;

public class StoryCache
{
    private TextAsset _LastUsedInkJSONAsset;

    private Story _CachedStory;

    public event Action NewStoryObjectCreated;

    public Story GetStory(TextAsset inkJSONAsset, StoryManager storyManager, BaseLogger baseLogger)
    {
        if (_CachedStory != null && _LastUsedInkJSONAsset != inkJSONAsset)
        {
            baseLogger.Info(storyManager,
                "changed ink json asset from {0} to {1}: resetting cached story",
                _LastUsedInkJSONAsset.name, inkJSONAsset.name);
            _CachedStory = null;
        }
        if (_CachedStory == null && inkJSONAsset != null)
        {
            baseLogger.Info(storyManager,
                "no cached story: creating new story from json asset {0}",
                inkJSONAsset.name);
            _LastUsedInkJSONAsset = inkJSONAsset;
            _CachedStory = new Story(inkJSONAsset.text);
            NewStoryObjectCreated?.Invoke();
        }
        return _CachedStory;
    }
}
