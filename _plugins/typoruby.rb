# http://bloerg.net/2013/03/03/typographic-improvements-for-jekyll.html
require 'typogruby'
 
module Jekyll
  class MarkdownConverter < Jekyll::Converter
    def matches(ext)
      ext =~ /^\.markdown$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      return Typogruby.improve(Kramdown::Document.new(content).to_html)
    end
  end
end