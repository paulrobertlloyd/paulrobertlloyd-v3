#
# Build script for paulrobertlloyd.com
#
# Author:: Paul Robert Lloyd
# Copyright: Copyright (c) 2014 Paul Robert Lloyd
# License:: MIT

npm_bin = `npm bin`.chomp
temp = 'tmp'
target = 'public'
source = 'source'


desc 'Install the necessary dependencies for building the website.'
task :install do |t|
  sh 'npm install'
end


desc "Concatenate Myth CSS files"
task :concatenate_css do
  files = FileList["#{source}/**/*.pre.css"]
  concatenated_filename = "assets/stylesheets/styles.pre.css"

  File.open(concatenated_filename, "w") do |output|
    files.each do |input|
      puts "Reading #{input}"
      output.write(File.read(input))
      output.write("\n")
    end
  end
end


desc "Compile Myth CSS files"
task :compile_css do
  myth = "#{npm_bin}/myth"
  css_file = "assets/stylesheets/styles"

  sh "#{myth} #{css_file}.pre.css > #{css_file}.css"
  sh "#{myth} --compress #{css_file}.css > #{css_file}.min.css"
end


desc 'Prepare the website assets.'
task :prepare => :clean do
  mkdir_p ["#{temp}/stylesheets", "#{temp}/images", "#{temp}/javascript"]

  cp_r 'assets/images', temp
end


desc 'Regenerate the website files and place them into destination.'
task :build => :prepare do
  sh 'bundle exec jekyll build --config config/jekyll.yml'
  cp_r "#{temp}/.", "#{target}/assets"
end


desc 'Regenerate the website files (with drafts) and place them into destination.'
task :build_drafts => :prepare do
  sh 'bundle exec jekyll build --config config/jekyll.yml --drafts'
  cp_r "#{temp}/.", "#{target}/assets"
end


desc 'Clean up prepared and built files.'
task :clean do
  rm_rf [temp, target]
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