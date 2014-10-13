# Jekyll https://github.com/berrberr/guard-jekyll-plus
guard :'jekyll-plus', :config => ['config/jekyll.yml', 'config/jekyll/development.yml'] do
  watch(%r{^source/.+})
  watch('config/jekyll.yml')
  watch('config/jekyll/development.yml')
end

# Sass https://github.com/hawx/guard-sass
guard :sass, :output => 'public/assets/', :syntax => :scss, :shallow => true, :silent => true do
  watch(%r{^source/_stylesheets/.+\.scss})
  callback(:run_on_changes_end) do |_, _, files|
    Array(files).each do |file|
      time = Benchmark.realtime { autoprefix_file(file) }
      benchmark = "[\e[33m%2.2fs\e[0m] " % time
      ::Guard::UI.info("\t\e[1;37mAutoprefixer\e[0m %s%s" % [benchmark, file])
    end
  end
end

# Sass Lint https://github.com/causes/scss-lint
guard :shell do
  watch(%r{^source/.+\.scss}) {
    |m| eager 'scss-lint source/_stylesheets --config config/lint/scss.yml'
  }
  watch('config/lint/scss.yml')
end

# JS Lint https://github.com/wireframe/guard-jslint-on-rails
guard :'jslint-on-rails', :config => '/config/lint/js.yml' do
  watch(%r{^source/_javascripts/.+\.js})
  watch('config/lint/js.yml')
end

# LiveReload https://github.com/guard/guard-livereload
guard :livereload, override_url: true do
  watch(%r{^public/.+})
end

def autoprefix_file(file)
  original_css = File.read(file)
  File.open(file, 'w') do |io|
    io << ::AutoprefixerRails.process(original_css, browsers: ['> 1%', 'ie >= 7'])
  end
end
