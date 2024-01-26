#!/usr/bin/env sh

# build sources
../build.sh test.bal

N_REQ=100
# we expect max for about 50
C=20

pkill java
java -jar new.jar > new.log 2>&1 &
sleep 5
ab -n $N_REQ -c $C -p req.json -T 'application/json' -H 'Content-Type: application/json' http://localhost:8290/test1/data > new.log

pkill java
java -jar current.jar > current.log 2>&1 &
sleep 5
ab -n $N_REQ -c $C -p req.json -T 'application/json' -H 'Content-Type: application/json' http://localhost:8290/test1/data > current.log

pkill java
