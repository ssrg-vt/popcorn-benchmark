###############################################################################
#                                                                             #
#                                  FIXME's                                    #
#                                                                             #
#   Fill in these variables with system & application-specific information.   #
#                                                                             #
###############################################################################

# FIXME directory of Popcorn compiler installation
POPCORN := /usr/local/popcorn
BIN := is


APP_DIR := $(shell pwd)

###############################################################################
#                  Compiler toolchain & command-line flags                    #
###############################################################################

# Compiler
CC         := gcc
CXX        := clang++


SRC :=$(wildcard *.c)

OBJS := $(patsubst %.c,%.o,$(SRC))

SOLIBS := -pthread -lpthread -lcrypt -lpcre -lcrypto -lcrypto -lz -lc

all: $(OBJS)
	$(CC) $(OBJS)  -o  $(BIN) -lm -L../ -static -l:libmigrate.a 	
	

clean:
	rm *.o $(BIN)

