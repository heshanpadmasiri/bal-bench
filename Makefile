##
# JBallerina Benchmark suite
#
# @file
# @version 0.1
NEW_PACK_STAMP=newpack.stamp
JBAL_SRC_DIR?=../ballerina-lang
JBAL_SRC=$(wildcard $(JBAL_SRC_DIR/**/*.java))
JBAL_VERSION?=2201.9.0-SNAPSHOT
JBAL_PACK=$(JBAL_SRC_DIR)/distribution/zip/jballerina-tools/build/extracted-distributions/jballerina-tools-$(JBAL_VERSION)
NEW_PACK=./newPack/jballerina-tools-$(JBAL_VERSION)
GRADLE_BUILD_COMMAND=clean build -x check
BENCHMARKS=helloWorld foreach foreachInt httpLoop httpSum httpLoadBalancing nballerinaBench

## Benchmark src

define benchmark
$1: $(NEW_PACK_STAMP) $$(wildcard ./$1/*.sh) $$(wildcard ./$1/*.bal)
	cd ./$1; ./bench.sh
endef

#TODO use the foreach macro
$(eval $(call benchmark,helloWorld))
$(eval $(call benchmark,foreach))
$(eval $(call benchmark,foreachInt))
$(eval $(call benchmark,httpLoop))
$(eval $(call benchmark,httpSum))
$(eval $(call benchmark,httpLoadBalancing))
$(eval $(call benchmark,nballerinaBench))
$(eval $(call benchmark,typeLoop))
$(eval $(call benchmark,typeLoopSimple))
$(eval $(call benchmark,typeLoopSingleton))

$(NEW_PACK_STAMP): $(JBAL_SRC)
	cd $(JBAL_SRC_DIR); ./gradlew $(GRADLE_BUILD_COMMAND)
	rm -rf $(NEW_PACK)
	mv $(JBAL_PACK) $(NEW_PACK)
	@touch $@

clean:
	rm -rf *.stamp

.PHONY: clean $(BENCHMARKS)
# end
