#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

gem install bundler -v 1.16.5

bundle update
bundle install

rake assets:precompile

rake db:migrate

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
