# USAGE
# {% loop_directory directory:images iterator:image filter:*.jpg sort:descending %}
#   <img src="{{ image }}" />
# {% endloop_directory %}
#
# inspired by
# - https://gist.github.com/jgatjens/8925165
# - http://simon.heimlicher.com/articles/2012/02/01/jekyll-directory-listing
# - https://github.com/dpb587/dpb587.me/blob/master/_plugins/loopdir.rb

module Jekyll
  class Loopdir < Liquid::Block
    include Liquid::StandardFilters
    Syntax = /(#{Liquid::QuotedFragment}+)?/
 
    def initialize(tag_name, markup, tokens)
      @attributes = {}
 
      @attributes['path'] = nil;
      @attributes['parse'] = 'true';
      @attributes['match'] = '*';
      @attributes['sort'] = 'path';
 
      markup.scan(Liquid::TagAttributes) do | key, value |
        if 'path' == key
          # path can be dynamic to support includes
          @attributes['path'] = Liquid::Variable.new(value)
        else
          @attributes[key] = value.gsub /"(.*)"/, '\1'
        end
      end

      if @attributes['path'].nil?
        raise SyntaxError.new("The `path` attribute is missing for `loopdir` tag.")
      end

      if 'true' == @attributes['parse']
        @attributes['parse'] = true
      else
        @attributes['parse'] = false
      end
 
      super
    end
 
    def render(context)
      context.registers[:loopdir] ||= Hash.new(0)
 
      items = []

      path = @attributes['path'].render(context)
 
      Dir.glob(File.join(path, @attributes['match'])).each do |pathname|
        if @attributes['parse']
          item = {}

          content = File.read(pathname)

          if content =~ /^(---\s*\n.*?\n?)^(---\s*$\n?)/m
            content = $POSTMATCH

            begin
              item = YAML.load($1)
            rescue => e
              puts "YAML Exception reading #{name}: #{e.message}"
            end
          end

          item['content'] = content
        else
          context['item'] = pathname
        end

        item['name'] = File.basename(pathname, @attributes['match'].sub('*', ''))
        item['fullname'] = path + '/' + item['name']
        item['path'] = pathname

        items.push item
      end

      sortby = @attributes['sort'].gsub(/^-/, '')

      items.sort! do | x, y |
        x[sortby] <=> y[sortby]
      end

      if sortby != @attributes['sort']
        items.reverse!
      end

      context.stack do
        result = []

        items.each do | item |
          context['item'] = item

          result << render_all(@nodelist, context)
        end

        result
      end
    end
  end
end
 
Liquid::Template.register_tag('loopdir', Jekyll::Loopdir)