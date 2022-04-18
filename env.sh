#!/usr/bin/env bash

alias build="docker-compose build"

alias start="docker-compose up -d"
alias debug="docker-compose up"
alias site="docker-compose run --service-port myweb bash"
once(){
    tmpcmd="docker exec -it $1 bash"
    $tmpcmd
}
