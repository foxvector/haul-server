# config valid for current version and patch releases of Capistrano
lock '~> 3.10.1'

set :stages, %w[production staging]

set :application, 'japanhaul-rails'
set :repo_url, 'git@github.com:movefast-llc/japanhaul-rails.git'
set :branch, 'feature/wishlists-api'

set :user, 'deployer'
set :deploy_to, "/data/#{fetch(:application)}"
set :ssh_options, { forward_agent: true }

set :puma_threads, [4, 16]
set :puma_workers, 0
set :puma_bind,       "unix://#{shared_path}/tmp/sockets/puma.sock"
set :puma_state,      "#{shared_path}/tmp/pids/puma.state"
set :puma_pid,        "#{shared_path}/tmp/pids/puma.pid"
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_preload_app, true
set :puma_worker_timeout, nil
set :puma_init_active_record, false

set :pty, false
set :keep_releases, 5

set :linked_files, %w{config/secrets.yml config/database.yml}
set :linked_dirs, %w{log tmp/pids tmp/sockets tmp/cache vendor/bundle public/system public/uploads}

# sidekiq settings
set :sidekiq_config, -> { File.join(current_path, 'config', 'sidekiq.yml') }

set :migration_role, :app

namespace :puma do
  desc 'Create Directories for Puma Pids and Socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc 'Initial deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end
end

after 'deploy:publishing', 'deploy:restart'
after 'deploy:restart', 'sidekiq:restart'
