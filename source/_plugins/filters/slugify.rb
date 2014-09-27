#
# Converts a string to its URL-friendly, slug form.
# 
# USAGE
# <a href="{% page.url | slugify %}">Link</a>
#

module Jekyll
  module SlugifyFilter
    def slugify(input)
      Utils.slugify(input)
    end
  end
end

Liquid::Template.register_filter(Jekyll::SlugifyFilter)