# Typographic improvements for Liquid templates (e.g. the templates used in
# Jekyll). Put this file in the `_plugins` directory of your Jekyll project,
#  and then use it like this:
#
#   {{ page.title | typeset }}

require 'typogruby'

module Jekyll
  module TypesetFilter
    def typeset(text)
      # BUG: We can't use the broader improve() method as typogruby sometimes applies itself to entire page without reason, and we don't always want to supress widows.
      Typogruby.amp(Typogruby.caps(text))
    end
  end
end

Liquid::Template.register_filter(Jekyll::TypesetFilter)