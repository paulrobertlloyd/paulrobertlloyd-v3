#
# An EXIF plugin for Jekyll
# 
# USAGE
# <h1>{% img.url | exif: [property] %}</h1>
#

require 'exifr'

module Jekyll
  module ExifFilter
    def exif(url, property)
      source = @context.registers[:site].config['source']

      if File.exist?(url)
        file_name = url
      else
        file_name = File.join(source, url)
      end

      exif = EXIFR::JPEG::new(file_name)

      return property.split('.').inject(exif){|o,m| o.send(m)}
    end
  end
end

Liquid::Template.register_filter(Jekyll::ExifFilter)
