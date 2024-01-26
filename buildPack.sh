#!/usr/bin/env sh

JBAL_VERSION="2201.8.4"
BAL_LANG_DIR="$HOME/Projects/ballerina-lang"
BAL_PACK="$BAL_LANG_DIR/distribution/zip/jballerina-tools/build/extracted-distributions/jballerina-tools-$JBAL_VERSION"
BENCH_DIR="$HOME/Projects/bal-bench"
NEW_PACK="$BENCH_DIR/newPack/jballerina-tools-$JBAL_VERSION"

cd "$BAL_LANG_DIR" || exit 1
./gradlew clean build -x check

rm -rf "$NEW_PACK"
mv "$BAL_PACK" "$NEW_PACK"
