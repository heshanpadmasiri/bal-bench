##
# JBallerina Benchmark suite
#
# @file
# @version 0.1
NEW_PACK_STAMP=newpack.stamp
JBAL_SRC_DIR?=../ballerina-lang
JBAL_SRC=$(wildcard $(JBAL_SRC_DIR/**/*.java))
JBAL_VERSION?=2201.8.4
JBAL_PACK=$(JBAL_SRC_DIR)/distribution/zip/jballerina-tools/build/extracted-distributions/jballerina-tools-$(JBAL_VERSION)
NEW_PACK=./newPack/jballerina-tools-$(JBAL_VERSION)
GRADLE_BUILD_COMMAND=clean build -x check

## Benchmark src
### Hello world
HELLO_WORLD_DIR=./helloWorld
HELLO_WORLD_SRC=$(wildcard $(HELLO_WORLD_DIR)/*.sh) $(wildcard $(HELLO_WORLD_DIR)/*.bal)

helloWorld: $(NEW_PACK_STAMP) $(HELLO_WORLD_SRC)
	cd $(HELLO_WORLD_DIR); ./bench.sh

$(NEW_PACK_STAMP): $(JBAL_SRC)
	cd $(JBAL_SRC_DIR); ./gradlew $(GRADLE_BUILD_COMMAND)
	mv $(JBAL_PACK) $(NEW_PACK)
	@touch $@

.PHONY: helloWorld
# end
