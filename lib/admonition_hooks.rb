require 'redmine'

class WikiAdmonitionApplicationHooks < Redmine::Hook::ViewListener
  def view_layouts_base_html_head(context = {})
    return stylesheet_link_tag("wiki_admonition.css", :plugin => "redmine_wiki_admonition", :media => "all")
  end
end
