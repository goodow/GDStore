.SUFFIXES: .java .m
.PHONY: default clean

include ../../resources/make/common.mk

SUPPORT_LIB = $(CONFIGURATION_BUILD_DIR)/libtest.a

TEST_SRC_DIR = $(MODEL_DIR)/src/test/java
TEST_BUILD_DIR = $(MODEL_DIR)/target/j2objc
TEST_SOURCES = $(shell find $(TEST_SRC_DIR) -name *.java)
TEST_TEMP_OBJCS = $(subst $(TEST_SRC_DIR), $(TEST_BUILD_DIR), $(TEST_SOURCES))
TEST_OBJCS = $(TEST_TEMP_OBJCS:.java=.o)
TEST_BINS = $(TEST_OBJCS:.o=)

default: clean test
	
$(TEST_BUILD_DIR)/%.o: $(TEST_GEN_DIR)/%.m $(TEST_SRC_DIR)/%.java
	@mkdir -p `dirname $@`
	@$(J2OBJCC) -c $< -o $@ \
	  -g -I$(GEN_INCLUDE_DIR) -I$(TEST_GEN_DIR) \
	  -Wno-objc-redundant-literal-use -Wno-format \
	  -Werror -Wno-parentheses

$(TEST_BUILD_DIR)/%: $(TEST_BUILD_DIR)/%.o $(SUPPORT_LIB)
	@$(J2OBJCC) $< -o $@ \
	  -g -Werror \
	  -ljunit -ltest -L$(CONFIGURATION_BUILD_DIR)

link-test: $(TEST_OBJCS) $(TEST_BINS)

test: link-test $(TEST_BINS)
	@/bin/sh $(ROOT_DIR)/resources/make/runtests.sh $(TEST_BINS)

clean:
	@rm -rf $(TEST_BUILD_DIR)