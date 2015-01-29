#
# Creates a <figure> element with optional class(es) and caption.
#
# USAGE
# {% figure class:[class name], caption:['Caption'] %}
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
      markup = /^(?:(?<preset>[^".:\/]+)\s+)?"(?<caption>[^"|\\"]*)"?\s(?<html_attr>[\s\S]+)?$/.match(render_markup)

      # used to escape markdown parsing rendering below
      markdown_escape = "\ "

      puts "Markup  " + markup.to_s + "\n"
      if markup[:preset] != nil
        puts "Preset  " + markup[:preset].to_s + "\n"
      end
      puts "Content " + converter.convert(super(context))
      if markup[:caption]
        puts "Caption " + markup[:caption].to_s + "\n"
      end
      if markup[:html_attr]
        puts "Attr    " + markup[:html_attr].to_s + "\n"
      end
      puts "---\n"

      figure_preset = markup[:preset]
      figure_main = converter.convert(super(context))
      figure_caption = converter.convert(markup[:caption])

      # Render <figure>
      # if markup[:preset]
      #   source = "<figure class=\"figure figure--#{figure_preset}\">"
      # else
      #   source = "<figure class=\"figure\">"
      # end
      #
      # source += "<div class=\"figure__main\">#{figure_main}</div>"
      #
      # if markup[:caption]
      #   source += "<figcaption class=\"figure__caption\">#{figure_caption}</figcaption>"
      #   source += "</figure>"
      # else
      #   source += "</figure>"
      # end
    end

  end
end

Liquid::Template.register_tag('figure', Jekyll::FigureTag)
