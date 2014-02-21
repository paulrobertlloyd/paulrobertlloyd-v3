# https://github.com/mmorearty/liquid-smartypants
#
# Smart quotes for Liquid templates (e.g. the templates used in Jekyll).  Put
# this file in the `_plugins` directory of your Jekyll project, and then use it
# like this:
#
#     {{ page.title | smart }}

require 'liquid'
require 'redcarpet'

module LiquidSmarty
  def smart(input)
    Redcarpet::Render::SmartyPants.render(input)
  end
end

Liquid::Template.register_filter LiquidSmarty
