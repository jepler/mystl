default::

clean:
	rm -rf resources/gen

rules.mk: _data/assets.yml rules.py
	./rules.py $< > $@
-include rules.mk


