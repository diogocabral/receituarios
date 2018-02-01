set :stage, :production

set :rvm_type, :system

server 'diogocabral.com.br', user: 'receituarios', roles: %w{web}

set :deploy_to, '/home/receituarios/app'
set :rails_env, 'production'
set :branch, 'master'

set :rvm_ruby_version, '2.2.0'
