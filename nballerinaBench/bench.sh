#!/usr/bin/env sh

TEST_SRC="test.bal"
./build.sh
hyperfine "java -jar new.jar $TEST_SRC" "java -jar current.jar $TEST_SRC"
