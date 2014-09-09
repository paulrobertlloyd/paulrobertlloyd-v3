#
# Creates a <figure> element with an optional caption. If the figure contains an image, make it responsive. Based on: 
# https://github.com/daneden/daneden.me/blob/master/_plugins/image.rb
#
# Usage:
# {% figure class "Optional caption" %}
# Figure content
# {% endfigure %}
#
# {% image class "Optional caption" %}
# ![Alternative text](/path/to/image.jpg)
# {% endimage %}
#

require 'nokogiri'

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

    # Regex to abstract path to image file
    IMAGE_PATH = /(https?:\/\/|\/)(assets\/images)([\/\w \.-]*)/i

    def initialize(tag_name, markup, tokens)
      super
      if markup =~ FIGURE_CLASS_CAPTION
        @class = ' class="'+$1+'"'
        @caption = $3
      elsif markup =~ FIGURE_CAPTION
        @caption = $1
      elsif markup =~ FIGURE_CLASS
        @class = ' class="'+$1+'"'
      end
    end

    def render(context)
      site = context.registers[:site]
      img_server = site.config['img_url']
      converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
      output = converter.convert(super(context))

      # Parse rendered HTML. abstract attributes from <img> element if exists
      html = Nokogiri::HTML(output)
      if html.css('img')[0]
        @img = html.css('img')[0]
        @img_alt = html.css('img')[0]["alt"]
        @img_src = html.css('img')[0]["src"]

        if @img_src =~ IMAGE_PATH
          @img_path = $3
          @img_name, @img_ext = @img_path.split(".")
        end

        # If src attribute contains a usable path, assign it to @img_path
        if @img_src =~ /(https?:\/\/)/
          @img_local = false
          unless defined?(@img_local)
            @img_local = true
          end
        else
          unless defined?(@img_local)
            @img_local = true
          end
        end
      end

      # Render <figure>
      source = "<figure#{@class}>"

      # If block contains an image make it responsive, else render the content
      if @img
        if @img_local
          if @img_ext != "svg"
            if @class and @class.include? "bleed"
              # For now, responsive images only within figure.bleed
              source += "<img src=\"#{img_server}/400w/100#{@img_path}\"
                            srcset=\"#{img_server}/400w/100#{@img_path} 400w, #{img_server}/800w/100#{@img_path} 800w, #{img_server}/1200w/100#{@img_path} 1200w\"
                            sizes=\"100vw\"
                            alt=\"#{@img_alt}\"/>"
            else
              # TODO: Figures with multiple images. For now, ignore
              source += "#{output}"
            end
          else
            # Image is an SVG, so natively scales
            source += "<img src=\"#{@img_src}\" alt=\"#{@img_alt}\"/>"
          end
        else
          # Image is served from a remote location
          source += "<img src=\"#{@img_src}\" alt=\"#{@img_alt}\"/>"
        end
      elsif
        source += "#{output}"
      end

      if @caption
        @caption = Kramdown::Document.new(@caption).to_html if @caption
        source += "<figcaption>#{@caption}</figcaption>" if @caption
      end
      source += "</figure>"

      return source
    end
  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)