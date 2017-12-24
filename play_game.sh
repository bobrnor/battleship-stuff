#!/usr/bin/env bash

GOPATH="$(pwd)/"
go run -race ./src/git.nulana.com/bobrnor/battleship-server/battleship.go > ./logs/server.log 2>&1 &

for i in `seq 0 1`;
do
    LOGFILE=./logs/client$i.log
    go run -race ./src/git.nulana.com/bobrnor/battleship-client/battleship.go > $LOGFILE 2>&1 &
    sleep 1
done
