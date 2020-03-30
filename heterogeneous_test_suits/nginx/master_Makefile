
default:	build

clean:
	rm -rf Makefile objs

build:
	cp *.h objs/
	mkdir -p objs/x86_objs/
	mkdir -p objs/arm_objs/
	cp Makefile.poptest_x86 objs/Makefile_x86
	cp Makefile.poptest_arm objs/Makefile_arm
	cp -Rvp objs/src/ objs/x86_objs/src
	cp -Rvp objs/src/ objs/arm_objs/src
	$(MAKE) -f objs/Makefile_x86
	$(MAKE) -f objs/Makefile_x86 manpage
	$(MAKE) -f objs/Makefile_arm
	$(MAKE) -f objs/Makefile_arm manpage

aligned:
	$(MAKE) -f objs/Makefile aligned

post_process:
	$(MAKE) -f objs/Makefile_arm post_process

install:
	$(MAKE) -f objs/Makefile install

upgrade:
	/usr/local/nginx/sbin/nginx -t

	kill -USR2 `cat /usr/local/nginx/logs/nginx.pid`
	sleep 1
	test -f /usr/local/nginx/logs/nginx.pid.oldbin

	kill -QUIT `cat /usr/local/nginx/logs/nginx.pid.oldbin`
