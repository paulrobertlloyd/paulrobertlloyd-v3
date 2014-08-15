#
# Build script for paulrobertlloyd.com
#
# Author:: Paul Robert Lloyd
# Copyright: Copyright (c) 2014 Paul Robert Lloyd
# License:: MIT

npm_bin = `npm bin`.chomp
prep = 'prep'
target = 'public'
source = 'source'


desc 'Install the necessary dependencies for building the website.'
task :install do |t|
  sh 'npm install'
end


desc "Concatenate Myth CSS files"
task :concatenate_css do
  files = FileList["#{source}/**/*.pre.css"]
  concatenated_filename = "#{prep}/stylesheets/styles.pre.css"

  File.open(concatenated_filename, "w") do |output|
    files.each do |input|
      puts "Reading #{input}"
      output.write(File.read(input))
      output.write("\n")
    end
  end
end


desc 'Prepare the website assets.'
task :prepare => :clean do
  mkdir_p ["#{prep}/stylesheets", "#{prep}/images", "#{prep}/javascript"]

# myth = "#{npm_bin}/myth"
# css_file = "#{prep}/css/main.css"
#
# sh "#{myth} assets/less/main.less > #{css_file}.pre"
# sh "#{myth} --compress #{css_file}.pre > #{css_file}"
# rm "#{css_file}.pre"

# javascript processing goes here

  cp_r 'assets/images', prep
end


desc 'Regenerate the website files and place them into destination.'
task :build => :prepare do
  sh 'bundle exec jekyll build'
  cp_r "#{prep}/.", "#{target}/assets"
end


desc 'Regenerate the website files (with drafts) and place them into destination.'
task :build_drafts => :prepare do
  sh 'bundle exec jekyll build --drafts'
  cp_r "#{prep}/.", "#{target}/assets"
end


desc 'Clean up prepared and built files.'
task :clean do
  rm_rf [prep, target]
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