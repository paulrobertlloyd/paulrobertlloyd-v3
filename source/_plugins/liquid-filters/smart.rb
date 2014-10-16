#
# A smartypants plugin for Jekyll
# 
# USAGE
# <h1>{% page.title | smart %}</h1>
#

require 'typogruby'

module Jekyll
  module SmartypantsFilter
    def smart(input)
      return RubyPants.new(input).to_html
    end
  end
end

Liquid::Template.register_filter(Jekyll::SmartypantsFilter)