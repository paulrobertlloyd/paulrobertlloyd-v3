#
# Typographic improvements for Liquid templates (e.g. the templates used in
# Jekyll). Put this file in the `_plugins` directory of your Jekyll project,
#  and then use it like this:
#
#   {{ page.title | typeset }}

require 'typogruby'

module Jekyll
  module TypesetFilter
    def typeset(input)
      Typogruby.amp(input)
      Typogruby.caps(input)
      Typogruby.entities(input)
      Typogruby.smartypants(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::TypesetFilter)
