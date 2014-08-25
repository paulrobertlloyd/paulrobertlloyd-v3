require 'japr'
require 'myth'
require 'yui/compressor'

module JAPR

  # Use Myth to pre-process CSS
  class CssConverter < JAPR::Converter
    def self.filetype
      '.myth'
    end

    def convert
      return Myth.preprocess(@content)
    end
  end


  # Use YUI Compressor to minify CSS
  class CssCompressor < JAPR::Compressor
    def self.filetype
      '.css'
    end

    def compress
      return YUI::CssCompressor.new.compress(@content)
    end
  end


  # Format link element
  class CssTagTemplate < JAPR::Template
    def self.filetype
      '.css'
    end

    def html
"<link rel=\"stylesheet\" href=\"/#{@path}/#{@filename}\"/>\n"
    end
  end


  # Use YUI Compressor to minify JavaScript
  class JavaScriptCompressor < JAPR::Compressor
    def self.filetype
      '.js'
    end

    def compress
      return YUI::JavaScriptCompressor.new(munge: true).compress(@content)
    end
  end


  # Format script element
  class JavaScriptTagTemplate < JAPR::Template
    def self.filetype
      '.js'
    end

    def html
"<script>
    if (enhanced) {
        document.write('<'+'script src=\"/#{@path}/#{@filename}\"></'+'script>');
    }
</script>"
    end
  end

end
