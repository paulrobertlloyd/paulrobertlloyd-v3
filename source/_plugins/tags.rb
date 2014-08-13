module Jekyll
  class TagPage < Page
    def initialize(site, base, dir, data = {})
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      data['layout'] = 'tag'
      data['order'] = 'reversed';
      data['title'] = "#{data['tag']}"

      self.data = data

      process(@name)
    end
  end

  class TagPageGenerator < Generator
    safe true

    def generate(site)
      site.tags.each do |tag, posts|
        site.pages << TagPage.new(site, site.source, File.join('tags', tag.downcase.tr(' ', '_')), {'tag' => tag, 'posts' => posts})
      end
    end
  end
end