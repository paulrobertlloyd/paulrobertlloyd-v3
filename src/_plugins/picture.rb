# Title: Jekyll Picture Tag
# Authors: Rob Wierzbowski : @robwierzbowski
#          Justin Reese    : @justinxreese
#          Welch Canavan   : @xiwcx
#
# Description: Easy responsive images for Jekyll.
#
# Download: https://github.com/robwierzbowski/jekyll-picture-tag
# Documentation: https://github.com/robwierzbowski/jekyll-picture-tag/readme.md
# Issues: https://github.com/robwierzbowski/jekyll-picture-tag/issues
#
# Syntax:  {% picture [preset] path/to/img.jpg [source_key: path/to/alt-img.jpg] [attr="value"] %}
# Example: {% picture poster.jpg alt="The strange case of responsive images" %}
#          {% picture gallery poster.jpg source_small: poster_closeup.jpg
#             alt="The strange case of responsive images" class="gal-img" data-selected %}
#
# See the documentation for full configuration and usage instructions.

require 'fileutils'
require 'pathname'
require 'ruby-thumbor'

module Jekyll
  class PictureTag < Liquid::Tag

    def initialize(tag_name, markup, tokens)
      @markup = markup
      super
    end


    def render(context)
      # Render any liquid variables in tag arguments and unescape template code
      render_markup = Liquid::Template.parse(@markup).render(context).gsub(/\\\{\\\{|\\\{\\%/, '\{\{' => '{{', '\{\%' => '{%')

      # Gather settings
      @site = context.registers[:site]
      @settings = @site.config['picture']
      markup = /^(?:(?<preset>[^\s.:\/]+)\s+)?(?<image_src>[^\s]+\.[a-zA-Z0-9]{3,4}?[^\s:\/]*)\s*(?<source_src>(?:(source_[^\s.:\/]+:\s+[^\s]+\.[a-zA-Z0-9]{3,4}?[^\s:\/]*)\s*)+)?(?<html_attr>[\s\S]+)?$/.match(render_markup)
      preset = @settings['presets'][markup[:preset]] || @settings['presets']['default']

      raise "Picture Tag can't read this tag. Try {% picture [preset] path/to/img.jpg [source_key: path/to/alt-img.jpg] [attr=\"value\"] %}." unless markup

      # Assign defaults
      @settings['markup'] ||= 'picturefill'
      @settings['quality'] ||= '80'

      # Assign defaults for image generation
      if !@settings['generate'].nil?
        @settings['generate']['source'] ||= '.'
        @settings['generate']['output'] ||= 'generated'

        # Prevent Jekyll from erasing our generated files
        @site.config['keep_files'] << @settings['generate']['output'] unless @site.config['keep_files'].include?(@settings['generate']['output'])
      end

      # Deep copy preset for single instance manipulation
      instance = Marshal.load(Marshal.dump(preset))

      # Process alternate source images
      source_src = if markup[:source_src]
        Hash[ *markup[:source_src].gsub(/:/, '').split ]
      else
        {}
      end

      # Process html attributes
      html_attr = if markup[:html_attr]
        Hash[ *markup[:html_attr].scan(/(?<attr>[^\s="]+)(?:="(?<value>[^"]+)")?\s?/).flatten ]
      else
        {}
      end

      if instance['attr']
        html_attr = instance.delete('attr').merge(html_attr)
      end

      if @settings['markup'] == 'picturefill'
        html_attr['data-picture'] = nil
        html_attr['data-alt'] = html_attr.delete('alt')
      end

      html_attr_string = html_attr.inject('') { |string, attrs|
        if attrs[1]
          string << "#{attrs[0]}=\"#{attrs[1]}\" "
        else
          string << "#{attrs[0]} "
        end
      }

      # Switch width and height keys to the symbols generate_image() expects
      # Get quality or use default setting
      instance.each { |key, source|
        raise "Preset #{key} is missing a width or a height" if !source['width'] and !source['height']
        instance[key][:width] = instance[key].delete('width') if source['width']
        instance[key][:height] = instance[key].delete('height') if source['height']
        instance[key][:quality] =  source['quality'] || @settings['quality']
      }

      # Store keys in an array for ordering the instance sources
      source_keys = instance.keys

      # Get file extension
      source_ext = File.extname(markup[:image_src])

      # Used to escape markdown parsing rendering below
      markdown_escape = "\ "

      # Raise some exceptions before we start expensive processing
      raise "Picture Tag can't find the \"#{markup[:preset]}\" preset. Check picture: presets in _config.yml for a list of presets." unless preset
      raise "Picture Tag can't find this preset source. Check picture: presets: #{markup[:preset]} in _config.yml for a list of sources." unless (source_src.keys - source_keys).empty?

      # Process instance and add image paths for each source
      instance.each_key { |key|
        instance[key][:src] = source_src[key] || markup[:image_src]
      }

      # Generate path to resized image
      instance.each { |key, source|
        if !@settings['generate'].nil?
          instance[key][:generated_src] = generate_image(source, @site.source, @site.dest, @settings['generate']['source'], @settings['generate']['output'], @site.config['baseurl'])
        else
          instance[key][:generated_src] = generate_path(source)
        end
      }

      # Construct and return tag
      if @settings['markup'] == 'picture'
        source_tags = ''
        source_keys.each { |source|
          media = " media=\"#{instance[source]['media']}\"" unless source == 'source_default'
          source_tags += "#{markdown_escape * 2}<source srcset=\"#{instance[source][:generated_src]}\"#{media}>\n"
        }

        picture_tag = "<picture>\n"\
                      "#{markdown_escape * 2}#{source_tags}"\
                      "#{markdown_escape * 2}<img src=\"#{instance['source_default'][:generated_src]}\" #{html_attr_string}>\n"\
                      "</picture>\n"

      elsif @settings['markup'] == 'img'
        unless source_ext == ".svg"
          source_tags = ''
          source_keys.each { |source|
            source_tags += "#{instance[source][:generated_src]} #{instance[source][:width]}w,"
          }

          picture_tag = "<img src=\"#{instance['source_default'][:generated_src]}\" srcset=\"#{source_tags}\" #{html_attr_string}/>"
        else
          picture_tag = "<img src=\"#{instance['source_default'][:generated_src]}\" #{html_attr_string}/>"
        end
      end

      picture_tag
    end


    def generate_path(instance)
      img = instance[:src]
      img_ext = File.extname(instance[:src])
      img_width = instance[:width]
      img_height = instance[:height]
      img_quality = instance[:quality]
      img_crypto = Thumbor::CryptoURL.new @settings['key']

      if img_ext == ".svg"
        path = "#{@settings['source']}/"

        Pathname.new(File.join(path, img))
        # => /path/to/image.jpg
      else
        if @settings['key']
          img_file_path = @site.config['url'] + @settings['source'] + img
          img_crypto_path = img_crypto.generate :width => img_width, :height => img_height, :smart => true, :filters => ["quality(#{img_quality})"], :image => img_file_path
          # => /[hmap]/[width]x[height]/smart/[filter]/path/to/image.jpg

          path = "#{@settings['cdn']}"

          Pathname.new(File.join(path, img_crypto_path))
          # => https://cdn.tld/[hmac]/[width]x[height]/[quality]/[PATH/TO/IMAGE]/
        else
          path = "#{@settings['cdn']}/#{img_width}x#{img_height}/#{img_quality}q/"
          # path to be rewitten by nginx

          Pathname.new(File.join(path, img))
          # => https://cdn.tld/[WIDTH]x[HEIGHT]/[QUALITY]q/path/to/image.jpg
        end
      end
    end


    def generate_image(instance, site_source, site_dest, image_source, image_dest, baseurl)
      require 'digest/md5'
      require 'mini_magick'
      require 'fastimage'

      digest = Digest::MD5.hexdigest(File.read(File.join(site_source, image_source, instance[:src]))).slice!(0..5)

      img_dir = File.dirname(instance[:src])
      img_ext = File.extname(instance[:src])
      img_basename = File.basename(instance[:src], img_ext)
      img_quality = instance[:quality]

      unless img_ext == '.svg'
        img_size = FastImage.size(File.join(site_source, image_source, instance[:src]))
        orig_width = img_size[0]
        orig_height = img_size[1]
        orig_ratio = orig_width*1.0/orig_height

        gen_width = if instance[:width]
          instance[:width].to_f
        elsif instance[:height]
          orig_ratio * instance[:height].to_f
        else
          orig_width
        end

        gen_height = if instance[:height]
          instance[:height].to_f
        elsif instance[:width]
          instance[:width].to_f / orig_ratio
        else
          orig_height
        end

        gen_ratio = gen_width/gen_height

        # Don't allow upscaling. If the image is smaller than the requested dimensions, recalculate.
        if orig_width < gen_width || orig_height < gen_height
          undersize = true
          gen_width = if orig_ratio < gen_ratio then orig_width else orig_height * gen_ratio end
          gen_height = if orig_ratio > gen_ratio then orig_height else orig_width/gen_ratio end
        end

        gen_name = "#{img_basename}--#{gen_width.round}x#{gen_height.round}--#{digest}#{img_ext}"
      else

        gen_name = "#{img_basename}--#{digest}#{img_ext}"
      end

      gen_dest_dir = File.join(site_dest, image_dest, img_dir)
      gen_dest_file = File.join(gen_dest_dir, gen_name)

      # Generate resized files
      unless File.exists?(gen_dest_file)
        #  If the destination directory doesn't exist, create it
        FileUtils.mkdir_p(gen_dest_dir) unless File.exist?(gen_dest_dir)

        unless img_ext == '.svg'
          warn "Warning:".yellow + " #{instance[:src]} is smaller than the requested output file. It will be resized without upscaling." if undersize

          # Let people know their images are being generated
          puts "Generating bitmap: #{gen_name}"

          image = MiniMagick::Image.open(File.join(site_source, image_source, instance[:src]))

          # Scale, crop, adjust quality and make progressive
          image.combine_options do |i|
            i.resize "#{gen_width}x#{gen_height}^"
            i.gravity "center"
            i.crop "#{gen_width}x#{gen_height}+0+0"
            i.quality "#{img_quality}"
            i.interlace "plane"
          end

          image.write gen_dest_file
        else
          # Let people know their images are being generated
          puts "Generating vector: #{gen_name}"

          image = File.join(site_source, image_source, instance[:src])
          FileUtils.copy(image, gen_dest_file)
        end
      end

      # Return path relative to the site root for html
      Pathname.new(File.join(baseurl, image_dest, img_dir, gen_name)).cleanpath
    end

  end
end

Liquid::Template.register_tag('picture', Jekyll::PictureTag)
