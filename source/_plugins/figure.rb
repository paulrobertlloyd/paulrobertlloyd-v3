#
# Creates a <figure> element with an optional caption. Based on: 
# http://stackoverflow.com/questions/19169849
#
# Usage:
# {% figure "Optional figure caption" %}
# Content of figure
# {% endfigure %}
#

module Jekyll
  class FigureTag < Liquid::Block

    FIGCAPTION_URL = /(\S[\S\s]*)\s+(https?:\/\/\S+)\s+(.+)/i
    FIGCAPTION = /(\S[\S\s]*)/

    def initialize(tag_name, markup, tokens)
      super
      @figcaption = nil
      if markup =~ FIGCAPTION_URL
        @figcaption = "\n<figcaption><p>#{$1}<a href='#{$2}'>#{$3}</a></p></figcaption>\n"
      elsif markup =~ FIGCAPTION
        @figcaption = "\n<figcaption><p>#{$1}</p></figcaption>\n"
      end
      @markup = markup
    end

    def render(context)
      site = context.registers[:site]
      converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
      output = converter.convert(super(context))
      "<figure>#{output}#{@figcaption}</figure>"
    end

  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)