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
  gem 'guard-jekyll-plus', github: 'berrberr/guard-jekyll-plus'
  gem 'guard-jshintrb', github: 'paulrobertlloyd/guard-jshintrb'
  gem 'guard-livereload'
  gem 'guard-sass', github: 'paulrobertlloyd/guard-sass'
  gem 'guard-scss-lint', github: 'chrislopresto/guard-scss-lint'

  gem 'autoprefixer-rails'
end

# Jekyll (generates static files)
gem 'jekyll'
group :jekyll_plugins do
  gem 'jekyll-archives'
  gem 'jekyll-assets'
  gem 'jekyll-minify-html'
  gem 'jekyll-pypedown'
  gem 'jekyll-sitemap'

  gem 'exifr'
  gem 'nokogiri'
  gem 'typogruby'
  gem 'uglifier'
end

# Rake (manages build tasks)
gem 'rake'

# JavaScript runtime
gem 'therubyracer'
