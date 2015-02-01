# Redmine wiki admonition

Adds macros for simple admonition blocks for Redmine's wiki.

## Installation

Just put `redmine_wiki_admonition` folder into your Redmine's `plugins` folder and restart Redmine.

## Available types and usage

* `note` - for friendly tips, hints etc.
    Usage:

        {{note(You should note:)
        That this is in fact a note.
        }}

* `danger` - for pointing out a potential danger
    Usage:

        {{danger(Beware!)
        It's dangerous to go alone.
        }}

* `important` - for things that require some extra caution
    Usage:

        {{important(This is important:)
        The two most important days in your life are
        the day you are born and the day you find out why.
        }}

## License

[WTFPL](http://www.wtfpl.net/)
