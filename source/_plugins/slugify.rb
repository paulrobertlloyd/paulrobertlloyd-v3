#
# Patch Utils.slugify to use underscores in place of hypens.
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
end
