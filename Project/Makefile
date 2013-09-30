.SUFFIXES: .java .m
.PHONY: default clean

include ../../resources/make/common.mk

SUPPORT_LIB = $(CONFIGURATION_BUILD_DIR)/libtest.a

TEST_SRC_DIR = $(API_DIR)/src/test/java
TEST_BUILD_DIR = $(API_DIR)/target/j2objc
TEST_SOURCES = $(subst $(TEST_SRC_DIR)/,,$(shell find $(TEST_SRC_DIR) -name *.java))
TEST_OBJECTS = $(TEST_SOURCES:%.java=$(TEST_BUILD_DIR)/%.o)

default: clean test
	
$(TEST_BUILD_DIR)/%.o: $(TEST_GEN_DIR)/%.m $(TEST_SRC_DIR)/%.java
	@mkdir -p `dirname $@`
	@$(J2OBJCC) -c $< -o $@ \
	  -g -I$(GEN_INCLUDE_DIR) -I$(TEST_GEN_DIR) \
	  -Wno-objc-redundant-literal-use -Wno-format \
	  -Werror -Wno-parentheses

$(TEST_BIN): $(TEST_OBJECTS) $(SUPPORT_LIB)
	@$(J2OBJCC) -o $@ $(TEST_OBJECTS) \
	  -g -Werror \
	  -ljunit -ltest -L$(CONFIGURATION_BUILD_DIR)

link-test: $(TEST_OBJECTS) $(TEST_BIN)

test: link_test $(TEST_BIN)
	/bin/sh $(ROOT_DIR)/resources/make/runtests.sh $(TEST_BIN) $(subst /,.,$(TEST_SOURCES:%.java=%))

clean:
	@rm -rf $(TEST_BUILD_DIR)