Bundler.require(:jekyll_plugins)

# Scss Lint https://github.com/arkbot/guard-scss-lint
guard :scsslint, cli: '--config config/lint/scss.yml' do
  watch(%r{^source/_stylesheets/.+\.scss})
end


# Jekyll https://github.com/imathis/guard-jekyll-plus
guard :jekyll_plus, :config => ['config/jekyll.yml', 'config/jekyll/development.yml'] do
  watch(%r{^source/.+})
  watch('config/jekyll.yml')
  watch('config/jekyll/development.yml')
end


# LiveReload https://github.com/guard/guard-livereload
guard :livereload, override_url: true do
  watch(%r{^public/.+})
end
