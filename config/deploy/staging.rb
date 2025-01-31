role :web, 'deployer@45.76.166.50'
role :db,  'deployer@45.76.166.50'
role :app, 'deployer@45.76.166.50'

set :rail_env, :staging

set :rvm_ruby_version, '2.3.0@japanhaul-rails'
