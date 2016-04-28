#
# Build script for paulrobertlloyd.com
#
# Author: Paul Robert Lloyd
# Copyright: Copyright (c) 2014 Paul Robert Lloyd
# License: MIT
#

destination = "public"
source = "source"
config = "config"


desc "Clean up prepared and built files"
task :clean do |t|
  rm_rf [destination]
end


desc "Regenerate the website files and place them into destination"
task :'build-dev' => [:clean] do
  sh "JEKYLL_ENV=development bundle exec jekyll build --config config/jekyll.yml --future --trace --profile"
end


desc "Regenerate the website files and place them into destination"
task :build => [:clean] do
  sh "JEKYLL_ENV=production bundle exec jekyll build --config config/jekyll.yml --future"
end


desc "Publish the website via rsync"
task :deploy => :build do
  puts "Publishing website..."
  user = "prlloyd"
  server = "paulrobertlloyd.com"
  path = "/home/prlloyd/webapps/paulrobertlloyd_v3"
  sh "rsync -hvrt --delete-after #{destination} #{user}@#{server}:#{path}"
  sh "rsync -hvrt --delete-after #{config} #{user}@#{server}:#{path}"
  puts "Your website is now published!"
end


desc "Replace 'lazy' Markdown references with proper versions"
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


desc "Replace email addresses in remarks with md5 hashed strings"
task :hash do |t|
  FileList.new('source/_data/remarks/*.yml').each do |path|
    File.open(path, 'r+:utf-8') do |file_name|

      require 'digest/md5'
      private :hash
      def hash(email)
        email_address = email ? email.downcase.strip : ''
        Digest::MD5.hexdigest(email_address)
      end

      contents = File.read(file_name)
      email_regex = /([_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,4}))/i
      @replace = contents.gsub(email_regex) { |m| hash(m) }

      File.open(file_name, "w") { |file| file.puts @replace }
    end
  end
end
