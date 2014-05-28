# https://gist.github.com/snrbrnjna/7711441

module Jekyll
  module Generators
    class Pagination
      # Monkey patch this method to exclude some cats and tags from all standard
      # paginators
      #
      # For this to take effect, you have to define a ``exclude_home`` property in your _config.yml:
      # 
      # exclude_home:
      #   categories: [notes]
      #   tags: [hidehome]
      #
      def paginate(site, page)
        all_posts = _exclude_posts(site)
        pages = Pager.calculate_pages(all_posts, site.config['paginate'].to_i)
        (1..pages).each do |num_page|
          pager = Pager.new(site, num_page, all_posts, pages)
          if num_page > 1
            newpage = Page.new(site, site.source, page.dir, page.name)
            newpage.pager = pager
            newpage.dir = Pager.paginate_path(site, num_page)
            site.pages << newpage
          else
            page.pager = pager
          end
        end
      end
      
      def _exclude_posts site
        posts = site.site_payload['site']['posts']
        if (config=site.config['paginate_exclude'])
          cats = config['categories']; tags = config['tags']
          posts.reject! do |post|
            reject = false
            if cats.is_a?(Array)
              cats.each do |excat|
                if post.categories.include?(excat)
                  reject = true
                  break
                end
              end
            end
            if !reject && tags.is_a?(Array)
              tags.each do |extag|
                if post.tags.include?(extag)
                  reject = true
                  break
                end
              end
            end
            reject
          end
        end
        posts
      end
    end
  end
end
