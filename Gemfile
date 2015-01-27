source "https://rubygems.org"

# Capistrano (automates deployment)
group :development do
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
end

# Guard (automates development tasks)
group :development do
  gem 'guard'
  gem 'guard-jekyll-plus', github: 'imathis/guard-jekyll-plus'
  gem 'guard-jshintrb'
  gem 'guard-livereload'
  gem 'guard-sass'
  gem 'guard-scss-lint'
end

# Jekyll (generates static files)
gem 'jekyll', github: 'jekyll/jekyll'
group :jekyll_plugins do
  gem 'jekyll-archives', github: 'pathawks/jekyll-archives', branch: '3.0'
  gem 'jekyll-assets'
  gem 'jekyll-sitemap'

  gem 'octopress-hooks', github: 'paulrobertlloyd/hooks', branch: '3.0'
  gem 'octopress-autoprefixer', github: 'paulrobertlloyd/autoprefixer', branch: '3.0'
  gem 'octopress-minify-html', github: 'paulrobertlloyd/minify-html', branch: '3.0'

  gem 'exiftool'
  gem 'susy'
  gem 'therubyracer'
  gem 'typogruby'
  gem 'uglifier'
end

# Rake (manages build tasks)
gem 'rake'

# Image plugin
gem 'mini_magick'
