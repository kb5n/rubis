lock '~> 3.11.0'

set :application, 'app'
set :repo_url, 'git@github.com:ozhaan/rubis.git'
set :deploy_to, '/var/www/app'
set :format_options, command_output: true, log_file: 'log/capistrano.log', color: :auto, truncate: :auto
set :linked_files, %w[.env config/master.key]
set :linked_dirs, %w[log tmp/pids tmp/cache tmp/sockets tmp/run tmp/uploads vendor/bundle]
set :bundle_flags, '--deployment'
set :current_path, '/var/www/app/current'
set :shared_path, '/var/www/app/shared'
set :yarn_flags, '--prefer-offline --production'
set :yarn_roles, :app

namespace :deploy do
  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  namespace :check do
    desc 'Upload gitignore files'
    task :upload do
      on roles(:app) do
        upload!('.env', "#{shared_path}/.env")
        upload!('config/master.key', "#{shared_path}/config/master.key")
      end
    end

    after :make_linked_dirs, :upload
  end

  after :publishing, :restart
end
