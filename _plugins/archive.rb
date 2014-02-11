#
# Generates archive pages for year, month, and day.
#
# An archive listing will be created for each year and month that contains
# a post.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013 Mark Trapp
# License:: MIT
# Acknowledgements:: Inspired by the work done by nlindley and ilkka on Github:
#     https://gist.github.com/nlindley/6409459
#     https://gist.github.com/nlindley/6409441
#     https://gist.github.com/ilkka/707020
#     https://gist.github.com/ilkka/707909

module Jekyll
  class ArchiveGenerator < Generator
    safe true

    def generate(site)
      layout = site.config['archive']['layout'] || 'archive'
      if site.layouts.key? layout
        exclude_categories = site.config['archive']['exclude'] || []
        posts = site.posts.select do |post|
          (post.categories & exclude_categories).empty?
        end
        site.pages += generate_archive_pages(site, posts, '%Y/%m')
        site.pages += generate_archive_pages(site, posts, '%Y')
      end
    end

    private

    def generate_archive_pages(site, posts, pattern)
      pages = []
      collate(posts, pattern).each do |_, collated_posts|
        pages << ArchivePage.new(site, site.source, pattern, collated_posts)
      end
      pages
    end

    def collate(posts, pattern)
      collated = {}
      posts.each do |post|
        key = post.date.strftime(pattern)
        collated[key] ||= []
        collated[key] << post
      end
      collated
    end
  end

  # Represents an archive listing page.
  class ArchivePage < Page
    def initialize(site, base, pattern, posts)
      @site = site
      @base = base
      @dir = posts.first.date.strftime(pattern)
      @name = 'index.html'
      @config = site.config['archive']

      process(@name)

      layout = @config['layout'] || 'archive'
      read_yaml(File.join(base, '_layouts'), "#{layout}.html")

      data['posts'] = posts
      data['date'] = {
        'value' => posts.first.date,
        'pattern' => pattern,
      }
      data['title'] = title
    end

    def url
      base = site.config['archive']['path'] || '/'
      File.join(base, @dir, 'index.html')
    end

    def title
      tokenized_title = @config['title'] || 'Blog archive - :date'
      date = data['date']['value']
      pattern = data['date']['pattern']
      tokenized_title.gsub(':date', date.strftime(pattern))
    end

    def to_liquid
      data.deep_merge('url' => url, 'content' => content)
    end
  end
end
