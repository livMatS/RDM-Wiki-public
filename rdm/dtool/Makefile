.RECIPEPREFIX +=
# inspiration from
# * https://ismail.badawi.io/blog/automatic-directory-creation-in-make/
# * https://stackoverflow.com/questions/4219255/how-do-you-get-the-list-of-targets-in-a-makefile

# base uri of web version
BASE_URI := https://github.com/livMatS/RDM-Wiki-public/tree/master/rdm/dtool/
# pandoc builder
PANDOC=pandoc
# Directory containing source (Markdown) files
SRC_DIR := src

# Directory containing output files
BUILD_DIR := build

# Directory holding latex template
TEMPLATE_DIR := template

# Find all the md files we want to compile
# Note the single quotes around the * expressions. Make will incorrectly expand these otherwise.
SRC := $(sort $(shell find $(SRC_DIR) -name '*.md'))

# Convert the list of source files (Markdown files in directory src/)
# into a list of output files (processed markdown files in directory build/).
OBJS := $(subst $(SRC_DIR),$(BUILD_DIR),$(SRC))

all: pdf

.PHONY: pdf
pdf: $(BUILD_DIR)/output.pdf

.PHONY: html
html: $(BUILD_DIR)/index.html

.PRECIOUS: $(BUILD_DIR)/. $(BUILD_DIR)%/.

$(BUILD_DIR)/.:
  @echo "Create $@"
  mkdir -p $@

$(BUILD_DIR)%/.:
  @echo "Create $@"
  mkdir -p $@

.PHONY : clean
clean:
  @rm -rf $(BUILD_DIR)

.PHONY : list
list:
  @LC_ALL=C $(MAKE) -pRrq -f $(lastword $(MAKEFILE_LIST)) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'

.SECONDEXPANSION:

$(BUILD_DIR)/%.md: $(SRC_DIR)/%.md | $$(@D)/.
  $(PANDOC) --from markdown+rebase_relative_paths -o $@ $<
  perl -0pi -e 's|([^[]*\])\(((?!https?://)[^)]*\.md)\)|\1($(BASE_URI)\2)|gs' $@

$(BUILD_DIR)/output.pdf: $(OBJS)
  $(PANDOC) \
    --pdf-engine=xelatex \
    --template=$(TEMPLATE_DIR)/eisvogel.latex \
    --highlight-style tango \
    --toc -N \
    --filter pandoc-crossref \
    -o $@ \
    $(SRC_DIR)/title.txt $^

$(BUILD_DIR)/%.pdf: $(BUILD_DIR)/%.md
  $(PANDOC) \
    --pdf-engine=xelatex \
    --template=$(TEMPLATE_DIR)/eisvogel.latex \
    --highlight-style tango \
    --filter pandoc-crossref \
    -o $@ \
    $(SRC_DIR)/title.txt $<

$(BUILD_DIR)/index.html: $(OBJS)
  $(PANDOC) \
    -f markdown+smart -t markdown-smart \
    --highlight-style tango \
    --filter pandoc-crossref \
    -s -t slidy \
    -o $@ \
    $(SRC_DIR)/title.txt $^
