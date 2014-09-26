require 'typogruby'
require 'kramdown'

module Jekyll
  module Converters
    class Markdown < Converter
      def convert(content)
        # BUG: We can't use the broader improve() method as typogruby applies itself to the entire page, and we don't always want to supress widows
        return Typogruby.amp(Typogruby.caps(Typogruby.smartypants(Kramdown::Document.new(content).to_html)))
      end
    end
  end
end
