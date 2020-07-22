
-include resources/gen/main.stl.d
resources/gen/main.stl: resources/main.scad
	$(ECHO) $target
	$(Q)mkdir -p $(dir resources/gen/main.stl)
	$(Q)openscad -o resources/gen/main.stl.tmp.stl -d resources/gen/main.stl.d $(SCAD_FLAGS)  resources/main.scad
	$(Q)admesh -b resources/gen/main.stl resources/gen/main.stl.tmp.stl
	$(Q)rm -f resources/gen/main.stl.tmp.stl
default:: resources/gen/main.stl


-include resources/gen/main.png.d
resources/gen/main.png: resources/main.scad
	$(ECHO) $target
	$(Q)mkdir -p $(dir resources/gen/main.png)
	$(Q)openscad --imgsize=2048,2048 -o resources/gen/main.png.tmp.png -d resources/gen/main.png.d $(SCAD_FLAGS)  resources/main.scad
	$(Q)convert -geometry 25% resources/gen/main.png.tmp.png resources/gen/main.png
	$(Q)rm -f resources/gen/main.png.tmp.png
default:: resources/gen/main.png


-include resources/gen/big.stl.d
resources/gen/big.stl: resources/main.scad
	$(ECHO) $target
	$(Q)mkdir -p $(dir resources/gen/big.stl)
	$(Q)openscad -o resources/gen/big.stl.tmp.stl -d resources/gen/big.stl.d $(SCAD_FLAGS) -Dsize=100 '-Dcolor="red"' resources/main.scad
	$(Q)admesh -b resources/gen/big.stl resources/gen/big.stl.tmp.stl
	$(Q)rm -f resources/gen/big.stl.tmp.stl
default:: resources/gen/big.stl


-include resources/gen/big.png.d
resources/gen/big.png: resources/main.scad
	$(ECHO) $target
	$(Q)mkdir -p $(dir resources/gen/big.png)
	$(Q)openscad --imgsize=2048,2048 -o resources/gen/big.png.tmp.png -d resources/gen/big.png.d $(SCAD_FLAGS) -Dsize=100 '-Dcolor="red"' resources/main.scad
	$(Q)convert -geometry 25% resources/gen/big.png.tmp.png resources/gen/big.png
	$(Q)rm -f resources/gen/big.png.tmp.png
default:: resources/gen/big.png

