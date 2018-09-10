# Description
Game of drones is an fun game about rock scisor and paper. 

#TL;TR

```
git clone https://github.com/alphonse92/game-of-drones-compose.git
sh install.sh
sh start_api.sh
sh start_client.sh
```


## Requeriments
1. Node Js
2. Angular CLI
3. Docker

## Installation
### Using the installer script
```
git clone https://github.com/alphonse92/game-of-drones-compose.git
sh install.sh
```


### Manually For Geeks

```
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
```


### Configuration

By default the api listen to localhost:1337 and client runs on localhost:4200

#### Api
docker-compose .yaml has the proper configuration. If you want to set your own environment edit it.

#### Client
If you want to change the default environment configuration, you must rebuild the client.

1. Change the vars in src/environments/ in each environment.ts
2. Build the project using angular CLI (ng build)


### Run
#### Using the script
```
sh start_client.sh
sh start_api.sh
```

#### Using manually for geeks
```
docker-compose up api
cd game-of-drones-client
node server.js
```