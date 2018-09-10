#!/bin/sh
set -e
git submodule update --init --recursive
git submodule foreach --recursive git fetch
git submodule foreach git merge origin master

cd game-of-drones-client
npm install .
cd ..
cd game-of-drones-api
npm install .
cd ..

docker-compose build api