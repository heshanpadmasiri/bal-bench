#!/usr/bin/env sh

# build sources
../build.sh test.bal

# benchmark
hyperfine "java -jar new.jar" "java -jar current.jar"
