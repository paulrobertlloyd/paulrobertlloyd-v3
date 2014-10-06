guard 'jekyll-plus', :config => ['config/jekyll.yml', 'config/jekyll/development.yml'], :extensions => ['txt', 'markdown', 'html', 'xml', 'yml'] do
  watch(%r{source/.+})
  watch(%r{config/.+})
end

guard 'sass', :output => 'public/assets/', :syntax => :scss, :shallow => true do
  watch(%r{source/assets/_stylesheets/.+})
end

guard 'livereload', override_url: true do
  watch(%r{public/.+})
end
