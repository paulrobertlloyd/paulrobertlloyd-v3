Bundler.require(:jekyll_plugins)

# Jekyll https://github.com/imathis/guard-jekyll-plus
guard :jekyll_plus, :config => ['config/jekyll.yml', 'config/jekyll/development.yml'] do
  watch(%r{^source/.+})
end


# LiveReload https://github.com/guard/guard-livereload
guard :livereload, grace_period: 0.5 do
  watch(%r{^public/.+})
end
