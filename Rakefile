#
# Build script for paulrobertlloyd.com
#
# Author:: Paul Robert Lloyd
# Copyright: Copyright (c) 2014 Paul Robert Lloyd
# License:: MIT
#

destination = "public"
destination_css = "source/assets/stylesheets"
destination_js = "source/assets/javascript"
source = "source"
temp = "tmp"


desc "Install the necessary node dependencies for building the website."
task :install do |t|
  sh "npm install"
end


desc "Clean up prepared and built files."
task :clean do |t|
  rm_rf [destination, destination_css, destination_js, temp, "node_modules"]
end


desc "Concatenate Myth CSS files"
task :concatenate_css do
  mkdir_p ["#{source}/assets/stylesheets"]

  files = FileList["#{source}/_includes/**/*.pre.css"]
  concatenated_filename = "#{destination_css}/global.myth"

  File.open(concatenated_filename, "w") do |output|
    files.each do |input|
      puts "Reading #{input}"
      output.write(File.read(input))
      output.write("\n")
    end
  end
end


desc "Concatenate JS files"
task :concatenate_js do
  mkdir_p ["#{source}/assets/javascript"]

  files = FileList["#{source}/_includes/**/*.js"]
  concatenated_filename = "#{destination_js}/global.js"

  File.open(concatenated_filename, "w") do |output|
    files.each do |input|
      puts "Reading #{input}"
      output.write(File.read(input))
      output.write("\n")
    end
  end
end


desc "Concatenate website assets."
task :concat do
  # Concatenate CSS files
  Rake::Task["concatenate_css"].execute

  # Concatenate JS files
  Rake::Task["concatenate_js"].execute
end


desc "Regenerate the website files and place them into destination."
task :'dev-build' => [:install, :concat] do
  sh "bundle exec jekyll build --config config/jekyll.yml,config/jekyll/development.yml --trace"
end


desc "Regenerate the website files and place them into destination."
task :build => [:install, :concat] do
  sh "bundle exec jekyll build --config config/jekyll.yml,config/jekyll/production.yml"
end


desc 'Replace "lazy" Markdown references with proper versions'
task :refs do |t|
  FileList.new('jekyll/**/*.md').each do |path|
    File.open(path, 'r+:utf-8') do |file|
      contents = file.read

      # Search file contents for Markdown references containing asterisks
      #  instead of numbers and replace them with numbers in the correct order.
      #  See http://brettterpstra.com/2013/10/19/lazy-markdown-reference-links/
      #  Credit to Glenn Fleishman and Brett Terpstra for the idea and
      #  implementation.
      counter = 0
      while contents =~ /(\[[^\]]+\]\s*\[)\*(\].*?^\[)\*\]\:/m
        contents.sub!(/(\[[^\]]+\]\s*\[)\*(\].*?^\[)\*\]\:/m) do
          counter += 1
          Regexp.last_match[1] + counter.to_s + Regexp.last_match[2] + counter.to_s + ']:'
        end
      end

      file.pos = 0
      file.print contents
      file.truncate(file.pos)
    end
  end
end
