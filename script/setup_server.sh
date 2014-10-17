#!/usr/bin/env bash


cp config/database.sample.yml config/database.yml;
cp config/secrets.sample.yml config/secrets.yml;
cp config/config.sample.yml config/config.yml;

bundle install;

sed -i "s/secret_key_base: \w\+/secret_key_base: `bundle exec rake secret`/g" config/secrets.yml;


sudo service nginx restart;