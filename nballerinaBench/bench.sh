#!/usr/bin/env sh

TEST_SRC="test.bal"
./build.sh
hyperfine --warmup=5 "java -jar new.jar $TEST_SRC" "java -jar current.jar $TEST_SRC"
