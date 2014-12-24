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


desc "Clean up prepared and built files"
task :clean do |t|
  rm_rf [destination, temp]
end


desc "Regenerate the website files and place them into destination"
task :'dev-build' do
  sh "bundle exec jekyll build --config config/jekyll.yml,config/jekyll/development.yml --trace"
end


desc "Regenerate the website files and place them into destination"
task :build do
  sh "bundle exec jekyll build --config config/jekyll.yml,config/jekyll/production.yml --trace"
end


desc "Trigger webmentions"
task :webmention do
  require 'yaml'

  # Caches
  webmention_cache = '.webmention-cache'    # generic caching directory
  FileUtils.mkdir_p( webmention_cache )
  cache_all_webmentions = "#{webmention_cache}/webmentions.yml"
  cache_sent_webmentions = "#{webmention_cache}/sent_webmentions.yml"
  if File.exists?(cache_all_webmentions)
    if File.exists?(cache_sent_webmentions)
      sent_webmentions = open(cache_sent_webmentions) { |f| YAML.load(f) }
    else
      sent_webmentions = {}
    end
    all_webmentions = open(cache_all_webmentions) { |f| YAML.load(f) }
    all_webmentions.each_pair do |source, targets|
      if ! sent_webmentions[source] or ! sent_webmentions[source].kind_of?(Array)
        sent_webmentions[source] = Array.new
      end
      targets.each do |target|
        if target and ! sent_webmentions[source].find_index( target )
          if target.index( "//" ) == 0
            target  = "http:#{target}"
          end
          endpoint = `curl -s --location "#{target}" | grep 'rel="webmention"'`
          if endpoint
            endpoint.scan(/href="([^"]+)"/) do |endpoint_url|
              endpoint_url = endpoint_url[0]
              puts "Sending webmention of #{source} to #{endpoint_url}"
              command =  "curl -s -i -d \"source=#{source}&target=#{target}\" #{endpoint_url}"
              puts command
              # system command
            end
            sent_webmentions[source].push( target )
          end
        end
      end
    end
    File.open(cache_sent_webmentions, 'w') { |f| YAML.dump(sent_webmentions, f) }
  end
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
