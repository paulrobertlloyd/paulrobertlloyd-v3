#
# Better typography for Jekyll
# 
# USAGE
# <h1>{{ content | typogrify }}</h1>
#

require 'typogruby'

module Jekyll
  module TypogrifyFilter

    def typogrify(input)
      return Typogruby.improve(input)
    end

  end
end

Liquid::Template.register_filter(Jekyll::TypogrifyFilter)
