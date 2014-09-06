#
# Takes a markdown formatted image and populates a <picture> element, 
# surrounded by a <figure> element. Based on: 
# https://github.com/daneden/daneden.me/blob/master/_plugins/image.rb
#
# Usage:
# {% picture classname %}
# ![Alternative text](/path/to/image.jpg "Optional title")
# {% endpicture %}
#

require 'nokogiri'

module Jekyll
  class PictureTag < Liquid::Block

    # Regex to abstract path to image file
    IMAGE_PATH = /(https?:\/\/|\/)(source\/assets\/images)([\/\w \.-]*)/i

    def initialize(tag_name, markup, tokens)
      super
      @class = markup.strip
    end

    def render(context)
      site = context.registers[:site]
      img_server = site.config['img_url']

      # Render Markdown formatted content of liquid block as HTML
      converter = site.getConverterImpl(::Jekyll::Converters::Markdown)
      output = converter.convert(super(context))

      # Parse rendered HTML, and abstract attributes from <img> element
      html = Nokogiri::HTML(output)
      @img_src = html.css('img')[0]["src"]
      @img_alt = html.css('img')[0]["alt"]
      @img_title = html.css('img')[0]["title"]

      # If contents of src attribute contain usable path, assign to @img_path
      if @img_src =~ IMAGE_PATH
        @img_path = $3
      end

      # Render image within <figure> element
      source = "<figure class=\"#{@class}\">"

      if @img_path =~ /(https?:\/\/)/
        @local = false
        unless defined?(@local)
          @local = true
        end
      else
        unless defined?(@local)
          @local = true
        end

        # Get file extension of image
        @img_name, @img_ext = @img_path.split(".")
      end

      if @local
        if @img_ext != "svg"
          if @class and @class.include? "bleed"
            source += "<img src=\"#{img_server}/400w/100#{@img_path}\"
                          srcset=\"#{img_server}/400w/100#{@img_path} 400w, #{img_server}/800w/100#{@img_path} 800w, #{img_server}/1200w/100#{@img_path} 1200w\"
                          sizes=\"100vw\"
                          alt=\"#{@img_alt}\"/>"
          else
            source += "<img src=\"#{img_server}/400w/100#{@img_path}\"
                          srcset=\"#{img_server}/400w/100#{@img_path} 400w, #{img_server}/800w/100#{@img_path} 800w, #{img_server}/1200w/100#{@img_path} 1200w\"
                          sizes=\"100vw\"
                          alt=\"#{@img_alt}\"/>"
          end
        else
          # Image is an SVG, so natively scales
          source += "<img src=\"#{@img_src}\" alt=\"#{@img_alt}\"/>"
        end
      else
        # Image is served from a remote location
        source += "<img src=\"#{@img_src}\" alt=\"#{@img_alt}\"/>"
      end

      @img_title = Kramdown::Document.new(@img_title).to_html if @img_title
      source += "<figcaption>#{@img_title}</figcaption>" if @img_title
      source += "</figure>"

      return source
    end
  end
end

Liquid::Template.register_tag('picture', Jekyll::PictureTag)