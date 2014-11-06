source "https://rubygems.org"

# Capistrano (for automated deployment)
group :development do
  gem 'capistrano'
  gem 'capistrano-rvm'
  gem 'capistrano-bundler'
end

# Guard (for development)
group :development do
  gem 'guard'
  gem 'guard-jekyll-plus', github: 'berrberr/guard-jekyll-plus'
  gem 'guard-jshintrb', github: 'paulrobertlloyd/guard-jshintrb'
  gem 'guard-livereload'
  gem 'guard-sass', github: 'paulrobertlloyd/guard-sass'
  gem 'guard-scss-lint', github: 'chrislopresto/guard-scss-lint'

  gem 'autoprefixer-rails'
end

# Rake (for task management)
gem 'rake'

# Jekyll
gem 'jekyll'
group :jekyll_plugins do
  gem 'jekyll-archives'
  gem 'jekyll-assets'
  gem 'jekyll-pypedown'
  gem 'jekyll-sitemap'

  gem 'exifr'
  gem 'nokogiri'
  gem 'typogruby'
  gem 'uglifier'
end
