#
# Create placeholder markup for progressively enhanced embeds
#
# This plugin takes a YouTube/Vimeo/Flickr URL and generates placeholder markup
# that can progressively enhance link and replace it with an embed.
# 
# Usage: {% embed https://www.youtube.com/watch?v=AIzbwV7on6Q %}
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

      # Parse URL into its constituent parts - host, port, query string…
      @uri = URI(url)
      @host = @uri.host
      @path = @uri.path
      @query = @uri.query

      def embedCode(embed_type, embed_url, embed_action)
        %|<p class="embed embed--#{embed_type}" data-src="#{embed_url}"><a href="#{@uri}">#{embed_action}</a></p>|
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
        html = embedCode("map", "#{@uri}", "View map on Mapbox")
        return html
 
      elsif
        print "#{@uri} does not support embedding\n"

      end
    end
  end
end

Liquid::Template.register_tag('embed', Jekyll::EmbedTag)