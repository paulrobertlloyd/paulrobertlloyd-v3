guard 'jekyll', :config => ['config/jekyll.yml', 'config/jekyll/development.yml'] do
  watch /.*/
  ignore /public/
end

guard 'livereload', :port => '35729', :host => '127.0.0.1', apply_css_live: true, override_url: true do
  watch(%r{public/.+})
end
