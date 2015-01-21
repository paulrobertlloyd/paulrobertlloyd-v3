Bundler.require(:jekyll_plugins)

# Jekyll https://github.com/berrberr/guard-jekyll-plus
guard :'jekyll-plus', :config => ['config/jekyll.yml', 'config/jekyll/development.yml'], :silent => true do
  watch(%r{^source/.+})
  watch('config/jekyll.yml')
  watch('config/jekyll/development.yml')
end

# Scss Lint https://github.com/arkbot/guard-scss-lint
guard :scsslint, cli: '--config config/lint/scss.yml' do
  watch(%r{^source/_stylesheets/.+\.scss})
end

# Sass https://github.com/hawx/guard-sass
guard :sass, :output => 'public/assets/', :syntax => :scss, :shallow => true, :silent => true do
  watch(%r{^source/_stylesheets/.+\.scss})
end

# JSHint https://github.com/thegarage/guard-jshintrb
guard :jshintrb do
  watch(%r{^source/_javascripts/.+\.js})
end

# LiveReload https://github.com/guard/guard-livereload
# guard :livereload, override_url: true do
#   watch(%r{^public/.+})
# end
