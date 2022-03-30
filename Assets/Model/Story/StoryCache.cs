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
            Debug.Log("StoryManager: ink asset change, resetting story");
            _CachedStory = null;
        }
        if (_CachedStory == null && inkJSONAsset != null)
        {
            Debug.Log("StoryManager: no cached story, creating one");
            _LastUsedInkJSONAsset = inkJSONAsset;
            Debug.Log("StortManager: text is:\n" + inkJSONAsset.text);
            _CachedStory = new Story(inkJSONAsset.text);
            NewStoryObjectCreated?.Invoke();
        }
        return _CachedStory;
    }
}
