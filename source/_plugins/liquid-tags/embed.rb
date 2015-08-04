#
# Takes a YouTube/Vimeo/Flickr URL and generates placeholder markup that can
# progressively enhance link and replace it with an embed.
#
# We could use oEmbed more extensively, but as this calls URLs on each rebuild,
# we'd need to build a caching mechanism.
# 
# USAGE
# {% embed https://www.youtube.com/watch?v=YOUTUBE-ID %}
#

require 'cgi'
require 'oembed'
require 'uri'

module Jekyll
  class EmbedTag < Liquid::Tag

    class SpeakerDeckApi
      include Oembed::Client

      def endpoint_uri
        'http://speakerdeck.com/oembed.json'
      end
    end

    def initialize(tag_name, link, tokens)
      @link = link.to_s
      super
    end

    def render(context)
      url = Liquid::Template.parse(@link).render context
      url_cleaned = url.strip
      url_encoded = URI.encode(url_cleaned)

      # Parse URL into its constituent parts - host, port, query string…
      @uri = URI.parse(url_encoded)
      @host = @uri.host
      @path = @uri.path
      @query = @uri.query

      def embedCode(embed_type, embed_src, embed_action)
        %Q[<p class="c-embed" data-embed-src="#{embed_src}" data-embed-type="#{embed_type}">
            <a href="#{@uri}">#{embed_action}</a>
        </p>]
      end

      if @host.to_s.include? 'youtube.com'
        youtube_id = CGI::parse(@query.to_s)["v"][0]
        return embedCode("video", "//www.youtube-nocookie.com/embed/#{youtube_id}?showinfo=0&#38?rel=0&#38?modestbranding=1", "Watch video on YouTube")

      elsif @host.to_s.include? 'vimeo.com'
        vimeo_id = @path.split('/').last
        return embedCode("video", "//player.vimeo.com/video/#{vimeo_id}", "Watch video on Vimeo")

      elsif @host.to_s.include? 'flickr.com'
        return embedCode("photo", "#{url_cleaned}player/", "View photo on Flickr")

      elsif @host.to_s.include? 'mapbox.com'
        return embedCode("map", "#{url_cleaned}", "View map on Mapbox")

      elsif @host.to_s.include? 'speakerdeck.com'
        client = SpeakerDeckApi.new
        oEmbed = client.fetch("#{url_cleaned}")
        if oEmbed['html']
          html = oEmbed['html'].match(/src=["'](?<iframe_src>[^"']*)["']/)
          embed_src = html[:iframe_src]
          return embedCode("slidedeck", "#{embed_src}", "View presentation on Speaker Deck")
        else
          warn "Warning:".yellow + " #{url_cleaned} does not provide the required oEmbed feature"
        end

      elsif
        print "#{url_cleaned} does not support embedding\n"
      end

    end
  end
end

Liquid::Template.register_tag('embed', Jekyll::EmbedTag)
