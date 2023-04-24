#!/bin/sh -xe

if [ -e /app/tmp/pids/server.pid ]; then
  rm -rf /app/tmp/pids/server.pid
fi

bundle exec puma -C config/puma.rb
