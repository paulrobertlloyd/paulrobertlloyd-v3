#
# Pypedown markdown processor: Pygments + Typograuby + kramdown
#
# BASED ON
# https://github.com/navarroj/krampygs
# https://github.com/mvdbos/kramdown-with-pygments
#

require 'pygments'
require 'typogruby'
require 'kramdown'

# Patch kramdown to use Pygments for syntax highlighting
module Kramdown
  module Converter

    # Subclass Html to add indent option and disable coderay
    class Html
      attr_accessor :indent

      def initialize(root, options)
        super
        @footnote_counter = @footnote_start = @options[:footnote_nr]
        @footnotes = []
        @footnotes_by_name = {}
        @footnote_location = nil
        @toc = []
        @toc_code = nil
        @indent = @options[:indent] || 2
        @stack = []
        @coderay_enabled = false
      end
    end

    # Highlight code blocks and code spans using Pygments
    class Pygs < Html
      def convert_codeblock(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr) || @options[:coderay_default_lang]
        code = pygmentize(el.value, lang)
        code_attr = {}
        code_attr['class'] = "syntax syntax--#{lang}" if lang
        "#{' '*indent}<pre#{html_attributes(attr)}><code#{html_attributes(code_attr)}>#{code}</code></pre>\n"
      end

      def convert_codespan(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr) || @options[:coderay_default_lang]
        code = pygmentize(el.value, lang)
        if lang
          if attr.has_key?('class')
            attr['class'] += " syntax syntax--#{lang}"
          else
            attr['class'] = "syntax syntax--#{lang}"
          end
        end
        "<code#{html_attributes(attr)}>#{code}</code>"
      end

      def pygmentize(code, lang)
        if lang
          Pygments.highlight(code,
            :lexer => lang,
            :options => { :encoding => 'utf-8', :nowrap => true, :startinline => true })
        else
          escape_html(code)
        end
      end
    end

  end
end

# Create a new Markdown processor that uses Pygments-flavoured kramdown
# We can only patch the converter once, so add typographic hooks with Typogruby
module Jekyll
  class Converters::Markdown::Pypedown

    def initialize(config)
      @config = config
      if @config['pypedown']
        %w[auto_ids auto_id_prefix default_lang entity_output footnote_nr smart_quotes toc_levels indent input].each do |key|
          @config['pypedown'][key] = @config['kramdown'][key] unless @config['pypedown'][key]
        end
      elsif
        @config['pypedown'] = @config['kramdown']
      end
    end

    def convert(content)
      options = Jekyll::Utils.symbolize_hash_keys(@config["pypedown"])
      html = Kramdown::Document.new(content, options).to_pygs

      return Typogruby.improve(html)
    end

  end
end
