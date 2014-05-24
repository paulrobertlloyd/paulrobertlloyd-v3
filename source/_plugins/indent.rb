#
# Provides a Liquid filter for indenting content.
#
# Indents the contents of a tag by a specified number of spaces. Accounts for
# <pre> elements in HTML, which should not have their indentation altered.
#
# Author:: Mark Trapp
# Copyright: Copyright (c) 2013 Mark Trapp
# License:: MIT
# Acknowledgements::
#   - Inspired by the example provided by Mike Fulcher:
#     http://drawingablank.me/blog/indentation-for-injected-jekyll-content.html
#   - <pre> element handling inspired by kerotaa's newline collapsing plugin:
#     https://gist.github.com/kerotaa/5788650
#     See also collapse_newlines.rb

module Jekyll
  module Itafroma
    module IndentFilter
      def indent(content, indent = 0)
        output = []

        pre_regexp = /<\/?pre[^>]*>/i
        pre_list = content.scan(pre_regexp)
        blocks = content.split(pre_regexp)

        blocks.each_with_index do |block, i|
          if i.odd?
            output << block
          else
            # The first line should already be indented.
            output << block.lines.first
            block.lines.to_a[1..-1].each do |line|
              output << (' ' * indent.to_i) + line
            end
          end
          output << pre_list[i] if pre_list.size > i
        end
        output.join('')
      end
    end
  end
end

Liquid::Template.register_filter(Jekyll::Itafroma::IndentFilter)