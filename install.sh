#!/bin/sh
set -e
git config -f .gitmodules --get-regexp '^submodule\..*\.path$' |
    while read path_key path
    do
        url_key=$(echo $path_key | sed 's/\.path/.url/')
        url=$(git config -f .gitmodules --get "$url_key")
        git submodule add $url $path
    done

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