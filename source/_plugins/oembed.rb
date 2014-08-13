##
# OEmbed Liquid Tag for Jekyll
#    - source: https://gist.github.com/vanto/1455726
#    - requires: https://github.com/judofyr/ruby-oembed/
#
# Copyright 2011 Tammo van Lessen
# 
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
# 
#        http://www.apache.org/licenses/LICENSE-2.0
# 
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
##
require 'json'
require 'xmlsimple'
require 'oembed'
require 'uri'
require 'net/https'

::OEmbed::Providers.register_all()

module Jekyll
  class OEmbed < Liquid::Tag

    # def initialize(tag_name, text, tokens)
    #    super
    #    @text = text
    # end
    #
    # def render(context)
    #   # Pipe param through liquid to make additional replacements possible
    #   url = Liquid::Template.parse(@text).render context
    #
    #   # oEmbed look up
    #   # https://gist.github.com/jmoz/5358695
    #   begin
    #     result = ::OEmbed::Providers.get(url.strip!, :format => :xml)
    #     print "Embed found on ", url, "\n"
    #   rescue ::OEmbed::NotFound
    #     print "No embed found on ", url, "\n"
    #     return
    #   end
    #
    #   # Odd: slideshare uses provider-name instead of provider_name
    #   provider = result.fields['provider_name'] || result.fields['provider-name'] || 'unknown'
    #
    #   "<div class=\"embed embed--#{result.type} #{provider.downcase}\">#{result.html}</div>"
    # end
  end
end

Liquid::Template.register_tag('oembed', Jekyll::OEmbed)