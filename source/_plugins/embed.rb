#
# Create placeholder markup for progressively enhanced embeds
#
# This plugin takes a YouTube/Vimeo/Flickr URL and generates placeholder markup
# that can progressively enhance link and replace it with an embed.
# 
# Usage: {% embed https://www.youtube.com/watch?v=AIzbwV7on6Q %}

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

      # Parse the query string into a hash of names and values
      @params = CGI::parse(@query.to_s)

      def embedCode(embed_url, embed_action)
        print "Embedding #{@uri}\n"

        %|<p class="embed" data-src="#{embed_url}"><a href="#{@uri}">#{embed_action}</a></p>|
      end

      if @host == 'www.youtube.com'
        html = embedCode("//www.youtube.com/embed/"+@params["v"][0]+"?controls=0&#38showinfo=0&#38?rel=0&#38?modestbranding=1", "Watch on YouTube")
        return html

      elsif @host == 'vimeo.com'
        html = embedCode("//player.vimeo.com/video/", "Watch on Vimeo") # TODO: Get Vimeo ID
        return html

      elsif @host == 'www.flickr.com'
        html = embedCode("#{@uri}/player/", "View on Flickr")
        return html
 
      elsif
        print "#{@uri} does not support embedding\n"

      end
    end
  end
end

Liquid::Template.register_tag('embed', Jekyll::EmbedTag)