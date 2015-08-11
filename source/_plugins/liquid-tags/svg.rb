module Jekyll
  class SvgInclude < Liquid::Tag
    def initialize(tag_name, path, tokens)
      super
      @path = path
    end

    def render(context)
      path = Liquid::Template.parse(@path).render context
      source_dir = context.registers[:site].source

      "#{File.read(source_dir + '/assets/_vectors/' + path.strip + '.svg')}"
    end
  end
end

Liquid::Template.register_tag('svg', Jekyll::SvgInclude)
