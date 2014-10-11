# Jekyll https://github.com/berrberr/guard-jekyll-plus
guard 'jekyll-plus', :config => ['config/jekyll.yml', 'config/jekyll/development.yml'] do
  watch(%r{^source/.+})
  watch(%r{^config/jekyll.yml})
  watch(%r{^config/jekyll/development.yml})
end

# Sass https://github.com/hawx/guard-sass
guard 'sass', :output => 'public/assets/', :syntax => :scss, :shallow => true, :silent => true do
  watch(%r{^source/.+\.scss})
end

# Sass Lint https://github.com/causes/scss-lint
guard :shell do
  watch(%r{^source/.+\.scss}) {
    |m| eager 'scss-lint source/_stylesheets --config config/lint/scss.yml'
  }
end

# LiveReload https://github.com/guard/guard-livereload
guard 'livereload', override_url: true do
  watch(%r{^public/.+})
end
