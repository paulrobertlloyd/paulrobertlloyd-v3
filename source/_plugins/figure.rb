#
# Creates a <figure> element with an optional caption.
#
# Usage:
# {% figure "Optional figure caption" %}
# Content of figure
# {% endfigure %}
#

module Jekyll
  class FigureTag < Liquid::Block
    @class = nil
    @caption = nil

    # Matches {% figure class "Caption" %}
    FIGURE_CLASS_CAPTION = /(\w+)(\s+)"(.*?)"/i

    # Matches {% figure "Caption" %}
    FIGURE_CAPTION = /"(.*?)"/i

    # Matches {% figure class %}
    FIGURE_CLASS = /(\w+)/i

    def initialize(tag_name, markup, tokens)
      super
      if markup =~ FIGURE_CLASS_CAPTION
        @class = $1
        @caption = $3
      elsif markup =~ FIGURE_CAPTION
        @caption = $1
      elsif markup =~ FIGURE_CLASS
        @class = $1
      end
    end

    def render(context)
      site = context.registers[:site]

      # Render Markdown formatted content of liquid block as HTML
      converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
      output = converter.convert(super(context))

      # Render <figure> element
      if @class
        source = "<figure class=\"#{@class}\">"
      elsif
        source = "<figure>"
      end

      source += "#{output}"

      if @caption
        @caption = Kramdown::Document.new(@caption).to_html if @caption
        source += "<figcaption>#{@caption}</figcaption>\n" if @caption
      end
      source += "</figure>\n"

      return source
    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)