#
# Namespace CSS
# http://csswizardry.com/2015/03/more-transparent-ui-code-with-namespaces/
# 
# USAGE
# <h1>{{ content | namespace }}</h1>
#

module Jekyll
  module NamespaceFilter

    def namespace(html)
      # Add utility namespace to typogruby generated classes
      html = html.gsub(/class=\s*"([caps|amp|dquo]+)"/, "class=\"u-\\1\"")

      # Add scoped namespace to kramdown generated classes
      html = html.gsub(/class=\s*"([footnotes]+)"/, "class=\"s-\\1\"")

      # Return transformed output
      return html
    end

  end
end

Liquid::Template.register_filter(Jekyll::NamespaceFilter)
