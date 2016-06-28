set :stage, :production

set :rvm_type, :system

# set :rvm_path, '/usr/local/rvm'
# set :rvm_type, :system

# set :ruby_string, '2.1.5p273'
# set :rvm_gemset_string, 'receituarios_production'
# set :rvm_ruby_string, 'ruby-2.1.5eceituarios'

server 'diogo.4techlabs.com.br', user: 'receituarios', roles: %w{web}

set :deploy_to, '/home/receituarios/app'
set :rails_env, 'production'
set :branch, 'master'

set :rvm_ruby_version, '2.1.5'
