cp objs/x86_objs/nginx_x86-64 objs/arm_objs/nginx_aarch64 src /home/sengming/PopcornVM/deploy/nginx/
rsync -rv objs/arm_objs/nginx_aarch64 objs/x86_objs/nginx_x86-64 src sengming@10.4.4.36:/home/sengming/PopcornVM/deploy/nginx
