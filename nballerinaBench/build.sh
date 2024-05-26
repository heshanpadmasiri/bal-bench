#!/usr/bin/env bash

set -x
JBAL_VERSION="2201.9.0-SNAPSHOT"
CURRENT_BAL=$(realpath "../currentPack/jballerina-tools-$JBAL_VERSION/bin/bal")
NEW_BAL=$(realpath "../newPack/jballerina-tools-$JBAL_VERSION/bin/bal")

rm -f "current.jar"
rm -f "new.jar"

NBALLERINA_DIR="../nballerina/compiler"

cleanAndRebuildDependencies() {
    rm -rf ~/.ballerina
}

build() {
    BAL="$1"
    pushd "$(pwd)" || exit 1
    cd "$NBALLERINA_DIR" || exit 1
    make clean -i
    make BAL="$BAL" BAL_BUILD_FLAGS=
    mv ../build/compiler/bin/nballerina.jar ../../nballerinaBench/"$2"
    popd || exit 1
}

build "$NEW_BAL" "new.jar"
build "bal" "current.jar"
