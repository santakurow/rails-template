#!/bin/bash
set -e

echo "Build => "
docker-compose build

echo "Bundle Install => "
docker-compose run --rm web bundle install

echo "Yarn Setup => "
docker-compose run --rm web yarn --check-files

echo "DB Drop => "
docker-compose run --rm web rails db:drop

echo "Create .env file => "
cp .env.sample .env

echo "Complete Setup! The next step is to add the value of the APP_NAME environment variable in the .env file."
