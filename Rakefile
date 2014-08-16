#
# Build script for paulrobertlloyd.com
#
# Author:: Paul Robert Lloyd
# Copyright: Copyright (c) 2014 Paul Robert Lloyd
# License:: MIT

temp = 'tmp'
destination = 'public'
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
  npm_bin = `npm bin`.chomp

  myth = "#{npm_bin}/myth"
  css_file = "assets/stylesheets/styles"

  sh "#{myth} #{css_file}.pre.css > #{css_file}.css"
  sh "#{myth} --compress #{css_file}.css > #{css_file}.min.css"
end


desc 'Prepare the website assets.'
task :prepare do
  mkdir_p ["assets/stylesheets"]

  # Concatenate CSS files, then process (and minify) with Myth
  Rake::Task["concatenate_css"].execute
  Rake::Task["compile_css"].execute

  # Concatenate CSS files, then minify with Ugligy
  #  TBD
end


desc 'Regenerate the website files and place them into destination.'
task :build do
  sh 'jekyll build --config config/jekyll.yml'
  cp_r "assets/.", "#{destination}/assets"
end


desc 'Regenerate the website files (with drafts) and place them into destination.'
task :build_drafts do
  sh 'bundle exec jekyll build --config config/jekyll.yml --drafts'
  cp_r "assets/.", "#{destination}/assets"
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