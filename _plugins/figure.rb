# http://stackoverflow.com/questions/19169849/how-to-get-markdown-processed-content-in-jekyll-tag-plugin

module Jekyll
  module Tags
    class FigureTag < Liquid::Block

      CaptionUrl = /(\S[\S\s]*)\s+(https?:\/\/\S+)\s+(.+)/i
      Caption = /(\S[\S\s]*)/

      def initialize(tag_name, markup, tokens)
        super
        @caption = nil
        if markup =~ CaptionUrl
          @caption = "\n\s\s\s\s<figcaption>#{$1}<a href='#{$2}'>#{$3}</a></figcaption>\n"
        elsif markup =~ Caption
          @caption = "\n\s\s\s\s<figcaption>#{$1}</figcaption>\n"
        end
        @markup = markup
      end

      def render(context)
        site = context.registers[:site]
        converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
        output = converter.convert(super(context))
        "<figure>#{output}#{@caption}</figure>"
      end
    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::Tags::FigureTag)