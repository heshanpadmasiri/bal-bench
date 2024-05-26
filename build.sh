#!/usr/bin/env sh

set -x
JBAL_VERSION="2201.9.0-SNAPSHOT"
CURRENT_BAL="../currentPack/jballerina-tools-$JBAL_VERSION/bin/bal"
NEW_BAL="../newPack/jballerina-tools-$JBAL_VERSION/bin/bal"

SRC="$1"

build() {
    BAL="$1"
    TARGET_NAME="$2"
    "$BAL" build "$SRC"
    FILE_NAME=$(basename -- "$SRC")
    BASE_NAME="${FILE_NAME%.*}"
    mv "$BASE_NAME".jar "$TARGET_NAME"
}

echo "building started"
build "bal" "current.jar"
build "$NEW_BAL" "new.jar"

echo "finish building"
