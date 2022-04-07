using System;
using UnityEngine;
using Ink.Runtime;

public class StoryCache
{
    private TextAsset _LastUsedInkJSONAsset;

    private Story _CachedStory;

    public event Action NewStoryObjectCreated;

    public Story GetStory(TextAsset inkJSONAsset)
    {
        if (_CachedStory != null && _LastUsedInkJSONAsset != inkJSONAsset)
        {
            _CachedStory = null;
        }
        if (_CachedStory == null && inkJSONAsset != null)
        {
            _LastUsedInkJSONAsset = inkJSONAsset;
            _CachedStory = new Story(inkJSONAsset.text);
            NewStoryObjectCreated?.Invoke();
        }
        return _CachedStory;
    }
}
