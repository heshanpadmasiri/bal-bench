#!/usr/bin/env sh
set -e
# build sources
../build.sh test.bal

N_REQ=10000
# we expect max for about 50
C=20

java -jar new.jar > new.log 2>&1 &
sleep 5
ab -n $N_REQ -c $C -p req.json -T 'application/json' -H 'Content-Type: application/json' http://localhost:8290/test1/data | tee new.log

pkill java
java -jar current.jar > current.log 2>&1 &
sleep 5
ab -n $N_REQ -c $C -p req.json -T 'application/json' -H 'Content-Type: application/json' http://localhost:8290/test1/data | tee current.log

pkill java
