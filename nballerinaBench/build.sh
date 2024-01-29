#!/usr/bin/env bash

JBAL_VERSION="2201.8.4"
CURRENT_BAL=$(realpath "../currentPack/jballerina-tools-$JBAL_VERSION/bin/bal")
NEW_BAL=$(realpath "../newPack/jballerina-tools-$JBAL_VERSION/bin/bal")

NBALLERINA_DIR="../nballerina/compiler"

build() {
    BAL="$1"
    pushd "$(pwd)" || exit 1
    cd "$NBALLERINA_DIR" || exit 1
    make clean -i
    make BAL="$BAL" BAL_BUILD_FLAGS=
    mv ../build/compiler/bin/nballerina.jar ../../nballerinaBench/"$2"
    popd || exit 1
}

build "$CURRENT_BAL" "current.jar"
build "$NEW_BAL" "new.jar"
