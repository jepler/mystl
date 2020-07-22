
-include resources/gen/main.stl.d
resources/gen/main.stl: resources/main.scad
	mkdir -p $(dir resources/gen/main.stl)
	openscad -o resources/gen/main.stl.tmp.stl -d resources/gen/main.stl.d $(SCAD_FLAGS)  resources/main.scad
	admesh -b resources/gen/main.stl resources/gen/main.stl.tmp.stl
	rm -f resources/gen/main.stl.tmp.stl
default:: resources/gen/main.stl


-include resources/gen/main.png.d
resources/gen/main.png: resources/main.scad
	mkdir -p $(dir resources/gen/main.png)
	openscad -o resources/gen/main.png -d resources/gen/main.png.d $(SCAD_FLAGS)  resources/main.scad
default:: resources/gen/main.png


-include resources/gen/big.stl.d
resources/gen/big.stl: resources/main.scad
	mkdir -p $(dir resources/gen/big.stl)
	openscad -o resources/gen/big.stl.tmp.stl -d resources/gen/big.stl.d $(SCAD_FLAGS) -Dsize=100 '-Dcolor="red"' resources/main.scad
	admesh -b resources/gen/big.stl resources/gen/big.stl.tmp.stl
	rm -f resources/gen/big.stl.tmp.stl
default:: resources/gen/big.stl


-include resources/gen/big.png.d
resources/gen/big.png: resources/main.scad
	mkdir -p $(dir resources/gen/big.png)
	openscad -o resources/gen/big.png -d resources/gen/big.png.d $(SCAD_FLAGS) -Dsize=100 '-Dcolor="red"' resources/main.scad
default:: resources/gen/big.png

