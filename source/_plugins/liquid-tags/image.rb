#
# Creates an <img> element and makes it responsive.
#
# USAGE
# {% image path preset:[preset] class:[class name], alt:['Alt text'] %}
#

module Jekyll
  class ImageTag < Liquid::Tag
    Syntax = /(#{Liquid::QuotedFragment}+)?/o

    def initialize(tag_name, markup, tokens)
      super

      if markup =~ Syntax
        @img_path = $1
        @attributes    = {}

        markup.scan(Liquid::TagAttributes) do |key, value|
        # TODO: Find preferred method for removing quotes from argument strings
          @attributes[key] = value.gsub(/^'|"/, '').gsub(/'|"$/, '')
        end
      else
        raise SyntaxError.new(options[:locale].t("errors.syntax.include".freeze))
      end
    end

    def render(context)
      site = context.registers[:site]

      img_server = site.config['img_url']
      img_path = @img_path.to_s
      img_preset = @attributes['present'].to_s
      img_class = @attributes['class'].to_s
      img_alt = @attributes['alt'].to_s

      # If src attribute contains a usable path, assign it to @img_path
      # TODO: Test if this actually works
      # TODO: Reinstate SVG behaviour
      if img_path =~ /(https?:\/\/)/
        @img_local = false
        unless defined?(@img_local)
          @img_local = true
        end
      else
        unless defined?(@img_local)
          @img_local = true
        end
      end

      if @img_local
        if img_preset and img_preset.include? "bleed"
          # TODO: Only show class and alt attributes if set
          # For now, responsive images only within figure.bleed
          source = "<img class=\"#{img_class}\"
                         src=\"#{img_server}/400w/60#{img_path}\"
                         srcset=\"#{img_server}/400w/80#{img_path} 400w,
                                  #{img_server}/800w/80#{img_path} 800w,
                                  #{img_server}/1200w/80#{img_path} 1200w\"
                         sizes=\"100vw\"
                         alt=\"#{img_alt}\"/>"
        else
          source = "<img class=\"#{img_class}\"
                         src=\"#{img_server}/400w/60#{img_path}\"
                         srcset=\"#{img_server}/400w/80#{img_path} 400w,
                                  #{img_server}/800w/80#{img_path} 800w\"
                         sizes=\"100vw\"
                         alt=\"#{img_alt}\"/>"
        end
      else
        # Image is served from a remote location
        source = "<img src=\"#{img_path}\" alt=\"#{img_alt}\"/>"
      end
    end
  end
end

Liquid::Template.register_tag('image', Jekyll::ImageTag)
