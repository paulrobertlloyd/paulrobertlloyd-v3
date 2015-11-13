#  By Aaron Gustafson, based on the work of Jeremy Keith
#  https://github.com/aarongustafson/jekyll-crosspost_to_medium
#  https://gist.github.com/adactio/c174a4a68498e30babfd
#  Licence : MIT
#
#  This generator cross-posts entries to Medium. To work, this script requires
#  a MEDIUM_USER_ID environment variable and a MEDIUM_INTEGRATION_TOKEN.
#
#  The generator will only pick up posts with the following front matter:
#
#  `crosspost_to_medium: true`
#
#  You can control crossposting globally by setting `enabled: true` under the 
#  `jekyll-crosspost_to_medium` variable in your Jekyll configuration file.
#  Setting it to false will skip the processing loop entirely which can be
#  useful for local preview builds.

require 'json'
require 'net/http'
require 'net/https'
require 'kramdown'
require 'uri'

module Jekyll
  class MediumCrossPostGenerator < Generator
    safe true
    priority :low

    def generate(site)
      @settings = site.config['jekyll-crosspost_to_medium']

      @medium_cache_dir = @settings['cache'] || site.config['source'] + '/.jekyll-crosspost_to_medium'
      FileUtils.mkdir_p(@medium_cache_dir)

      # Should we allow this to run?
      globally_enabled = true

      if site.config.has_key? 'jekyll-crosspost_to_medium'
        globally_enabled = @settings['enabled']
      end

      if globally_enabled
        user_id = ENV['MEDIUM_USER_ID'] or false
        token = ENV['MEDIUM_INTEGRATION_TOKEN'] or false

        if ! user_id or ! token
          raise ArgumentError, "MediumCrossPostGenerator: Environment variables not found"
          return
        end

        if defined?(@medium_cache_dir)

          crossposted_file = File.join(@medium_cache_dir, "medium_crossposted.yml")

          if File.exists?(crossposted_file)
            crossposted = open(crossposted_file) { |f| YAML.load(f) }
          else
            crossposted = []
          end

          # If Jekyll 3.0, use hooks (which does a lot of the work for us)
          if (Jekyll.const_defined? :Hooks)

            Jekyll::Hooks.register :posts, :post_render do |post|
              if ! post.published?
                next
              end

              crosspost = post.data.include? 'crosspost_to_medium'
              if ! crosspost or ! post.data['crosspost_to_medium']
                next
              end

              url = "#{site.config['url']}#{post.url}"
              content = post.content

              crosspost_payload(crossposted, post, content, post.data['title'], url)
            end

          else

            site.posts do |post|
              if ! post.published?
                next
              end

              crosspost = post.data.include? 'crosspost_to_medium'
              if ! crosspost or ! post.data['crosspost_to_medium']
                next
              end

              url = "#{site.config['url']}#{post.url}"
              content = post.content
              content = Kramdown::Document.new(content).to_html

              crosspost_payload(crossposted, post, content, post.title, url)
            end # @posts.each
          end # :Hooks?

          # Save it back
          File.open(crossposted_file, 'w') { |f| YAML.dump(crossposted, f) }
        end
      end
    end

    def crosspost_payload(crossposted, post, content, title, url)
      # Prepend the title and add a link back to the originating site
      content.prepend("<h1>#{title}</h1>")
      content << "<p><i>This was originally posted <a href=\"#{url}\" rel=\"canonical\">on my own site</a>.</i></p>"

      # Only cross-post if content has not already been cross-posted
      if url and ! crossposted.include? url
        payload = {
          'title'         => title,
          'contentFormat' => "html",
          'content'       => content,
          'tags'          => post.data['tags'],
          'publishStatus' => @settings['status'] || "publish",
          'license'       => @settings['license'] || "all-rights-reserved",
          'canonicalUrl'  => url
        }

        puts payload

        crosspost_to_medium(payload)
        crossposted << url
      end
    end

    def crosspost_to_medium( payload )
      puts "Cross-posting “#{payload['title']}” to Medium"

      user_id = ENV['MEDIUM_USER_ID'] or false
      token = ENV['MEDIUM_INTEGRATION_TOKEN'] or false
      medium_api = URI.parse("https://api.medium.com/v1/users/#{user_id}/posts")

      # Build the connection
      https = Net::HTTP.new(medium_api.host, medium_api.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(medium_api.path)

      # Set the headers
      request['Authorization'] = "Bearer #{token}"
      request['Content-Type'] = "application/json"
      request['Accept'] = "application/json"
      request['Accept-Charset'] = "utf-8"

      # Set the payload
      request.body = JSON.generate(payload)

      # Post it
      response = https.request(request)
    end

  end
end
