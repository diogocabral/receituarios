# config valid only for current version of Capistrano
lock '3.5.0'

set :application, 'receituarios'
set :repo_url, 'git@github.com:diogocabral/receituarios.git'

set :rvm_type, :system

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
# set :deploy_to, '/home/receituarios/app'

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
# set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

# Default value for linked_dirs is []
# set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'public/system')

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

namespace :deploy do

  desc "Stop application"

  task :stop do
    on roles(:web), in: :sequence, wait: 5 do
      execute :touch, release_path.join('/tmp/stop.txt')
    end
  end

  desc "Start application"

  task :start do
    on roles(:web), in: :sequence, wait: 5 do
      run "rm -f #{current_path}/tmp/stop.txt"
    end
  end

  desc 'Restart application'

  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end

namespace :db do
  desc "Create the database"
  task :configure do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        execute :rake, "db:migrate RAILS_ENV=#{fetch(:rails_env)}"
        execute :rake, "db:seed RAILS_ENV=#{fetch(:rails_env)}"
      end
    end
  end
end

after 'deploy', 'db:configure'