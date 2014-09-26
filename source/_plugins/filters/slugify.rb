#
# Patch Utils.slugify to use underscore in place of hypen, and provide liquid
# filter to apply this utility to strings.
# 
# Usage:
# {% page.title | slugify %}
#

module Jekyll
  module Utils
    def slugify(string)
      unless string.nil?
        # Remove apostrophes then replace each non-alphanumeric character sequence with an underscore
        slug = string.gsub(/[']+/i, '').gsub(/[^a-z0-9]+/i, '_')
        # Remove leading/trailing underscore
        slug.gsub!(/^_|_$/i, '')
        slug.downcase
      end
    end
  end

  module SlugifyFilter
    def slugify(input)
      Utils.slugify(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::SlugifyFilter)