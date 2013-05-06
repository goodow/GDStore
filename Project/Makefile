.SUFFIXES: .java .m
.PHONY: default clean

# Change to where distribution was unzipped.
J2OBJC_DIST = ~/dev/tools/lib/j2objc/dist

ifdef CONFIGURATION_BUILD_DIR
# In Xcode build
BUILD_DIR = $(CONFIGURATION_BUILD_DIR)/build
ARCHFLAGS = $(ARCHS:%=-arch %)
SDKFLAGS = -isysroot $(SDKROOT)
else
# In command-line build
BUILD_DIR = $(HOME)/build
ARCHFLAGS =
SDKFLAGS =
endif

ifdef OPTIMIZATION_LEVEL
DEBUGFLAGS := $(DEBUGFLAGS) -O$(OPTIMIZATION_LEVEL)
endif

ifdef OTHER_CFLAGS
DEBUGFLAGS := $(DEBUGFLAGS) $(OTHER_CFLAGS)
endif

# Workaround for iPhoneSimulator SDK's gcc bug
ifdef EFFECTIVE_PLATFORM_NAME
ifneq ($(EFFECTIVE_PLATFORM_NAME), -iphonesimulator)
WARNINGS := $(WARNINGS) -Wreturn-type
endif
endif

J2OBJCC_FLAGS = -ObjC $(WARNINGS) $(SDKFLAGS) $(ARCHFLAGS) $(DEBUGFLAGS)
J2OBJCC = $(J2OBJC_DIST)/j2objcc $(J2OBJCC_FLAGS)

REALTIME_MODEL_DIR = ../../realtime-model
MAIN_GEN_DIR = ../Classes/generated
SUPPORT_LIB = $(CONFIGURATION_BUILD_DIR)/libtest.a

TEST_SRC_DIR = $(REALTIME_MODEL_DIR)/src/test/java
TEST_GEN_DIR = ../Classes/test_generated
TEST_BUILD_DIR = $(REALTIME_MODEL_DIR)/target/j2objc
TEST_SOURCES = $(shell find $(TEST_SRC_DIR) -name *.java)
TEST_TEMP_OBJCS = $(subst $(TEST_SRC_DIR), $(TEST_BUILD_DIR), $(TEST_SOURCES))
TEST_OBJCS = $(TEST_TEMP_OBJCS:.java=.o)
TEST_BINS = $(TEST_OBJCS:.o=)

default: test
	
$(TEST_BUILD_DIR)/%.o: $(TEST_GEN_DIR)/%.m $(TEST_SRC_DIR)/%.java
	@mkdir -p `dirname $@`
	@$(J2OBJCC) -c $< -o $@ \
	  -g -I$(MAIN_GEN_DIR) -I$(TEST_GEN_DIR) \
	  -Wno-objc-redundant-literal-use -Wno-format \
	  -Werror -Wno-parentheses

$(TEST_BUILD_DIR)/%: $(TEST_BUILD_DIR)/%.o $(SUPPORT_LIB)
	@$(J2OBJCC) $< -o $@ \
	  -g -Werror \
	  -ljunit -ltest -L$(CONFIGURATION_BUILD_DIR)

link-test: $(TEST_OBJCS) $(TEST_BINS)

test: link-test $(TEST_BINS)
	@/bin/sh runtests.sh $(TEST_BINS)

clean:
	@rm -rf $(TEST_BUILD_DIR)