#
# Strips extraneous whitespace from rendered files.
#
# I modified kerotaa's original plugin to strip newlines from non HTML files
# and to make a few style changes.
#
# Derivative work:
#   Author:: Mark Trapp
#   Copyright:: Copyright (c) 2013 Mark Trapp
#   License:: MIT
#
# Original work:
#   Author:: kerotaa
#   Copyright:: Copyright (c) 2012 kerotaa
#   License:: MIT
#   URL:: https://gist.github.com/kerotaa/5788650
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

module Jekyll
  module Convertible
    def write(dest)
      path = destination(dest)
      FileUtils.mkdir_p(File.dirname(path))
      output.strip!

      newline_regexp = /^[\s\t]*(\r\n|\r|\n)/

      if File.extname(path).downcase.eql? '.html'
        # If the file is HTML, newlines within <pre> elements should not be
        #   collapsed.
        pre_regexp = /<\/?pre[^>]*>/i
        pre_list = output.scan(pre_regexp)
        blocks = output.split(pre_regexp)

        collapsed_blocks = []
        blocks.each_with_index do |block, i|
          collapsed_blocks << (i.odd? ? block : block.gsub(newline_regexp, ''))
          collapsed_blocks << pre_list[i] if pre_list.size > i
        end
        self.output = collapsed_blocks.join('')
      else
        self.output = output.gsub(newline_regexp, '')
      end

      File.open(path, 'w') { |f| f.write(output) }
    end
  end
end
