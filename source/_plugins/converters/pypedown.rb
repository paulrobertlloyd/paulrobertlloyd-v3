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
    class Pygs < Html
      def convert_codeblock(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr) || @options[:coderay_default_lang]
        code = pygmentize(el.value, lang)
        code_attr = {}
        code_attr['class'] = "language-#{lang}" if lang
        "#{' '*indent}<pre#{html_attributes(attr)}><code#{html_attributes(code_attr)}>#{code}</code></pre>\n"
      end

      def convert_codespan(el, indent)
        attr = el.attr.dup
        lang = extract_code_language!(attr) || @options[:coderay_default_lang]
        code = pygmentize(el.value, lang)
        if lang
          if attr.has_key?('class')
            attr['class'] += " language-#{lang}"
          else
            attr['class'] = "language-#{lang}"
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
class Jekyll::Converters::Markdown::Pypedown
  def initialize(config)
    require 'kramdown'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install kramdown'
    raise FatalException.new("Missing dependency: kramdown")
  end

  def convert(content)
    
    html = Kramdown::Document.new(content, {
      #:auto_ids       => @config['pypedown']['auto_ids'] || true,
      #:auto_id_prefix => @config['pypedown']['auto_id_prefix'] || h
      #:footnote_nr    => @config['pypedown']['footnote_nr'] || 1,
      #:entity_output  => @config['pypedown']['entity_output'] || ':as_char',
      #:toc_levels     => @config['pypedown']['toc_levels'] || "1..6",
      #:smart_quotes   => @config['pypedown']['smart_quotes'] || 'lsquo,rsquo,ldquo,rdquo',
      #:input          => @config['pypedown']['input'] || 'GFM'
    }).to_pygs
    return Typogruby.improve(Kramdown::Document.new(html).to_html)
  end
end
