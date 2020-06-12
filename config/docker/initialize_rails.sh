#!/bin/sh
set -e
cd /usr/src/app
rm -f tmp/pids/server.pid
metricbeat &
filebeat &
su app -c 'bin/bundle exec prometheus_exporter &'
su app -c 'bin/rails s -b 0.0.0.0'

