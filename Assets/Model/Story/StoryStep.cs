using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using UnityEngine;

public enum StoryStepKind
{
    End = 0, // default value for empty constructor
    Marker = 1,
    Text = 2,
    Choice = 3
}

[Serializable]
public struct StoryStep : IEquatable<StoryStep>
{
    [SerializeField]
    private StoryStepKind _Kind;

    public StoryStepKind Kind { get => _Kind; }

    [SerializeField]
    private string _Text;

    public string Text
    {
        get
        {
            if (Kind != StoryStepKind.Text && Kind != StoryStepKind.Choice)
            {
                throw new Exception("Trying to access text when the step is not text or choice");
            }
            return _Text;
        }
    }

    [SerializeField]
    private string _Marker;

    public string Marker
    {
        get
        {
            if (Kind != StoryStepKind.Marker)
            {
                throw new Exception("Trying to access marker when the step is not marker");
            }
            return _Marker;
        }
    }

    [Serializable]
    public struct Choice
    {
        public int Index;
        public string Text;
    }

    [SerializeField]
    private Choice[] _Choices;

    public Choice[] Choices
    {
        get
        {
            if (Kind != StoryStepKind.Choice)
            {
                throw new Exception("Trying to access choices when the step is not choices");
            }
            return _Choices;
        }
    }

    [SerializeField]
    private bool _ShowStreet;

    public bool ShowStreet { get => _ShowStreet; }

    [SerializeField]
    private bool _ShowPeople;

    public bool ShowPeople { get => _ShowPeople; }

    [SerializeField]
    private bool _IsTitle;
    public bool IsTitle { get => _IsTitle; }

    [SerializeField]
    private int _Completion;
    public int Completion { get => _Completion; }

    private static readonly Regex _CompletionRegex = new Regex(@"completion_([0-9]+)");

    [SerializeField]
    private bool _AlmostThere;
    public bool AlmostThere { get => _AlmostThere; }

    private static readonly Regex _BulletHellRegex = new Regex(@"bullet_hell_(.*)");

    public bool IsBulletHell
    {
        get
        {
            if (_Kind != StoryStepKind.Marker)
            {
                return false;
            }
            return _BulletHellRegex.IsMatch(_Marker);
        }
    }

    public string BulletHellName
    {
        get
        {
            if (!IsBulletHell)
            {
                throw new Exception("Trying to access bullet hell name when the step is not a bullet hell");
            }
            return _BulletHellRegex.Match(_Marker).Groups[1].Value;
        }
    }

    public StoryStep(string text, List<string> tags)
    {
        if (text.Length >= 2 && text[0] == '$' && text[^1] == '$')
        {
            _Kind = StoryStepKind.Marker;
            _Marker = text[1..^1];
            _Text = null;
        }
        else
        {
            _Kind = StoryStepKind.Text;
            _Marker = null;
            _Text = text;
        }
        _Choices = null;
        _ShowStreet = false;
        _ShowPeople = false;
        _IsTitle = false;
        _AlmostThere = false;
        _Completion = -1;
        ReadTags(tags);
    }

    public StoryStep(string text, Choice[] choices, List<string> tags)
    {
        _Kind = StoryStepKind.Choice;
        _Marker = null;
        _Text = text;
        _Choices = choices;
        _ShowStreet = false;
        _ShowPeople = false;
        _IsTitle = false;
        _AlmostThere = false;
        _Completion = -1;
        ReadTags(tags);
    }

    private void ReadTags(List<string> tags)
    {
        _ShowStreet = tags.IndexOf("street") >= 0;
        _ShowPeople = tags.IndexOf("people") >= 0;
        _IsTitle = tags.IndexOf("title") >= 0;
        _AlmostThere = tags.IndexOf("almost_there") >= 0;

        var completionTags = tags.Select(tag => _CompletionRegex.Match(tag)).Where(match => match.Success).ToList();
        if (completionTags.Count > 0)
        {
            if (completionTags.Count > 1)
            {
                throw new Exception("Multiple completion tags");
            }
            _Completion = int.Parse(completionTags[0].Groups[1].Value);
        }
        else
        {
            _Completion = -1;
        }
    }

    public bool Equals(StoryStep other)
    {
        return _Kind == other._Kind && (
            _Kind == StoryStepKind.End ||
            (_Kind == StoryStepKind.Marker && _Marker == other._Marker) ||
            (_Kind == StoryStepKind.Text && _Text == other._Text)
        );
    }

    public override string ToString()
    {
        return _Kind switch
        {
            StoryStepKind.End => "[end]",
            StoryStepKind.Marker => $"[marker: {_Marker}]",
            StoryStepKind.Text => $"[text: {_Text}]",
            StoryStepKind.Choice => $"[choice: {String.Join(", ", (from choice in _Choices select choice.Text))}]",
            _ => "[unknown StoryStep!]",
        };
    }

    public override int GetHashCode()
    {
        return _Kind.GetHashCode() ^ (_Marker == null ? _Text.GetHashCode() : _Marker.GetHashCode());
    }
}
