# Author: Stefan Imhoff
#
# Replaces all occurrence of '&' or '&amp;' surrounded by spaces.
# It will replace 'Peter & Paul', but not 'Peter&Paul'. It will not
# replace any '&' or '&amp;' in attributes.
#
# Usage: <div class="entry-content">{{ content | ampersand }}</div>
#
# Outputs a string like this:
#
# Peter&thinsp;<span class="amp">&amp;</span>&thinsp;Paul
#
module Jekyll
  module AmpersandFilter
    def ampersand(input)
      input.gsub /\s+(&amp;|&)\s+(?![^">]+"(>|\s+))/, '&thinsp;<span class="amp">&amp;</span>&thinsp;'
    end
  end
end

Liquid::Template.register_filter(Jekyll::AmpersandFilter)
