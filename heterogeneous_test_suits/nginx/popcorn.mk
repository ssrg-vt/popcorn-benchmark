# ====================================
# Popcorn Compiler Env (header file)
# ====================================
POPCORN := /usr/local/popcorn

# FIXME directory of libgcc & libgcc_eh for aarch64 compiler
ARM64_LIBGCC := $(shell dirname \
                $(shell aarch64-linux-gnu-gcc -print-libgcc-file-name))

CC         := $(POPCORN)/bin/clang
CXX        := $(POPCORN)/bin/clang++

HET_CFLAGS := $(CFLAGS) -popcorn-migratable -fno-common \
              -ftls-model=initial-exec
IR := $(SRC:.c=.ll)

# Linker
## Default linker for LLVM/Clang 9.0
LD      := $(POPCORN)/bin/x86_64-popcorn-linux-gnu-ld.gold
ifeq ($(LLVM), 3.7)
LD      := $(POPCORN)/bin/ld.gold
endif

LDFLAGS := -z relro -z noexecstack --hash-style=gnu --build-id -static
LIBS    := /lib/crt1.o \
           /lib/libc.a \
           /lib/libmigrate.a \
           /lib/libstack-transform.a \
           /lib/libelf.a \
           /lib/libpthread.a \
           /lib/libc.a \
           /lib/libm.a
LIBGCC  := --start-group -lgcc -lgcc_eh --end-group

# Non Popcorn different architectures
ARM_OBJ_DIR := arm_objs
X86_OBJ_DIR := x86_objs

# Alignment
ALIGN          := $(POPCORN)/bin/pyalign

# Post-processing & checking
POST_PROCESS   := $(POPCORN)/bin/gen-stackinfo
ALIGN_CHECK    := $(POPCORN)/bin/check-align.py
STACKMAP_CHECK := $(POPCORN)/bin/check-stackmaps

###########
# AArch64 #
###########

# Locations
ARM64_POPCORN := $(POPCORN)/aarch64
ARM64_BUILD   := build_aarch64

# Generated files
ARM64_ALIGNED     := objs/$(ARM_OBJ_DIR)/nginx_aarch64
ARM64_VANILLA     := $(ARM64_BUILD)/$(ARM64_ALIGNED)
ARM64_OBJ         := $(SRC:.c=.o)
ARM64_MAP         := objs/$(ARM_OBJ_DIR)/$(ARM64_BUILD)/map.txt
ARM64_LD_SCRIPT   := objs/$(ARM_OBJ_DIR)/$(ARM64_BUILD)/aligned_linker_script_arm.x
ARM64_ALIGNED_MAP := objs/$(ARM_OBJ_DIR)/$(ARM64_BUILD)/aligned_map.txt

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
X86_64_ALIGNED     := objs/$(X86_OBJ_DIR)/nginx_x86-64
X86_64_VANILLA     := $(X86_64_BUILD)/$(X86_64_ALIGNED)
X86_64_OBJ         := $(SRC:.c=_x86_64.o)
X86_64_MAP         := objs/$(X86_OBJ_DIR)/$(X86_64_BUILD)/map.txt
X86_64_SD          := $(X86_64_SD_BUILD)/$(X86_64_ALIGNED)
X86_64_SD_OBJ      := $(addprefix $(X86_64_SD_BUILD)/,$(SRC:.c=.o))
X86_64_LD_SCRIPT   := objs/$(X86_OBJ_DIR)/$(X86_64_BUILD)/aligned_linker_script_x86.x
X86_64_ALIGNED_MAP := objs/$(X86_OBJ_DIR)/$(X86_64_BUILD)/aligned_map.txt

# Flags
X86_64_TARGET  := x86_64-linux-gnu
X86_64_INC     := -isystem $(X86_64_POPCORN)/include
X86_64_LDFLAGS := -m elf_x86_64 -L$(X86_64_POPCORN)/lib \
                  $(addprefix $(X86_64_POPCORN),$(LIBS)) \
                  --start-group --end-group
