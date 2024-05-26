#!/usr/bin/env sh

# build sources
../build.sh test.bal

# benchmark
hyperfine --warmup 5 "java -jar new.jar" "java -jar current.jar"
