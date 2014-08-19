#
# Generates archive pages for year, month, and day.
#
# An archive listing will be created for each year, month, and day that
# contains a post.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013-2014 Mark Trapp
# License:: MIT

module Jekyll
  # Generator for archive listings.
  class ArchiveGenerator < Generator
    # This generator is safe from arbitrary code execution.
    safe true

    # Generate archive pages.
    #
    # site - The site.
    #
    # Returns nothing.
    def generate(site)
      layout = site.config['archive']['layout'] || 'archive'
      if site.layouts.key? layout
        exclude_categories = site.config['archive']['exclude'] || []
        posts = site.posts.select do |post|
          (post.categories & exclude_categories).empty?
        end
        # site.pages += generate_archive_pages(site, posts, '%Y/%m/%d')
        site.pages += generate_archive_pages(site, posts, '%Y/%m')
        site.pages += generate_archive_pages(site, posts, '%Y')
      end
    end

    private

    # Generate an archive page group.
    #
    # site    - The site.
    # posts   - The Posts to include in the archive.
    # pattern - The date pattern to collate the archive on
    #
    # Returns an Array of archive Pages.
    def generate_archive_pages(site, posts, pattern)
      pages = []

      collate(posts, pattern).each do |_, collated_posts|
        pages << ArchivePage.new(site, site.source, pattern, collated_posts)
      end

      pages.each_with_index do |page, index|
        page.pager = ArchivePager.new(site, index + 1, pages, pages.size)
      end

      pages
    end

    # Collate an Array of Posts by a date pattern.
    #
    # posts - The Posts to collate
    # pattern - The date pattern to collate the Posts on
    #
    # Returns a collated Hash of Posts.
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
end

#
# An archive listing page.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013-2014 Mark Trapp
# License:: MIT
# Acknowledgements:: Inspired by the work done by nlindley and ilkka on Github:
#     https://gist.github.com/nlindley/6409459
#     https://gist.github.com/nlindley/6409441
#     https://gist.github.com/ilkka/707020
#     https://gist.github.com/ilkka/707909

module Jekyll
  # Represents an archive listing page.
  class ArchivePage < Page
    # Initalize a new ArchivePage.
    #
    # site         - The site.
    # base         - The path to the site's root
    # date_pattern - The pattern of the date the posts are collated on
    # posts        - The posts to be added to the ArchivePage.
    def initialize(site, base, date_pattern, posts)
      @site = site
      @config = site.config['archive']
      @posts = posts

      @date_pattern = date_pattern
      @base = base
      @dir = dir
      @name = 'index.html'

      process(@name)

      layout = @config['layout'] || 'archive'
      read_yaml(File.join(base, '_layouts'), "#{layout}.html")

      populate_data!
    end

    # Generate the start date of the archive.
    #
    # To determine the archive's start date, the date of the first post is
    # converted to a string using `@date_pattern`. Doing this will clear any
    # precision beyond what's specified in `@date_pattern`.
    #
    # Returns a DateTime containing the archive's start date.
    def date
      date_string = @posts.first.date.strftime(@date_pattern)
      DateTime.strptime(date_string, @date_pattern)
    end

    # Generate the ArchivePage title.
    #
    # Returns a String containing the ArchivePage title.
    def title
      tokenized_title = @config['title'] || 'Blog archive - :date'
      tokenized_title.gsub(':date', date.strftime(@date_pattern))
    end

    # Generate the ArchivePage url.
    #
    # Returns a String containing the ArchivePage url.
    def url
      base = @config['path'] || '/'
      File.join(base, date.strftime(@date_pattern), 'index.html')
    end

    # Add the ArchivePage-specific data to the regular Page data.
    #
    # Returns nothing.
    def populate_data!
      data.merge!('date' => date,
                  'title' => title,
                  'archive' => {
                    'date_pattern' => @date_pattern,
                    'posts' => @posts
                  })
    end
  end
end

#
# An archive listing pager.
#
# Adapted from Jekyll::Generators::Pagination
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2014 Mark Trapp
# License:: MIT
# Acknowledgements:: Inspired by the work done by nlindley and ilkka on Github:
#     https://gist.github.com/nlindley/6409459
#     https://gist.github.com/nlindley/6409441
#     https://gist.github.com/ilkka/707020
#     https://gist.github.com/ilkka/707909
module Jekyll
  # Represents the pager used for ArchivePages.
  class ArchivePager
    attr_reader :page, :per_page, :posts, :total_posts, :total_pages,
                :previous_page, :previous_page_path, :next_page,
                :next_page_path

    # Static: Return the pagination path of the archive page
    #
    # posts     - The Array of the archive's Posts.
    # num_page  - the pagination page number
    #
    # Returns the pagination path as a string
    def self.paginate_path(posts, num_page)
      return posts.first.url if num_page.nil?
      return nil if num_page < 1
      return nil if num_page > posts.size
      posts[num_page - 1].url
    end

    # Initialize a new Archive Pager.
    #
    # site      - the Jekyll::Site object
    # page      - The Integer page number.
    # all_posts - The Array of the archive's Posts.
    # num_pages - The Integer number of pages or nil if you'd like the number
    #             of pages calculated.
    def initialize(site, page, all_posts, num_pages = nil)
      @page = page
      @per_page = 1
      @total_pages = num_pages || all_posts.size

      if @page > @total_pages
        fail "Jekyll Archive Generator: page number can't be greater than total pages: #{@page} > #{@total_pages}"
      end

      @total_posts = all_posts.size
      @posts = all_posts
      @previous_page = @page != 1 ? @page - 1 : nil
      @previous_page_path = ArchivePager.paginate_path(all_posts, @previous_page)
      @next_page = @page != @total_pages ? @page + 1 : nil
      @next_page_path = ArchivePager.paginate_path(all_posts, @next_page)
    end

    # Convert this Pager's data to a Hash suitable for use by Liquid.
    #
    # Returns the Hash representation of this Pager.
    def to_liquid
      {
        'page' => page,
        'per_page' => per_page,
        'posts' => posts,
        'total_posts' => total_posts,
        'total_pages' => total_pages,
        'previous_page' => previous_page,
        'previous_page_path' => previous_page_path,
        'next_page' => next_page,
        'next_page_path' => next_page_path
      }
    end
  end
end
