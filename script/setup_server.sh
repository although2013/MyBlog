#!/usr/bin/env bash


cp config/database.sample.yml config/database.yml;
cp config/secrets.sample.yml config/secrets.yml;

if [ -f config/config.yml ]; then
  echo "'config.yml' already exist"
else
  cp config/config.sample.yml config/config.yml;
fi

bundle install;

sed -i "s/secret_key_base: \w\+/secret_key_base: `bundle exec rake secret`/g" config/secrets.yml;


RAILS_ENV=production rake db:create db:migrate;
RAILS_ENV=production rake assets:precompile;

sudo service nginx restart;
