#
# Liquid filter that translates plain ASCII punctuation characters into "smart" 
# typographic punctuation HTML entities.
# 
# Usage:
# {% page.title | smart %}
#

module Jekyll
  module SmartypantsFilter
    def smart(input)
      return RubyPants.new(input).to_html
    end
  end

end

Liquid::Template.register_filter(Jekyll::SmartypantsFilter)