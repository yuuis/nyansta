#!/bin/bash
set -eu

# ENVS
export SECRET_KEY_BASE=$(bundle exec rails secret)

# prepare db
bundle exec rails db:create RAILS_ENV=production
bundle exec rails db:migrate RAILS_ENV=production

# start server
exec bundle exec rails s -e production -b 0.0.0.0
