
FINAL_CFLAGS=-Wall -I. -O2 -DNDEBUG -std=c99
SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)
HDRS=$(wildcard *.h)
TARGET=sqlite-bench

UNAME_S := $(shell uname -s)
ifeq ($(UNAME_S),Darwin)
	LDFLAGS=-lpthread -ldl -lm
else
	LDFLAGS=-lpthread -ldl -lm -static
endif

###########
# AArch64 #
###########
include ./popcorn.mk

# Locations
ARM64_POPCORN := $(POPCORN)/aarch64
ARM64_BUILD   := build_aarch64

# Generated files
ARM64_ALIGNED     := sqlite-bench_aarch64
ARM64_VANILLA     := $(ARM64_BUILD)/$(ARM64_ALIGNED)
ARM64_OBJ         := $(SRC:.c=.o)
ARM64_MAP         := $(ARM64_BUILD)/map.txt
ARM64_LD_SCRIPT   := $(ARM64_BUILD)/aligned_linker_script_arm.x
ARM64_ALIGNED_MAP := $(ARM64_BUILD)/aligned_map.txt

# Flags
ARM64_TARGET  := aarch64-linux-gnu
ARM64_INC     := -isystem $(ARM64_POPCORN)/include
ARM64_LDFLAGS := -m aarch64linux -L$(ARM64_POPCORN)/lib -L$(ARM64_LIBGCC) \
                 $(addprefix $(ARM64_POPCORN),$(LIBS)) $(LIBGCC)
##########
# x86-64 #
##########

# Locations
X86_64_POPCORN  := $(POPCORN)/x86_64
X86_64_BUILD    := build_x86-64
X86_64_SD_BUILD := sd_x86-64

# Generated files
X86_64_ALIGNED     := sqlite-bench_x86-64
X86_64_VANILLA     := $(X86_64_BUILD)/$(X86_64_ALIGNED)
X86_64_OBJ         := $(SRC:.c=_x86_64.o)
X86_64_MAP         := $(X86_64_BUILD)/map.txt
X86_64_SD          := $(X86_64_SD_BUILD)/$(X86_64_ALIGNED)
X86_64_SD_OBJ      := $(addprefix $(X86_64_SD_BUILD)/,$(SRC:.c=.o))

X86_64_LD_SCRIPT   := $(X86_64_BUILD)/aligned_linker_script_x86.x
X86_64_ALIGNED_MAP := $(X86_64_BUILD)/aligned_map.txt

# Flags
X86_64_TARGET  := x86_64-linux-gnu
X86_64_INC     := -isystem $(X86_64_POPCORN)/include
X86_64_LDFLAGS := -m elf_x86_64 -L$(X86_64_POPCORN)/lib \
                  $(addprefix $(X86_64_POPCORN),$(LIBS)) \
                  --start-group --end-group


#end of popcorn


SQLITE_BENCH_OBJ=$(SRCS:.c=.o)
SQLITE_BENCHX86_OBJ=$(SRCS:.c=.o)
SQLITE_POPCORN_LD=$(LD) $(LDFLAGS)
SQLITE_BENCH_AARCH64=sqlite-bench-aarch64
SQLITE_BENCH_X86=sqlite-bench-x86
SQLITE_BENCH_AARCH64_ALIGNED=sqlite-bench_aarch64
SQLITE_BENCH_X86_ALIGNED=sqlite-bench_x86-64
FINAL_CFLAGS :=  $(FINAL_CFLAGS) $(X86_64_INC) 

.PHONY : all

all: $(SQLITE_BENCH_X86) post_process 

#$(TARGET): $(OBJS)
#	$(CC) $(OBJS) -o $(TARGET) $(LDFLAGS)

%.o : %.c 
	$(CC) $(FINAL_CFLAGS) -c $<

$(OBJS): $(HDRS)

bench: $(TARGET) clean-db
	./$(TARGET)

clean:
	rm -f $(TARGET) *.o
	rm -rf $(X86_64_BUILD)
	rm -rf $(ARM64_BUILD)
	rm -rf $(SQLITE_BENCH_X86_ALIGNED)
	rm -rf $(SQLITE_BENCH_AARCH64_ALIGNED)

clean-db:
	rm -f dbbench_sqlite3*

%.dir:
	@echo " [MKDIR] $*"
	@mkdir -p $*
	@touch $@

#$(SQLITE_BENCH_X86): $(SQLITE_BENCH_OBJ) $(X86_64_BUILD)/.dir
#mv *.o $(X86_64_BUILD)
#mv *.o $(ARM64_BUILD)
#$(SQLITE_BENCH_AARCH64): $(SQLITE_BENCH_OBJ) $(ARM64_BUILD)/.dir

# redis-server
$(SQLITE_BENCH_X86): FINAL_CFLAGS := $(X86_CFLAGS) $(FINAL_CFLAGS)
$(SQLITE_BENCH_X86): $(SQLITE_BENCHX86_OBJ) $(X86_64_BUILD)/.dir
	mv *.o $(X86_64_BUILD)
	$(SQLITE_POPCORN_LD) -o $(X86_64_BUILD)/$@ \
	$(addprefix $(X86_64_BUILD)/,$(SQLITE_BENCH_OBJ)) \
            $(X86_64_LDFLAGS) -Map $(X86_64_MAP)

$(SQLITE_BENCH_AARCH64): FINAL_CFLAGS := $(ARM_CFLAGS) $(FINAL_CFLAGS)
$(SQLITE_BENCH_AARCH64): $(SQLITE_BENCH_OBJ) $(ARM64_BUILD)/.dir
	mv *.o $(ARM64_BUILD)
	$(SQLITE_POPCORN_LD) -o $(ARM64_BUILD)/$@ \
	$(addprefix $(ARM64_BUILD)/,$(SQLITE_BENCH_OBJ)) \
	    $(ARM64_LDFLAGS)  -Map $(ARM64_MAP)

post_process: $(ARM64_ALIGNED) $(X86_64_ALIGNED)
	@echo " [POST_PROCESS] $^"
	@$(POST_PROCESS) -f $(ARM64_ALIGNED)
	@$(POST_PROCESS) -f $(X86_64_ALIGNED)

$(X86_64_ALIGNED): $(X86_64_LD_SCRIPT)
	@echo " [LD] $@ (aligned)"
	$(SQLITE_POPCORN_LD) -o $(SQLITE_BENCH_X86_ALIGNED) $(addprefix $(X86_64_BUILD)/,$(SQLITE_BENCH_OBJ)) $(X86_64_LDFLAGS) -Map $(X86_64_ALIGNED_MAP) -T $<

$(ARM64_ALIGNED): $(ARM64_LD_SCRIPT)
	@echo "a [LD] $@ (aligned)"
	$(SQLITE_POPCORN_LD) -o $(SQLITE_BENCH_AARCH64_ALIGNED) \
	$(addprefix $(ARM64_BUILD)/,$(SQLITE_BENCH_OBJ)) \
	$(ARM64_LDFLAGS) -Map $(ARM64_ALIGNED_MAP) -T $<

$(ARM64_LD_SCRIPT):
	@echo " [ALIGN] $@"
	@$(ALIGN) --compiler-inst $(POPCORN) --x86-bin $(X86_64_BUILD)/$(SQLITE_BENCH_X86) --arm-bin $(ARM64_BUILD)/$(SQLITE_BENCH_AARCH64) --x86-map $(X86_64_MAP) --arm-map $(ARM64_MAP) --output-x86-ls $(X86_64_LD_SCRIPT)     --output-arm-ls $(ARM64_LD_SCRIPT)
	@echo " Done Alignment!!!"

$(X86_64_LD_SCRIPT): $(ARM64_LD_SCRIPT)
	@echo " [ALIGN] $@"

