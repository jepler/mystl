ifeq ("$(origin V)", "command line")
BUILD_VERBOSE = $(V)
endif
ifndef BUILD_VERBOSE
BUILD_VERBOSE = 0
endif

ifeq "$(findstring s,$(MAKEFLAGS))" ""
ECHO=@echo
VECHO=echo
else
ECHO=@true
VECHO=true
endif

default::

clean:
	$(ECHO) CLEAN
	$(Q)rm -rf resources/gen

resources/gen/rules.mk: _data/assets.yml _lib/rules.py
	$(ECHO) RULES
	$(Q)mkdir resources/gen
	$(Q)_lib/rules.py $< > $@
-include resources/gen/rules.mk


.PHONY: publish
publish: default
	$(ECHO) "PUBLISH"
	$(Q)git branch -D gh-pages || true
	$(Q)./_lib/docimport.py | git fast-import --date-format=now
	$(Q)git push -f origin gh-pages
