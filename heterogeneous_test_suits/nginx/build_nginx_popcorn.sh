# The script to build Nginx using Popcorn Compiler
CC=/usr/local/popcorn/bin/clang ./configure --without-http_rewrite_module \
    --without-pcre --without-http_gzip_module

make -f Makefile.popcorn -j8 $1