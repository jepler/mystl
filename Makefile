default::

clean:
	rm -rf resources/gen

rules.mk: files.gen rules.py
	./rules.py files.gen > rules.mk
-include rules.mk


