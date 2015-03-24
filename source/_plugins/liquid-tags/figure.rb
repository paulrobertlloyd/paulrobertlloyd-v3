#
# Creates a <figure> element with optional class(es) and caption.
# TODO: Make this a (configurable) plugin
#
# USAGE
# {% figure [class(es)] ["Caption"] [attr="value"] %}
# Figure content
# {% endfigure %}
#

module Jekyll
  class FigureTag < Liquid::Block

    def initialize(tag_name, markup, tokens)
      @markup = markup
      super
    end

    def render(context)
      # Render any liquid variables in tag arguments and unescape template code
      render_markup = Liquid::Template.parse(@markup).render(context).gsub(/\\\{\\\{|\\\{\\%/, '\{\{' => '{{', '\{\%' => '{%')

      # Gather settings
      site = context.registers[:site]
      converter = site.find_converter_instance(::Jekyll::Converters::Markdown)
      markup = /^(?:(?<classes>[^".:\/]+)\s+)?(?:"(?<caption>[^"|\\"]+)"\s+)?(?<html_attr>[\s\S]+)?$/.match(render_markup)

      # Used to escape markdown parsing rendering
      markdown_escape = "\ "

      # All figures have content…
      figure_main = converter.convert(super(context)).sub(/<([\w]).*?(?:class="([\s\S]+)")?>/, "<\\1 class=\"figure__main  \\2\">")

      # …but some figures may have extra attributes
      unless markup.nil?
        # Optional class name
        classes = markup[:classes].to_s
        figure_classes = if markup[:classes]
          " #{classes}"
        end

        # Optional caption
        caption = converter.convert(markup[:caption].to_s)
        figure_caption = if markup[:caption]
          "<figcaption class=\"figure__caption\">#{caption}</figcaption>\n"
        end

        # Optional HTML attributes
        html_attr = markup[:html_attr].to_s
        figure_html_attr = if markup[:html_attr]
          " #{html_attr}"
        end
      end

      # Render <figure>
      figure_tag =  "<figure class=\"figure#{figure_classes}\"#{figure_html_attr}>\n"
      figure_tag += "#{markdown_escape * 2}#{figure_main}\n"
      figure_tag += "#{markdown_escape * 2}#{figure_caption}"
      figure_tag += "</figure>\n"
    end

  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)
