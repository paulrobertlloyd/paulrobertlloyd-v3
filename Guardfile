# Jekyll https://github.com/berrberr/guard-jekyll-plus
guard 'jekyll-plus', :config => ['config/jekyll.yml', 'config/jekyll/development.yml'] do
  watch(%r{^source/.+\.(txt|markdown|html|yml|xml)})
end

# Sass https://github.com/hawx/guard-sass
guard 'sass', :output => 'public/assets/', :syntax => :scss, :shallow => true do
  watch(%r{^source/.+\.scss})
end

# LiveReload https://github.com/guard/guard-livereload
guard 'livereload', override_url: true do
  watch(%r{^public/.+})
end
