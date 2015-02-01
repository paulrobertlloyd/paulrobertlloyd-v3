#
# Takes a YouTube/Vimeo/Flickr URL and generates placeholder markup that can
# progressively enhance link and replace it with an embed.
# 
# USAGE
# {% embed https://www.youtube.com/watch?v=YOUTUBE-ID %}
#

require 'uri'
require 'cgi'

module Jekyll
  class EmbedTag < Liquid::Tag

    def initialize(name, link, tokens)
      super
      @link = link.to_s
    end

    def render(context)
      url = Liquid::Template.parse(@link).render context
      url_encoded = URI.encode(url.strip)

      # Parse URL into its constituent parts - host, port, query string…
      @uri = URI.parse(url_encoded)
      @host = @uri.host
      @path = @uri.path
      @query = @uri.query

      def embedCode(embed_type, embed_src, embed_action)
        %Q[<p class="embed" data-embed-src="#{embed_src}" data-embed-type="#{embed_type}">
            <a class="button" href="#{@url}">#{embed_action}</a>
        </p>]
      end

      if @host.to_s.include? 'youtube.com'
        youtube_id = CGI::parse(@query.to_s)["v"][0]
        html = embedCode("video", "//www.youtube.com/embed/#{youtube_id}?controls=0&#38showinfo=0&#38?rel=0&#38?modestbranding=1", "Watch video on YouTube")
        return html

      elsif @host.to_s.include? 'vimeo.com'
        vimeo_id = @path.split('/').last
        html = embedCode("video", "//player.vimeo.com/video/#{vimeo_id}", "Watch video on Vimeo")
        return html

      elsif @host.to_s.include? 'flickr.com'
        html = embedCode("photo", "#{@uri}/player/", "View photo on Flickr")
        return html

      elsif @host.to_s.include? 'mapbox.com'
        html = embedCode("map", "#{@url}", "View map on Mapbox")
        return html
 
      elsif
        print "#{@url} does not support embedding\n"
      end

    end
  end
end

Liquid::Template.register_tag('embed', Jekyll::EmbedTag)
