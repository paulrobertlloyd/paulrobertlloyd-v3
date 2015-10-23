source "https://rubygems.org"

# Guard (automates development tasks)
group :development do
  gem 'guard'
  gem 'guard-jekyll-plus', github: 'guard/guard-jekyll-plus', branch: 'fix_loading_issue'
  gem 'guard-livereload'
  gem 'guard-scss-lint'
end

# Jekyll (generates static files)
gem 'jekyll', '~> 3.0.0.pre.beta'
group :jekyll_plugins do
  gem 'jekyll-archives', github: 'jekyll/jekyll-archives'
  gem 'jekyll-assets', '~> 2.0.0.beta'
  gem 'jekyll-paginate'
  gem 'jekyll-sitemap'
  gem 'jekyll-smartify'

  gem 'autoprefixer-rails'
  gem 'exiftool'
  gem 'oembed'
  gem 'susy'
  gem 'typogruby'
  gem 'uglifier'
  gem 'ruby-thumbor'
end

# Rake (manages build tasks)
gem 'rake'
