#!/usr/bin/env sh

JBAL_VERSION="2201.8.4"
CURRENT_BAL="../currentPack/jballerina-tools-$JBAL_VERSION/bin/bal"
NEW_BAL="../newPack/jballerina-tools-$JBAL_VERSION/bin/bal"

SRC="$1"

build() {
    BAL="$1"
    TARGET_NAME="$2"
    rm -rf ~/.ballerina
    "$BAL" build "$SRC"
    FILE_NAME=$(basename -- "$SRC")
    BASE_NAME="${FILE_NAME%.*}"
    mv "$BASE_NAME".jar "$TARGET_NAME"
}

build "$CURRENT_BAL" "current.jar"
build "$NEW_BAL" "new.jar"
