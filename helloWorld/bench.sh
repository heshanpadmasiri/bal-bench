#!/usr/bin/env sh

# build sources
../build.sh helloWorld.bal

# benchmark
hyperfine "java -jar new.jar" "java -jar current.jar"
