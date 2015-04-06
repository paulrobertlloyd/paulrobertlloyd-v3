#
# Patch Utils.slugify to use underscores in place of hypens.
# TODO: Make this a (configurable) plugin
# https://github.com/jekyll/jekyll-help/issues/254
#

module Jekyll
  module Utils
    # Slugify a filename or title.
    #
    # string - the filename or title to slugify
    # mode - how string is slugified
    #
    # When mode is "none", return the given string in lowercase.
    #
    # When mode is "raw", return the given string in lowercase,
    # with every sequence of spaces characters replaced with a hyphen.
    #
    # When mode is "default" or nil, non-alphabetic characters are
    # replaced with a hyphen too.
    #
    # When mode is "pretty", some non-alphabetic characters (._~!$&'()+,;=@)
    # are not replaced with hyphen.
    #
    # Examples:
    #   slugify("The _config.yml file")
    #   # => "the-config-yml-file"
    #
    #   slugify("The _config.yml file", "pretty")
    #   # => "the-_config.yml-file"
    #
    # Returns the slugified string.
    def slugify(string, mode=nil)
      mode ||= 'default'
      return nil if string.nil?
      return string.downcase unless SLUGIFY_MODES.include?(mode)

      # Replace each character sequence with a hyphen
      re = case mode
      when 'raw'
        SLUGIFY_RAW_REGEXP
      when 'default'
        SLUGIFY_DEFAULT_REGEXP
      when 'pretty'
        # "._~!$&'()+,;=@" is human readable (not URI-escaped) in URL
        # and is allowed in both extN and NTFS.
        SLUGIFY_PRETTY_REGEXP
      end

      string.
        # Strip according to the mode
        gsub(re, '_').
        # Remove leading/trailing hyphen
        gsub(/^\-|\-$/i, '').
        # Downcase
        downcase
    end

  end
end
