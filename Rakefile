#
# Build script for paulrobertlloyd.com
#
# Author:: Paul Robert Lloyd
# Copyright: Copyright (c) 2014 Paul Robert Lloyd
# License:: MIT
#

destination = "public"
source = "source"
temp = "tmp"


desc "Clean up prepared and built files."
task :clean do |t|
  rm_rf [destination, temp]
end


desc "Regenerate the website files and place them into destination."
task :'dev-build' do
  sh "bundle exec jekyll build --config config/jekyll.yml,config/jekyll/development.yml --trace"
end


desc "Regenerate the website files and place them into destination."
task :build do
  sh "bundle exec jekyll build --config config/jekyll.yml,config/jekyll/production.yml"
end


desc 'Replace "lazy" Markdown references with proper versions'
task :refs do |t|
  FileList.new('source/**/*.markdown').each do |path|
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
