# Top level makefile, the real shit is at src/Makefile

default: all

.DEFAULT:
	cd src && $(MAKE) $@

install:
	cd src && $(MAKE) $@

deps_build:
	make -C deps/hiredis/ hiredis-x86 -j`nproc` 
	make clean
	make -C deps/hiredis/ hiredis-aarch64 -j`nproc` 
	make clean
	
	cp deps/lua/src/Makefile.x86 deps/lua/src/Makefile
	make -C deps/lua/src/  lua-x86 -j 8
	make clean
	cp deps/lua/src/Makefile.arm deps/lua/src/Makefile
	make -C deps/lua/src/  lua-aarch64 -j 8
	make clean
all: deps_build
	make -C src redis-server-x86 -j 8
	make -C src redis-server-aarch64 -j 8
	make post_process
clean:
	make -C src clean
.PHONY: install
