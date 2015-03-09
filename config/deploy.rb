# config valid only for Capistrano 3.4
lock '3.4.0'

set :application, 'paulrobertlloyd_v3'
set :repo_url, 'git@github.com:paulrobertlloyd/paulrobertlloyd.com.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/home/prlloyd/webapps/paulrobertlloyd_v3'
set :tmp_dir, "/home/prlloyd/webapps/paulrobertlloyd_v3/tmp/capistrano"

# Default value for :scm is :git
set :scm, :git
set :git_strategy, Capistrano::Git::SubmoduleStrategy

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}

# Default value for linked_dirs is []
# set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5


namespace :deploy do

  task :update_jekyll do
    on roles(:app) do
      within release_path do
        execute :rake, 'build'
      end
    end
  end

end

after "deploy:updated", "deploy:update_jekyll"
