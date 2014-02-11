# Author: Stefan Imhoff
#
# Surrounds all occurrence of an acronym/abbreviation with `<abbr>` tags
# plus a title. The title is taken from a YAML file.
#
# It only matches full word abbreviations, so no matches for spaces,
# dots ... (e.g. will not work as abbreviation). It won’t replace
# abbreviations in attributes or already surrounded by an abbreviation.
#
# If you have abbreviations with multiple meanings add `#` plus a number to
# differentiate (DSL#1, DSL#2). During rendering this will be cut of.
#
# For more examples how this works look into abbreviation.yml.
#
# And as always: with REGEX – there might be some edge cases where
# it won’t work
#
# Usage: <div class="entry-content">{{ content | abbr }}</div>
# Input (example): HTML
# Output (example): <abbr title="Hypertext Markup Language">HTML</abbr>
#
require 'yaml'

module Jekyll
  module AbbreviationFilter
    def abbr(input)
      plugin_root = File.dirname(__FILE__)
      abbr_dict = YAML.load(File.open(File.join(plugin_root, "abbreviation.yml")))
      abbr_dict.each do |abbr, title|
        input.gsub! /\b#{abbr}\b(?![^">]+">|<\/abbr>|">)/, "<abbr title=\"#{title}\">#{abbr[/[A-Za-z0-9\.\s\;\&]+/]}</abbr>"
      end
      input
    end
  end
end

Liquid::Template.register_filter(Jekyll::AbbreviationFilter)
