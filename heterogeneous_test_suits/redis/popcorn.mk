# ====================================
# Popcorn Compiler Env (header file)
# ====================================

# Popcorn Compiler Installation Path
POPCORN := /usr/local/popcorn

# FIXME directory of libgcc & libgcc_eh for aarch64 compiler
ARM64_LIBGCC := $(shell dirname \
                $(shell aarch64-linux-gnu-gcc -print-libgcc-file-name))

CC         := $(POPCORN)/bin/clang
CXX        := $(POPCORN)/bin/clang++
X86_CFLAGS     := -O0 -Wall -nostdinc -g -target x86_64 -popcorn-alignment -fno-common -ftls-model=initial-exec
ARM_CFLAGS     := -O0 -Wall -nostdinc -g -target aarch64 -popcorn-alignment -fno-common -ftls-model=initial-exec
HET_CFLAGS := $(X86_CFLAGS) -popcorn-migratable -fno-common \
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
