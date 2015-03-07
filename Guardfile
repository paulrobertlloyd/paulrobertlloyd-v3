Bundler.require(:jekyll_plugins)

# Jekyll https://github.com/imathis/guard-jekyll-plus
guard :jekyll_plus, :config => ['config/jekyll.yml', 'config/jekyll/development.yml'] do
  watch(%r{^source/.+})
  watch('config/jekyll.yml')
  watch('config/jekyll/development.yml')
end

# Scss Lint https://github.com/arkbot/guard-scss-lint
guard :scsslint, cli: '--config config/lint/scss.yml' do
  watch(%r{^source/_stylesheets/.+\.scss})
end

# Sass https://github.com/hawx/guard-sass
# Autoprefix https://github.com/ai/autoprefixer-rails
guard :sass, :output => 'public/assets/', :syntax => :scss, :shallow => true do
  watch(%r{^source/_stylesheets/.+\.scss})

  callback(:run_on_changes_end) do |_, _, files|
    Array(files).each do |file|
      time = Benchmark.realtime { autoprefix_file(file) }
      benchmark = "[\e[33m%2.2fs\e[0m] " % time
      ::Guard::UI.info("\t\e[1;37mAutoprefixer\e[0m %s%s" % [benchmark, file])
    end
  end

  def autoprefix_file(file)
    original_css = File.read(file)
    File.open(file, 'w') do |io|
      io << ::AutoprefixerRails.process(original_css, browsers: ['> 1%', 'ie >= 7'])
    end
  end
end

# JSHint https://github.com/thegarage/guard-jshintrb
guard :jshintrb do
  watch(%r{^source/_javascripts/.+\.js})
end

# LiveReload https://github.com/guard/guard-livereload
guard :livereload, override_url: true do
  watch(%r{^public/.+})
end
