# encoding: utf-8
require 'redmine'
require_dependency 'admonition_hooks'

Redmine::Plugin.register :redmine_wiki_admonition do
  name        'Redmine Wiki Admonitions'
  author      'Grzegorz Rajchman'
  author_url  'https://github.com/mrliptontea'
  description 'Adds macros for simple admonition blocks'
  version     '0.0.1'

  RedCloth3::ALLOWED_TAGS << "div"

  Redmine::WikiFormatting::Macros.register do
    desc "Adds a `note` block\n" +
         "Usage:\n" +
         "<pre>{{note(You should note:)\n" +
         "That this is in fact a note.\n" +
         "}}</pre>\n"
    macro :note, :parse_args => false do |obj, args, text|
      body = text.present? ? text : args
      head = body != args ? args : nil
      body = textilizable(body, :object => obj, :headings => false)

      if head.present?
        head = textilizable(head)
        head.sub!(/<(p|h\d+)>/, '<h4>').sub!(/<\/(p|h\d+)>/, '</h4>')
        content = head + body
      else
        content = body
      end

      content_tag('div', content.html_safe, :class => "admonition note")
    end

    desc "Adds a `danger` block\n" +
         "Usage:\n" +
         "<pre>{{danger(Beware!)\n" +
         "It's dangerous to go alone.\n" +
         "}}</pre>\n"
    macro :danger, :parse_args => false do |obj, args, text|
      body = text.present? ? text : args
      head = body != args ? args : nil
      body = textilizable(body, :object => obj, :headings => false)

      if head.present?
        head = textilizable(head)
        head.sub!(/<(p|h\d+)>/, '<h4>').sub!(/<\/(p|h\d+)>/, '</h4>')
        content = head + body
      else
        content = body
      end

      content_tag('div', content.html_safe, :class => "admonition danger")
    end

    desc "Adds a `important` block\n" +
         "Usage:\n" +
         "<pre>{{important(This is important:)\n" +
         "The two most important days in your life are the day you are born and the day you find out why.\n" +
         "}}</pre>\n"
    macro :important, :parse_args => false do |obj, args, text|
      body = text.present? ? text : args
      head = body != args ? args : nil
      body = textilizable(body, :object => obj, :headings => false)

      if head.present?
        head = textilizable(head)
        head.sub!(/<(p|h\d+)>/, '<h4>').sub!(/<\/(p|h\d+)>/, '</h4>')
        content = head + body
      else
        content = body
      end

      content_tag('div', content.html_safe, :class => "admonition important")
    end
  end
end
