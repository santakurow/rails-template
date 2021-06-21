#!/bin/bash
set -e

echo "Build => "
docker-compose build

echo "Bundle Install => "
docker-compose run --rm app bundle install

echo "Yarn Setup => "
docker-compose run --rm app yarn --check-files

echo "DB Create => "
docker-compose run --rm app rails db:create

echo "Complete Setup! The next step is to add the value of the APP_NAME environment variable in the .env file."
