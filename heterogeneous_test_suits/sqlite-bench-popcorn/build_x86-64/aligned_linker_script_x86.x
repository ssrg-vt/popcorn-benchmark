/* Default linker script, for normal executables */
/* Copyright (C) 2014 Free Software Foundation, Inc.
   Copying and distribution of this script, with or without modification,
   are permitted in any medium without royalty provided the copyright
   notice and this notice are preserved.  */
OUTPUT_FORMAT("elf64-x86-64", "elf64-x86-64",
	      "elf64-x86-64")
OUTPUT_ARCH(i386:x86-64)
ENTRY(_start)
/*SEARCH_DIR("/usr/local/x86_64-unknown-linux-gnu/lib64"); SEARCH_DIR("/usr/local/lib64"); SEARCH_DIR("/lib64"); SEARCH_DIR("/usr/lib64"); SEARCH_DIR("/usr/local/x86_64-unknown-linux-gnu/lib"); SEARCH_DIR("/usr/local/lib"); SEARCH_DIR("/lib"); SEARCH_DIR("/usr/lib");*/
SECTIONS
{
  /* Read-only sections, merged into text segment: */
  PROVIDE (__executable_start = SEGMENT_START("text-segment", 0x400000)); . = SEGMENT_START("text-segment", 0x400000) + SIZEOF_HEADERS;
  .interp         : { *(.interp) }
/*  .note.gnu.build-id : { *(.note.gnu.build-id) }*/
  .hash           : { *(.hash) }
  .gnu.hash       : { *(.gnu.hash) }
  .dynsym         : { *(.dynsym) }
  .dynstr         : { *(.dynstr) }
  .gnu.version    : { *(.gnu.version) }
  .gnu.version_d  : { *(.gnu.version_d) }
  .gnu.version_r  : { *(.gnu.version_r) }
  .rela.init      : { *(.rela.init) }
  .rela.text      : { *(.rela.text .rela.text.* .rela.gnu.linkonce.t.*) }
  .rela.fini      : { *(.rela.fini) }
  .rela.rodata    : { *(.rela.rodata .rela.rodata.* .rela.gnu.linkonce.r.*) }
  .rela.data.rel.ro   : { *(.rela.data.rel.ro .rela.data.rel.ro.* .rela.gnu.linkonce.d.rel.ro.*) }
  .rela.data      : { *(.rela.data .rela.data.* .rela.gnu.linkonce.d.*) }
  .rela.tdata	  : { *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*) }
  .rela.tbss	  : { *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*) }
  .rela.ctors     : { *(.rela.ctors) }
  .rela.dtors     : { *(.rela.dtors) }
  .rela.got       : { *(.rela.got) }
  .rela.bss       : { *(.rela.bss .rela.bss.* .rela.gnu.linkonce.b.*) }
  .rela.ldata     : { *(.rela.ldata .rela.ldata.* .rela.gnu.linkonce.l.*) }
  .rela.lbss      : { *(.rela.lbss .rela.lbss.* .rela.gnu.linkonce.lb.*) }
  .rela.lrodata   : { *(.rela.lrodata .rela.lrodata.* .rela.gnu.linkonce.lr.*) }
  .rela.ifunc     : { *(.rela.ifunc) }
  .rela.plt       :
    {
      *(.rela.plt)
      PROVIDE_HIDDEN (__rela_iplt_start = .);
      *(.rela.iplt)
      PROVIDE_HIDDEN (__rela_iplt_end = .);
    }
  .init           :
  {
 /*   KEEP (*(SORT_NONE(.init)))*/
  }
  .plt            : ALIGN(16) { *(.plt) *(.iplt) }
  .plt.bnd        : { *(.plt.bnd) }

.text	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x4); /* align for .text.exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(exit.o)"(.text.exit); /* size 0x1d */
	. = . + 0x7; /* padding after .text.exit */
	. = ALIGN(0x10); /* align for .text.finished_single_op */
	"build_x86-64/benchmark.o"(.text.finished_single_op); /* size 0x18f */
	. = . + 0x35; /* padding after .text.finished_single_op */
	. = ALIGN(0x10); /* align for .text.benchmark_init */
	"build_x86-64/benchmark.o"(.text.benchmark_init); /* size 0xff */
	. = . + 0x19; /* padding after .text.benchmark_init */
	. = ALIGN(0x10); /* align for .text.benchmark_fini */
	"build_x86-64/benchmark.o"(.text.benchmark_fini); /* size 0x35 */
	. = . + 0xb; /* padding after .text.benchmark_fini */
	. = ALIGN(0x10); /* align for .text.benchmark_run */
	"build_x86-64/benchmark.o"(.text.benchmark_run); /* size 0x66d */
	. = ALIGN(0x10); /* align for .text.benchmark_open */
	"build_x86-64/benchmark.o"(.text.benchmark_open); /* size 0x1de */
	. = . + 0x1e; /* padding after .text.benchmark_open */
	. = ALIGN(0x10); /* align for .text.benchmark_write */
	"build_x86-64/benchmark.o"(.text.benchmark_write); /* size 0x42d */
	. = ALIGN(0x10); /* align for .text.benchmark_read */
	"build_x86-64/benchmark.o"(.text.benchmark_read); /* size 0x241 */
	. = . + 0xb; /* padding after .text.benchmark_read */
	. = ALIGN(0x10); /* align for .text.histogram_clear */
	"build_x86-64/histogram.o"(.text.histogram_clear); /* size 0x23 */
	. = . + 0xd; /* padding after .text.histogram_clear */
	. = ALIGN(0x10); /* align for .text.histogram_add */
	"build_x86-64/histogram.o"(.text.histogram_add); /* size 0xa3 */
	. = ALIGN(0x10); /* align for .text.histogram_merge */
	"build_x86-64/histogram.o"(.text.histogram_merge); /* size 0x183 */
	. = ALIGN(0x10); /* align for .text.histogram_to_string */
	"build_x86-64/histogram.o"(.text.histogram_to_string); /* size 0x41f */
	. = ALIGN(0x10); /* align for .text.init */
	"build_x86-64/main.o"(.text.init); /* size 0x82 */
	. = . + 0x12; /* padding after .text.init */
	. = ALIGN(0x10); /* align for .text.print_usage */
	"build_x86-64/main.o"(.text.print_usage); /* size 0x2cd */
	. = . + 0x27; /* padding after .text.print_usage */
	. = ALIGN(0x10); /* align for .text.main */
	"build_x86-64/main.o"(.text.main); /* size 0x393 */
	. = . + 0x8d; /* padding after .text.main */
	. = ALIGN(0x10); /* align for .text.rand_init */
	"build_x86-64/random.o"(.text.rand_init); /* size 0x20 */
	. = . + 0x4; /* padding after .text.rand_init */
	. = ALIGN(0x10); /* align for .text.rand_next */
	"build_x86-64/random.o"(.text.rand_next); /* size 0x2b */
	. = . + 0x9; /* padding after .text.rand_next */
	. = ALIGN(0x10); /* align for .text.rand_uniform */
	"build_x86-64/random.o"(.text.rand_uniform); /* size 0x31 */
	. = . + 0xb; /* padding after .text.rand_uniform */
	. = ALIGN(0x10); /* align for .text.rand_gen_init */
	"build_x86-64/random.o"(.text.rand_gen_init); /* size 0x15c */
	. = . + 0xc; /* padding after .text.rand_gen_init */
	. = ALIGN(0x10); /* align for .text.rand_gen_generate */
	"build_x86-64/random.o"(.text.rand_gen_generate); /* size 0x5a */
	. = . + 0xe; /* padding after .text.rand_gen_generate */
	. = ALIGN(0x10); /* align for .text.raw_clear */
	"build_x86-64/raw.o"(.text.raw_clear); /* size 0x3e */
	. = . + 0xe; /* padding after .text.raw_clear */
	. = ALIGN(0x10); /* align for .text.raw_add */
	"build_x86-64/raw.o"(.text.raw_add); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.raw_to_string */
	"build_x86-64/raw.o"(.text.raw_to_string); /* size 0xf8 */
	. = . + 0x10; /* padding after .text.raw_to_string */
	. = ALIGN(0x10); /* align for .text.raw_print */
	"build_x86-64/raw.o"(.text.raw_print); /* size 0x91 */
	. = . + 0x1b; /* padding after .text.raw_print */
	. = ALIGN(0x10); /* align for .text.sqlite3_status64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_status64); /* size 0xb4 */
	. = . + 0x30; /* padding after .text.sqlite3_status64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_mutex_enter */
	"build_x86-64/sqlite3.o"(.text.sqlite3_mutex_enter); /* size 0x12 */
	. = . + 0x2; /* padding after .text.sqlite3_mutex_enter */
	. = ALIGN(0x10); /* align for .text.sqlite3_mutex_leave */
	"build_x86-64/sqlite3.o"(.text.sqlite3_mutex_leave); /* size 0x12 */
	. = . + 0x2; /* padding after .text.sqlite3_mutex_leave */
	. = ALIGN(0x10); /* align for .text.sqlite3_status */
	"build_x86-64/sqlite3.o"(.text.sqlite3_status); /* size 0xbd */
	. = . + 0x2b; /* padding after .text.sqlite3_status */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_status */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_status); /* size 0x4e6 */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeLeaveAll */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeLeaveAll); /* size 0x12 */
	. = ALIGN(0x10); /* align for .text.sqlite3_msize */
	"build_x86-64/sqlite3.o"(.text.sqlite3_msize); /* size 0x16 */
	. = . + 0xe; /* padding after .text.sqlite3_msize */
	. = ALIGN(0x10); /* align for .text.sqlite3DeleteTrigger */
	"build_x86-64/sqlite3.o"(.text.sqlite3DeleteTrigger); /* size 0x154 */
	. = . + 0x38; /* padding after .text.sqlite3DeleteTrigger */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeClearObject */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeClearObject); /* size 0x56b */
	. = . + 0x49; /* padding after .text.sqlite3VdbeClearObject */
	. = ALIGN(0x10); /* align for .text.sqlite3DbFree */
	"build_x86-64/sqlite3.o"(.text.sqlite3DbFree); /* size 0xc0 */
	. = . + 0x38; /* padding after .text.sqlite3DbFree */
	. = ALIGN(0x10); /* align for .text.sqlite3_vfs_find */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vfs_find); /* size 0x95 */
	. = . + 0x23; /* padding after .text.sqlite3_vfs_find */
	. = ALIGN(0x10); /* align for .text.sqlite3_initialize */
	"build_x86-64/sqlite3.o"(.text.sqlite3_initialize); /* size 0xaea */
	. = ALIGN(0x10); /* align for .text.sqlite3_vfs_register */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vfs_register); /* size 0xe2 */
	. = . + 0x26; /* padding after .text.sqlite3_vfs_register */
	. = ALIGN(0x10); /* align for .text.sqlite3_vfs_unregister */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vfs_unregister); /* size 0xa1 */
	. = . + 0x33; /* padding after .text.sqlite3_vfs_unregister */
	. = ALIGN(0x10); /* align for .text.sqlite3_mutex_alloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3_mutex_alloc); /* size 0xad */
	. = . + 0x1b; /* padding after .text.sqlite3_mutex_alloc */
	. = ALIGN(0x10); /* align for .text.sqlite3_mutex_free */
	"build_x86-64/sqlite3.o"(.text.sqlite3_mutex_free); /* size 0x12 */
	. = . + 0x2; /* padding after .text.sqlite3_mutex_free */
	. = ALIGN(0x10); /* align for .text.sqlite3_mutex_try */
	"build_x86-64/sqlite3.o"(.text.sqlite3_mutex_try); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.sqlite3_release_memory */
	"build_x86-64/sqlite3.o"(.text.sqlite3_release_memory); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sqlite3_memory_alarm */
	"build_x86-64/sqlite3.o"(.text.sqlite3_memory_alarm); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sqlite3_soft_heap_limit64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_soft_heap_limit64); /* size 0xa0 */
	. = . + 0x40; /* padding after .text.sqlite3_soft_heap_limit64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_memory_used */
	"build_x86-64/sqlite3.o"(.text.sqlite3_memory_used); /* size 0x3d */
	. = . + 0x27; /* padding after .text.sqlite3_memory_used */
	. = ALIGN(0x10); /* align for .text.sqlite3_soft_heap_limit */
	"build_x86-64/sqlite3.o"(.text.sqlite3_soft_heap_limit); /* size 0x8b */
	. = . + 0x2d; /* padding after .text.sqlite3_soft_heap_limit */
	. = ALIGN(0x10); /* align for .text.sqlite3_memory_highwater */
	"build_x86-64/sqlite3.o"(.text.sqlite3_memory_highwater); /* size 0x58 */
	. = . + 0x1c; /* padding after .text.sqlite3_memory_highwater */
	. = ALIGN(0x10); /* align for .text.sqlite3_malloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3_malloc); /* size 0x2c */
	. = . + 0x14; /* padding after .text.sqlite3_malloc */
	. = ALIGN(0x10); /* align for .text.sqlite3Malloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3Malloc); /* size 0x12d */
	. = . + 0x77; /* padding after .text.sqlite3Malloc */
	. = ALIGN(0x10); /* align for .text.sqlite3_malloc64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_malloc64); /* size 0x29 */
	. = . + 0xf; /* padding after .text.sqlite3_malloc64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_free */
	"build_x86-64/sqlite3.o"(.text.sqlite3_free); /* size 0x7a */
	. = . + 0x3a; /* padding after .text.sqlite3_free */
	. = ALIGN(0x10); /* align for .text.sqlite3MallocSize */
	"build_x86-64/sqlite3.o"(.text.sqlite3MallocSize); /* size 0xb */
	. = . + 0x1; /* padding after .text.sqlite3MallocSize */
	. = ALIGN(0x10); /* align for .text.sqlite3_realloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3_realloc); /* size 0x2f */
	. = . + 0x11; /* padding after .text.sqlite3_realloc */
	. = ALIGN(0x10); /* align for .text.sqlite3Realloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3Realloc); /* size 0x20b */
	. = . + 0xa5; /* padding after .text.sqlite3Realloc */
	. = ALIGN(0x10); /* align for .text.sqlite3_realloc64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_realloc64); /* size 0x2c */
	. = . + 0x14; /* padding after .text.sqlite3_realloc64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_vappendf */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_vappendf); /* size 0x2712 */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_append */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_append); /* size 0x2e */
	. = . + 0xa; /* padding after .text.sqlite3_str_append */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_appendchar */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_appendchar); /* size 0x5b */
	. = . + 0x19; /* padding after .text.sqlite3_str_appendchar */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_appendall */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_appendall); /* size 0x5d */
	. = . + 0x23; /* padding after .text.sqlite3_str_appendall */
	. = ALIGN(0x10); /* align for .text.sqlite3StrAccumEnlarge */
	"build_x86-64/sqlite3.o"(.text.sqlite3StrAccumEnlarge); /* size 0x210 */
	. = . + 0x40; /* padding after .text.sqlite3StrAccumEnlarge */
	. = ALIGN(0x10); /* align for .text.enlargeAndAppend */
	"build_x86-64/sqlite3.o"(.text.enlargeAndAppend); /* size 0x3f */
	. = . + 0x21; /* padding after .text.enlargeAndAppend */
	. = ALIGN(0x10); /* align for .text.sqlite3Strlen30 */
	"build_x86-64/sqlite3.o"(.text.sqlite3Strlen30); /* size 0x18 */
	. = . + 0x4; /* padding after .text.sqlite3Strlen30 */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_finish */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_finish); /* size 0xbb */
	. = . + 0x45; /* padding after .text.sqlite3_str_finish */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_errcode */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_errcode); /* size 0x15 */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_length */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_length); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_value */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_value); /* size 0x23 */
	. = . + 0x1; /* padding after .text.sqlite3_str_value */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_reset */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_reset); /* size 0x3c */
	. = . + 0x8; /* padding after .text.sqlite3_str_reset */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_new */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_new); /* size 0x62 */
	. = ALIGN(0x10); /* align for .text.sqlite3_vmprintf */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vmprintf); /* size 0x8c */
	. = . + 0x10; /* padding after .text.sqlite3_vmprintf */
	. = ALIGN(0x10); /* align for .text.sqlite3_mprintf */
	"build_x86-64/sqlite3.o"(.text.sqlite3_mprintf); /* size 0x10c */
	. = ALIGN(0x10); /* align for .text.sqlite3_vsnprintf */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vsnprintf); /* size 0x4d */
	. = . + 0x17; /* padding after .text.sqlite3_vsnprintf */
	. = ALIGN(0x10); /* align for .text.sqlite3_snprintf */
	"build_x86-64/sqlite3.o"(.text.sqlite3_snprintf); /* size 0xbd */
	. = ALIGN(0x10); /* align for .text.sqlite3_log */
	"build_x86-64/sqlite3.o"(.text.sqlite3_log); /* size 0x119 */
	. = ALIGN(0x10); /* align for .text.sqlite3_str_appendf */
	"build_x86-64/sqlite3.o"(.text.sqlite3_str_appendf); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.sqlite3_randomness */
	"build_x86-64/sqlite3.o"(.text.sqlite3_randomness); /* size 0x2f3 */
	. = ALIGN(0x10); /* align for .text.sqlite3_stricmp */
	"build_x86-64/sqlite3.o"(.text.sqlite3_stricmp); /* size 0x77 */
	. = ALIGN(0x10); /* align for .text.sqlite3_strnicmp */
	"build_x86-64/sqlite3.o"(.text.sqlite3_strnicmp); /* size 0x76 */
	. = . + 0xa; /* padding after .text.sqlite3_strnicmp */
	. = ALIGN(0x10); /* align for .text.sqlite3_os_init */
	"build_x86-64/sqlite3.o"(.text.sqlite3_os_init); /* size 0x140 */
	. = . + 0x40; /* padding after .text.sqlite3_os_init */
	. = ALIGN(0x10); /* align for .text.unixOpen */
	"build_x86-64/sqlite3.o"(.text.unixOpen); /* size 0xae5 */
	. = ALIGN(0x10); /* align for .text.unixDelete */
	"build_x86-64/sqlite3.o"(.text.unixDelete); /* size 0x12c */
	. = . + 0x1c; /* padding after .text.unixDelete */
	. = ALIGN(0x10); /* align for .text.unixAccess */
	"build_x86-64/sqlite3.o"(.text.unixAccess); /* size 0x59 */
	. = . + 0x1f; /* padding after .text.unixAccess */
	. = ALIGN(0x10); /* align for .text.unixFullPathname */
	"build_x86-64/sqlite3.o"(.text.unixFullPathname); /* size 0x4bb */
	. = . + 0x1; /* padding after .text.unixFullPathname */
	. = ALIGN(0x10); /* align for .text.unixDlOpen */
	"build_x86-64/sqlite3.o"(.text.unixDlOpen); /* size 0x12 */
	. = ALIGN(0x10); /* align for .text.unixDlError */
	"build_x86-64/sqlite3.o"(.text.unixDlError); /* size 0x57 */
	. = . + 0x21; /* padding after .text.unixDlError */
	. = ALIGN(0x10); /* align for .text.unixDlSym */
	"build_x86-64/sqlite3.o"(.text.unixDlSym); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.unixDlClose */
	"build_x86-64/sqlite3.o"(.text.unixDlClose); /* size 0xd */
	. = ALIGN(0x10); /* align for .text.unixRandomness */
	"build_x86-64/sqlite3.o"(.text.unixRandomness); /* size 0x139 */
	. = . + 0x53; /* padding after .text.unixRandomness */
	. = ALIGN(0x10); /* align for .text.unixSleep */
	"build_x86-64/sqlite3.o"(.text.unixSleep); /* size 0x37 */
	. = . + 0x15; /* padding after .text.unixSleep */
	. = ALIGN(0x10); /* align for .text.unixCurrentTime */
	"build_x86-64/sqlite3.o"(.text.unixCurrentTime); /* size 0x65 */
	. = . + 0x1f; /* padding after .text.unixCurrentTime */
	. = ALIGN(0x10); /* align for .text.unixGetLastError */
	"build_x86-64/sqlite3.o"(.text.unixGetLastError); /* size 0xd */
	. = . + 0xb; /* padding after .text.unixGetLastError */
	. = ALIGN(0x10); /* align for .text.unixCurrentTimeInt64 */
	"build_x86-64/sqlite3.o"(.text.unixCurrentTimeInt64); /* size 0x57 */
	. = . + 0x19; /* padding after .text.unixCurrentTimeInt64 */
	. = ALIGN(0x10); /* align for .text.unixSetSystemCall */
	"build_x86-64/sqlite3.o"(.text.unixSetSystemCall); /* size 0xb6 */
	. = . + 0x26; /* padding after .text.unixSetSystemCall */
	. = ALIGN(0x10); /* align for .text.unixGetSystemCall */
	"build_x86-64/sqlite3.o"(.text.unixGetSystemCall); /* size 0x50 */
	. = . + 0x14; /* padding after .text.unixGetSystemCall */
	. = ALIGN(0x10); /* align for .text.unixNextSystemCall */
	"build_x86-64/sqlite3.o"(.text.unixNextSystemCall); /* size 0x81 */
	. = . + 0x1b; /* padding after .text.unixNextSystemCall */
	. = ALIGN(0x10); /* align for .text.sqlite3_os_end */
	"build_x86-64/sqlite3.o"(.text.sqlite3_os_end); /* size 0x13 */
	. = ALIGN(0x10); /* align for .text.sqlite3_enable_shared_cache */
	"build_x86-64/sqlite3.o"(.text.sqlite3_enable_shared_cache); /* size 0xe */
	. = . + 0x2; /* padding after .text.sqlite3_enable_shared_cache */
	. = ALIGN(0x10); /* align for .text.sqlite3_backup_init */
	"build_x86-64/sqlite3.o"(.text.sqlite3_backup_init); /* size 0x198 */
	. = . + 0x60; /* padding after .text.sqlite3_backup_init */
	. = ALIGN(0x10); /* align for .text.sqlite3ErrorWithMsg */
	"build_x86-64/sqlite3.o"(.text.sqlite3ErrorWithMsg); /* size 0x28e */
	. = ALIGN(0x10); /* align for .text.findBtree */
	"build_x86-64/sqlite3.o"(.text.findBtree); /* size 0x221 */
	. = . + 0x1f; /* padding after .text.findBtree */
	. = ALIGN(0x10); /* align for .text.sqlite3_backup_step */
	"build_x86-64/sqlite3.o"(.text.sqlite3_backup_step); /* size 0x7ad */
	. = . + 0x8f; /* padding after .text.sqlite3_backup_step */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeBeginTrans */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeBeginTrans); /* size 0x98e */
	. = . + 0x66; /* padding after .text.sqlite3BtreeBeginTrans */
	. = ALIGN(0x10); /* align for .text.backupOnePage */
	"build_x86-64/sqlite3.o"(.text.backupOnePage); /* size 0x1f8 */
	. = . + 0x5c; /* padding after .text.backupOnePage */
	. = ALIGN(0x10); /* align for .text.sqlite3ResetAllSchemasOfConnection */
	"build_x86-64/sqlite3.o"(.text.sqlite3ResetAllSchemasOfConnection); /* size 0x7f */
	. = . + 0x19; /* padding after .text.sqlite3ResetAllSchemasOfConnection */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeSetVersion */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeSetVersion); /* size 0xdd */
	. = . + 0x33; /* padding after .text.sqlite3BtreeSetVersion */
	. = ALIGN(0x10); /* align for .text.sqlite3PagerCommitPhaseOne */
	"build_x86-64/sqlite3.o"(.text.sqlite3PagerCommitPhaseOne); /* size 0x73b */
	. = . + 0xd; /* padding after .text.sqlite3PagerCommitPhaseOne */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeCommitPhaseTwo */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeCommitPhaseTwo); /* size 0x141 */
	. = . + 0x43; /* padding after .text.sqlite3BtreeCommitPhaseTwo */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeCommitPhaseOne */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeCommitPhaseOne); /* size 0x394 */
	. = . + 0x44; /* padding after .text.sqlite3BtreeCommitPhaseOne */
	. = ALIGN(0x10); /* align for .text.sqlite3_backup_finish */
	"build_x86-64/sqlite3.o"(.text.sqlite3_backup_finish); /* size 0x16c */
	. = . + 0x6c; /* padding after .text.sqlite3_backup_finish */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeRollback */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeRollback); /* size 0x122 */
	. = . + 0x36; /* padding after .text.sqlite3BtreeRollback */
	. = ALIGN(0x10); /* align for .text.sqlite3LeaveMutexAndCloseZombie */
	"build_x86-64/sqlite3.o"(.text.sqlite3LeaveMutexAndCloseZombie); /* size 0xa00 */
	. = . + 0x134; /* padding after .text.sqlite3LeaveMutexAndCloseZombie */
	. = ALIGN(0x10); /* align for .text.sqlite3_backup_remaining */
	"build_x86-64/sqlite3.o"(.text.sqlite3_backup_remaining); /* size 0x9 */
	. = ALIGN(0x10); /* align for .text.sqlite3_backup_pagecount */
	"build_x86-64/sqlite3.o"(.text.sqlite3_backup_pagecount); /* size 0x9 */
	. = ALIGN(0x10); /* align for .text.sqlite3_expired */
	"build_x86-64/sqlite3.o"(.text.sqlite3_expired); /* size 0x1d */
	. = ALIGN(0x10); /* align for .text.sqlite3_finalize */
	"build_x86-64/sqlite3.o"(.text.sqlite3_finalize); /* size 0x1f9 */
	. = . + 0x33; /* padding after .text.sqlite3_finalize */
	. = ALIGN(0x10); /* align for .text.invokeProfileCallback */
	"build_x86-64/sqlite3.o"(.text.invokeProfileCallback); /* size 0xaf */
	. = . + 0x15; /* padding after .text.invokeProfileCallback */
	. = ALIGN(0x10); /* align for .text.sqlite3_reset */
	"build_x86-64/sqlite3.o"(.text.sqlite3_reset); /* size 0xb2 */
	. = . + 0x16; /* padding after .text.sqlite3_reset */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeReset */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeReset); /* size 0x93 */
	. = . + 0x11; /* padding after .text.sqlite3VdbeReset */
	. = ALIGN(0x10); /* align for .text.sqlite3_clear_bindings */
	"build_x86-64/sqlite3.o"(.text.sqlite3_clear_bindings); /* size 0xb5 */
	. = . + 0x2b; /* padding after .text.sqlite3_clear_bindings */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_blob */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_blob); /* size 0xad */
	. = . + 0x2b; /* padding after .text.sqlite3_value_blob */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_text */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_text); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_bytes */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_bytes); /* size 0x40 */
	. = . + 0x14; /* padding after .text.sqlite3_value_bytes */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_bytes16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_bytes16); /* size 0x40 */
	. = . + 0x14; /* padding after .text.sqlite3_value_bytes16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_double */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_double); /* size 0x2c */
	. = . + 0xc; /* padding after .text.sqlite3_value_double */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_int */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_int); /* size 0x2f */
	. = . + 0x25; /* padding after .text.sqlite3_value_int */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_int64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_int64); /* size 0x2d */
	. = . + 0x7; /* padding after .text.sqlite3_value_int64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_subtype */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_subtype); /* size 0x15 */
	. = . + 0x3; /* padding after .text.sqlite3_value_subtype */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_pointer */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_pointer); /* size 0x46 */
	. = . + 0x16; /* padding after .text.sqlite3_value_pointer */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_text16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_text16); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_text16be */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_text16be); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_text16le */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_text16le); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_type */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_type); /* size 0x14 */
	. = . + 0x4; /* padding after .text.sqlite3_value_type */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_nochange */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_nochange); /* size 0x1b */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_dup */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_dup); /* size 0x1d7 */
	. = . + 0x41; /* padding after .text.sqlite3_value_dup */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_free */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_free); /* size 0xd8 */
	. = . + 0x44; /* padding after .text.sqlite3_value_free */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_blob */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_blob); /* size 0x49 */
	. = . + 0x17; /* padding after .text.sqlite3_result_blob */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_blob64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_blob64); /* size 0x6e */
	. = . + 0x1a; /* padding after .text.sqlite3_result_blob64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_double */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_double); /* size 0x5a */
	. = . + 0x22; /* padding after .text.sqlite3_result_double */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_error */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_error); /* size 0x20 */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMemSetStr */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMemSetStr); /* size 0x340 */
	. = . + 0x40; /* padding after .text.sqlite3VdbeMemSetStr */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_error16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_error16); /* size 0x20 */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_int */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_int); /* size 0x21 */
	. = . + 0xb; /* padding after .text.sqlite3_result_int */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_int64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_int64); /* size 0x1e */
	. = . + 0xa; /* padding after .text.sqlite3_result_int64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_null */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_null); /* size 0x1b */
	. = . + 0x9; /* padding after .text.sqlite3_result_null */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_pointer */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_pointer); /* size 0x61 */
	. = . + 0x2b; /* padding after .text.sqlite3_result_pointer */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_subtype */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_subtype); /* size 0x11 */
	. = . + 0x7; /* padding after .text.sqlite3_result_subtype */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_text */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_text); /* size 0x4c */
	. = . + 0x14; /* padding after .text.sqlite3_result_text */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_text64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_text64); /* size 0x81 */
	. = . + 0x17; /* padding after .text.sqlite3_result_text64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_text16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_text16); /* size 0x4c */
	. = . + 0x14; /* padding after .text.sqlite3_result_text16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_text16be */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_text16be); /* size 0x4c */
	. = . + 0x14; /* padding after .text.sqlite3_result_text16be */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_text16le */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_text16le); /* size 0x4c */
	. = . + 0x14; /* padding after .text.sqlite3_result_text16le */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_value */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_value); /* size 0xdf */
	. = . + 0x29; /* padding after .text.sqlite3_result_value */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_zeroblob */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_zeroblob); /* size 0x4a */
	. = . + 0x16; /* padding after .text.sqlite3_result_zeroblob */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_zeroblob64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_zeroblob64); /* size 0x5d */
	. = . + 0x1f; /* padding after .text.sqlite3_result_zeroblob64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_error_code */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_error_code); /* size 0x7d */
	. = . + 0x23; /* padding after .text.sqlite3_result_error_code */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_error_toobig */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_error_toobig); /* size 0x26 */
	. = . + 0x2; /* padding after .text.sqlite3_result_error_toobig */
	. = ALIGN(0x10); /* align for .text.sqlite3_result_error_nomem */
	"build_x86-64/sqlite3.o"(.text.sqlite3_result_error_nomem); /* size 0x5e */
	. = . + 0x2a; /* padding after .text.sqlite3_result_error_nomem */
	. = ALIGN(0x10); /* align for .text.sqlite3_step */
	"build_x86-64/sqlite3.o"(.text.sqlite3_step); /* size 0x13f4 */
	. = ALIGN(0x10); /* align for .text.sqlite3_user_data */
	"build_x86-64/sqlite3.o"(.text.sqlite3_user_data); /* size 0xe */
	. = ALIGN(0x10); /* align for .text.sqlite3_context_db_handle */
	"build_x86-64/sqlite3.o"(.text.sqlite3_context_db_handle); /* size 0xd */
	. = ALIGN(0x10); /* align for .text.sqlite3_vtab_nochange */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vtab_nochange); /* size 0x1e */
	. = ALIGN(0x10); /* align for .text.sqlite3_aggregate_context */
	"build_x86-64/sqlite3.o"(.text.sqlite3_aggregate_context); /* size 0x1a */
	. = ALIGN(0x10); /* align for .text.createAggContext */
	"build_x86-64/sqlite3.o"(.text.createAggContext); /* size 0x8d */
	. = . + 0x37; /* padding after .text.createAggContext */
	. = ALIGN(0x10); /* align for .text.sqlite3_get_auxdata */
	"build_x86-64/sqlite3.o"(.text.sqlite3_get_auxdata); /* size 0x3f */
	. = . + 0x5; /* padding after .text.sqlite3_get_auxdata */
	. = ALIGN(0x10); /* align for .text.sqlite3_set_auxdata */
	"build_x86-64/sqlite3.o"(.text.sqlite3_set_auxdata); /* size 0x16c */
	. = . + 0x4; /* padding after .text.sqlite3_set_auxdata */
	. = ALIGN(0x10); /* align for .text.sqlite3DbMallocZero */
	"build_x86-64/sqlite3.o"(.text.sqlite3DbMallocZero); /* size 0xac */
	. = . + 0x24; /* padding after .text.sqlite3DbMallocZero */
	. = ALIGN(0x10); /* align for .text.sqlite3_aggregate_count */
	"build_x86-64/sqlite3.o"(.text.sqlite3_aggregate_count); /* size 0xd */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_count */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_count); /* size 0x15 */
	. = ALIGN(0x10); /* align for .text.sqlite3_data_count */
	"build_x86-64/sqlite3.o"(.text.sqlite3_data_count); /* size 0x20 */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_blob */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_blob); /* size 0xb2 */
	. = . + 0x2a; /* padding after .text.sqlite3_column_blob */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_bytes */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_bytes); /* size 0xeb */
	. = . + 0x3d; /* padding after .text.sqlite3_column_bytes */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_bytes16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_bytes16); /* size 0xeb */
	. = . + 0x3d; /* padding after .text.sqlite3_column_bytes16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_double */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_double); /* size 0xef */
	. = . + 0x2d; /* padding after .text.sqlite3_column_double */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_int */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_int); /* size 0xdc */
	. = . + 0x3c; /* padding after .text.sqlite3_column_int */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_int64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_int64); /* size 0xdc */
	. = . + 0x3c; /* padding after .text.sqlite3_column_int64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_text */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_text); /* size 0xe5 */
	. = . + 0x27; /* padding after .text.sqlite3_column_text */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_value */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_value); /* size 0xca */
	. = . + 0x1a; /* padding after .text.sqlite3_column_value */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_text16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_text16); /* size 0xe5 */
	. = . + 0x27; /* padding after .text.sqlite3_column_text16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_type */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_type); /* size 0xb4 */
	. = . + 0x28; /* padding after .text.sqlite3_column_type */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_name */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_name); /* size 0xe4 */
	. = . + 0x3c; /* padding after .text.sqlite3_column_name */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_name16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_name16); /* size 0xe4 */
	. = . + 0x3c; /* padding after .text.sqlite3_column_name16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_decltype */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_decltype); /* size 0xe4 */
	. = . + 0x3c; /* padding after .text.sqlite3_column_decltype */
	. = ALIGN(0x10); /* align for .text.sqlite3_column_decltype16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_column_decltype16); /* size 0xe4 */
	. = . + 0x3c; /* padding after .text.sqlite3_column_decltype16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_blob */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_blob); /* size 0xd */
	. = ALIGN(0x10); /* align for .text.bindText */
	"build_x86-64/sqlite3.o"(.text.bindText); /* size 0x12a */
	. = . + 0x1a; /* padding after .text.bindText */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_blob64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_blob64); /* size 0x32 */
	. = . + 0xe; /* padding after .text.sqlite3_bind_blob64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_double */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_double); /* size 0xa6 */
	. = . + 0x1e; /* padding after .text.sqlite3_bind_double */
	. = ALIGN(0x10); /* align for .text.vdbeUnbind */
	"build_x86-64/sqlite3.o"(.text.vdbeUnbind); /* size 0x1cb */
	. = . + 0x3d; /* padding after .text.vdbeUnbind */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_int */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_int); /* size 0x72 */
	. = . + 0x1a; /* padding after .text.sqlite3_bind_int */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_int64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_int64); /* size 0x72 */
	. = . + 0x1a; /* padding after .text.sqlite3_bind_int64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_null */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_null); /* size 0x2e */
	. = . + 0x16; /* padding after .text.sqlite3_bind_null */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_pointer */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_pointer); /* size 0xa3 */
	. = . + 0x19; /* padding after .text.sqlite3_bind_pointer */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_text */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_text); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_text64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_text64); /* size 0x44 */
	. = . + 0x8; /* padding after .text.sqlite3_bind_text64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_text16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_text16); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_value */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_value); /* size 0x21d */
	. = . + 0x1f; /* padding after .text.sqlite3_bind_value */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_zeroblob */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_zeroblob); /* size 0xc0 */
	. = . + 0xc; /* padding after .text.sqlite3_bind_zeroblob */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_zeroblob64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_zeroblob64); /* size 0x11a */
	. = . + 0x2e; /* padding after .text.sqlite3_bind_zeroblob64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_parameter_count */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_parameter_count); /* size 0x12 */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_parameter_name */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_parameter_name); /* size 0x47 */
	. = . + 0x5; /* padding after .text.sqlite3_bind_parameter_name */
	. = ALIGN(0x10); /* align for .text.sqlite3_bind_parameter_index */
	"build_x86-64/sqlite3.o"(.text.sqlite3_bind_parameter_index); /* size 0x9c */
	. = . + 0x4; /* padding after .text.sqlite3_bind_parameter_index */
	. = ALIGN(0x10); /* align for .text.sqlite3_transfer_bindings */
	"build_x86-64/sqlite3.o"(.text.sqlite3_transfer_bindings); /* size 0x130 */
	. = . + 0xc; /* padding after .text.sqlite3_transfer_bindings */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_handle */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_handle); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.sqlite3_stmt_readonly */
	"build_x86-64/sqlite3.o"(.text.sqlite3_stmt_readonly); /* size 0x1e */
	. = ALIGN(0x10); /* align for .text.sqlite3_stmt_busy */
	"build_x86-64/sqlite3.o"(.text.sqlite3_stmt_busy); /* size 0x1e */
	. = . + 0x12; /* padding after .text.sqlite3_stmt_busy */
	. = ALIGN(0x10); /* align for .text.sqlite3_next_stmt */
	"build_x86-64/sqlite3.o"(.text.sqlite3_next_stmt); /* size 0x59 */
	. = . + 0x1f; /* padding after .text.sqlite3_next_stmt */
	. = ALIGN(0x10); /* align for .text.sqlite3_stmt_status */
	"build_x86-64/sqlite3.o"(.text.sqlite3_stmt_status); /* size 0x93 */
	. = . + 0x9; /* padding after .text.sqlite3_stmt_status */
	. = ALIGN(0x10); /* align for .text.sqlite3_sql */
	"build_x86-64/sqlite3.o"(.text.sqlite3_sql); /* size 0x15 */
	. = ALIGN(0x10); /* align for .text.sqlite3_expanded_sql */
	"build_x86-64/sqlite3.o"(.text.sqlite3_expanded_sql); /* size 0x5a */
	. = . + 0x1e; /* padding after .text.sqlite3_expanded_sql */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeExpandSql */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeExpandSql); /* size 0x5ba */
	. = ALIGN(0x10); /* align for .text.sqlite3_value_numeric_type */
	"build_x86-64/sqlite3.o"(.text.sqlite3_value_numeric_type); /* size 0x96 */
	. = . + 0x26; /* padding after .text.sqlite3_value_numeric_type */
	. = ALIGN(0x10); /* align for .text.sqlite3_blob_open */
	"build_x86-64/sqlite3.o"(.text.sqlite3_blob_open); /* size 0xca8 */
	. = ALIGN(0x10); /* align for .text.sqlite3LocateTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3LocateTable); /* size 0xcfd */
	. = ALIGN(0x10); /* align for .text.sqlite3ErrorMsg */
	"build_x86-64/sqlite3.o"(.text.sqlite3ErrorMsg); /* size 0x164 */
	. = ALIGN(0x10); /* align for .text.sqlite3MPrintf */
	"build_x86-64/sqlite3.o"(.text.sqlite3MPrintf); /* size 0x11d */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMakeReady */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMakeReady); /* size 0x4d6 */
	. = ALIGN(0x10); /* align for .text.blobSeekToRow */
	"build_x86-64/sqlite3.o"(.text.blobSeekToRow); /* size 0x184 */
	. = . + 0x4c; /* padding after .text.blobSeekToRow */
	. = ALIGN(0x10); /* align for .text.sqlite3_blob_close */
	"build_x86-64/sqlite3.o"(.text.sqlite3_blob_close); /* size 0x5e */
	. = . + 0x1a; /* padding after .text.sqlite3_blob_close */
	. = ALIGN(0x10); /* align for .text.sqlite3_blob_read */
	"build_x86-64/sqlite3.o"(.text.sqlite3_blob_read); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.blobReadWrite */
	"build_x86-64/sqlite3.o"(.text.blobReadWrite); /* size 0x2a2 */
	. = . + 0x4a; /* padding after .text.blobReadWrite */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreePayloadChecked */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreePayloadChecked); /* size 0x18 */
	. = ALIGN(0x10); /* align for .text.sqlite3_blob_write */
	"build_x86-64/sqlite3.o"(.text.sqlite3_blob_write); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreePutData */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreePutData); /* size 0x15b */
	. = . + 0x7d; /* padding after .text.sqlite3BtreePutData */
	. = ALIGN(0x10); /* align for .text.sqlite3_blob_bytes */
	"build_x86-64/sqlite3.o"(.text.sqlite3_blob_bytes); /* size 0x18 */
	. = . + 0x4; /* padding after .text.sqlite3_blob_bytes */
	. = ALIGN(0x10); /* align for .text.sqlite3_blob_reopen */
	"build_x86-64/sqlite3.o"(.text.sqlite3_blob_reopen); /* size 0xe1 */
	. = . + 0x37; /* padding after .text.sqlite3_blob_reopen */
	. = ALIGN(0x10); /* align for .text.sqlite3_set_authorizer */
	"build_x86-64/sqlite3.o"(.text.sqlite3_set_authorizer); /* size 0x79 */
	. = . + 0x3; /* padding after .text.sqlite3_set_authorizer */
	. = ALIGN(0x10); /* align for .text.sqlite3_strglob */
	"build_x86-64/sqlite3.o"(.text.sqlite3_strglob); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.patternCompare */
	"build_x86-64/sqlite3.o"(.text.patternCompare); /* size 0x963 */
	. = ALIGN(0x10); /* align for .text.sqlite3_strlike */
	"build_x86-64/sqlite3.o"(.text.sqlite3_strlike); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.sqlite3_exec */
	"build_x86-64/sqlite3.o"(.text.sqlite3_exec); /* size 0x84f */
	. = . + 0x39; /* padding after .text.sqlite3_exec */
	. = ALIGN(0x10); /* align for .text.sqlite3_prepare_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_prepare_v2); /* size 0x22 */
	. = ALIGN(0x10); /* align for .text.sqlite3_errmsg */
	"build_x86-64/sqlite3.o"(.text.sqlite3_errmsg); /* size 0x15d */
	. = . + 0x6f; /* padding after .text.sqlite3_errmsg */
	. = ALIGN(0x10); /* align for .text.sqlite3_load_extension */
	"build_x86-64/sqlite3.o"(.text.sqlite3_load_extension); /* size 0x7d8 */
	. = . + 0x38; /* padding after .text.sqlite3_load_extension */
	. = ALIGN(0x10); /* align for .text.sqlite3_enable_load_extension */
	"build_x86-64/sqlite3.o"(.text.sqlite3_enable_load_extension); /* size 0x4f */
	. = . + 0x15; /* padding after .text.sqlite3_enable_load_extension */
	. = ALIGN(0x10); /* align for .text.sqlite3_auto_extension */
	"build_x86-64/sqlite3.o"(.text.sqlite3_auto_extension); /* size 0x105 */
	. = . + 0x27; /* padding after .text.sqlite3_auto_extension */
	. = ALIGN(0x10); /* align for .text.sqlite3_cancel_auto_extension */
	"build_x86-64/sqlite3.o"(.text.sqlite3_cancel_auto_extension); /* size 0x96 */
	. = . + 0x36; /* padding after .text.sqlite3_cancel_auto_extension */
	. = ALIGN(0x10); /* align for .text.sqlite3_reset_auto_extension */
	"build_x86-64/sqlite3.o"(.text.sqlite3_reset_auto_extension); /* size 0xe6 */
	. = . + 0x4e; /* padding after .text.sqlite3_reset_auto_extension */
	. = ALIGN(0x10); /* align for .text.sqlite3_prepare */
	"build_x86-64/sqlite3.o"(.text.sqlite3_prepare); /* size 0x1f */
	. = ALIGN(0x10); /* align for .text.sqlite3LockAndPrepare */
	"build_x86-64/sqlite3.o"(.text.sqlite3LockAndPrepare); /* size 0xbf2 */
	. = ALIGN(0x10); /* align for .text.sqlite3_prepare_v3 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_prepare_v3); /* size 0x29 */
	. = ALIGN(0x10); /* align for .text.sqlite3_prepare16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_prepare16); /* size 0x12 */
	. = ALIGN(0x10); /* align for .text.sqlite3Prepare16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3Prepare16); /* size 0x330 */
	. = ALIGN(0x10); /* align for .text.sqlite3_prepare16_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_prepare16_v2); /* size 0x15 */
	. = ALIGN(0x10); /* align for .text.sqlite3_prepare16_v3 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_prepare16_v3); /* size 0x13 */
	. = ALIGN(0x10); /* align for .text.sqlite3_get_table */
	"build_x86-64/sqlite3.o"(.text.sqlite3_get_table); /* size 0x2f9 */
	. = . + 0x5f; /* padding after .text.sqlite3_get_table */
	. = ALIGN(0x10); /* align for .text.sqlite3_get_table_cb */
	"build_x86-64/sqlite3.o"(.text.sqlite3_get_table_cb); /* size 0x1fb */
	. = . + 0x45; /* padding after .text.sqlite3_get_table_cb */
	. = ALIGN(0x10); /* align for .text.sqlite3_free_table */
	"build_x86-64/sqlite3.o"(.text.sqlite3_free_table); /* size 0x113 */
	. = . + 0x91; /* padding after .text.sqlite3_free_table */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_module */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_module); /* size 0xd */
	. = ALIGN(0x10); /* align for .text.createModule */
	"build_x86-64/sqlite3.o"(.text.createModule); /* size 0x1ad */
	. = . + 0x3f; /* padding after .text.createModule */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_module_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_module_v2); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.sqlite3_declare_vtab */
	"build_x86-64/sqlite3.o"(.text.sqlite3_declare_vtab); /* size 0x3c8 */
	. = . + 0x84; /* padding after .text.sqlite3_declare_vtab */
	. = ALIGN(0x10); /* align for .text.sqlite3RunParser */
	"build_x86-64/sqlite3.o"(.text.sqlite3RunParser); /* size 0xaef */
	. = ALIGN(0x10); /* align for .text.sqlite3_vtab_on_conflict */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vtab_on_conflict); /* size 0x11 */
	. = . + 0x7; /* padding after .text.sqlite3_vtab_on_conflict */
	. = ALIGN(0x10); /* align for .text.sqlite3_vtab_config */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vtab_config); /* size 0x12f */
	. = . + 0x1; /* padding after .text.sqlite3_vtab_config */
	. = ALIGN(0x10); /* align for .text.sqlite3_vtab_collation */
	"build_x86-64/sqlite3.o"(.text.sqlite3_vtab_collation); /* size 0x87 */
	. = . + 0x25; /* padding after .text.sqlite3_vtab_collation */
	. = ALIGN(0x10); /* align for .text.sqlite3_keyword_name */
	"build_x86-64/sqlite3.o"(.text.sqlite3_keyword_name); /* size 0x33 */
	. = . + 0x15; /* padding after .text.sqlite3_keyword_name */
	. = ALIGN(0x10); /* align for .text.sqlite3_keyword_count */
	"build_x86-64/sqlite3.o"(.text.sqlite3_keyword_count); /* size 0xb */
	. = ALIGN(0x10); /* align for .text.sqlite3_keyword_check */
	"build_x86-64/sqlite3.o"(.text.sqlite3_keyword_check); /* size 0xc3 */
	. = . + 0x29; /* padding after .text.sqlite3_keyword_check */
	. = ALIGN(0x10); /* align for .text.sqlite3KeywordCode */
	"build_x86-64/sqlite3.o"(.text.sqlite3KeywordCode); /* size 0xc9 */
	. = . + 0x2b; /* padding after .text.sqlite3KeywordCode */
	. = ALIGN(0x10); /* align for .text.sqlite3_complete */
	"build_x86-64/sqlite3.o"(.text.sqlite3_complete); /* size 0x9d1 */
	. = ALIGN(0x10); /* align for .text.sqlite3_complete16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_complete16); /* size 0x19f */
	. = . + 0x19; /* padding after .text.sqlite3_complete16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_libversion */
	"build_x86-64/sqlite3.o"(.text.sqlite3_libversion); /* size 0xb */
	. = . + 0x1; /* padding after .text.sqlite3_libversion */
	. = ALIGN(0x10); /* align for .text.sqlite3_libversion_number */
	"build_x86-64/sqlite3.o"(.text.sqlite3_libversion_number); /* size 0xb */
	. = . + 0x1; /* padding after .text.sqlite3_libversion_number */
	. = ALIGN(0x10); /* align for .text.sqlite3_threadsafe */
	"build_x86-64/sqlite3.o"(.text.sqlite3_threadsafe); /* size 0xb */
	. = ALIGN(0x10); /* align for .text.sqlite3_shutdown */
	"build_x86-64/sqlite3.o"(.text.sqlite3_shutdown); /* size 0xc7 */
	. = . + 0x9; /* padding after .text.sqlite3_shutdown */
	. = ALIGN(0x10); /* align for .text.sqlite3_config */
	"build_x86-64/sqlite3.o"(.text.sqlite3_config); /* size 0x72d */
	. = . + 0x57; /* padding after .text.sqlite3_config */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_mutex */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_mutex); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_release_memory */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_release_memory); /* size 0xa6 */
	. = . + 0x2e; /* padding after .text.sqlite3_db_release_memory */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_cacheflush */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_cacheflush); /* size 0x13b */
	. = . + 0x29; /* padding after .text.sqlite3_db_cacheflush */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_config */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_config); /* size 0x23b */
	. = . + 0x81; /* padding after .text.sqlite3_db_config */
	. = ALIGN(0x10); /* align for .text.setupLookaside */
	"build_x86-64/sqlite3.o"(.text.setupLookaside); /* size 0x318 */
	. = ALIGN(0x10); /* align for .text.sqlite3_last_insert_rowid */
	"build_x86-64/sqlite3.o"(.text.sqlite3_last_insert_rowid); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.sqlite3_set_last_insert_rowid */
	"build_x86-64/sqlite3.o"(.text.sqlite3_set_last_insert_rowid); /* size 0x3c */
	. = . + 0x1c; /* padding after .text.sqlite3_set_last_insert_rowid */
	. = ALIGN(0x10); /* align for .text.sqlite3_changes */
	"build_x86-64/sqlite3.o"(.text.sqlite3_changes); /* size 0x9 */
	. = ALIGN(0x10); /* align for .text.sqlite3_total_changes */
	"build_x86-64/sqlite3.o"(.text.sqlite3_total_changes); /* size 0x9 */
	. = ALIGN(0x10); /* align for .text.sqlite3_close */
	"build_x86-64/sqlite3.o"(.text.sqlite3_close); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.sqlite3Close */
	"build_x86-64/sqlite3.o"(.text.sqlite3Close); /* size 0x331 */
	. = . + 0x17; /* padding after .text.sqlite3Close */
	. = ALIGN(0x10); /* align for .text.sqlite3_close_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_close_v2); /* size 0xf */
	. = ALIGN(0x10); /* align for .text.sqlite3_busy_handler */
	"build_x86-64/sqlite3.o"(.text.sqlite3_busy_handler); /* size 0x6b */
	. = . + 0x5; /* padding after .text.sqlite3_busy_handler */
	. = ALIGN(0x10); /* align for .text.sqlite3_progress_handler */
	"build_x86-64/sqlite3.o"(.text.sqlite3_progress_handler); /* size 0x70 */
	. = . + 0xc; /* padding after .text.sqlite3_progress_handler */
	. = ALIGN(0x10); /* align for .text.sqlite3_busy_timeout */
	"build_x86-64/sqlite3.o"(.text.sqlite3_busy_timeout); /* size 0xd5 */
	. = ALIGN(0x10); /* align for .text.sqliteDefaultBusyCallback */
	"build_x86-64/sqlite3.o"(.text.sqliteDefaultBusyCallback); /* size 0x2c */
	. = . + 0x20; /* padding after .text.sqliteDefaultBusyCallback */
	. = ALIGN(0x10); /* align for .text.sqlite3_interrupt */
	"build_x86-64/sqlite3.o"(.text.sqlite3_interrupt); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_function */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_function); /* size 0xb7 */
	. = . + 0x29; /* padding after .text.sqlite3_create_function */
	. = ALIGN(0x10); /* align for .text.createFunctionApi */
	"build_x86-64/sqlite3.o"(.text.createFunctionApi); /* size 0x1e2 */
	. = . + 0x52; /* padding after .text.createFunctionApi */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_function_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_function_v2); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_window_function */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_window_function); /* size 0x2c */
	. = . + 0xc; /* padding after .text.sqlite3_create_window_function */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_function16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_function16); /* size 0x147 */
	. = . + 0x29; /* padding after .text.sqlite3_create_function16 */
	. = ALIGN(0x10); /* align for .text.sqlite3CreateFunc */
	"build_x86-64/sqlite3.o"(.text.sqlite3CreateFunc); /* size 0x28b */
	. = . + 0x29; /* padding after .text.sqlite3CreateFunc */
	. = ALIGN(0x10); /* align for .text.sqlite3_overload_function */
	"build_x86-64/sqlite3.o"(.text.sqlite3_overload_function); /* size 0xab */
	. = . + 0x29; /* padding after .text.sqlite3_overload_function */
	. = ALIGN(0x10); /* align for .text.sqlite3FindFunction */
	"build_x86-64/sqlite3.o"(.text.sqlite3FindFunction); /* size 0x4d7 */
	. = . + 0x9; /* padding after .text.sqlite3FindFunction */
	. = ALIGN(0x10); /* align for .text.sqlite3InvalidFunction */
	"build_x86-64/sqlite3.o"(.text.sqlite3InvalidFunction); /* size 0xaf */
	. = . + 0x3d; /* padding after .text.sqlite3InvalidFunction */
	. = ALIGN(0x10); /* align for .text.sqlite3_trace */
	"build_x86-64/sqlite3.o"(.text.sqlite3_trace); /* size 0x63 */
	. = . + 0xd; /* padding after .text.sqlite3_trace */
	. = ALIGN(0x10); /* align for .text.sqlite3_trace_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_trace_v2); /* size 0x66 */
	. = . + 0xe; /* padding after .text.sqlite3_trace_v2 */
	. = ALIGN(0x10); /* align for .text.sqlite3_profile */
	"build_x86-64/sqlite3.o"(.text.sqlite3_profile); /* size 0x6a */
	. = . + 0x2; /* padding after .text.sqlite3_profile */
	. = ALIGN(0x10); /* align for .text.sqlite3_commit_hook */
	"build_x86-64/sqlite3.o"(.text.sqlite3_commit_hook); /* size 0x6a */
	. = . + 0x2; /* padding after .text.sqlite3_commit_hook */
	. = ALIGN(0x10); /* align for .text.sqlite3_update_hook */
	"build_x86-64/sqlite3.o"(.text.sqlite3_update_hook); /* size 0x6a */
	. = . + 0x2; /* padding after .text.sqlite3_update_hook */
	. = ALIGN(0x10); /* align for .text.sqlite3_rollback_hook */
	"build_x86-64/sqlite3.o"(.text.sqlite3_rollback_hook); /* size 0x6a */
	. = . + 0x2; /* padding after .text.sqlite3_rollback_hook */
	. = ALIGN(0x10); /* align for .text.sqlite3_wal_autocheckpoint */
	"build_x86-64/sqlite3.o"(.text.sqlite3_wal_autocheckpoint); /* size 0x8c */
	. = . + 0x10; /* padding after .text.sqlite3_wal_autocheckpoint */
	. = ALIGN(0x10); /* align for .text.sqlite3_wal_hook */
	"build_x86-64/sqlite3.o"(.text.sqlite3_wal_hook); /* size 0x6a */
	. = . + 0x2; /* padding after .text.sqlite3_wal_hook */
	. = ALIGN(0x10); /* align for .text.sqlite3WalDefaultHook */
	"build_x86-64/sqlite3.o"(.text.sqlite3WalDefaultHook); /* size 0x46 */
	. = . + 0x1e; /* padding after .text.sqlite3WalDefaultHook */
	. = ALIGN(0x10); /* align for .text.sqlite3_wal_checkpoint_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_wal_checkpoint_v2); /* size 0x26c */
	. = ALIGN(0x10); /* align for .text.sqlite3Checkpoint */
	"build_x86-64/sqlite3.o"(.text.sqlite3Checkpoint); /* size 0x1dc */
	. = ALIGN(0x10); /* align for .text.sqlite3_wal_checkpoint */
	"build_x86-64/sqlite3.o"(.text.sqlite3_wal_checkpoint); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.sqlite3_errmsg16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_errmsg16); /* size 0x1b1 */
	. = . + 0x63; /* padding after .text.sqlite3_errmsg16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_errcode */
	"build_x86-64/sqlite3.o"(.text.sqlite3_errcode); /* size 0x82 */
	. = . + 0x32; /* padding after .text.sqlite3_errcode */
	. = ALIGN(0x10); /* align for .text.sqlite3_extended_errcode */
	"build_x86-64/sqlite3.o"(.text.sqlite3_extended_errcode); /* size 0x7f */
	. = . + 0x31; /* padding after .text.sqlite3_extended_errcode */
	. = ALIGN(0x10); /* align for .text.sqlite3_system_errno */
	"build_x86-64/sqlite3.o"(.text.sqlite3_system_errno); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.sqlite3_errstr */
	"build_x86-64/sqlite3.o"(.text.sqlite3_errstr); /* size 0x52 */
	. = . + 0x22; /* padding after .text.sqlite3_errstr */
	. = ALIGN(0x10); /* align for .text.sqlite3_limit */
	"build_x86-64/sqlite3.o"(.text.sqlite3_limit); /* size 0x2b */
	. = . + 0x11; /* padding after .text.sqlite3_limit */
	. = ALIGN(0x10); /* align for .text.sqlite3_open */
	"build_x86-64/sqlite3.o"(.text.sqlite3_open); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.openDatabase */
	"build_x86-64/sqlite3.o"(.text.openDatabase); /* size 0xacd */
	. = . + 0x15b; /* padding after .text.openDatabase */
	. = ALIGN(0x10); /* align for .text.sqlite3_open_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_open_v2); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.sqlite3_open16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_open16); /* size 0x1de */
	. = . + 0x22; /* padding after .text.sqlite3_open16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_collation */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_collation); /* size 0x85 */
	. = . + 0x2f; /* padding after .text.sqlite3_create_collation */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_collation_v2 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_collation_v2); /* size 0x8c */
	. = . + 0x2c; /* padding after .text.sqlite3_create_collation_v2 */
	. = ALIGN(0x10); /* align for .text.createCollation */
	"build_x86-64/sqlite3.o"(.text.createCollation); /* size 0x3fa */
	. = ALIGN(0x10); /* align for .text.sqlite3_create_collation16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_create_collation16); /* size 0x113 */
	. = . + 0x3d; /* padding after .text.sqlite3_create_collation16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_collation_needed */
	"build_x86-64/sqlite3.o"(.text.sqlite3_collation_needed); /* size 0x5b */
	. = . + 0x5; /* padding after .text.sqlite3_collation_needed */
	. = ALIGN(0x10); /* align for .text.sqlite3_collation_needed16 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_collation_needed16); /* size 0x5b */
	. = . + 0x5; /* padding after .text.sqlite3_collation_needed16 */
	. = ALIGN(0x10); /* align for .text.sqlite3_global_recover */
	"build_x86-64/sqlite3.o"(.text.sqlite3_global_recover); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sqlite3_get_autocommit */
	"build_x86-64/sqlite3.o"(.text.sqlite3_get_autocommit); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.sqlite3_thread_cleanup */
	"build_x86-64/sqlite3.o"(.text.sqlite3_thread_cleanup); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.sqlite3_table_column_metadata */
	"build_x86-64/sqlite3.o"(.text.sqlite3_table_column_metadata); /* size 0x487 */
	. = ALIGN(0x10); /* align for .text.sqlite3Init */
	"build_x86-64/sqlite3.o"(.text.sqlite3Init); /* size 0xac */
	. = . + 0x28; /* padding after .text.sqlite3Init */
	. = ALIGN(0x10); /* align for .text.sqlite3FindTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3FindTable); /* size 0x2cc */
	. = ALIGN(0x10); /* align for .text.sqlite3_sleep */
	"build_x86-64/sqlite3.o"(.text.sqlite3_sleep); /* size 0x92 */
	. = . + 0x2a; /* padding after .text.sqlite3_sleep */
	. = ALIGN(0x10); /* align for .text.sqlite3_extended_result_codes */
	"build_x86-64/sqlite3.o"(.text.sqlite3_extended_result_codes); /* size 0x56 */
	. = . + 0x1a; /* padding after .text.sqlite3_extended_result_codes */
	. = ALIGN(0x10); /* align for .text.sqlite3_file_control */
	"build_x86-64/sqlite3.o"(.text.sqlite3_file_control); /* size 0x228 */
	. = . + 0x58; /* padding after .text.sqlite3_file_control */
	. = ALIGN(0x10); /* align for .text.sqlite3_test_control */
	"build_x86-64/sqlite3.o"(.text.sqlite3_test_control); /* size 0xc6b */
	. = . + 0x17d; /* padding after .text.sqlite3_test_control */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeSetPageSize */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeSetPageSize); /* size 0x145 */
	. = ALIGN(0x10); /* align for .text.sqlite3_uri_parameter */
	"build_x86-64/sqlite3.o"(.text.sqlite3_uri_parameter); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.sqlite3_uri_boolean */
	"build_x86-64/sqlite3.o"(.text.sqlite3_uri_boolean); /* size 0xb5 */
	. = ALIGN(0x10); /* align for .text.sqlite3_uri_int64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3_uri_int64); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.sqlite3DecOrHexToI64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3DecOrHexToI64); /* size 0xe4 */
	. = . + 0x28; /* padding after .text.sqlite3DecOrHexToI64 */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_filename */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_filename); /* size 0x152 */
	. = ALIGN(0x10); /* align for .text.sqlite3_db_readonly */
	"build_x86-64/sqlite3.o"(.text.sqlite3_db_readonly); /* size 0x145 */
	. = ALIGN(0x10); /* align for .text.sqlite3_compileoption_used */
	"build_x86-64/sqlite3.o"(.text.sqlite3_compileoption_used); /* size 0x275 */
	. = . + 0x7f; /* padding after .text.sqlite3_compileoption_used */
	. = ALIGN(0x10); /* align for .text.sqlite3_compileoption_get */
	"build_x86-64/sqlite3.o"(.text.sqlite3_compileoption_get); /* size 0x19 */
	. = . + 0x7; /* padding after .text.sqlite3_compileoption_get */
	. = ALIGN(0x10); /* align for .text.sqlite3_sourceid */
	"build_x86-64/sqlite3.o"(.text.sqlite3_sourceid); /* size 0xb */
	. = . + 0x1; /* padding after .text.sqlite3_sourceid */
	. = ALIGN(0x10); /* align for .text.pthreadMutexInit */
	"build_x86-64/sqlite3.o"(.text.pthreadMutexInit); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.pthreadMutexEnd */
	"build_x86-64/sqlite3.o"(.text.pthreadMutexEnd); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.pthreadMutexAlloc */
	"build_x86-64/sqlite3.o"(.text.pthreadMutexAlloc); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.pthreadMutexFree */
	"build_x86-64/sqlite3.o"(.text.pthreadMutexFree); /* size 0x7f */
	. = . + 0x39; /* padding after .text.pthreadMutexFree */
	. = ALIGN(0x10); /* align for .text.pthreadMutexEnter */
	"build_x86-64/sqlite3.o"(.text.pthreadMutexEnter); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.pthreadMutexTry */
	"build_x86-64/sqlite3.o"(.text.pthreadMutexTry); /* size 0x15 */
	. = . + 0xb; /* padding after .text.pthreadMutexTry */
	. = ALIGN(0x10); /* align for .text.pthreadMutexLeave */
	"build_x86-64/sqlite3.o"(.text.pthreadMutexLeave); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.noopMutexInit */
	"build_x86-64/sqlite3.o"(.text.noopMutexInit); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.noopMutexEnd */
	"build_x86-64/sqlite3.o"(.text.noopMutexEnd); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.noopMutexAlloc */
	"build_x86-64/sqlite3.o"(.text.noopMutexAlloc); /* size 0xb */
	. = ALIGN(0x10); /* align for .text.noopMutexFree */
	"build_x86-64/sqlite3.o"(.text.noopMutexFree); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.noopMutexEnter */
	"build_x86-64/sqlite3.o"(.text.noopMutexEnter); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.noopMutexTry */
	"build_x86-64/sqlite3.o"(.text.noopMutexTry); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.noopMutexLeave */
	"build_x86-64/sqlite3.o"(.text.noopMutexLeave); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.measureAllocationSize */
	"build_x86-64/sqlite3.o"(.text.measureAllocationSize); /* size 0x42 */
	. = . + 0x1e; /* padding after .text.measureAllocationSize */
	. = ALIGN(0x10); /* align for .text.dbReallocFinish */
	"build_x86-64/sqlite3.o"(.text.dbReallocFinish); /* size 0x141 */
	. = . + 0xf; /* padding after .text.dbReallocFinish */
	. = ALIGN(0x10); /* align for .text.dbMallocRawFinish */
	"build_x86-64/sqlite3.o"(.text.dbMallocRawFinish); /* size 0x47 */
	. = . + 0x19; /* padding after .text.dbMallocRawFinish */
	. = ALIGN(0x10); /* align for .text.strAccumFinishRealloc */
	"build_x86-64/sqlite3.o"(.text.strAccumFinishRealloc); /* size 0xd6 */
	. = . + 0x22; /* padding after .text.strAccumFinishRealloc */
	. = ALIGN(0x10); /* align for .text.posixIoFinderImpl */
	"build_x86-64/sqlite3.o"(.text.posixIoFinderImpl); /* size 0xb */
	. = . + 0x1; /* padding after .text.posixIoFinderImpl */
	. = ALIGN(0x10); /* align for .text.unixClose */
	"build_x86-64/sqlite3.o"(.text.unixClose); /* size 0x35d */
	. = . + 0x8b; /* padding after .text.unixClose */
	. = ALIGN(0x10); /* align for .text.unixRead */
	"build_x86-64/sqlite3.o"(.text.unixRead); /* size 0x133 */
	. = . + 0x11; /* padding after .text.unixRead */
	. = ALIGN(0x10); /* align for .text.unixWrite */
	"build_x86-64/sqlite3.o"(.text.unixWrite); /* size 0xdc */
	. = . + 0x1c; /* padding after .text.unixWrite */
	. = ALIGN(0x10); /* align for .text.unixTruncate */
	"build_x86-64/sqlite3.o"(.text.unixTruncate); /* size 0xac */
	. = . + 0x20; /* padding after .text.unixTruncate */
	. = ALIGN(0x10); /* align for .text.unixSync */
	"build_x86-64/sqlite3.o"(.text.unixSync); /* size 0xe6 */
	. = . + 0x26; /* padding after .text.unixSync */
	. = ALIGN(0x10); /* align for .text.unixFileSize */
	"build_x86-64/sqlite3.o"(.text.unixFileSize); /* size 0x5b */
	. = . + 0x9; /* padding after .text.unixFileSize */
	. = ALIGN(0x10); /* align for .text.unixLock */
	"build_x86-64/sqlite3.o"(.text.unixLock); /* size 0x497 */
	. = . + 0x9d; /* padding after .text.unixLock */
	. = ALIGN(0x10); /* align for .text.unixUnlock */
	"build_x86-64/sqlite3.o"(.text.unixUnlock); /* size 0x3ac */
	. = . + 0x4c; /* padding after .text.unixUnlock */
	. = ALIGN(0x10); /* align for .text.unixCheckReservedLock */
	"build_x86-64/sqlite3.o"(.text.unixCheckReservedLock); /* size 0xc9 */
	. = . + 0x3b; /* padding after .text.unixCheckReservedLock */
	. = ALIGN(0x10); /* align for .text.unixFileControl */
	"build_x86-64/sqlite3.o"(.text.unixFileControl); /* size 0x279 */
	. = . + 0x3f; /* padding after .text.unixFileControl */
	. = ALIGN(0x10); /* align for .text.unixSectorSize */
	"build_x86-64/sqlite3.o"(.text.unixSectorSize); /* size 0x25 */
	. = . + 0xf; /* padding after .text.unixSectorSize */
	. = ALIGN(0x10); /* align for .text.unixDeviceCharacteristics */
	"build_x86-64/sqlite3.o"(.text.unixDeviceCharacteristics); /* size 0x20 */
	. = . + 0x14; /* padding after .text.unixDeviceCharacteristics */
	. = ALIGN(0x10); /* align for .text.unixShmMap */
	"build_x86-64/sqlite3.o"(.text.unixShmMap); /* size 0x7ef */
	. = ALIGN(0x10); /* align for .text.unixShmLock */
	"build_x86-64/sqlite3.o"(.text.unixShmLock); /* size 0x22d */
	. = . + 0x3b; /* padding after .text.unixShmLock */
	. = ALIGN(0x10); /* align for .text.unixShmBarrier */
	"build_x86-64/sqlite3.o"(.text.unixShmBarrier); /* size 0x2e */
	. = . + 0x1a; /* padding after .text.unixShmBarrier */
	. = ALIGN(0x10); /* align for .text.unixShmUnmap */
	"build_x86-64/sqlite3.o"(.text.unixShmUnmap); /* size 0x120 */
	. = . + 0x5c; /* padding after .text.unixShmUnmap */
	. = ALIGN(0x10); /* align for .text.unixFetch */
	"build_x86-64/sqlite3.o"(.text.unixFetch); /* size 0xf */
	. = ALIGN(0x10); /* align for .text.unixUnfetch */
	"build_x86-64/sqlite3.o"(.text.unixUnfetch); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.verifyDbFile */
	"build_x86-64/sqlite3.o"(.text.verifyDbFile); /* size 0xa8 */
	. = . + 0x24; /* padding after .text.verifyDbFile */
	. = ALIGN(0x10); /* align for .text.posixOpen */
	"build_x86-64/sqlite3.o"(.text.posixOpen); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.openDirectory */
	"build_x86-64/sqlite3.o"(.text.openDirectory); /* size 0x154 */
	. = . + 0x4c; /* padding after .text.openDirectory */
	. = ALIGN(0x10); /* align for .text.unixGetpagesize */
	"build_x86-64/sqlite3.o"(.text.unixGetpagesize); /* size 0xf */
	. = . + 0x9; /* padding after .text.unixGetpagesize */
	. = ALIGN(0x10); /* align for .text.robust_open */
	"build_x86-64/sqlite3.o"(.text.robust_open); /* size 0xf4 */
	. = . + 0x48; /* padding after .text.robust_open */
	. = ALIGN(0x10); /* align for .text.unixGetTempname */
	"build_x86-64/sqlite3.o"(.text.unixGetTempname); /* size 0x166 */
	. = . + 0x6; /* padding after .text.unixGetTempname */
	. = ALIGN(0x10); /* align for .text.unixLockSharedMemory */
	"build_x86-64/sqlite3.o"(.text.unixLockSharedMemory); /* size 0x177 */
	. = . + 0x29; /* padding after .text.unixLockSharedMemory */
	. = ALIGN(0x10); /* align for .text.unixShmPurge */
	"build_x86-64/sqlite3.o"(.text.unixShmPurge); /* size 0x257 */
	. = . + 0xb5; /* padding after .text.unixShmPurge */
	. = ALIGN(0x10); /* align for .text.nolockClose */
	"build_x86-64/sqlite3.o"(.text.nolockClose); /* size 0xef */
	. = . + 0x39; /* padding after .text.nolockClose */
	. = ALIGN(0x10); /* align for .text.nolockLock */
	"build_x86-64/sqlite3.o"(.text.nolockLock); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.nolockUnlock */
	"build_x86-64/sqlite3.o"(.text.nolockUnlock); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.nolockCheckReservedLock */
	"build_x86-64/sqlite3.o"(.text.nolockCheckReservedLock); /* size 0xe */
	. = ALIGN(0x10); /* align for .text.dotlockClose */
	"build_x86-64/sqlite3.o"(.text.dotlockClose); /* size 0x17f */
	. = . + 0x79; /* padding after .text.dotlockClose */
	. = ALIGN(0x10); /* align for .text.dotlockLock */
	"build_x86-64/sqlite3.o"(.text.dotlockLock); /* size 0x8e */
	. = . + 0x26; /* padding after .text.dotlockLock */
	. = ALIGN(0x10); /* align for .text.dotlockUnlock */
	"build_x86-64/sqlite3.o"(.text.dotlockUnlock); /* size 0x51 */
	. = . + 0x2f; /* padding after .text.dotlockUnlock */
	. = ALIGN(0x10); /* align for .text.dotlockCheckReservedLock */
	"build_x86-64/sqlite3.o"(.text.dotlockCheckReservedLock); /* size 0x27 */
	. = . + 0x19; /* padding after .text.dotlockCheckReservedLock */
	. = ALIGN(0x10); /* align for .text.nolockIoFinderImpl */
	"build_x86-64/sqlite3.o"(.text.nolockIoFinderImpl); /* size 0xb */
	. = . + 0x1; /* padding after .text.nolockIoFinderImpl */
	. = ALIGN(0x10); /* align for .text.dotlockIoFinderImpl */
	"build_x86-64/sqlite3.o"(.text.dotlockIoFinderImpl); /* size 0xb */
	. = . + 0x1; /* padding after .text.dotlockIoFinderImpl */
	. = ALIGN(0x10); /* align for .text.btreeEnterAll */
	"build_x86-64/sqlite3.o"(.text.btreeEnterAll); /* size 0x7b */
	. = . + 0x15; /* padding after .text.btreeEnterAll */
	. = ALIGN(0x10); /* align for .text.btreeLeaveAll */
	"build_x86-64/sqlite3.o"(.text.btreeLeaveAll); /* size 0x5f */
	. = . + 0x1d; /* padding after .text.btreeLeaveAll */
	. = ALIGN(0x10); /* align for .text.sqlite3ErrorFinish */
	"build_x86-64/sqlite3.o"(.text.sqlite3ErrorFinish); /* size 0x65 */
	. = . + 0x27; /* padding after .text.sqlite3ErrorFinish */
	. = ALIGN(0x10); /* align for .text.sqlite3OpenTempDatabase */
	"build_x86-64/sqlite3.o"(.text.sqlite3OpenTempDatabase); /* size 0xd3 */
	. = . + 0x11; /* padding after .text.sqlite3OpenTempDatabase */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeOpen */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeOpen); /* size 0x1555 */
	. = ALIGN(0x10); /* align for .text.pageReinit */
	"build_x86-64/sqlite3.o"(.text.pageReinit); /* size 0x22 */
	. = . + 0x6; /* padding after .text.pageReinit */
	. = ALIGN(0x10); /* align for .text.btreeInvokeBusyHandler */
	"build_x86-64/sqlite3.o"(.text.btreeInvokeBusyHandler); /* size 0x6b */
	. = . + 0x5; /* padding after .text.btreeInvokeBusyHandler */
	. = ALIGN(0x10); /* align for .text.sqlite3PagerSetPagesize */
	"build_x86-64/sqlite3.o"(.text.sqlite3PagerSetPagesize); /* size 0x1a4 */
	. = ALIGN(0x10); /* align for .text.sqlite3PagerClose */
	"build_x86-64/sqlite3.o"(.text.sqlite3PagerClose); /* size 0x2d8 */
	. = . + 0x94; /* padding after .text.sqlite3PagerClose */
	. = ALIGN(0x10); /* align for .text.pagerStress */
	"build_x86-64/sqlite3.o"(.text.pagerStress); /* size 0x16a */
	. = . + 0x1e; /* padding after .text.pagerStress */
	. = ALIGN(0x10); /* align for .text.subjournalPageIfRequired */
	"build_x86-64/sqlite3.o"(.text.subjournalPageIfRequired); /* size 0x2b2 */
	. = . + 0x12; /* padding after .text.subjournalPageIfRequired */
	. = ALIGN(0x10); /* align for .text.pagerWalFrames */
	"build_x86-64/sqlite3.o"(.text.pagerWalFrames); /* size 0xf5e */
	. = ALIGN(0x10); /* align for .text.syncJournal */
	"build_x86-64/sqlite3.o"(.text.syncJournal); /* size 0x265 */
	. = . + 0xf; /* padding after .text.syncJournal */
	. = ALIGN(0x10); /* align for .text.pager_write_pagelist */
	"build_x86-64/sqlite3.o"(.text.pager_write_pagelist); /* size 0x18f */
	. = . + 0x31; /* padding after .text.pager_write_pagelist */
	. = ALIGN(0x10); /* align for .text.memjrnlClose */
	"build_x86-64/sqlite3.o"(.text.memjrnlClose); /* size 0x9e */
	. = . + 0x46; /* padding after .text.memjrnlClose */
	. = ALIGN(0x10); /* align for .text.memjrnlRead */
	"build_x86-64/sqlite3.o"(.text.memjrnlRead); /* size 0x103 */
	. = ALIGN(0x10); /* align for .text.memjrnlWrite */
	"build_x86-64/sqlite3.o"(.text.memjrnlWrite); /* size 0x37b */
	. = ALIGN(0x10); /* align for .text.memjrnlTruncate */
	"build_x86-64/sqlite3.o"(.text.memjrnlTruncate); /* size 0xc1 */
	. = . + 0x4b; /* padding after .text.memjrnlTruncate */
	. = ALIGN(0x10); /* align for .text.memjrnlSync */
	"build_x86-64/sqlite3.o"(.text.memjrnlSync); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.memjrnlFileSize */
	"build_x86-64/sqlite3.o"(.text.memjrnlFileSize); /* size 0xf */
	. = . + 0x1; /* padding after .text.memjrnlFileSize */
	. = ALIGN(0x10); /* align for .text.sqlite3BitvecSet */
	"build_x86-64/sqlite3.o"(.text.sqlite3BitvecSet); /* size 0x244 */
	. = . + 0xc4; /* padding after .text.sqlite3BitvecSet */
	. = ALIGN(0x10); /* align for .text.sqlite3WalFindFrame */
	"build_x86-64/sqlite3.o"(.text.sqlite3WalFindFrame); /* size 0x1dd */
	. = ALIGN(0x10); /* align for .text.walIndexAppend */
	"build_x86-64/sqlite3.o"(.text.walIndexAppend); /* size 0x2af */
	. = ALIGN(0x10); /* align for .text.walTryBeginRead */
	"build_x86-64/sqlite3.o"(.text.walTryBeginRead); /* size 0x891 */
	. = . + 0x6f; /* padding after .text.walTryBeginRead */
	. = ALIGN(0x10); /* align for .text.walIndexReadHdr */
	"build_x86-64/sqlite3.o"(.text.walIndexReadHdr); /* size 0x90a */
	. = ALIGN(0x10); /* align for .text.walIndexTryHdr */
	"build_x86-64/sqlite3.o"(.text.walIndexTryHdr); /* size 0x138 */
	. = . + 0x84; /* padding after .text.walIndexTryHdr */
	. = ALIGN(0x10); /* align for .text.walIndexPageRealloc */
	"build_x86-64/sqlite3.o"(.text.walIndexPageRealloc); /* size 0x113 */
	. = . + 0x29; /* padding after .text.walIndexPageRealloc */
	. = ALIGN(0x10); /* align for .text.walDecodeFrame */
	"build_x86-64/sqlite3.o"(.text.walDecodeFrame); /* size 0x105 */
	. = ALIGN(0x10); /* align for .text.walEncodeFrame */
	"build_x86-64/sqlite3.o"(.text.walEncodeFrame); /* size 0x110 */
	. = . + 0xc; /* padding after .text.walEncodeFrame */
	. = ALIGN(0x10); /* align for .text.backupUpdate */
	"build_x86-64/sqlite3.o"(.text.backupUpdate); /* size 0x91 */
	. = . + 0x3b; /* padding after .text.backupUpdate */
	. = ALIGN(0x10); /* align for .text.writeJournalHdr */
	"build_x86-64/sqlite3.o"(.text.writeJournalHdr); /* size 0x1bb */
	. = ALIGN(0x10); /* align for .text.pcache1Free */
	"build_x86-64/sqlite3.o"(.text.pcache1Free); /* size 0x146 */
	. = . + 0x5e; /* padding after .text.pcache1Free */
	. = ALIGN(0x10); /* align for .text.getPageError */
	"build_x86-64/sqlite3.o"(.text.getPageError); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.getPageNormal */
	"build_x86-64/sqlite3.o"(.text.getPageNormal); /* size 0x3d5 */
	. = . + 0x7; /* padding after .text.getPageNormal */
	. = ALIGN(0x10); /* align for .text.readDbPage */
	"build_x86-64/sqlite3.o"(.text.readDbPage); /* size 0xee */
	. = ALIGN(0x10); /* align for .text.pcacheFetchFinishWithInit */
	"build_x86-64/sqlite3.o"(.text.pcacheFetchFinishWithInit); /* size 0x5c */
	. = . + 0x4; /* padding after .text.pcacheFetchFinishWithInit */
	. = ALIGN(0x10); /* align for .text.sqlite3PagerRollback */
	"build_x86-64/sqlite3.o"(.text.sqlite3PagerRollback); /* size 0xe0 */
	. = . + 0x38; /* padding after .text.sqlite3PagerRollback */
	. = ALIGN(0x10); /* align for .text.pager_end_transaction */
	"build_x86-64/sqlite3.o"(.text.pager_end_transaction); /* size 0x7dc */
	. = . + 0x9c; /* padding after .text.pager_end_transaction */
	. = ALIGN(0x10); /* align for .text.pager_unlock */
	"build_x86-64/sqlite3.o"(.text.pager_unlock); /* size 0x25f */
	. = . + 0x4d; /* padding after .text.pager_unlock */
	. = ALIGN(0x10); /* align for .text.sqlite3PagerSavepoint */
	"build_x86-64/sqlite3.o"(.text.sqlite3PagerSavepoint); /* size 0x7d4 */
	. = ALIGN(0x10); /* align for .text.pager_playback */
	"build_x86-64/sqlite3.o"(.text.pager_playback); /* size 0x7cc */
	. = ALIGN(0x10); /* align for .text.sqlite3BitvecDestroy */
	"build_x86-64/sqlite3.o"(.text.sqlite3BitvecDestroy); /* size 0x99 */
	. = . + 0x3b; /* padding after .text.sqlite3BitvecDestroy */
	. = ALIGN(0x10); /* align for .text.pager_playback_one_page */
	"build_x86-64/sqlite3.o"(.text.pager_playback_one_page); /* size 0x4a5 */
	. = . + 0x7f; /* padding after .text.pager_playback_one_page */
	. = ALIGN(0x10); /* align for .text.readJournalHdr */
	"build_x86-64/sqlite3.o"(.text.readJournalHdr); /* size 0x24a */
	. = ALIGN(0x10); /* align for .text.pagerUndoCallback */
	"build_x86-64/sqlite3.o"(.text.pagerUndoCallback); /* size 0x17c */
	. = . + 0x20; /* padding after .text.pagerUndoCallback */
	. = ALIGN(0x10); /* align for .text.sqlite3PcacheDirtyList */
	"build_x86-64/sqlite3.o"(.text.sqlite3PcacheDirtyList); /* size 0x2dc */
	. = ALIGN(0x10); /* align for .text.sqlite3PcacheRelease */
	"build_x86-64/sqlite3.o"(.text.sqlite3PcacheRelease); /* size 0xd5 */
	. = . + 0x1f; /* padding after .text.sqlite3PcacheRelease */
	. = ALIGN(0x10); /* align for .text.readMasterJournal */
	"build_x86-64/sqlite3.o"(.text.readMasterJournal); /* size 0x25e */
	. = ALIGN(0x10); /* align for .text.pager_reset */
	"build_x86-64/sqlite3.o"(.text.pager_reset); /* size 0x136 */
	. = . + 0x26; /* padding after .text.pager_reset */
	. = ALIGN(0x10); /* align for .text.btreeInitPage */
	"build_x86-64/sqlite3.o"(.text.btreeInitPage); /* size 0x404 */
	. = . + 0x10; /* padding after .text.btreeInitPage */
	. = ALIGN(0x10); /* align for .text.cellSizePtr */
	"build_x86-64/sqlite3.o"(.text.cellSizePtr); /* size 0x18b */
	. = ALIGN(0x10); /* align for .text.btreeParseCellPtr */
	"build_x86-64/sqlite3.o"(.text.btreeParseCellPtr); /* size 0x265 */
	. = ALIGN(0x10); /* align for .text.cellSizePtrNoPayload */
	"build_x86-64/sqlite3.o"(.text.cellSizePtrNoPayload); /* size 0x22 */
	. = ALIGN(0x10); /* align for .text.btreeParseCellPtrNoPayload */
	"build_x86-64/sqlite3.o"(.text.btreeParseCellPtrNoPayload); /* size 0x3b */
	. = . + 0x5; /* padding after .text.btreeParseCellPtrNoPayload */
	. = ALIGN(0x10); /* align for .text.btreeParseCellPtrIndex */
	"build_x86-64/sqlite3.o"(.text.btreeParseCellPtrIndex); /* size 0x146 */
	. = ALIGN(0x10); /* align for .text.btreeParseCellAdjustSizeForOverflow */
	"build_x86-64/sqlite3.o"(.text.btreeParseCellAdjustSizeForOverflow); /* size 0x40 */
	. = . + 0xc; /* padding after .text.btreeParseCellAdjustSizeForOverflow */
	. = ALIGN(0x10); /* align for .text.sqlite3GetVarint */
	"build_x86-64/sqlite3.o"(.text.sqlite3GetVarint); /* size 0x16f */
	. = . + 0x35; /* padding after .text.sqlite3GetVarint */
	. = ALIGN(0x10); /* align for .text.pcache1Alloc */
	"build_x86-64/sqlite3.o"(.text.pcache1Alloc); /* size 0x133 */
	. = . + 0x51; /* padding after .text.pcache1Alloc */
	. = ALIGN(0x10); /* align for .text.sqlite3WalClose */
	"build_x86-64/sqlite3.o"(.text.sqlite3WalClose); /* size 0x337 */
	. = . + 0xd1; /* padding after .text.sqlite3WalClose */
	. = ALIGN(0x10); /* align for .text.sqlite3WalCheckpoint */
	"build_x86-64/sqlite3.o"(.text.sqlite3WalCheckpoint); /* size 0x12f1 */
	. = ALIGN(0x10); /* align for .text.btreeLockCarefully */
	"build_x86-64/sqlite3.o"(.text.btreeLockCarefully); /* size 0xd8 */
	. = . + 0x24; /* padding after .text.btreeLockCarefully */
	. = ALIGN(0x10); /* align for .text.unlockBtreeMutex */
	"build_x86-64/sqlite3.o"(.text.unlockBtreeMutex); /* size 0x27 */
	. = . + 0x11; /* padding after .text.unlockBtreeMutex */
	. = ALIGN(0x10); /* align for .text.newDatabase */
	"build_x86-64/sqlite3.o"(.text.newDatabase); /* size 0x1fb */
	. = . + 0x19; /* padding after .text.newDatabase */
	. = ALIGN(0x10); /* align for .text.sqlite3PagerSharedLock */
	"build_x86-64/sqlite3.o"(.text.sqlite3PagerSharedLock); /* size 0x882 */
	. = ALIGN(0x10); /* align for .text.releasePageOne */
	"build_x86-64/sqlite3.o"(.text.releasePageOne); /* size 0x7c */
	. = . + 0x20; /* padding after .text.releasePageOne */
	. = ALIGN(0x10); /* align for .text.pagerOpenWal */
	"build_x86-64/sqlite3.o"(.text.pagerOpenWal); /* size 0x2f8 */
	. = . + 0x54; /* padding after .text.pagerOpenWal */
	. = ALIGN(0x10); /* align for .text.pagerOpenSavepoint */
	"build_x86-64/sqlite3.o"(.text.pagerOpenSavepoint); /* size 0x163 */
	. = . + 0x25; /* padding after .text.pagerOpenSavepoint */
	. = ALIGN(0x10); /* align for .text.pagerWriteLargeSector */
	"build_x86-64/sqlite3.o"(.text.pagerWriteLargeSector); /* size 0x3a7 */
	. = ALIGN(0x10); /* align for .text.pager_write */
	"build_x86-64/sqlite3.o"(.text.pager_write); /* size 0x393 */
	. = . + 0x95; /* padding after .text.pager_write */
	. = ALIGN(0x10); /* align for .text.pagerAddPageToRollbackJournal */
	"build_x86-64/sqlite3.o"(.text.pagerAddPageToRollbackJournal); /* size 0x17c */
	. = . + 0x84; /* padding after .text.pagerAddPageToRollbackJournal */
	. = ALIGN(0x10); /* align for .text.btreeEndTransaction */
	"build_x86-64/sqlite3.o"(.text.btreeEndTransaction); /* size 0x173 */
	. = . + 0x7d; /* padding after .text.btreeEndTransaction */
	. = ALIGN(0x10); /* align for .text.incrVacuumStep */
	"build_x86-64/sqlite3.o"(.text.incrVacuumStep); /* size 0x36c */
	. = . + 0x58; /* padding after .text.incrVacuumStep */
	. = ALIGN(0x10); /* align for .text.saveCursorsOnList */
	"build_x86-64/sqlite3.o"(.text.saveCursorsOnList); /* size 0x1dd */
	. = ALIGN(0x10); /* align for .text.saveCursorKey */
	"build_x86-64/sqlite3.o"(.text.saveCursorKey); /* size 0xdd */
	. = . + 0x37; /* padding after .text.saveCursorKey */
	. = ALIGN(0x10); /* align for .text.getCellInfo */
	"build_x86-64/sqlite3.o"(.text.getCellInfo); /* size 0x4c */
	. = . + 0x8; /* padding after .text.getCellInfo */
	. = ALIGN(0x10); /* align for .text.accessPayload */
	"build_x86-64/sqlite3.o"(.text.accessPayload); /* size 0x458 */
	. = ALIGN(0x10); /* align for .text.getOverflowPage */
	"build_x86-64/sqlite3.o"(.text.getOverflowPage); /* size 0x1a0 */
	. = . + 0x5c; /* padding after .text.getOverflowPage */
	. = ALIGN(0x10); /* align for .text.ptrmapGet */
	"build_x86-64/sqlite3.o"(.text.ptrmapGet); /* size 0x168 */
	. = . + 0x40; /* padding after .text.ptrmapGet */
	. = ALIGN(0x10); /* align for .text.allocateBtreePage */
	"build_x86-64/sqlite3.o"(.text.allocateBtreePage); /* size 0x11e9 */
	. = ALIGN(0x10); /* align for .text.relocatePage */
	"build_x86-64/sqlite3.o"(.text.relocatePage); /* size 0x85c */
	. = . + 0xc4; /* padding after .text.relocatePage */
	. = ALIGN(0x10); /* align for .text.setChildPtrmaps */
	"build_x86-64/sqlite3.o"(.text.setChildPtrmaps); /* size 0x130 */
	. = . + 0x20; /* padding after .text.setChildPtrmaps */
	. = ALIGN(0x10); /* align for .text.ptrmapPut */
	"build_x86-64/sqlite3.o"(.text.ptrmapPut); /* size 0x1ef */
	. = . + 0x45; /* padding after .text.ptrmapPut */
	. = ALIGN(0x10); /* align for .text.sqlite3PcacheMove */
	"build_x86-64/sqlite3.o"(.text.sqlite3PcacheMove); /* size 0xd5 */
	. = . + 0x23; /* padding after .text.sqlite3PcacheMove */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeTripAllCursors */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeTripAllCursors); /* size 0x2b9 */
	. = ALIGN(0x10); /* align for .text.freeP4 */
	"build_x86-64/sqlite3.o"(.text.freeP4); /* size 0x17d */
	. = . + 0x6b; /* padding after .text.freeP4 */
	. = ALIGN(0x10); /* align for .text.freeP4FuncCtx */
	"build_x86-64/sqlite3.o"(.text.freeP4FuncCtx); /* size 0x1c5 */
	. = . + 0x3b; /* padding after .text.freeP4FuncCtx */
	. = ALIGN(0x10); /* align for .text.freeP4Mem */
	"build_x86-64/sqlite3.o"(.text.freeP4Mem); /* size 0xc8 */
	. = . + 0x48; /* padding after .text.freeP4Mem */
	. = ALIGN(0x10); /* align for .text.apiOomError */
	"build_x86-64/sqlite3.o"(.text.apiOomError); /* size 0x3a */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeHalt */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeHalt); /* size 0x1629 */
	. = . + 0x1a3; /* padding after .text.sqlite3VdbeHalt */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeTransferError */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeTransferError); /* size 0x16e */
	. = ALIGN(0x10); /* align for .text.sqlite3RollbackAll */
	"build_x86-64/sqlite3.o"(.text.sqlite3RollbackAll); /* size 0x163 */
	. = . + 0x11; /* padding after .text.sqlite3RollbackAll */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeFrameRestore */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeFrameRestore); /* size 0x126 */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeFreeCursor */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeFreeCursor); /* size 0x11a */
	. = . + 0x56; /* padding after .text.sqlite3VdbeFreeCursor */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeClose */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeClose); /* size 0x2e8 */
	. = . + 0xc0; /* padding after .text.sqlite3BtreeClose */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeCloseCursor */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeCloseCursor); /* size 0x228 */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeSorterReset */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeSorterReset); /* size 0xa03 */
	. = . + 0x191; /* padding after .text.sqlite3VdbeSorterReset */
	. = ALIGN(0x10); /* align for .text.vdbePmaReaderClear */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReaderClear); /* size 0x41 */
	. = . + 0x3; /* padding after .text.vdbePmaReaderClear */
	. = ALIGN(0x10); /* align for .text.vdbeMergeEngineFree */
	"build_x86-64/sqlite3.o"(.text.vdbeMergeEngineFree); /* size 0xb4 */
	. = . + 0x40; /* padding after .text.vdbeMergeEngineFree */
	. = ALIGN(0x10); /* align for .text.vdbeSorterJoinThread */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterJoinThread); /* size 0xbb */
	. = . + 0x39; /* padding after .text.vdbeSorterJoinThread */
	. = ALIGN(0x10); /* align for .text.vdbeIncrFree */
	"build_x86-64/sqlite3.o"(.text.vdbeIncrFree); /* size 0x50 */
	. = . + 0x8; /* padding after .text.vdbeIncrFree */
	. = ALIGN(0x10); /* align for .text.sqlite3OsCloseFree */
	"build_x86-64/sqlite3.o"(.text.sqlite3OsCloseFree); /* size 0x86 */
	. = . + 0x42; /* padding after .text.sqlite3OsCloseFree */
	. = ALIGN(0x10); /* align for .text.sqlite3VtabRollback */
	"build_x86-64/sqlite3.o"(.text.sqlite3VtabRollback); /* size 0x158 */
	. = . + 0x2c; /* padding after .text.sqlite3VtabRollback */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeError */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeError); /* size 0x147 */
	. = ALIGN(0x10); /* align for .text.vdbeLeave */
	"build_x86-64/sqlite3.o"(.text.vdbeLeave); /* size 0x74 */
	. = . + 0x30; /* padding after .text.vdbeLeave */
	. = ALIGN(0x10); /* align for .text.sqlite3VtabCommit */
	"build_x86-64/sqlite3.o"(.text.sqlite3VtabCommit); /* size 0x158 */
	. = . + 0x2c; /* padding after .text.sqlite3VtabCommit */
	. = ALIGN(0x10); /* align for .text.vdbeCloseStatement */
	"build_x86-64/sqlite3.o"(.text.vdbeCloseStatement); /* size 0x1fd */
	. = . + 0x3f; /* padding after .text.vdbeCloseStatement */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeSavepoint */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeSavepoint); /* size 0xdb */
	. = . + 0x35; /* padding after .text.sqlite3BtreeSavepoint */
	. = ALIGN(0x10); /* align for .text.vdbeMemClear */
	"build_x86-64/sqlite3.o"(.text.vdbeMemClear); /* size 0xdf */
	. = . + 0x45; /* padding after .text.vdbeMemClear */
	. = ALIGN(0x10); /* align for .text.vdbeMemClearExternAndSetNull */
	"build_x86-64/sqlite3.o"(.text.vdbeMemClearExternAndSetNull); /* size 0x163 */
	. = . + 0x25; /* padding after .text.vdbeMemClearExternAndSetNull */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMemGrow */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMemGrow); /* size 0x32c */
	. = . + 0x70; /* padding after .text.sqlite3VdbeMemGrow */
	. = ALIGN(0x10); /* align for .text.valueBytes */
	"build_x86-64/sqlite3.o"(.text.valueBytes); /* size 0x21 */
	. = . + 0x7; /* padding after .text.valueBytes */
	. = ALIGN(0x10); /* align for .text.valueToText */
	"build_x86-64/sqlite3.o"(.text.valueToText); /* size 0x162 */
	. = . + 0x52; /* padding after .text.valueToText */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMemStringify */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMemStringify); /* size 0xe1 */
	. = . + 0x2b; /* padding after .text.sqlite3VdbeMemStringify */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMemTranslate */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMemTranslate); /* size 0x6f1 */
	. = . + 0xb; /* padding after .text.sqlite3VdbeMemTranslate */
	. = ALIGN(0x10); /* align for .text.vdbeMemAddTerminator */
	"build_x86-64/sqlite3.o"(.text.vdbeMemAddTerminator); /* size 0x4a */
	. = . + 0x16; /* padding after .text.vdbeMemAddTerminator */
	. = ALIGN(0x10); /* align for .text.memRealValue */
	"build_x86-64/sqlite3.o"(.text.memRealValue); /* size 0x32 */
	. = . + 0x6; /* padding after .text.memRealValue */
	. = ALIGN(0x10); /* align for .text.sqlite3AtoF */
	"build_x86-64/sqlite3.o"(.text.sqlite3AtoF); /* size 0x4e8 */
	. = . + 0x98; /* padding after .text.sqlite3AtoF */
	. = ALIGN(0x10); /* align for .text.doubleToInt64 */
	"build_x86-64/sqlite3.o"(.text.doubleToInt64); /* size 0x33 */
	. = . + 0x5; /* padding after .text.doubleToInt64 */
	. = ALIGN(0x10); /* align for .text.memIntValue */
	"build_x86-64/sqlite3.o"(.text.memIntValue); /* size 0x31 */
	. = . + 0x7; /* padding after .text.memIntValue */
	. = ALIGN(0x10); /* align for .text.sqlite3Atoi64 */
	"build_x86-64/sqlite3.o"(.text.sqlite3Atoi64); /* size 0x262 */
	. = . + 0x2e; /* padding after .text.sqlite3Atoi64 */
	. = ALIGN(0x10); /* align for .text.vdbeReleaseAndSetInt64 */
	"build_x86-64/sqlite3.o"(.text.vdbeReleaseAndSetInt64); /* size 0x31 */
	. = . + 0x1f; /* padding after .text.vdbeReleaseAndSetInt64 */
	. = ALIGN(0x10); /* align for .text.sqlite3NoopDestructor */
	"build_x86-64/sqlite3.o"(.text.sqlite3NoopDestructor); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeExec */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeExec); /* size 0xe755 */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMemCast */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMemCast); /* size 0x14a */
	. = . + 0x32; /* padding after .text.sqlite3VdbeMemCast */
	. = ALIGN(0x10); /* align for .text.sqlite3MemCompare */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemCompare); /* size 0x113 */
	. = . + 0x61; /* padding after .text.sqlite3MemCompare */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeSerialGet */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeSerialGet); /* size 0x14c */
	. = . + 0x4c; /* padding after .text.sqlite3VdbeSerialGet */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeCursor */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeCursor); /* size 0x176 */
	. = . + 0x32; /* padding after .text.sqlite3BtreeCursor */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeCreateTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeCreateTable); /* size 0x75d */
	. = . + 0x1f; /* padding after .text.sqlite3BtreeCreateTable */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeMovetoUnpacked */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeMovetoUnpacked); /* size 0x6c3 */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeNext */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeNext); /* size 0x123 */
	. = . + 0x25; /* padding after .text.sqlite3BtreeNext */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreePrevious */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreePrevious); /* size 0x3a */
	. = . + 0x6; /* padding after .text.sqlite3BtreePrevious */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeRecordUnpack */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeRecordUnpack); /* size 0x187 */
	. = . + 0x1d; /* padding after .text.sqlite3VdbeRecordUnpack */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeLast */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeLast); /* size 0x14d */
	. = . + 0x17; /* padding after .text.sqlite3BtreeLast */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeInsert */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeInsert); /* size 0xa69 */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeDelete */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeDelete); /* size 0x765 */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeFirst */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeFirst); /* size 0xfd */
	. = . + 0x23; /* padding after .text.sqlite3BtreeFirst */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeClearTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeClearTable); /* size 0xf8 */
	. = . + 0x3c; /* padding after .text.sqlite3BtreeClearTable */
	. = ALIGN(0x10); /* align for .text.sqlite3SchemaClear */
	"build_x86-64/sqlite3.o"(.text.sqlite3SchemaClear); /* size 0x495 */
	. = . + 0x143; /* padding after .text.sqlite3SchemaClear */
	. = ALIGN(0x10); /* align for .text.sqlite3InitOne */
	"build_x86-64/sqlite3.o"(.text.sqlite3InitOne); /* size 0x938 */
	. = ALIGN(0x10); /* align for .text.sqlite3InitCallback */
	"build_x86-64/sqlite3.o"(.text.sqlite3InitCallback); /* size 0x4e4 */
	. = ALIGN(0x10); /* align for .text.sqlite3AnalysisLoad */
	"build_x86-64/sqlite3.o"(.text.sqlite3AnalysisLoad); /* size 0x215 */
	. = . + 0x17; /* padding after .text.sqlite3AnalysisLoad */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMemSetRowSet */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMemSetRowSet); /* size 0x155 */
	. = . + 0x7; /* padding after .text.sqlite3VdbeMemSetRowSet */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeFrameMemDel */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeFrameMemDel); /* size 0x1b */
	. = ALIGN(0x10); /* align for .text.sqlite3PagerSetJournalMode */
	"build_x86-64/sqlite3.o"(.text.sqlite3PagerSetJournalMode); /* size 0x15a */
	. = . + 0x6a; /* padding after .text.sqlite3PagerSetJournalMode */
	. = ALIGN(0x10); /* align for .text.out2PrereleaseWithClear */
	"build_x86-64/sqlite3.o"(.text.out2PrereleaseWithClear); /* size 0x2f */
	. = . + 0x1d; /* padding after .text.out2PrereleaseWithClear */
	. = ALIGN(0x10); /* align for .text.vdbeClrCopy */
	"build_x86-64/sqlite3.o"(.text.vdbeClrCopy); /* size 0x5e */
	. = . + 0xe; /* padding after .text.vdbeClrCopy */
	. = ALIGN(0x10); /* align for .text.computeNumericType */
	"build_x86-64/sqlite3.o"(.text.computeNumericType); /* size 0x4c */
	. = . + 0xc; /* padding after .text.computeNumericType */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMemNumerify */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMemNumerify); /* size 0x90 */
	. = . + 0x20; /* padding after .text.sqlite3VdbeMemNumerify */
	. = ALIGN(0x10); /* align for .text.vdbeCompareMemString */
	"build_x86-64/sqlite3.o"(.text.vdbeCompareMemString); /* size 0x1ac */
	. = . + 0x24; /* padding after .text.vdbeCompareMemString */
	. = ALIGN(0x10); /* align for .text.sqlite3BlobCompare */
	"build_x86-64/sqlite3.o"(.text.sqlite3BlobCompare); /* size 0xb4 */
	. = . + 0x2c; /* padding after .text.sqlite3BlobCompare */
	. = ALIGN(0x10); /* align for .text.handleDeferredMoveto */
	"build_x86-64/sqlite3.o"(.text.handleDeferredMoveto); /* size 0x71 */
	. = . + 0x1b; /* padding after .text.handleDeferredMoveto */
	. = ALIGN(0x10); /* align for .text.handleMovedCursor */
	"build_x86-64/sqlite3.o"(.text.handleMovedCursor); /* size 0xf3 */
	. = . + 0x61; /* padding after .text.handleMovedCursor */
	. = ALIGN(0x10); /* align for .text.btreeMoveto */
	"build_x86-64/sqlite3.o"(.text.btreeMoveto); /* size 0x1cc */
	. = ALIGN(0x10); /* align for .text.vdbeMemFromBtreeResize */
	"build_x86-64/sqlite3.o"(.text.vdbeMemFromBtreeResize); /* size 0xa6 */
	. = . + 0x2e; /* padding after .text.vdbeMemFromBtreeResize */
	. = ALIGN(0x10); /* align for .text.serialGet */
	"build_x86-64/sqlite3.o"(.text.serialGet); /* size 0x44 */
	. = . + 0x8; /* padding after .text.serialGet */
	. = ALIGN(0x10); /* align for .text.putVarint64 */
	"build_x86-64/sqlite3.o"(.text.putVarint64); /* size 0x2b3 */
	. = ALIGN(0x10); /* align for .text.moveToRoot */
	"build_x86-64/sqlite3.o"(.text.moveToRoot); /* size 0x25c */
	. = . + 0x88; /* padding after .text.moveToRoot */
	. = ALIGN(0x10); /* align for .text.getAndInitPage */
	"build_x86-64/sqlite3.o"(.text.getAndInitPage); /* size 0x1de */
	. = ALIGN(0x10); /* align for .text.vdbeRecordCompareInt */
	"build_x86-64/sqlite3.o"(.text.vdbeRecordCompareInt); /* size 0x129 */
	. = ALIGN(0x10); /* align for .text.vdbeRecordCompareString */
	"build_x86-64/sqlite3.o"(.text.vdbeRecordCompareString); /* size 0x17a */
	. = . + 0x2a; /* padding after .text.vdbeRecordCompareString */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeRecordCompare */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeRecordCompare); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeRecordCompareWithSkip */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeRecordCompareWithSkip); /* size 0x852 */
	. = ALIGN(0x10); /* align for .text.btreeNext */
	"build_x86-64/sqlite3.o"(.text.btreeNext); /* size 0x397 */
	. = . + 0x8d; /* padding after .text.btreeNext */
	. = ALIGN(0x10); /* align for .text.btreePrevious */
	"build_x86-64/sqlite3.o"(.text.btreePrevious); /* size 0x323 */
	. = . + 0x55; /* padding after .text.btreePrevious */
	. = ALIGN(0x10); /* align for .text.btreeOverwriteCell */
	"build_x86-64/sqlite3.o"(.text.btreeOverwriteCell); /* size 0x209 */
	. = . + 0x17; /* padding after .text.btreeOverwriteCell */
	. = ALIGN(0x10); /* align for .text.clearCell */
	"build_x86-64/sqlite3.o"(.text.clearCell); /* size 0x260 */
	. = . + 0x48; /* padding after .text.clearCell */
	. = ALIGN(0x10); /* align for .text.dropCell */
	"build_x86-64/sqlite3.o"(.text.dropCell); /* size 0x131 */
	. = . + 0x23; /* padding after .text.dropCell */
	. = ALIGN(0x10); /* align for .text.insertCell */
	"build_x86-64/sqlite3.o"(.text.insertCell); /* size 0x315 */
	. = . + 0x4b; /* padding after .text.insertCell */
	. = ALIGN(0x10); /* align for .text.balance */
	"build_x86-64/sqlite3.o"(.text.balance); /* size 0x2e8c */
	. = ALIGN(0x10); /* align for .text.btreeOverwriteContent */
	"build_x86-64/sqlite3.o"(.text.btreeOverwriteContent); /* size 0x181 */
	. = . + 0x2f; /* padding after .text.btreeOverwriteContent */
	. = ALIGN(0x10); /* align for .text.freePage2 */
	"build_x86-64/sqlite3.o"(.text.freePage2); /* size 0x645 */
	. = . + 0xbb; /* padding after .text.freePage2 */
	. = ALIGN(0x10); /* align for .text.freeSpace */
	"build_x86-64/sqlite3.o"(.text.freeSpace); /* size 0x2f0 */
	. = . + 0x34; /* padding after .text.freeSpace */
	. = ALIGN(0x10); /* align for .text.pageFindSlot */
	"build_x86-64/sqlite3.o"(.text.pageFindSlot); /* size 0x122 */
	. = . + 0x26; /* padding after .text.pageFindSlot */
	. = ALIGN(0x10); /* align for .text.defragmentPage */
	"build_x86-64/sqlite3.o"(.text.defragmentPage); /* size 0x3b8 */
	. = ALIGN(0x10); /* align for .text.rebuildPage */
	"build_x86-64/sqlite3.o"(.text.rebuildPage); /* size 0x191 */
	. = ALIGN(0x10); /* align for .text.computeCellSize */
	"build_x86-64/sqlite3.o"(.text.computeCellSize); /* size 0x2a */
	. = . + 0x12; /* padding after .text.computeCellSize */
	. = ALIGN(0x10); /* align for .text.vdbeSorterSort */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterSort); /* size 0x3f9 */
	. = ALIGN(0x10); /* align for .text.vdbeSorterFlushPMA */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterFlushPMA); /* size 0x1c3 */
	. = . + 0x1; /* padding after .text.vdbeSorterFlushPMA */
	. = ALIGN(0x10); /* align for .text.vdbeSorterSetupMerge */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterSetupMerge); /* size 0x4478 */
	. = . + 0x800; /* padding after .text.vdbeSorterSetupMerge */
	. = ALIGN(0x10); /* align for .text.vdbeSorterCompareInt */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterCompareInt); /* size 0x14e */
	. = . + 0x32; /* padding after .text.vdbeSorterCompareInt */
	. = ALIGN(0x10); /* align for .text.vdbeSorterCompareText */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterCompareText); /* size 0x1c0 */
	. = . + 0x24; /* padding after .text.vdbeSorterCompareText */
	. = ALIGN(0x10); /* align for .text.vdbeSorterCompare */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterCompare); /* size 0x51 */
	. = . + 0x17; /* padding after .text.vdbeSorterCompare */
	. = ALIGN(0x10); /* align for .text.vdbeSorterListToPMA */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterListToPMA); /* size 0x5a5 */
	. = ALIGN(0x10); /* align for .text.vdbeSorterFlushThread */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterFlushThread); /* size 0x22 */
	. = . + 0xe; /* padding after .text.vdbeSorterFlushThread */
	. = ALIGN(0x10); /* align for .text.vdbeSorterOpenTempFile */
	"build_x86-64/sqlite3.o"(.text.vdbeSorterOpenTempFile); /* size 0x133 */
	. = . + 0x39; /* padding after .text.vdbeSorterOpenTempFile */
	. = ALIGN(0x10); /* align for .text.vdbePmaReaderIncrInit */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReaderIncrInit); /* size 0xdd */
	. = . + 0xb; /* padding after .text.vdbePmaReaderIncrInit */
	. = ALIGN(0x10); /* align for .text.vdbePmaReaderIncrMergeInit */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReaderIncrMergeInit); /* size 0x10b */
	. = . + 0xd; /* padding after .text.vdbePmaReaderIncrMergeInit */
	. = ALIGN(0x10); /* align for .text.vdbeMergeEngineInit */
	"build_x86-64/sqlite3.o"(.text.vdbeMergeEngineInit); /* size 0x1d3 */
	. = ALIGN(0x10); /* align for .text.vdbeMergeEngineLevel0 */
	"build_x86-64/sqlite3.o"(.text.vdbeMergeEngineLevel0); /* size 0x4fe */
	. = . + 0x8e; /* padding after .text.vdbeMergeEngineLevel0 */
	. = ALIGN(0x10); /* align for .text.vdbePmaReaderSeek */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReaderSeek); /* size 0x10e */
	. = . + 0x12; /* padding after .text.vdbePmaReaderSeek */
	. = ALIGN(0x10); /* align for .text.vdbePmaReadVarint */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReadVarint); /* size 0xab */
	. = . + 0x25; /* padding after .text.vdbePmaReadVarint */
	. = ALIGN(0x10); /* align for .text.vdbePmaReaderNext */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReaderNext); /* size 0x4c2 */
	. = . + 0x106; /* padding after .text.vdbePmaReaderNext */
	. = ALIGN(0x10); /* align for .text.vdbePmaReadBlob */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReadBlob); /* size 0x188 */
	. = . + 0x18; /* padding after .text.vdbePmaReadBlob */
	. = ALIGN(0x10); /* align for .text.vdbeIncrPopulate */
	"build_x86-64/sqlite3.o"(.text.vdbeIncrPopulate); /* size 0x409 */
	. = ALIGN(0x10); /* align for .text.vdbeIncrPopulateThread */
	"build_x86-64/sqlite3.o"(.text.vdbeIncrPopulateThread); /* size 0x21 */
	. = . + 0xf; /* padding after .text.vdbeIncrPopulateThread */
	. = ALIGN(0x10); /* align for .text.vdbeMergeEngineStep */
	"build_x86-64/sqlite3.o"(.text.vdbeMergeEngineStep); /* size 0x1a6 */
	. = ALIGN(0x10); /* align for .text.vdbePmaReaderBgIncrInit */
	"build_x86-64/sqlite3.o"(.text.vdbePmaReaderBgIncrInit); /* size 0x2a */
	. = . + 0xe; /* padding after .text.vdbePmaReaderBgIncrInit */
	. = ALIGN(0x10); /* align for .text.clearDatabasePage */
	"build_x86-64/sqlite3.o"(.text.clearDatabasePage); /* size 0x3b6 */
	. = . + 0x16; /* padding after .text.clearDatabasePage */
	. = ALIGN(0x10); /* align for .text.corruptSchema */
	"build_x86-64/sqlite3.o"(.text.corruptSchema); /* size 0x1b5 */
	. = . + 0x27; /* padding after .text.corruptSchema */
	. = ALIGN(0x10); /* align for .text.sqlite3GetInt32 */
	"build_x86-64/sqlite3.o"(.text.sqlite3GetInt32); /* size 0x33e */
	. = ALIGN(0x10); /* align for .text.analysisLoader */
	"build_x86-64/sqlite3.o"(.text.analysisLoader); /* size 0x335 */
	. = ALIGN(0x10); /* align for .text.decodeIntArray */
	"build_x86-64/sqlite3.o"(.text.decodeIntArray); /* size 0x2bc */
	. = . + 0x18; /* padding after .text.decodeIntArray */
	. = ALIGN(0x10); /* align for .text.sqlite3HashInsert */
	"build_x86-64/sqlite3.o"(.text.sqlite3HashInsert); /* size 0x633 */
	. = . + 0x65; /* padding after .text.sqlite3HashInsert */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprDeleteNN */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprDeleteNN); /* size 0x162 */
	. = . + 0x4e; /* padding after .text.sqlite3ExprDeleteNN */
	. = ALIGN(0x10); /* align for .text.sqlite3WindowDelete */
	"build_x86-64/sqlite3.o"(.text.sqlite3WindowDelete); /* size 0x82 */
	. = . + 0xa; /* padding after .text.sqlite3WindowDelete */
	. = ALIGN(0x10); /* align for .text.clearSelect */
	"build_x86-64/sqlite3.o"(.text.clearSelect); /* size 0x246 */
	. = ALIGN(0x10); /* align for .text.sqlite3SrcListDelete */
	"build_x86-64/sqlite3.o"(.text.sqlite3SrcListDelete); /* size 0x2d8 */
	. = . + 0x4c; /* padding after .text.sqlite3SrcListDelete */
	. = ALIGN(0x10); /* align for .text.exprListDeleteNN */
	"build_x86-64/sqlite3.o"(.text.exprListDeleteNN); /* size 0x112 */
	. = . + 0x5a; /* padding after .text.exprListDeleteNN */
	. = ALIGN(0x10); /* align for .text.checkList */
	"build_x86-64/sqlite3.o"(.text.checkList); /* size 0x4b6 */
	. = ALIGN(0x10); /* align for .text.checkAppendMsg */
	"build_x86-64/sqlite3.o"(.text.checkAppendMsg); /* size 0x10b */
	. = . + 0xd; /* padding after .text.checkAppendMsg */
	. = ALIGN(0x10); /* align for .text.checkTreePage */
	"build_x86-64/sqlite3.o"(.text.checkTreePage); /* size 0xa66 */
	. = ALIGN(0x10); /* align for .text.sqlite3RowSetDelete */
	"build_x86-64/sqlite3.o"(.text.sqlite3RowSetDelete); /* size 0x63 */
	. = ALIGN(0x10); /* align for .text.rowSetTreeToList */
	"build_x86-64/sqlite3.o"(.text.rowSetTreeToList); /* size 0x59 */
	. = . + 0x13; /* padding after .text.rowSetTreeToList */
	. = ALIGN(0x10); /* align for .text.rowSetNDeepTree */
	"build_x86-64/sqlite3.o"(.text.rowSetNDeepTree); /* size 0x70 */
	. = . + 0xc; /* padding after .text.rowSetNDeepTree */
	. = ALIGN(0x10); /* align for .text.execSql */
	"build_x86-64/sqlite3.o"(.text.execSql); /* size 0x1d5 */
	. = . + 0xb; /* padding after .text.execSql */
	. = ALIGN(0x10); /* align for .text.sqlite3BtreeSetPagerFlags */
	"build_x86-64/sqlite3.o"(.text.sqlite3BtreeSetPagerFlags); /* size 0x101 */
	. = . + 0x27; /* padding after .text.sqlite3BtreeSetPagerFlags */
	. = ALIGN(0x10); /* align for .text.execSqlF */
	"build_x86-64/sqlite3.o"(.text.execSqlF); /* size 0x169 */
	. = ALIGN(0x10); /* align for .text.vtabCallConstructor */
	"build_x86-64/sqlite3.o"(.text.vtabCallConstructor); /* size 0x82c */
	. = ALIGN(0x10); /* align for .text.sqlite3GetToken */
	"build_x86-64/sqlite3.o"(.text.sqlite3GetToken); /* size 0x709 */
	. = . + 0x6b; /* padding after .text.sqlite3GetToken */
	. = ALIGN(0x10); /* align for .text.growOp3 */
	"build_x86-64/sqlite3.o"(.text.growOp3); /* size 0x8d */
	. = . + 0x7; /* padding after .text.growOp3 */
	. = ALIGN(0x10); /* align for .text.growOpArray */
	"build_x86-64/sqlite3.o"(.text.growOpArray); /* size 0x187 */
	. = . + 0x29; /* padding after .text.growOpArray */
	. = ALIGN(0x10); /* align for .text.vdbeChangeP4Full */
	"build_x86-64/sqlite3.o"(.text.vdbeChangeP4Full); /* size 0x1d5 */
	. = . + 0x23; /* padding after .text.vdbeChangeP4Full */
	. = ALIGN(0x10); /* align for .text.resolveP2Values */
	"build_x86-64/sqlite3.o"(.text.resolveP2Values); /* size 0x113 */
	. = . + 0x25; /* padding after .text.resolveP2Values */
	. = ALIGN(0x10); /* align for .text.accessPayloadChecked */
	"build_x86-64/sqlite3.o"(.text.accessPayloadChecked); /* size 0xff */
	. = . + 0x61; /* padding after .text.accessPayloadChecked */
	. = ALIGN(0x10); /* align for .text.sqlite3VtabCreateModule */
	"build_x86-64/sqlite3.o"(.text.sqlite3VtabCreateModule); /* size 0x12c */
	. = . + 0x4; /* padding after .text.sqlite3VtabCreateModule */
	. = ALIGN(0x10); /* align for .text.pragmaVtabConnect */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabConnect); /* size 0x28a */
	. = . + 0x42; /* padding after .text.pragmaVtabConnect */
	. = ALIGN(0x10); /* align for .text.pragmaVtabBestIndex */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabBestIndex); /* size 0xe2 */
	. = . + 0x6; /* padding after .text.pragmaVtabBestIndex */
	. = ALIGN(0x10); /* align for .text.pragmaVtabDisconnect */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabDisconnect); /* size 0x72 */
	. = . + 0x3e; /* padding after .text.pragmaVtabDisconnect */
	. = ALIGN(0x10); /* align for .text.pragmaVtabOpen */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabOpen); /* size 0x4b */
	. = . + 0xd; /* padding after .text.pragmaVtabOpen */
	. = ALIGN(0x10); /* align for .text.pragmaVtabClose */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabClose); /* size 0x77 */
	. = . + 0x3d; /* padding after .text.pragmaVtabClose */
	. = ALIGN(0x10); /* align for .text.pragmaVtabFilter */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabFilter); /* size 0x2aa */
	. = . + 0x52; /* padding after .text.pragmaVtabFilter */
	. = ALIGN(0x10); /* align for .text.pragmaVtabNext */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabNext); /* size 0x45 */
	. = . + 0x13; /* padding after .text.pragmaVtabNext */
	. = ALIGN(0x10); /* align for .text.pragmaVtabEof */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabEof); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.pragmaVtabColumn */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabColumn); /* size 0x7f */
	. = . + 0x19; /* padding after .text.pragmaVtabColumn */
	. = ALIGN(0x10); /* align for .text.pragmaVtabRowid */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabRowid); /* size 0xf */
	. = . + 0x1; /* padding after .text.pragmaVtabRowid */
	. = ALIGN(0x10); /* align for .text.pragmaVtabCursorClear */
	"build_x86-64/sqlite3.o"(.text.pragmaVtabCursorClear); /* size 0xf8 */
	. = . + 0x68; /* padding after .text.pragmaVtabCursorClear */
	. = ALIGN(0x10); /* align for .text.sqlite3VtabUnlockList */
	"build_x86-64/sqlite3.o"(.text.sqlite3VtabUnlockList); /* size 0x8c */
	. = . + 0x8; /* padding after .text.sqlite3VtabUnlockList */
	. = ALIGN(0x10); /* align for .text.sqlite3CollapseDatabaseArray */
	"build_x86-64/sqlite3.o"(.text.sqlite3CollapseDatabaseArray); /* size 0xf5 */
	. = ALIGN(0x10); /* align for .text.deleteTable */
	"build_x86-64/sqlite3.o"(.text.deleteTable); /* size 0x37d */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeSetNumCols */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeSetNumCols); /* size 0x265 */
	. = . + 0x7b; /* padding after .text.sqlite3VdbeSetNumCols */
	. = ALIGN(0x10); /* align for .text.sqlite3DeleteTriggerStep */
	"build_x86-64/sqlite3.o"(.text.sqlite3DeleteTriggerStep); /* size 0x1f8 */
	. = . + 0x28; /* padding after .text.sqlite3DeleteTriggerStep */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCollSeq */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCollSeq); /* size 0x290 */
	. = ALIGN(0x10); /* align for .text.sqlite3FindCollSeq */
	"build_x86-64/sqlite3.o"(.text.sqlite3FindCollSeq); /* size 0x34a */
	. = . + 0x3e; /* padding after .text.sqlite3FindCollSeq */
	. = ALIGN(0x10); /* align for .text.sqlite3GetCollSeq */
	"build_x86-64/sqlite3.o"(.text.sqlite3GetCollSeq); /* size 0x853 */
	. = ALIGN(0x10); /* align for .text.yy_reduce */
	"build_x86-64/sqlite3.o"(.text.yy_reduce); /* size 0x10ac9 */
	. = ALIGN(0x10); /* align for .text.yy_destructor */
	"build_x86-64/sqlite3.o"(.text.yy_destructor); /* size 0x2d4 */
	. = . + 0x54; /* padding after .text.yy_destructor */
	. = ALIGN(0x10); /* align for .text.sqlite3Savepoint */
	"build_x86-64/sqlite3.o"(.text.sqlite3Savepoint); /* size 0x446 */
	. = ALIGN(0x10); /* align for .text.sqlite3StartTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3StartTable); /* size 0x1638 */
	. = ALIGN(0x10); /* align for .text.sqlite3EndTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3EndTable); /* size 0x1bdd */
	. = ALIGN(0x10); /* align for .text.sqlite3AddDefaultValue */
	"build_x86-64/sqlite3.o"(.text.sqlite3AddDefaultValue); /* size 0x2c4 */
	. = ALIGN(0x10); /* align for .text.tokenExpr */
	"build_x86-64/sqlite3.o"(.text.tokenExpr); /* size 0x268 */
	. = ALIGN(0x10); /* align for .text.sqlite3AddPrimaryKey */
	"build_x86-64/sqlite3.o"(.text.sqlite3AddPrimaryKey); /* size 0x3be */
	. = ALIGN(0x10); /* align for .text.sqlite3CreateIndex */
	"build_x86-64/sqlite3.o"(.text.sqlite3CreateIndex); /* size 0x293e */
	. = ALIGN(0x10); /* align for .text.sqlite3CreateForeignKey */
	"build_x86-64/sqlite3.o"(.text.sqlite3CreateForeignKey); /* size 0x711 */
	. = ALIGN(0x10); /* align for .text.sqlite3DropTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3DropTable); /* size 0x1a4c */
	. = ALIGN(0x10); /* align for .text.sqlite3Select */
	"build_x86-64/sqlite3.o"(.text.sqlite3Select); /* size 0xa9ed */
	. = ALIGN(0x10); /* align for .text.sqlite3SrcListAppendFromTerm */
	"build_x86-64/sqlite3.o"(.text.sqlite3SrcListAppendFromTerm); /* size 0x43a */
	. = ALIGN(0x10); /* align for .text.sqlite3SelectNew */
	"build_x86-64/sqlite3.o"(.text.sqlite3SelectNew); /* size 0x297 */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprListAppend */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprListAppend); /* size 0x146 */
	. = . + 0x12; /* padding after .text.sqlite3ExprListAppend */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprAlloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprAlloc); /* size 0x1e4 */
	. = . + 0x14; /* padding after .text.sqlite3ExprAlloc */
	. = ALIGN(0x10); /* align for .text.sqlite3SrcListAppend */
	"build_x86-64/sqlite3.o"(.text.sqlite3SrcListAppend); /* size 0x4f5 */
	. = ALIGN(0x10); /* align for .text.sqlite3JoinType */
	"build_x86-64/sqlite3.o"(.text.sqlite3JoinType); /* size 0x2ca */
	. = ALIGN(0x10); /* align for .text.sqlite3DeleteFrom */
	"build_x86-64/sqlite3.o"(.text.sqlite3DeleteFrom); /* size 0x1d35 */
	. = ALIGN(0x10); /* align for .text.sqlite3Update */
	"build_x86-64/sqlite3.o"(.text.sqlite3Update); /* size 0x4d8d */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprListAppendVector */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprListAppendVector); /* size 0x3ac */
	. = . + 0x8; /* padding after .text.sqlite3ExprListAppendVector */
	. = ALIGN(0x10); /* align for .text.sqlite3Insert */
	"build_x86-64/sqlite3.o"(.text.sqlite3Insert); /* size 0x5e6d */
	. = ALIGN(0x10); /* align for .text.sqlite3IdListAppend */
	"build_x86-64/sqlite3.o"(.text.sqlite3IdListAppend); /* size 0x59f */
	. = ALIGN(0x10); /* align for .text.sqlite3Pragma */
	"build_x86-64/sqlite3.o"(.text.sqlite3Pragma); /* size 0x6be8 */
	. = ALIGN(0x10); /* align for .text.sqlite3Analyze */
	"build_x86-64/sqlite3.o"(.text.sqlite3Analyze); /* size 0xac6 */
	. = ALIGN(0x10); /* align for .text.sqlite3VtabFinishParse */
	"build_x86-64/sqlite3.o"(.text.sqlite3VtabFinishParse); /* size 0x7bd */
	. = ALIGN(0x10); /* align for .text.sqlite3WithAdd */
	"build_x86-64/sqlite3.o"(.text.sqlite3WithAdd); /* size 0x3bc */
	. = ALIGN(0x10); /* align for .text.sqlite3WindowAlloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3WindowAlloc); /* size 0x18c */
	. = . + 0x2c; /* padding after .text.sqlite3WindowAlloc */
	. = ALIGN(0x10); /* align for .text.sqlite3OpenTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3OpenTable); /* size 0x36b */
	. = ALIGN(0x10); /* align for .text.sqlite3TableLock */
	"build_x86-64/sqlite3.o"(.text.sqlite3TableLock); /* size 0x227 */
	. = . + 0x29; /* padding after .text.sqlite3TableLock */
	. = ALIGN(0x10); /* align for .text.sqlite3KeyInfoOfIndex */
	"build_x86-64/sqlite3.o"(.text.sqlite3KeyInfoOfIndex); /* size 0x3b4 */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCodeTarget */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCodeTarget); /* size 0x37df */
	. = ALIGN(0x10); /* align for .text.codeInteger */
	"build_x86-64/sqlite3.o"(.text.codeInteger); /* size 0x4bf */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCodeTemp */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCodeTemp); /* size 0x10d */
	. = . + 0x1f; /* padding after .text.sqlite3ExprCodeTemp */
	. = ALIGN(0x10); /* align for .text.codeCompare */
	"build_x86-64/sqlite3.o"(.text.codeCompare); /* size 0x1a7 */
	. = . + 0x45; /* padding after .text.codeCompare */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCodeAtInit */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCodeAtInit); /* size 0xf5 */
	. = . + 0x13; /* padding after .text.sqlite3ExprCodeAtInit */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCodeExprList */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCodeExprList); /* size 0x269 */
	. = ALIGN(0x10); /* align for .text.sqlite3VtabOverloadFunction */
	"build_x86-64/sqlite3.o"(.text.sqlite3VtabOverloadFunction); /* size 0x213 */
	. = ALIGN(0x10); /* align for .text.sqlite3CodeSubselect */
	"build_x86-64/sqlite3.o"(.text.sqlite3CodeSubselect); /* size 0xfb2 */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCodeIN */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCodeIN); /* size 0x189b */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprIfFalse */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprIfFalse); /* size 0xa25 */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCodeGetColumnOfTable */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCodeGetColumnOfTable); /* size 0x307 */
	. = ALIGN(0x10); /* align for .text.valueFromExpr */
	"build_x86-64/sqlite3.o"(.text.valueFromExpr); /* size 0x1027 */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprAffinity */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprAffinity); /* size 0x192 */
	. = . + 0x6a; /* padding after .text.sqlite3ExprAffinity */
	. = ALIGN(0x10); /* align for .text.exprNodeIsConstant */
	"build_x86-64/sqlite3.o"(.text.exprNodeIsConstant); /* size 0x140 */
	. = . + 0x28; /* padding after .text.exprNodeIsConstant */
	. = ALIGN(0x10); /* align for .text.sqlite3SelectWalkFail */
	"build_x86-64/sqlite3.o"(.text.sqlite3SelectWalkFail); /* size 0xf */
	. = . + 0x1; /* padding after .text.sqlite3SelectWalkFail */
	. = ALIGN(0x10); /* align for .text.walkExpr */
	"build_x86-64/sqlite3.o"(.text.walkExpr); /* size 0x292 */
	. = ALIGN(0x10); /* align for .text.sqlite3WalkSelect */
	"build_x86-64/sqlite3.o"(.text.sqlite3WalkSelect); /* size 0x12d */
	. = ALIGN(0x10); /* align for .text.sqlite3WalkSelectExpr */
	"build_x86-64/sqlite3.o"(.text.sqlite3WalkSelectExpr); /* size 0x13c */
	. = . + 0xc; /* padding after .text.sqlite3WalkSelectExpr */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCompare */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCompare); /* size 0x7f8 */
	. = ALIGN(0x10); /* align for .text.sqlite3WindowCompare */
	"build_x86-64/sqlite3.o"(.text.sqlite3WindowCompare); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.exprDup */
	"build_x86-64/sqlite3.o"(.text.exprDup); /* size 0x3f3 */
	. = . + 0x5; /* padding after .text.exprDup */
	. = ALIGN(0x10); /* align for .text.dupedExprSize */
	"build_x86-64/sqlite3.o"(.text.dupedExprSize); /* size 0xb1 */
	. = . + 0x2f; /* padding after .text.dupedExprSize */
	. = ALIGN(0x10); /* align for .text.sqlite3SelectDup */
	"build_x86-64/sqlite3.o"(.text.sqlite3SelectDup); /* size 0x4c5 */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprListDup */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprListDup); /* size 0x3bb */
	. = ALIGN(0x10); /* align for .text.sqlite3WindowDup */
	"build_x86-64/sqlite3.o"(.text.sqlite3WindowDup); /* size 0x287 */
	. = ALIGN(0x10); /* align for .text.sqlite3SrcListDup */
	"build_x86-64/sqlite3.o"(.text.sqlite3SrcListDup); /* size 0x553 */
	. = ALIGN(0x10); /* align for .text.sqlite3IdListDup */
	"build_x86-64/sqlite3.o"(.text.sqlite3IdListDup); /* size 0x359 */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeExplain */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeExplain); /* size 0x232 */
	. = ALIGN(0x10); /* align for .text.exprINAffinity */
	"build_x86-64/sqlite3.o"(.text.exprINAffinity); /* size 0x1f5 */
	. = . + 0x3f; /* padding after .text.exprINAffinity */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprIsInteger */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprIsInteger); /* size 0x5e */
	. = . + 0x22; /* padding after .text.sqlite3ExprIsInteger */
	. = ALIGN(0x10); /* align for .text.sqlite3SetHasNullFlag */
	"build_x86-64/sqlite3.o"(.text.sqlite3SetHasNullFlag); /* size 0x165 */
	. = . + 0x1f; /* padding after .text.sqlite3SetHasNullFlag */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprCheckIN */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprCheckIN); /* size 0x9d */
	. = . + 0x3b; /* padding after .text.sqlite3ExprCheckIN */
	. = ALIGN(0x10); /* align for .text.sqlite3FindInIndex */
	"build_x86-64/sqlite3.o"(.text.sqlite3FindInIndex); /* size 0xd59 */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprIfTrue */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprIfTrue); /* size 0xa78 */
	. = ALIGN(0x10); /* align for .text.sqlite3CheckObjectName */
	"build_x86-64/sqlite3.o"(.text.sqlite3CheckObjectName); /* size 0x19e */
	. = . + 0x3e; /* padding after .text.sqlite3CheckObjectName */
	. = ALIGN(0x10); /* align for .text.sqlite3ResultSetOfSelect */
	"build_x86-64/sqlite3.o"(.text.sqlite3ResultSetOfSelect); /* size 0x1c3 */
	. = ALIGN(0x10); /* align for .text.sqlite3TableAffinity */
	"build_x86-64/sqlite3.o"(.text.sqlite3TableAffinity); /* size 0x1de */
	. = . + 0x6; /* padding after .text.sqlite3TableAffinity */
	. = ALIGN(0x10); /* align for .text.sqlite3NestedParse */
	"build_x86-64/sqlite3.o"(.text.sqlite3NestedParse); /* size 0x20b */
	. = ALIGN(0x10); /* align for .text.sqlite3ResolveExprNames */
	"build_x86-64/sqlite3.o"(.text.sqlite3ResolveExprNames); /* size 0xd6 */
	. = . + 0x26; /* padding after .text.sqlite3ResolveExprNames */
	. = ALIGN(0x10); /* align for .text.resolveExprStep */
	"build_x86-64/sqlite3.o"(.text.resolveExprStep); /* size 0x1d01 */
	. = ALIGN(0x10); /* align for .text.resolveSelectStep */
	"build_x86-64/sqlite3.o"(.text.resolveSelectStep); /* size 0xe2e */
	. = ALIGN(0x10); /* align for .text.sqlite3MatchSpanName */
	"build_x86-64/sqlite3.o"(.text.sqlite3MatchSpanName); /* size 0x1c9 */
	. = ALIGN(0x10); /* align for .text.resolveAlias */
	"build_x86-64/sqlite3.o"(.text.resolveAlias); /* size 0x231 */
	. = . + 0xb; /* padding after .text.resolveAlias */
	. = ALIGN(0x10); /* align for .text.incrAggDepth */
	"build_x86-64/sqlite3.o"(.text.incrAggDepth); /* size 0x13 */
	. = . + 0x11; /* padding after .text.incrAggDepth */
	. = ALIGN(0x10); /* align for .text.sqlite3AuthReadCol */
	"build_x86-64/sqlite3.o"(.text.sqlite3AuthReadCol); /* size 0xee */
	. = . + 0x1a; /* padding after .text.sqlite3AuthReadCol */
	. = ALIGN(0x10); /* align for .text.exprSrcCount */
	"build_x86-64/sqlite3.o"(.text.exprSrcCount); /* size 0x4c */
	. = . + 0x28; /* padding after .text.exprSrcCount */
	. = ALIGN(0x10); /* align for .text.sqlite3SelectPrep */
	"build_x86-64/sqlite3.o"(.text.sqlite3SelectPrep); /* size 0xf9 */
	. = . + 0x17; /* padding after .text.sqlite3SelectPrep */
	. = ALIGN(0x10); /* align for .text.resolveOrderGroupBy */
	"build_x86-64/sqlite3.o"(.text.resolveOrderGroupBy); /* size 0x2bc */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprWalkNoop */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprWalkNoop); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.convertCompoundSelectToSubquery */
	"build_x86-64/sqlite3.o"(.text.convertCompoundSelectToSubquery); /* size 0x2af */
	. = ALIGN(0x10); /* align for .text.selectExpander */
	"build_x86-64/sqlite3.o"(.text.selectExpander); /* size 0x2374 */
	. = ALIGN(0x10); /* align for .text.selectPopWith */
	"build_x86-64/sqlite3.o"(.text.selectPopWith); /* size 0x42 */
	. = ALIGN(0x10); /* align for .text.sqlite3SrcListAssignCursors */
	"build_x86-64/sqlite3.o"(.text.sqlite3SrcListAssignCursors); /* size 0x72 */
	. = . + 0x1e; /* padding after .text.sqlite3SrcListAssignCursors */
	. = ALIGN(0x10); /* align for .text.sqlite3ExpandSubquery */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExpandSubquery); /* size 0x244 */
	. = ALIGN(0x10); /* align for .text.sqlite3ViewGetColumnNames */
	"build_x86-64/sqlite3.o"(.text.sqlite3ViewGetColumnNames); /* size 0x44a */
	. = ALIGN(0x10); /* align for .text.sqlite3ColumnsFromExprList */
	"build_x86-64/sqlite3.o"(.text.sqlite3ColumnsFromExprList); /* size 0x7af */
	. = ALIGN(0x10); /* align for .text.sqlite3SelectAddColumnTypeAndCollation */
	"build_x86-64/sqlite3.o"(.text.sqlite3SelectAddColumnTypeAndCollation); /* size 0x388 */
	. = ALIGN(0x10); /* align for .text.columnTypeImpl */
	"build_x86-64/sqlite3.o"(.text.columnTypeImpl); /* size 0x131 */
	. = . + 0x3; /* padding after .text.columnTypeImpl */
	. = ALIGN(0x10); /* align for .text.setJoinExpr */
	"build_x86-64/sqlite3.o"(.text.setJoinExpr); /* size 0x8b */
	. = . + 0x19; /* padding after .text.setJoinExpr */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprAnd */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprAnd); /* size 0x1cc */
	. = . + 0x8; /* padding after .text.sqlite3ExprAnd */
	. = ALIGN(0x10); /* align for .text.sqlite3SelectWalkNoop */
	"build_x86-64/sqlite3.o"(.text.sqlite3SelectWalkNoop); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.selectAddSubqueryTypeInfo */
	"build_x86-64/sqlite3.o"(.text.selectAddSubqueryTypeInfo); /* size 0x82 */
	. = . + 0xe; /* padding after .text.selectAddSubqueryTypeInfo */
	. = ALIGN(0x10); /* align for .text.sqlite3ResolveOrderGroupBy */
	"build_x86-64/sqlite3.o"(.text.sqlite3ResolveOrderGroupBy); /* size 0xdb */
	. = . + 0x1d; /* padding after .text.sqlite3ResolveOrderGroupBy */
	. = ALIGN(0x10); /* align for .text.identPut */
	"build_x86-64/sqlite3.o"(.text.identPut); /* size 0x117 */
	. = . + 0x3d; /* padding after .text.identPut */
	. = ALIGN(0x10); /* align for .text.renameUnmapExprCb */
	"build_x86-64/sqlite3.o"(.text.renameUnmapExprCb); /* size 0x3b */
	. = ALIGN(0x10); /* align for .text.sqlite3FixSrcList */
	"build_x86-64/sqlite3.o"(.text.sqlite3FixSrcList); /* size 0x193 */
	. = ALIGN(0x10); /* align for .text.sqlite3RefillIndex */
	"build_x86-64/sqlite3.o"(.text.sqlite3RefillIndex); /* size 0xb87 */
	. = ALIGN(0x10); /* align for .text.sqlite3FixSelect */
	"build_x86-64/sqlite3.o"(.text.sqlite3FixSelect); /* size 0x18d */
	. = . + 0x7; /* padding after .text.sqlite3FixSelect */
	. = ALIGN(0x10); /* align for .text.sqlite3FixExpr */
	"build_x86-64/sqlite3.o"(.text.sqlite3FixExpr); /* size 0xe8 */
	. = . + 0x18; /* padding after .text.sqlite3FixExpr */
	. = ALIGN(0x10); /* align for .text.sqlite3GenerateIndexKey */
	"build_x86-64/sqlite3.o"(.text.sqlite3GenerateIndexKey); /* size 0x656 */
	. = ALIGN(0x10); /* align for .text.sqlite3UniqueConstraint */
	"build_x86-64/sqlite3.o"(.text.sqlite3UniqueConstraint); /* size 0x499 */
	. = . + 0xb; /* padding after .text.sqlite3UniqueConstraint */
	. = ALIGN(0x10); /* align for .text.sqlite3IndexAffinityStr */
	"build_x86-64/sqlite3.o"(.text.sqlite3IndexAffinityStr); /* size 0x113 */
	. = . + 0x11; /* padding after .text.sqlite3IndexAffinityStr */
	. = ALIGN(0x10); /* align for .text.sqlite3DropTriggerPtr */
	"build_x86-64/sqlite3.o"(.text.sqlite3DropTriggerPtr); /* size 0x5a5 */
	. = ALIGN(0x10); /* align for .text.destroyRootPage */
	"build_x86-64/sqlite3.o"(.text.destroyRootPage); /* size 0x28b */
	. = ALIGN(0x10); /* align for .text.unsetJoinExpr */
	"build_x86-64/sqlite3.o"(.text.unsetJoinExpr); /* size 0x9b */
	. = . + 0x21; /* padding after .text.unsetJoinExpr */
	. = ALIGN(0x10); /* align for .text.pushDownWhereTerms */
	"build_x86-64/sqlite3.o"(.text.pushDownWhereTerms); /* size 0x192 */
	. = . + 0x2; /* padding after .text.pushDownWhereTerms */
	. = ALIGN(0x10); /* align for .text.computeLimitRegisters */
	"build_x86-64/sqlite3.o"(.text.computeLimitRegisters); /* size 0x7a9 */
	. = ALIGN(0x10); /* align for .text.sqlite3WhereBegin */
	"build_x86-64/sqlite3.o"(.text.sqlite3WhereBegin); /* size 0x3057 */
	. = ALIGN(0x10); /* align for .text.selectInnerLoop */
	"build_x86-64/sqlite3.o"(.text.selectInnerLoop); /* size 0x1640 */
	. = ALIGN(0x10); /* align for .text.sqlite3WhereEnd */
	"build_x86-64/sqlite3.o"(.text.sqlite3WhereEnd); /* size 0xcaf */
	. = ALIGN(0x10); /* align for .text.updateAccumulator */
	"build_x86-64/sqlite3.o"(.text.updateAccumulator); /* size 0x6d6 */
	. = ALIGN(0x10); /* align for .text.finalizeAggFunctions */
	"build_x86-64/sqlite3.o"(.text.finalizeAggFunctions); /* size 0xf9 */
	. = . + 0x7; /* padding after .text.finalizeAggFunctions */
	. = ALIGN(0x10); /* align for .text.resetAccumulator */
	"build_x86-64/sqlite3.o"(.text.resetAccumulator); /* size 0x32a */
	. = ALIGN(0x10); /* align for .text.selectWindowRewriteExprCb */
	"build_x86-64/sqlite3.o"(.text.selectWindowRewriteExprCb); /* size 0x13b */
	. = . + 0x39; /* padding after .text.selectWindowRewriteExprCb */
	. = ALIGN(0x10); /* align for .text.selectWindowRewriteSelectCb */
	"build_x86-64/sqlite3.o"(.text.selectWindowRewriteSelectCb); /* size 0x2f */
	. = . + 0x11; /* padding after .text.selectWindowRewriteSelectCb */
	. = ALIGN(0x10); /* align for .text.impliesNotNullRow */
	"build_x86-64/sqlite3.o"(.text.impliesNotNullRow); /* size 0xad */
	. = ALIGN(0x10); /* align for .text.sqlite3SrcListEnlarge */
	"build_x86-64/sqlite3.o"(.text.sqlite3SrcListEnlarge); /* size 0x295 */
	. = ALIGN(0x10); /* align for .text.substSelect */
	"build_x86-64/sqlite3.o"(.text.substSelect); /* size 0x1bb */
	. = ALIGN(0x10); /* align for .text.substExpr */
	"build_x86-64/sqlite3.o"(.text.substExpr); /* size 0x212 */
	. = . + 0x4a; /* padding after .text.substExpr */
	. = ALIGN(0x10); /* align for .text.generateWithRecursiveQuery */
	"build_x86-64/sqlite3.o"(.text.generateWithRecursiveQuery); /* size 0xa6b */
	. = ALIGN(0x10); /* align for .text.multiSelectOrderBy */
	"build_x86-64/sqlite3.o"(.text.multiSelectOrderBy); /* size 0x17dc */
	. = ALIGN(0x10); /* align for .text.multiSelectCollSeq */
	"build_x86-64/sqlite3.o"(.text.multiSelectCollSeq); /* size 0x5f */
	. = . + 0x19; /* padding after .text.multiSelectCollSeq */
	. = ALIGN(0x10); /* align for .text.multiSelectOrderByKeyInfo */
	"build_x86-64/sqlite3.o"(.text.multiSelectOrderByKeyInfo); /* size 0x223 */
	. = . + 0x21; /* padding after .text.multiSelectOrderByKeyInfo */
	. = ALIGN(0x10); /* align for .text.generateOutputSubroutine */
	"build_x86-64/sqlite3.o"(.text.generateOutputSubroutine); /* size 0xb6b */
	. = ALIGN(0x10); /* align for .text.findConstInWhere */
	"build_x86-64/sqlite3.o"(.text.findConstInWhere); /* size 0x405 */
	. = . + 0x17; /* padding after .text.findConstInWhere */
	. = ALIGN(0x10); /* align for .text.propagateConstantExprRewrite */
	"build_x86-64/sqlite3.o"(.text.propagateConstantExprRewrite); /* size 0xa7 */
	. = . + 0x35; /* padding after .text.propagateConstantExprRewrite */
	. = ALIGN(0x10); /* align for .text.binCollFunc */
	"build_x86-64/sqlite3.o"(.text.binCollFunc); /* size 0xc3 */
	. = . + 0x15; /* padding after .text.binCollFunc */
	. = ALIGN(0x10); /* align for .text.heightOfSelect */
	"build_x86-64/sqlite3.o"(.text.heightOfSelect); /* size 0x14c */
	. = . + 0x20; /* padding after .text.heightOfSelect */
	. = ALIGN(0x10); /* align for .text.sqlite3WhereSplit */
	"build_x86-64/sqlite3.o"(.text.sqlite3WhereSplit); /* size 0x90 */
	. = . + 0x1c; /* padding after .text.sqlite3WhereSplit */
	. = ALIGN(0x10); /* align for .text.wherePathSolver */
	"build_x86-64/sqlite3.o"(.text.wherePathSolver); /* size 0xcbe */
	. = ALIGN(0x10); /* align for .text.sqlite3WhereExplainOneScan */
	"build_x86-64/sqlite3.o"(.text.sqlite3WhereExplainOneScan); /* size 0x511 */
	. = . + 0x87; /* padding after .text.sqlite3WhereExplainOneScan */
	. = ALIGN(0x10); /* align for .text.sqlite3WhereCodeOneLoopStart */
	"build_x86-64/sqlite3.o"(.text.sqlite3WhereCodeOneLoopStart); /* size 0x4a5b */
	. = ALIGN(0x10); /* align for .text.whereInfoFree */
	"build_x86-64/sqlite3.o"(.text.whereInfoFree); /* size 0x451 */
	. = . + 0x93; /* padding after .text.whereInfoFree */
	. = ALIGN(0x10); /* align for .text.whereClauseInsert */
	"build_x86-64/sqlite3.o"(.text.whereClauseInsert); /* size 0x2a5 */
	. = ALIGN(0x10); /* align for .text.exprAnalyze */
	"build_x86-64/sqlite3.o"(.text.exprAnalyze); /* size 0x3058 */
	. = ALIGN(0x10); /* align for .text.exprSelectUsage */
	"build_x86-64/sqlite3.o"(.text.exprSelectUsage); /* size 0x2b4 */
	. = ALIGN(0x10); /* align for .text.sqlite3WhereExprUsageNN */
	"build_x86-64/sqlite3.o"(.text.sqlite3WhereExprUsageNN); /* size 0x176 */
	. = . + 0x2e; /* padding after .text.sqlite3WhereExprUsageNN */
	. = ALIGN(0x10); /* align for .text.exprMightBeIndexed2 */
	"build_x86-64/sqlite3.o"(.text.exprMightBeIndexed2); /* size 0x17a */
	. = ALIGN(0x10); /* align for .text.whereCombineDisjuncts */
	"build_x86-64/sqlite3.o"(.text.whereCombineDisjuncts); /* size 0x11f */
	. = . + 0x21; /* padding after .text.whereCombineDisjuncts */
	. = ALIGN(0x10); /* align for .text.exprNodeIsDeterministic */
	"build_x86-64/sqlite3.o"(.text.exprNodeIsDeterministic); /* size 0x1e */
	. = . + 0xa; /* padding after .text.exprNodeIsDeterministic */
	. = ALIGN(0x10); /* align for .text.whereScanNext */
	"build_x86-64/sqlite3.o"(.text.whereScanNext); /* size 0x39a */
	. = ALIGN(0x10); /* align for .text.sqlite3IndexAffinityOk */
	"build_x86-64/sqlite3.o"(.text.sqlite3IndexAffinityOk); /* size 0xa8 */
	. = . + 0x48; /* padding after .text.sqlite3IndexAffinityOk */
	. = ALIGN(0x10); /* align for .text.whereLoopAddVirtual */
	"build_x86-64/sqlite3.o"(.text.whereLoopAddVirtual); /* size 0xaf1 */
	. = ALIGN(0x10); /* align for .text.whereLoopAddBtree */
	"build_x86-64/sqlite3.o"(.text.whereLoopAddBtree); /* size 0xa68 */
	. = ALIGN(0x10); /* align for .text.whereLoopAddOr */
	"build_x86-64/sqlite3.o"(.text.whereLoopAddOr); /* size 0x638 */
	. = ALIGN(0x10); /* align for .text.whereLoopAddVirtualOne */
	"build_x86-64/sqlite3.o"(.text.whereLoopAddVirtualOne); /* size 0x72b */
	. = ALIGN(0x10); /* align for .text.whereLoopInsert */
	"build_x86-64/sqlite3.o"(.text.whereLoopInsert); /* size 0xba3 */
	. = ALIGN(0x10); /* align for .text.whereLoopFindLesser */
	"build_x86-64/sqlite3.o"(.text.whereLoopFindLesser); /* size 0xdb */
	. = . + 0x9; /* padding after .text.whereLoopFindLesser */
	. = ALIGN(0x10); /* align for .text.whereUsablePartialIndex */
	"build_x86-64/sqlite3.o"(.text.whereUsablePartialIndex); /* size 0xc0 */
	. = . + 0x24; /* padding after .text.whereUsablePartialIndex */
	. = ALIGN(0x10); /* align for .text.whereLoopOutputAdjust */
	"build_x86-64/sqlite3.o"(.text.whereLoopOutputAdjust); /* size 0x154 */
	. = . + 0x2c; /* padding after .text.whereLoopOutputAdjust */
	. = ALIGN(0x10); /* align for .text.whereLoopAddBtreeIndex */
	"build_x86-64/sqlite3.o"(.text.whereLoopAddBtreeIndex); /* size 0x11ec */
	. = ALIGN(0x10); /* align for .text.sqlite3ExprImpliesExpr */
	"build_x86-64/sqlite3.o"(.text.sqlite3ExprImpliesExpr); /* size 0xe5 */
	. = . + 0x3; /* padding after .text.sqlite3ExprImpliesExpr */
	. = ALIGN(0x10); /* align for .text.exprIdxCover */
	"build_x86-64/sqlite3.o"(.text.exprIdxCover); /* size 0x53 */
	. = . + 0x21; /* padding after .text.exprIdxCover */
	. = ALIGN(0x10); /* align for .text.whereRangeVectorLen */
	"build_x86-64/sqlite3.o"(.text.whereRangeVectorLen); /* size 0x263 */
	. = . + 0x1d; /* padding after .text.whereRangeVectorLen */
	. = ALIGN(0x10); /* align for .text.wherePathSatisfiesOrderBy */
	"build_x86-64/sqlite3.o"(.text.wherePathSatisfiesOrderBy); /* size 0xad1 */
	. = ALIGN(0x10); /* align for .text.explainAppendTerm */
	"build_x86-64/sqlite3.o"(.text.explainAppendTerm); /* size 0x367 */
	. = . + 0xbd; /* padding after .text.explainAppendTerm */
	. = ALIGN(0x10); /* align for .text.codeEqualityTerm */
	"build_x86-64/sqlite3.o"(.text.codeEqualityTerm); /* size 0xc11 */
	. = ALIGN(0x10); /* align for .text.codeExprOrVector */
	"build_x86-64/sqlite3.o"(.text.codeExprOrVector); /* size 0x2b7 */
	. = ALIGN(0x10); /* align for .text.updateRangeAffinityStr */
	"build_x86-64/sqlite3.o"(.text.updateRangeAffinityStr); /* size 0x1a8 */
	. = . + 0x48; /* padding after .text.updateRangeAffinityStr */
	. = ALIGN(0x10); /* align for .text.whereIndexExprTransNode */
	"build_x86-64/sqlite3.o"(.text.whereIndexExprTransNode); /* size 0x55 */
	. = . + 0x7; /* padding after .text.whereIndexExprTransNode */
	. = ALIGN(0x10); /* align for .text.sqlite3WhereClauseClear */
	"build_x86-64/sqlite3.o"(.text.sqlite3WhereClauseClear); /* size 0xb2 */
	. = . + 0x16; /* padding after .text.sqlite3WhereClauseClear */
	. = ALIGN(0x10); /* align for .text.windowCodeRowExprStep */
	"build_x86-64/sqlite3.o"(.text.windowCodeRowExprStep); /* size 0x152a */
	. = ALIGN(0x10); /* align for .text.windowPartitionCache */
	"build_x86-64/sqlite3.o"(.text.windowPartitionCache); /* size 0x7cc */
	. = ALIGN(0x10); /* align for .text.windowCheckIntValue */
	"build_x86-64/sqlite3.o"(.text.windowCheckIntValue); /* size 0x375 */
	. = ALIGN(0x10); /* align for .text.windowInitAccum */
	"build_x86-64/sqlite3.o"(.text.windowInitAccum); /* size 0x472 */
	. = ALIGN(0x10); /* align for .text.windowAggStep */
	"build_x86-64/sqlite3.o"(.text.windowAggStep); /* size 0xa6f */
	. = ALIGN(0x10); /* align for .text.windowAggFinal */
	"build_x86-64/sqlite3.o"(.text.windowAggFinal); /* size 0x58d */
	. = ALIGN(0x10); /* align for .text.windowReturnOneRow */
	"build_x86-64/sqlite3.o"(.text.windowReturnOneRow); /* size 0xc73 */
	. = ALIGN(0x10); /* align for .text.windowReturnRows */
	"build_x86-64/sqlite3.o"(.text.windowReturnRows); /* size 0x331 */
	. = ALIGN(0x10); /* align for .text.codeDistinct */
	"build_x86-64/sqlite3.o"(.text.codeDistinct); /* size 0x1d7 */
	. = . + 0x1d; /* padding after .text.codeDistinct */
	. = ALIGN(0x10); /* align for .text.pushOntoSorter */
	"build_x86-64/sqlite3.o"(.text.pushOntoSorter); /* size 0xee0 */
	. = ALIGN(0x10); /* align for .text.havingToWhereExprCb */
	"build_x86-64/sqlite3.o"(.text.havingToWhereExprCb); /* size 0x11e */
	. = ALIGN(0x10); /* align for .text.exprNodeIsConstantOrGroupBy */
	"build_x86-64/sqlite3.o"(.text.exprNodeIsConstantOrGroupBy); /* size 0xe0 */
	. = . + 0x1c; /* padding after .text.exprNodeIsConstantOrGroupBy */
	. = ALIGN(0x10); /* align for .text.analyzeAggregate */
	"build_x86-64/sqlite3.o"(.text.analyzeAggregate); /* size 0x50b */
	. = ALIGN(0x10); /* align for .text.analyzeAggregatesInSelect */
	"build_x86-64/sqlite3.o"(.text.analyzeAggregatesInSelect); /* size 0xc */
	. = . + 0x8; /* padding after .text.analyzeAggregatesInSelect */
	. = ALIGN(0x10); /* align for .text.analyzeAggregatesInSelectEnd */
	"build_x86-64/sqlite3.o"(.text.analyzeAggregatesInSelectEnd); /* size 0xa */
	. = . + 0x6; /* padding after .text.analyzeAggregatesInSelectEnd */
	. = ALIGN(0x10); /* align for .text.sqlite3MaterializeView */
	"build_x86-64/sqlite3.o"(.text.sqlite3MaterializeView); /* size 0x2b5 */
	. = ALIGN(0x10); /* align for .text.sqlite3OpenTableAndIndices */
	"build_x86-64/sqlite3.o"(.text.sqlite3OpenTableAndIndices); /* size 0x3f5 */
	. = ALIGN(0x10); /* align for .text.sqlite3VtabMakeWritable */
	"build_x86-64/sqlite3.o"(.text.sqlite3VtabMakeWritable); /* size 0xcc */
	. = . + 0x14; /* padding after .text.sqlite3VtabMakeWritable */
	. = ALIGN(0x10); /* align for .text.sqlite3GenerateRowDelete */
	"build_x86-64/sqlite3.o"(.text.sqlite3GenerateRowDelete); /* size 0xe2b */
	. = ALIGN(0x10); /* align for .text.sqlite3FkOldmask */
	"build_x86-64/sqlite3.o"(.text.sqlite3FkOldmask); /* size 0x4d5 */
	. = ALIGN(0x10); /* align for .text.sqlite3FkCheck */
	"build_x86-64/sqlite3.o"(.text.sqlite3FkCheck); /* size 0xa80 */
	. = ALIGN(0x10); /* align for .text.sqlite3GenerateRowIndexDelete */
	"build_x86-64/sqlite3.o"(.text.sqlite3GenerateRowIndexDelete); /* size 0x1ab */
	. = ALIGN(0x10); /* align for .text.sqlite3FkActions */
	"build_x86-64/sqlite3.o"(.text.sqlite3FkActions); /* size 0x19ff */
	. = ALIGN(0x10); /* align for .text.codeRowTrigger */
	"build_x86-64/sqlite3.o"(.text.codeRowTrigger); /* size 0xf75 */
	. = ALIGN(0x10); /* align for .text.targetSrcList */
	"build_x86-64/sqlite3.o"(.text.targetSrcList); /* size 0x22a */
	. = . + 0xa; /* padding after .text.targetSrcList */
	. = ALIGN(0x10); /* align for .text.sqlite3FkLocateIndex */
	"build_x86-64/sqlite3.o"(.text.sqlite3FkLocateIndex); /* size 0x4e7 */
	. = ALIGN(0x10); /* align for .text.fkLookupParent */
	"build_x86-64/sqlite3.o"(.text.fkLookupParent); /* size 0xfea */
	. = ALIGN(0x10); /* align for .text.fkScanChildren */
	"build_x86-64/sqlite3.o"(.text.fkScanChildren); /* size 0xc61 */
	. = ALIGN(0x10); /* align for .text.exprTableRegister */
	"build_x86-64/sqlite3.o"(.text.exprTableRegister); /* size 0xff */
	. = . + 0x19; /* padding after .text.exprTableRegister */
	. = ALIGN(0x10); /* align for .text.autoIncrementEnd */
	"build_x86-64/sqlite3.o"(.text.autoIncrementEnd); /* size 0x286 */
	. = ALIGN(0x10); /* align for .text.sqlite3GenerateConstraintChecks */
	"build_x86-64/sqlite3.o"(.text.sqlite3GenerateConstraintChecks); /* size 0x3142 */
	. = ALIGN(0x10); /* align for .text.sqlite3CompleteInsertion */
	"build_x86-64/sqlite3.o"(.text.sqlite3CompleteInsertion); /* size 0x4eb */
	. = ALIGN(0x10); /* align for .text.checkConstraintExprNode */
	"build_x86-64/sqlite3.o"(.text.checkConstraintExprNode); /* size 0x2b */
	. = . + 0x15; /* padding after .text.checkConstraintExprNode */
	. = ALIGN(0x10); /* align for .text.autoIncBegin */
	"build_x86-64/sqlite3.o"(.text.autoIncBegin); /* size 0x14a */
	. = . + 0x22; /* padding after .text.autoIncBegin */
	. = ALIGN(0x10); /* align for .text.xferCompatibleIndex */
	"build_x86-64/sqlite3.o"(.text.xferCompatibleIndex); /* size 0x16f */
	. = ALIGN(0x10); /* align for .text.exprSetHeight */
	"build_x86-64/sqlite3.o"(.text.exprSetHeight); /* size 0x1b0 */
	. = . + 0x38; /* padding after .text.exprSetHeight */
	. = ALIGN(0x10); /* align for .text.returnSingleInt */
	"build_x86-64/sqlite3.o"(.text.returnSingleInt); /* size 0x1ba */
	. = . + 0x42; /* padding after .text.returnSingleInt */
	. = ALIGN(0x10); /* align for .text.getSafetyLevel */
	"build_x86-64/sqlite3.o"(.text.getSafetyLevel); /* size 0x169 */
	. = . + 0x2f; /* padding after .text.getSafetyLevel */
	. = ALIGN(0x10); /* align for .text.sqlite3VdbeMultiLoad */
	"build_x86-64/sqlite3.o"(.text.sqlite3VdbeMultiLoad); /* size 0x28c */
	. = ALIGN(0x10); /* align for .text.integrityCheckResultRow */
	"build_x86-64/sqlite3.o"(.text.integrityCheckResultRow); /* size 0x119 */
	. = . + 0x23; /* padding after .text.integrityCheckResultRow */
	. = ALIGN(0x10); /* align for .text.likeFunc */
	"build_x86-64/sqlite3.o"(.text.likeFunc); /* size 0x334 */
	. = ALIGN(0x10); /* align for .text.triggerStepAllocate */
	"build_x86-64/sqlite3.o"(.text.triggerStepAllocate); /* size 0x3b3 */
	. = ALIGN(0x10); /* align for .text.attachFunc */
	"build_x86-64/sqlite3.o"(.text.attachFunc); /* size 0x9ec */
	. = ALIGN(0x10); /* align for .text.codeAttach */
	"build_x86-64/sqlite3.o"(.text.codeAttach); /* size 0x995 */
	. = ALIGN(0x10); /* align for .text.sqlite3ParseUri */
	"build_x86-64/sqlite3.o"(.text.sqlite3ParseUri); /* size 0x716 */
	. = . + 0x36; /* padding after .text.sqlite3ParseUri */
	. = ALIGN(0x10); /* align for .text.sqlite3SchemaGet */
	"build_x86-64/sqlite3.o"(.text.sqlite3SchemaGet); /* size 0x141 */
	. = . + 0x23; /* padding after .text.sqlite3SchemaGet */
	. = ALIGN(0x10); /* align for .text.detachFunc */
	"build_x86-64/sqlite3.o"(.text.detachFunc); /* size 0x26d */
	. = ALIGN(0x10); /* align for .text.reindexTable */
	"build_x86-64/sqlite3.o"(.text.reindexTable); /* size 0x186 */
	. = ALIGN(0x10); /* align for .text.analyzeDatabase */
	"build_x86-64/sqlite3.o"(.text.analyzeDatabase); /* size 0x2b6 */
	. = ALIGN(0x10); /* align for .text.analyzeTable */
	"build_x86-64/sqlite3.o"(.text.analyzeTable); /* size 0x2cc */
	. = ALIGN(0x10); /* align for .text.openStatTable */
	"build_x86-64/sqlite3.o"(.text.openStatTable); /* size 0x3af */
	. = ALIGN(0x10); /* align for .text.analyzeOneTable */
	"build_x86-64/sqlite3.o"(.text.analyzeOneTable); /* size 0x1770 */
	. = ALIGN(0x10); /* align for .text.statInit */
	"build_x86-64/sqlite3.o"(.text.statInit); /* size 0x26c */
	. = ALIGN(0x10); /* align for .text.stat4Destructor */
	"build_x86-64/sqlite3.o"(.text.stat4Destructor); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.statPush */
	"build_x86-64/sqlite3.o"(.text.statPush); /* size 0x130 */
	. = . + 0x3c; /* padding after .text.statPush */
	. = ALIGN(0x10); /* align for .text.statGet */
	"build_x86-64/sqlite3.o"(.text.statGet); /* size 0x197 */
	. = . + 0x35; /* padding after .text.statGet */
	. = ALIGN(0x10); /* align for .text.isSystemTable */
	"build_x86-64/sqlite3.o"(.text.isSystemTable); /* size 0x180 */
	. = . + 0x3c; /* padding after .text.isSystemTable */
	. = ALIGN(0x10); /* align for .text.loadExt */
	"build_x86-64/sqlite3.o"(.text.loadExt); /* size 0x1a0 */
	. = . + 0x34; /* padding after .text.loadExt */
	. = ALIGN(0x10); /* align for .text.compileoptionusedFunc */
	"build_x86-64/sqlite3.o"(.text.compileoptionusedFunc); /* size 0x78 */
	. = . + 0x20; /* padding after .text.compileoptionusedFunc */
	. = ALIGN(0x10); /* align for .text.compileoptiongetFunc */
	"build_x86-64/sqlite3.o"(.text.compileoptiongetFunc); /* size 0x98 */
	. = . + 0x38; /* padding after .text.compileoptiongetFunc */
	. = ALIGN(0x10); /* align for .text.versionFunc */
	"build_x86-64/sqlite3.o"(.text.versionFunc); /* size 0x56 */
	. = . + 0x16; /* padding after .text.versionFunc */
	. = ALIGN(0x10); /* align for .text.trimFunc */
	"build_x86-64/sqlite3.o"(.text.trimFunc); /* size 0x4a9 */
	. = . + 0x3; /* padding after .text.trimFunc */
	. = ALIGN(0x10); /* align for .text.minmaxFunc */
	"build_x86-64/sqlite3.o"(.text.minmaxFunc); /* size 0xd8 */
	. = . + 0x10; /* padding after .text.minmaxFunc */
	. = ALIGN(0x10); /* align for .text.minmaxStep */
	"build_x86-64/sqlite3.o"(.text.minmaxStep); /* size 0x192 */
	. = . + 0x3a; /* padding after .text.minmaxStep */
	. = ALIGN(0x10); /* align for .text.minMaxFinalize */
	"build_x86-64/sqlite3.o"(.text.minMaxFinalize); /* size 0x5e */
	. = . + 0x22; /* padding after .text.minMaxFinalize */
	. = ALIGN(0x10); /* align for .text.minMaxValue */
	"build_x86-64/sqlite3.o"(.text.minMaxValue); /* size 0x4a */
	. = . + 0x12; /* padding after .text.minMaxValue */
	. = ALIGN(0x10); /* align for .text.typeofFunc */
	"build_x86-64/sqlite3.o"(.text.typeofFunc); /* size 0x6a */
	. = . + 0x22; /* padding after .text.typeofFunc */
	. = ALIGN(0x10); /* align for .text.lengthFunc */
	"build_x86-64/sqlite3.o"(.text.lengthFunc); /* size 0x130 */
	. = . + 0x70; /* padding after .text.lengthFunc */
	. = ALIGN(0x10); /* align for .text.instrFunc */
	"build_x86-64/sqlite3.o"(.text.instrFunc); /* size 0x2b1 */
	. = . + 0xf; /* padding after .text.instrFunc */
	. = ALIGN(0x10); /* align for .text.printfFunc */
	"build_x86-64/sqlite3.o"(.text.printfFunc); /* size 0x13b */
	. = ALIGN(0x10); /* align for .text.unicodeFunc */
	"build_x86-64/sqlite3.o"(.text.unicodeFunc); /* size 0xfc */
	. = . + 0x4; /* padding after .text.unicodeFunc */
	. = ALIGN(0x10); /* align for .text.charFunc */
	"build_x86-64/sqlite3.o"(.text.charFunc); /* size 0x29f */
	. = . + 0x39; /* padding after .text.charFunc */
	. = ALIGN(0x10); /* align for .text.absFunc */
	"build_x86-64/sqlite3.o"(.text.absFunc); /* size 0x17d */
	. = . + 0x67; /* padding after .text.absFunc */
	. = ALIGN(0x10); /* align for .text.roundFunc */
	"build_x86-64/sqlite3.o"(.text.roundFunc); /* size 0x270 */
	. = . + 0x64; /* padding after .text.roundFunc */
	. = ALIGN(0x10); /* align for .text.upperFunc */
	"build_x86-64/sqlite3.o"(.text.upperFunc); /* size 0x1f0 */
	. = . + 0xc; /* padding after .text.upperFunc */
	. = ALIGN(0x10); /* align for .text.lowerFunc */
	"build_x86-64/sqlite3.o"(.text.lowerFunc); /* size 0x228 */
	. = ALIGN(0x10); /* align for .text.hexFunc */
	"build_x86-64/sqlite3.o"(.text.hexFunc); /* size 0x1ef */
	. = ALIGN(0x10); /* align for .text.randomFunc */
	"build_x86-64/sqlite3.o"(.text.randomFunc); /* size 0x54 */
	. = . + 0x10; /* padding after .text.randomFunc */
	. = ALIGN(0x10); /* align for .text.randomBlob */
	"build_x86-64/sqlite3.o"(.text.randomBlob); /* size 0x117 */
	. = . + 0x65; /* padding after .text.randomBlob */
	. = ALIGN(0x10); /* align for .text.nullifFunc */
	"build_x86-64/sqlite3.o"(.text.nullifFunc); /* size 0x46 */
	. = . + 0x12; /* padding after .text.nullifFunc */
	. = ALIGN(0x10); /* align for .text.sourceidFunc */
	"build_x86-64/sqlite3.o"(.text.sourceidFunc); /* size 0x56 */
	. = . + 0x16; /* padding after .text.sourceidFunc */
	. = ALIGN(0x10); /* align for .text.errlogFunc */
	"build_x86-64/sqlite3.o"(.text.errlogFunc); /* size 0x8b */
	. = . + 0x2d; /* padding after .text.errlogFunc */
	. = ALIGN(0x10); /* align for .text.quoteFunc */
	"build_x86-64/sqlite3.o"(.text.quoteFunc); /* size 0x4a1 */
	. = . + 0x73; /* padding after .text.quoteFunc */
	. = ALIGN(0x10); /* align for .text.last_insert_rowid */
	"build_x86-64/sqlite3.o"(.text.last_insert_rowid); /* size 0x26 */
	. = . + 0xa; /* padding after .text.last_insert_rowid */
	. = ALIGN(0x10); /* align for .text.changes */
	"build_x86-64/sqlite3.o"(.text.changes); /* size 0x26 */
	. = . + 0xa; /* padding after .text.changes */
	. = ALIGN(0x10); /* align for .text.total_changes */
	"build_x86-64/sqlite3.o"(.text.total_changes); /* size 0x26 */
	. = . + 0xa; /* padding after .text.total_changes */
	. = ALIGN(0x10); /* align for .text.replaceFunc */
	"build_x86-64/sqlite3.o"(.text.replaceFunc); /* size 0x5a7 */
	. = . + 0x85; /* padding after .text.replaceFunc */
	. = ALIGN(0x10); /* align for .text.zeroblobFunc */
	"build_x86-64/sqlite3.o"(.text.zeroblobFunc); /* size 0xd0 */
	. = . + 0x24; /* padding after .text.zeroblobFunc */
	. = ALIGN(0x10); /* align for .text.substrFunc */
	"build_x86-64/sqlite3.o"(.text.substrFunc); /* size 0x3d0 */
	. = ALIGN(0x10); /* align for .text.sumStep */
	"build_x86-64/sqlite3.o"(.text.sumStep); /* size 0x1b1 */
	. = ALIGN(0x10); /* align for .text.sumFinalize */
	"build_x86-64/sqlite3.o"(.text.sumFinalize); /* size 0xe9 */
	. = . + 0x3f; /* padding after .text.sumFinalize */
	. = ALIGN(0x10); /* align for .text.sumInverse */
	"build_x86-64/sqlite3.o"(.text.sumInverse); /* size 0x16a */
	. = ALIGN(0x10); /* align for .text.totalFinalize */
	"build_x86-64/sqlite3.o"(.text.totalFinalize); /* size 0x88 */
	. = . + 0x24; /* padding after .text.totalFinalize */
	. = ALIGN(0x10); /* align for .text.avgFinalize */
	"build_x86-64/sqlite3.o"(.text.avgFinalize); /* size 0x97 */
	. = . + 0x25; /* padding after .text.avgFinalize */
	. = ALIGN(0x10); /* align for .text.countStep */
	"build_x86-64/sqlite3.o"(.text.countStep); /* size 0x5a */
	. = . + 0x16; /* padding after .text.countStep */
	. = ALIGN(0x10); /* align for .text.countFinalize */
	"build_x86-64/sqlite3.o"(.text.countFinalize); /* size 0x56 */
	. = . + 0x22; /* padding after .text.countFinalize */
	. = ALIGN(0x10); /* align for .text.countInverse */
	"build_x86-64/sqlite3.o"(.text.countInverse); /* size 0x5a */
	. = . + 0x16; /* padding after .text.countInverse */
	. = ALIGN(0x10); /* align for .text.groupConcatStep */
	"build_x86-64/sqlite3.o"(.text.groupConcatStep); /* size 0x208 */
	. = . + 0x98; /* padding after .text.groupConcatStep */
	. = ALIGN(0x10); /* align for .text.groupConcatFinalize */
	"build_x86-64/sqlite3.o"(.text.groupConcatFinalize); /* size 0x107 */
	. = . + 0x39; /* padding after .text.groupConcatFinalize */
	. = ALIGN(0x10); /* align for .text.groupConcatValue */
	"build_x86-64/sqlite3.o"(.text.groupConcatValue); /* size 0xf3 */
	. = . + 0x35; /* padding after .text.groupConcatValue */
	. = ALIGN(0x10); /* align for .text.groupConcatInverse */
	"build_x86-64/sqlite3.o"(.text.groupConcatInverse); /* size 0x11c */
	. = . + 0x48; /* padding after .text.groupConcatInverse */
	. = ALIGN(0x10); /* align for .text.renameColumnFunc */
	"build_x86-64/sqlite3.o"(.text.renameColumnFunc); /* size 0xfe4 */
	. = ALIGN(0x10); /* align for .text.renameTableFunc */
	"build_x86-64/sqlite3.o"(.text.renameTableFunc); /* size 0xb4c */
	. = ALIGN(0x10); /* align for .text.renameTableTest */
	"build_x86-64/sqlite3.o"(.text.renameTableTest); /* size 0x63c */
	. = . + 0x20; /* padding after .text.renameTableTest */
	. = ALIGN(0x10); /* align for .text.renameColumnExprCb */
	"build_x86-64/sqlite3.o"(.text.renameColumnExprCb); /* size 0xad */
	. = . + 0x1f; /* padding after .text.renameColumnExprCb */
	. = ALIGN(0x10); /* align for .text.renameColumnSelectCb */
	"build_x86-64/sqlite3.o"(.text.renameColumnSelectCb); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.renameResolveTrigger */
	"build_x86-64/sqlite3.o"(.text.renameResolveTrigger); /* size 0x8b7 */
	. = ALIGN(0x10); /* align for .text.renameWalkTrigger */
	"build_x86-64/sqlite3.o"(.text.renameWalkTrigger); /* size 0x16a */
	. = ALIGN(0x10); /* align for .text.renameEditSql */
	"build_x86-64/sqlite3.o"(.text.renameEditSql); /* size 0x3c8 */
	. = ALIGN(0x10); /* align for .text.renameParseCleanup */
	"build_x86-64/sqlite3.o"(.text.renameParseCleanup); /* size 0x228 */
	. = . + 0x44; /* padding after .text.renameParseCleanup */
	. = ALIGN(0x10); /* align for .text.renameTableExprCb */
	"build_x86-64/sqlite3.o"(.text.renameTableExprCb); /* size 0x5d */
	. = . + 0xf; /* padding after .text.renameTableExprCb */
	. = ALIGN(0x10); /* align for .text.renameTableSelectCb */
	"build_x86-64/sqlite3.o"(.text.renameTableSelectCb); /* size 0x81 */
	. = . + 0x17; /* padding after .text.renameTableSelectCb */
	. = ALIGN(0x10); /* align for .text.row_numberStepFunc */
	"build_x86-64/sqlite3.o"(.text.row_numberStepFunc); /* size 0x2e */
	. = . + 0x12; /* padding after .text.row_numberStepFunc */
	. = ALIGN(0x10); /* align for .text.row_numberValueFunc */
	"build_x86-64/sqlite3.o"(.text.row_numberValueFunc); /* size 0x59 */
	. = . + 0x1f; /* padding after .text.row_numberValueFunc */
	. = ALIGN(0x10); /* align for .text.noopStepFunc */
	"build_x86-64/sqlite3.o"(.text.noopStepFunc); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.dense_rankStepFunc */
	"build_x86-64/sqlite3.o"(.text.dense_rankStepFunc); /* size 0x32 */
	. = . + 0xa; /* padding after .text.dense_rankStepFunc */
	. = ALIGN(0x10); /* align for .text.dense_rankValueFunc */
	"build_x86-64/sqlite3.o"(.text.dense_rankValueFunc); /* size 0x6d */
	. = . + 0x13; /* padding after .text.dense_rankValueFunc */
	. = ALIGN(0x10); /* align for .text.rankStepFunc */
	"build_x86-64/sqlite3.o"(.text.rankStepFunc); /* size 0x41 */
	. = . + 0xf; /* padding after .text.rankStepFunc */
	. = ALIGN(0x10); /* align for .text.rankValueFunc */
	"build_x86-64/sqlite3.o"(.text.rankValueFunc); /* size 0x5c */
	. = . + 0x1c; /* padding after .text.rankValueFunc */
	. = ALIGN(0x10); /* align for .text.percent_rankStepFunc */
	"build_x86-64/sqlite3.o"(.text.percent_rankStepFunc); /* size 0x82 */
	. = . + 0x1e; /* padding after .text.percent_rankStepFunc */
	. = ALIGN(0x10); /* align for .text.percent_rankValueFunc */
	"build_x86-64/sqlite3.o"(.text.percent_rankValueFunc); /* size 0xfe */
	. = . + 0x1e; /* padding after .text.percent_rankValueFunc */
	. = ALIGN(0x10); /* align for .text.cume_distStepFunc */
	"build_x86-64/sqlite3.o"(.text.cume_distStepFunc); /* size 0x72 */
	. = . + 0x26; /* padding after .text.cume_distStepFunc */
	. = ALIGN(0x10); /* align for .text.cume_distValueFunc */
	"build_x86-64/sqlite3.o"(.text.cume_distValueFunc); /* size 0x9c */
	. = . + 0x20; /* padding after .text.cume_distValueFunc */
	. = ALIGN(0x10); /* align for .text.ntileStepFunc */
	"build_x86-64/sqlite3.o"(.text.ntileStepFunc); /* size 0xea */
	. = . + 0x32; /* padding after .text.ntileStepFunc */
	. = ALIGN(0x10); /* align for .text.ntileValueFunc */
	"build_x86-64/sqlite3.o"(.text.ntileValueFunc); /* size 0xdf */
	. = . + 0x31; /* padding after .text.ntileValueFunc */
	. = ALIGN(0x10); /* align for .text.last_valueStepFunc */
	"build_x86-64/sqlite3.o"(.text.last_valueStepFunc); /* size 0xb2 */
	. = . + 0x36; /* padding after .text.last_valueStepFunc */
	. = ALIGN(0x10); /* align for .text.last_valueFinalizeFunc */
	"build_x86-64/sqlite3.o"(.text.last_valueFinalizeFunc); /* size 0x58 */
	. = . + 0xc; /* padding after .text.last_valueFinalizeFunc */
	. = ALIGN(0x10); /* align for .text.last_valueValueFunc */
	"build_x86-64/sqlite3.o"(.text.last_valueValueFunc); /* size 0x4d */
	. = . + 0xb; /* padding after .text.last_valueValueFunc */
	. = ALIGN(0x10); /* align for .text.last_valueInvFunc */
	"build_x86-64/sqlite3.o"(.text.last_valueInvFunc); /* size 0x49 */
	. = . + 0x13; /* padding after .text.last_valueInvFunc */
	. = ALIGN(0x10); /* align for .text.noopValueFunc */
	"build_x86-64/sqlite3.o"(.text.noopValueFunc); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.juliandayFunc */
	"build_x86-64/sqlite3.o"(.text.juliandayFunc); /* size 0x1fa */
	. = . + 0x42; /* padding after .text.juliandayFunc */
	. = ALIGN(0x10); /* align for .text.dateFunc */
	"build_x86-64/sqlite3.o"(.text.dateFunc); /* size 0x1fb */
	. = . + 0x5; /* padding after .text.dateFunc */
	. = ALIGN(0x10); /* align for .text.timeFunc */
	"build_x86-64/sqlite3.o"(.text.timeFunc); /* size 0x266 */
	. = . + 0x3a; /* padding after .text.timeFunc */
	. = ALIGN(0x10); /* align for .text.datetimeFunc */
	"build_x86-64/sqlite3.o"(.text.datetimeFunc); /* size 0xbf */
	. = ALIGN(0x10); /* align for .text.strftimeFunc */
	"build_x86-64/sqlite3.o"(.text.strftimeFunc); /* size 0x7a3 */
	. = . + 0x65; /* padding after .text.strftimeFunc */
	. = ALIGN(0x10); /* align for .text.ctimeFunc */
	"build_x86-64/sqlite3.o"(.text.ctimeFunc); /* size 0xe */
	. = ALIGN(0x10); /* align for .text.ctimestampFunc */
	"build_x86-64/sqlite3.o"(.text.ctimestampFunc); /* size 0xe */
	. = ALIGN(0x10); /* align for .text.cdateFunc */
	"build_x86-64/sqlite3.o"(.text.cdateFunc); /* size 0xe */
	. = ALIGN(0x10); /* align for .text.isDate */
	"build_x86-64/sqlite3.o"(.text.isDate); /* size 0x11bf */
	. = ALIGN(0x10); /* align for .text.computeJD */
	"build_x86-64/sqlite3.o"(.text.computeJD); /* size 0x17a */
	. = . + 0x22; /* padding after .text.computeJD */
	. = ALIGN(0x10); /* align for .text.parseHhMmSs */
	"build_x86-64/sqlite3.o"(.text.parseHhMmSs); /* size 0x1e5 */
	. = ALIGN(0x10); /* align for .text.getDigits */
	"build_x86-64/sqlite3.o"(.text.getDigits); /* size 0x12d */
	. = ALIGN(0x10); /* align for .text.localtimeOffset */
	"build_x86-64/sqlite3.o"(.text.localtimeOffset); /* size 0x3fb */
	. = . + 0x5d; /* padding after .text.localtimeOffset */
	. = ALIGN(0x10); /* align for .text.computeYMD_HMS */
	"build_x86-64/sqlite3.o"(.text.computeYMD_HMS); /* size 0x20e */
	. = . + 0x42; /* padding after .text.computeYMD_HMS */
	. = ALIGN(0x10); /* align for .text.sqlite3MemMalloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemMalloc); /* size 0x48 */
	. = . + 0x8; /* padding after .text.sqlite3MemMalloc */
	. = ALIGN(0x10); /* align for .text.sqlite3MemFree */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemFree); /* size 0xe */
	. = ALIGN(0x10); /* align for .text.sqlite3MemRealloc */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemRealloc); /* size 0x5e */
	. = ALIGN(0x10); /* align for .text.sqlite3MemSize */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemSize); /* size 0x9 */
	. = ALIGN(0x10); /* align for .text.sqlite3MemRoundup */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemRoundup); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.sqlite3MemInit */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemInit); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sqlite3MemShutdown */
	"build_x86-64/sqlite3.o"(.text.sqlite3MemShutdown); /* size 0x6 */
	. = ALIGN(0x10); /* align for .text.pcache1Init */
	"build_x86-64/sqlite3.o"(.text.pcache1Init); /* size 0xe1 */
	. = . + 0x13; /* padding after .text.pcache1Init */
	. = ALIGN(0x10); /* align for .text.pcache1Shutdown */
	"build_x86-64/sqlite3.o"(.text.pcache1Shutdown); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.pcache1Create */
	"build_x86-64/sqlite3.o"(.text.pcache1Create); /* size 0x100 */
	. = . + 0xc; /* padding after .text.pcache1Create */
	. = ALIGN(0x10); /* align for .text.pcache1Cachesize */
	"build_x86-64/sqlite3.o"(.text.pcache1Cachesize); /* size 0x176 */
	. = . + 0x56; /* padding after .text.pcache1Cachesize */
	. = ALIGN(0x10); /* align for .text.pcache1Pagecount */
	"build_x86-64/sqlite3.o"(.text.pcache1Pagecount); /* size 0x9 */
	. = ALIGN(0x10); /* align for .text.pcache1Fetch */
	"build_x86-64/sqlite3.o"(.text.pcache1Fetch); /* size 0x6d */
	. = . + 0xb; /* padding after .text.pcache1Fetch */
	. = ALIGN(0x10); /* align for .text.pcache1Unpin */
	"build_x86-64/sqlite3.o"(.text.pcache1Unpin); /* size 0x95 */
	. = . + 0x3b; /* padding after .text.pcache1Unpin */
	. = ALIGN(0x10); /* align for .text.pcache1Rekey */
	"build_x86-64/sqlite3.o"(.text.pcache1Rekey); /* size 0x5e */
	. = . + 0x6; /* padding after .text.pcache1Rekey */
	. = ALIGN(0x10); /* align for .text.pcache1Truncate */
	"build_x86-64/sqlite3.o"(.text.pcache1Truncate); /* size 0x121 */
	. = . + 0x1f; /* padding after .text.pcache1Truncate */
	. = ALIGN(0x10); /* align for .text.pcache1Destroy */
	"build_x86-64/sqlite3.o"(.text.pcache1Destroy); /* size 0x3a4 */
	. = . + 0xc4; /* padding after .text.pcache1Destroy */
	. = ALIGN(0x10); /* align for .text.pcache1Shrink */
	"build_x86-64/sqlite3.o"(.text.pcache1Shrink); /* size 0x15e */
	. = . + 0x46; /* padding after .text.pcache1Shrink */
	. = ALIGN(0x10); /* align for .text.pcache1ResizeHash */
	"build_x86-64/sqlite3.o"(.text.pcache1ResizeHash); /* size 0x147 */
	. = . + 0x41; /* padding after .text.pcache1ResizeHash */
	. = ALIGN(0x10); /* align for .text.pcache1FetchStage2 */
	"build_x86-64/sqlite3.o"(.text.pcache1FetchStage2); /* size 0x453 */
	. = ALIGN(0x10); /* align for .text.nocaseCollatingFunc */
	"build_x86-64/sqlite3.o"(.text.nocaseCollatingFunc); /* size 0x80 */
	. = . + 0x10; /* padding after .text.nocaseCollatingFunc */
	. = ALIGN(0x10); /* align for .text.now_micros */
	"build_x86-64/util.o"(.text.now_micros); /* size 0x25 */
	. = . + 0xf; /* padding after .text.now_micros */
	. = ALIGN(0x10); /* align for .text.starts_with */
	"build_x86-64/util.o"(.text.starts_with); /* size 0x4a */
	. = . + 0x1a; /* padding after .text.starts_with */
	. = ALIGN(0x10); /* align for .text.trim_space */
	"build_x86-64/util.o"(.text.trim_space); /* size 0xaf */
	. = . + 0x15; /* padding after .text.trim_space */
	. = ALIGN(0x4); /* align for .text._start_c */
	"/usr/local/popcorn/x86_64/lib/crt1.o"(.text._start_c); /* size 0x1f */
	. = . + 0x11; /* padding after .text._start_c */
	. = ALIGN(0x4); /* align for .text.sysconf */
	"/usr/local/popcorn/x86_64/lib/libc.a(sysconf.o)"(.text.sysconf); /* size 0x189 */
	. = . + 0x43; /* padding after .text.sysconf */
	. = ALIGN(0x4); /* align for .text.closedir */
	"/usr/local/popcorn/x86_64/lib/libc.a(closedir.o)"(.text.closedir); /* size 0x20 */
	. = . + 0x14; /* padding after .text.closedir */
	. = ALIGN(0x4); /* align for .text.opendir */
	"/usr/local/popcorn/x86_64/lib/libc.a(opendir.o)"(.text.opendir); /* size 0x48 */
	. = . + 0xc; /* padding after .text.opendir */
	. = ALIGN(0x4); /* align for .text.readdir */
	"/usr/local/popcorn/x86_64/lib/libc.a(readdir.o)"(.text.readdir); /* size 0x6f */
	. = . + 0x35; /* padding after .text.readdir */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.dummy1 */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.text.dummy1); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy1 */
	. = ALIGN(0x4); /* align for .text.__init_libc */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.text.__init_libc); /* size 0x19f */
	. = . + 0x41; /* padding after .text.__init_libc */
	. = ALIGN(0x4); /* align for .text.libc_start_init */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.text.libc_start_init); /* size 0x31 */
	. = . + 0x1b; /* padding after .text.libc_start_init */
	. = ALIGN(0x4); /* align for .text.__libc_start_main */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.text.__libc_start_main); /* size 0x43 */
	. = . + 0xd; /* padding after .text.__libc_start_main */
	. = ALIGN(0x4); /* align for .text.getenv */
	"/usr/local/popcorn/x86_64/lib/libc.a(getenv.o)"(.text.getenv); /* size 0x80 */
	. = . + 0xc; /* padding after .text.getenv */
	. = ALIGN(0x4); /* align for .text.__errno_location */
	"/usr/local/popcorn/x86_64/lib/libc.a(__errno_location.o)"(.text.__errno_location); /* size 0xe */
	. = ALIGN(0x4); /* align for .text.libc_exit_fini */
	"/usr/local/popcorn/x86_64/lib/libc.a(exit.o)"(.text.libc_exit_fini); /* size 0x35 */
	. = . + 0x13; /* padding after .text.libc_exit_fini */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(exit.o)"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.fcntl */
	"/usr/local/popcorn/x86_64/lib/libc.a(fcntl.o)"(.text.fcntl); /* size 0x1fd */
	. = . + 0x27; /* padding after .text.fcntl */
	. = ALIGN(0x4); /* align for .text.open */
	"/usr/local/popcorn/x86_64/lib/libc.a(open.o)"(.text.open); /* size 0x113 */
	. = ALIGN(0x10); /* align for .text.__syscall_ret */
	"/usr/local/popcorn/x86_64/lib/libc.a(syscall_ret.o)"(.text.__syscall_ret); /* size 0x22 */
	. = . + 0xe; /* padding after .text.__syscall_ret */
	. = ALIGN(0x4); /* align for .text.dlclose */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlclose.o)"(.text.dlclose); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.dlerror */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlerror.o)"(.text.dlerror); /* size 0x3a */
	. = ALIGN(0x4); /* align for .text.__dl_thread_cleanup */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlerror.o)"(.text.__dl_thread_cleanup); /* size 0x1e */
	. = . + 0x6; /* padding after .text.__dl_thread_cleanup */
	. = ALIGN(0x4); /* align for .text.__dl_vseterr */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlerror.o)"(.text.__dl_vseterr); /* size 0xa8 */
	. = . + 0x14; /* padding after .text.__dl_vseterr */
	. = ALIGN(0x4); /* align for .text.__dl_seterr */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlerror.o)"(.text.__dl_seterr); /* size 0x85 */
	. = ALIGN(0x4); /* align for .text.stub_invalid_handle */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlerror.o)"(.text.stub_invalid_handle); /* size 0x17 */
	. = . + 0xd; /* padding after .text.stub_invalid_handle */
	. = ALIGN(0x4); /* align for .text.stub_dlopen */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlopen.o)"(.text.stub_dlopen); /* size 0x11 */
	. = . + 0xf; /* padding after .text.stub_dlopen */
	. = ALIGN(0x10); /* align for .text.dlsym */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlsym.o)"(.text.dlsym); /* size 0x9 */
	. = ALIGN(0x4); /* align for .text.__lsysinfo */
	"/usr/local/popcorn/x86_64/lib/libc.a(sysinfo.o)"(.text.__lsysinfo); /* size 0xf */
	. = . + 0xd; /* padding after .text.__lsysinfo */
	. = ALIGN(0x4); /* align for .text.utimes */
	"/usr/local/popcorn/x86_64/lib/libc.a(utimes.o)"(.text.utimes); /* size 0x10 */
	. = . + 0x4; /* padding after .text.utimes */
	. = ALIGN(0x10); /* align for .text.calloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(calloc.o)"(.text.calloc); /* size 0x34 */
	. = . + 0x14; /* padding after .text.calloc */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(calloc.o)"(.text.popcorn_calloc); /* size 0x38 */
	. = . + 0x14; /* padding after .text.popcorn_calloc */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a(calloc.o)"(.text.popcorn_calloc_cur); /* size 0x52 */
	. = . + 0x12; /* padding after .text.popcorn_calloc_cur */
	. = ALIGN(0x10); /* align for .text.__simple_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(lite_malloc.o)"(.text.__simple_malloc); /* size 0xfc */
	. = . + 0x14; /* padding after .text.__simple_malloc */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.__init_malloc); /* size 0x11 */
	. = . + 0x3; /* padding after .text.__init_malloc */
	. = ALIGN(0x10); /* align for .text.malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.malloc); /* size 0x5de */
	. = . + 0x3e; /* padding after .text.malloc */
	. = ALIGN(0x10); /* align for .text.alloc_rev */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.alloc_rev); /* size 0xe8 */
	. = ALIGN(0x10); /* align for .text.lock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.lock_bin); /* size 0x96 */
	. = . + 0x32; /* padding after .text.lock_bin */
	. = ALIGN(0x10); /* align for .text.unbin */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.unbin); /* size 0x52 */
	. = . + 0x4a; /* padding after .text.unbin */
	. = ALIGN(0x10); /* align for .text.unlock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.unlock_bin); /* size 0x59 */
	. = . + 0x1b; /* padding after .text.unlock_bin */
	. = ALIGN(0x10); /* align for .text.__malloc0 */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.__malloc0); /* size 0xaf */
	. = . + 0x79; /* padding after .text.__malloc0 */
	. = ALIGN(0x10); /* align for .text.realloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.realloc); /* size 0x49c */
	. = ALIGN(0x10); /* align for .text.free */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.text.free); /* size 0x6b2 */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.__init_malloc); /* size 0x11 */
	. = . + 0x3; /* padding after .text.__init_malloc */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_malloc); /* size 0x837 */
	. = . + 0x265; /* padding after .text.popcorn_malloc */
	. = ALIGN(0x10); /* align for .text.lock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.lock_bin); /* size 0xb3 */
	. = . + 0x21; /* padding after .text.lock_bin */
	. = ALIGN(0x10); /* align for .text.unbin */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.unbin); /* size 0x59 */
	. = . + 0x47; /* padding after .text.unbin */
	. = ALIGN(0x10); /* align for .text.unlock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.unlock_bin); /* size 0x6a */
	. = . + 0x16; /* padding after .text.unlock_bin */
	. = ALIGN(0x10); /* align for .text.__popcorn_malloc0 */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.__popcorn_malloc0); /* size 0xaf */
	. = . + 0x79; /* padding after .text.__popcorn_malloc0 */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_malloc_cur); /* size 0x16 */
	. = . + 0x12; /* padding after .text.popcorn_malloc_cur */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_realloc); /* size 0x23e */
	. = . + 0x32; /* padding after .text.popcorn_realloc */
	. = ALIGN(0x10); /* align for .text.popcorn_free */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_free); /* size 0x50e */
	. = . + 0x27a; /* padding after .text.popcorn_free */
	. = ALIGN(0x10); /* align for .text.alloc_fwd */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.alloc_fwd); /* size 0xe0 */
	. = . + 0x4; /* padding after .text.alloc_fwd */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_realloc_cur); /* size 0x25 */
	. = . + 0xb; /* padding after .text.popcorn_realloc_cur */
	. = ALIGN(0x4); /* align for .text.sqrt */
	"/usr/local/popcorn/x86_64/lib/libc.a(sqrt.o)"(.text.sqrt); /* size 0x5 */
	. = . + 0x3; /* padding after .text.sqrt */
	. = ALIGN(0x4); /* align for .text.getrlimit */
	"/usr/local/popcorn/x86_64/lib/libc.a(getrlimit.o)"(.text.getrlimit); /* size 0xb0 */
	. = . + 0x34; /* padding after .text.getrlimit */
	. = ALIGN(0x4); /* align for .text.__madvise */
	"/usr/local/popcorn/x86_64/lib/libc.a(madvise.o)"(.text.__madvise); /* size 0x12 */
	. = . + 0xe; /* padding after .text.__madvise */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(mmap.o)"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__mmap */
	"/usr/local/popcorn/x86_64/lib/libc.a(mmap.o)"(.text.__mmap); /* size 0xb5 */
	. = . + 0x7; /* padding after .text.__mmap */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(mremap.o)"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__mremap */
	"/usr/local/popcorn/x86_64/lib/libc.a(mremap.o)"(.text.__mremap); /* size 0x117 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(munmap.o)"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__munmap */
	"/usr/local/popcorn/x86_64/lib/libc.a(munmap.o)"(.text.__munmap); /* size 0x2b */
	. = . + 0xd; /* padding after .text.__munmap */
	. = ALIGN(0x4); /* align for .text.fchmod */
	"/usr/local/popcorn/x86_64/lib/libc.a(fchmod.o)"(.text.fchmod); /* size 0x61 */
	. = . + 0x27; /* padding after .text.fchmod */
	. = ALIGN(0x4); /* align for .text.copy_stat */
	"/usr/local/popcorn/x86_64/lib/libc.a(fstat.o)"(.text.copy_stat); /* size 0x49 */
	. = . + 0x13; /* padding after .text.copy_stat */
	. = ALIGN(0x4); /* align for .text.fstat */
	"/usr/local/popcorn/x86_64/lib/libc.a(fstat.o)"(.text.fstat); /* size 0x218 */
	. = ALIGN(0x4); /* align for .text.__futimesat */
	"/usr/local/popcorn/x86_64/lib/libc.a(futimesat.o)"(.text.__futimesat); /* size 0x6f */
	. = . + 0x19; /* padding after .text.__futimesat */
	. = ALIGN(0x4); /* align for .text.lstat */
	"/usr/local/popcorn/x86_64/lib/libc.a(lstat.o)"(.text.lstat); /* size 0x41 */
	. = . + 0x13; /* padding after .text.lstat */
	. = ALIGN(0x4); /* align for .text.mkdir */
	"/usr/local/popcorn/x86_64/lib/libc.a(mkdir.o)"(.text.mkdir); /* size 0x11 */
	. = . + 0x1b; /* padding after .text.mkdir */
	. = ALIGN(0x4); /* align for .text.stat */
	"/usr/local/popcorn/x86_64/lib/libc.a(stat.o)"(.text.stat); /* size 0x3a */
	. = . + 0x1a; /* padding after .text.stat */
	. = ALIGN(0x4); /* align for .text.utimensat */
	"/usr/local/popcorn/x86_64/lib/libc.a(utimensat.o)"(.text.utimensat); /* size 0xdb */
	. = ALIGN(0x4); /* align for .text.fflush */
	"/usr/local/popcorn/x86_64/lib/libc.a(fflush.o)"(.text.fflush); /* size 0x124 */
	. = . + 0x38; /* padding after .text.fflush */
	. = ALIGN(0x4); /* align for .text.fprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a(fprintf.o)"(.text.fprintf); /* size 0x81 */
	. = ALIGN(0x4); /* align for .text.fputc */
	"/usr/local/popcorn/x86_64/lib/libc.a(fputc.o)"(.text.fputc); /* size 0x9c */
	. = . + 0x38; /* padding after .text.fputc */
	. = ALIGN(0x4); /* align for .text.__fwritex */
	"/usr/local/popcorn/x86_64/lib/libc.a(fwrite.o)"(.text.__fwritex); /* size 0xbb */
	. = . + 0x3d; /* padding after .text.__fwritex */
	. = ALIGN(0x4); /* align for .text.fwrite */
	"/usr/local/popcorn/x86_64/lib/libc.a(fwrite.o)"(.text.fwrite); /* size 0x8a */
	. = . + 0x12; /* padding after .text.fwrite */
	. = ALIGN(0x4); /* align for .text.__ofl_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.text.__ofl_lock); /* size 0x12 */
	. = . + 0x12; /* padding after .text.__ofl_lock */
	. = ALIGN(0x4); /* align for .text.__ofl_unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.text.__ofl_unlock); /* size 0xa */
	. = . + 0x2; /* padding after .text.__ofl_unlock */
	. = ALIGN(0x4); /* align for .text.remove */
	"/usr/local/popcorn/x86_64/lib/libc.a(remove.o)"(.text.remove); /* size 0x1b */
	. = . + 0x29; /* padding after .text.remove */
	. = ALIGN(0x4); /* align for .text.snprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a(snprintf.o)"(.text.snprintf); /* size 0x7d */
	. = ALIGN(0x4); /* align for .text.sscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a(sscanf.o)"(.text.sscanf); /* size 0x81 */
	. = ALIGN(0x4); /* align for .text.vfprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.text.vfprintf); /* size 0x1ab */
	. = ALIGN(0x4); /* align for .text.printf_core */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.text.printf_core); /* size 0x1bc3 */
	. = ALIGN(0x4); /* align for .text.pop_arg */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.text.pop_arg); /* size 0x1cc */
	. = . + 0xa0; /* padding after .text.pop_arg */
	. = ALIGN(0x4); /* align for .text.pad */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.text.pad); /* size 0xbc */
	. = . + 0x1c; /* padding after .text.pad */
	. = ALIGN(0x4); /* align for .text.vsnprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a(vsnprintf.o)"(.text.vsnprintf); /* size 0xc1 */
	. = . + 0xf; /* padding after .text.vsnprintf */
	. = ALIGN(0x4); /* align for .text.sn_write */
	"/usr/local/popcorn/x86_64/lib/libc.a(vsnprintf.o)"(.text.sn_write); /* size 0xb7 */
	. = . + 0x21; /* padding after .text.sn_write */
	. = ALIGN(0x4); /* align for .text.vsscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a(vsscanf.o)"(.text.vsscanf); /* size 0x63 */
	. = . + 0x15; /* padding after .text.vsscanf */
	. = ALIGN(0x4); /* align for .text.do_read */
	"/usr/local/popcorn/x86_64/lib/libc.a(vsscanf.o)"(.text.do_read); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.memcmp */
	"/usr/local/popcorn/x86_64/lib/libc.a(memcmp.o)"(.text.memcmp); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.strcat */
	"/usr/local/popcorn/x86_64/lib/libc.a(strcat.o)"(.text.strcat); /* size 0x26 */
	. = . + 0xe; /* padding after .text.strcat */
	. = ALIGN(0x10); /* align for .text.strchr */
	"/usr/local/popcorn/x86_64/lib/libc.a(strchr.o)"(.text.strchr); /* size 0x12 */
	. = . + 0x1a; /* padding after .text.strchr */
	. = ALIGN(0x10); /* align for .text.__strchrnul */
	"/usr/local/popcorn/x86_64/lib/libc.a(strchrnul.o)"(.text.__strchrnul); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.strcmp */
	"/usr/local/popcorn/x86_64/lib/libc.a(strcmp.o)"(.text.strcmp); /* size 0x35 */
	. = ALIGN(0x10); /* align for .text.strcpy */
	"/usr/local/popcorn/x86_64/lib/libc.a(strcpy.o)"(.text.strcpy); /* size 0xe */
	. = . + 0x16; /* padding after .text.strcpy */
	. = ALIGN(0x10); /* align for .text.strcspn */
	"/usr/local/popcorn/x86_64/lib/libc.a(strcspn.o)"(.text.strcspn); /* size 0x9a */
	. = . + 0x26; /* padding after .text.strcspn */
	. = ALIGN(0x10); /* align for .text.strlen */
	"/usr/local/popcorn/x86_64/lib/libc.a(strlen.o)"(.text.strlen); /* size 0x7e */
	. = ALIGN(0x10); /* align for .text.strncmp */
	"/usr/local/popcorn/x86_64/lib/libc.a(strncmp.o)"(.text.strncmp); /* size 0x3f */
	. = . + 0x9; /* padding after .text.strncmp */
	. = ALIGN(0x10); /* align for .text.strncpy */
	"/usr/local/popcorn/x86_64/lib/libc.a(strncpy.o)"(.text.strncpy); /* size 0xe */
	. = . + 0x16; /* padding after .text.strncpy */
	. = ALIGN(0x10); /* align for .text.strnlen */
	"/usr/local/popcorn/x86_64/lib/libc.a(strnlen.o)"(.text.strnlen); /* size 0x2c */
	. = . + 0xc; /* padding after .text.strnlen */
	. = ALIGN(0x4); /* align for .text.memcpy */
	"/usr/local/popcorn/x86_64/lib/libc.a(memcpy.o)"(.text.memcpy); /* size 0x32 */
	. = . + 0x3ce; /* padding after .text.memcpy */
	. = ALIGN(0x4); /* align for .text.memmove */
	"/usr/local/popcorn/x86_64/lib/libc.a(memmove.o)"(.text.memmove); /* size 0x25 */
	. = . + 0x1df; /* padding after .text.memmove */
	. = ALIGN(0x4); /* align for .text.memset */
	"/usr/local/popcorn/x86_64/lib/libc.a(memset.o)"(.text.memset); /* size 0xc4 */
	. = . + 0x7c; /* padding after .text.memset */
	. = ALIGN(0x4); /* align for .text.__lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lock.o)"(.text.__lock); /* size 0x47 */
	. = . + 0x19; /* padding after .text.__lock */
	. = ALIGN(0x4); /* align for .text.__unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lock.o)"(.text.__unlock); /* size 0x3d */
	. = . + 0x17; /* padding after .text.__unlock */
	. = ALIGN(0x4); /* align for .text.sccp */
	"/usr/local/popcorn/x86_64/lib/libc.a(__syscall_cp.o)"(.text.sccp); /* size 0x13 */
	. = ALIGN(0x4); /* align for .text.__syscall_cp */
	"/usr/local/popcorn/x86_64/lib/libc.a(__syscall_cp.o)"(.text.__syscall_cp); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.__wait */
	"/usr/local/popcorn/x86_64/lib/libc.a(__wait.o)"(.text.__wait); /* size 0x78 */
	. = . + 0x4c; /* padding after .text.__wait */
	. = ALIGN(0x4); /* align for .text.dummy_0 */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.text.dummy_0); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy_0 */
	. = ALIGN(0x4); /* align for .text.__pthread_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.text.__pthread_exit); /* size 0x1bb */
	. = ALIGN(0x4); /* align for .text.__do_cleanup_push */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.text.__do_cleanup_push); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.__do_cleanup_pop */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.text.__do_cleanup_pop); /* size 0x15 */
	. = ALIGN(0x4); /* align for .text.__pthread_create */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.text.__pthread_create); /* size 0x5c7 */
	. = ALIGN(0x4); /* align for .text.start_c11 */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.text.start_c11); /* size 0x19 */
	. = . + 0x3; /* padding after .text.start_c11 */
	. = ALIGN(0x4); /* align for .text.start */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.text.start); /* size 0x94 */
	. = ALIGN(0x4); /* align for .text.__pthread_timedjoin_np */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_join.o)"(.text.__pthread_timedjoin_np); /* size 0xc4 */
	. = . + 0x34; /* padding after .text.__pthread_timedjoin_np */
	. = ALIGN(0x4); /* align for .text.__pthread_join */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_join.o)"(.text.__pthread_join); /* size 0x7 */
	. = . + 0x1; /* padding after .text.__pthread_join */
	. = ALIGN(0x4); /* align for .text.__pthread_tryjoin_np */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_join.o)"(.text.__pthread_tryjoin_np); /* size 0x15 */
	. = . + 0x13; /* padding after .text.__pthread_tryjoin_np */
	. = ALIGN(0x4); /* align for .text.pthread_mutex_destroy */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutex_destroy.o)"(.text.pthread_mutex_destroy); /* size 0x3 */
	. = . + 0x5; /* padding after .text.pthread_mutex_destroy */
	. = ALIGN(0x4); /* align for .text.pthread_mutex_init */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutex_init.o)"(.text.pthread_mutex_init); /* size 0x3a */
	. = . + 0x6; /* padding after .text.pthread_mutex_init */
	. = ALIGN(0x4); /* align for .text.__pthread_mutex_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutex_lock.o)"(.text.__pthread_mutex_lock); /* size 0x25 */
	. = . + 0x23; /* padding after .text.__pthread_mutex_lock */
	. = ALIGN(0x4); /* align for .text.__pthread_mutex_timedlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutex_timedlock.o)"(.text.__pthread_mutex_timedlock); /* size 0x104 */
	. = . + 0x50; /* padding after .text.__pthread_mutex_timedlock */
	. = ALIGN(0x4); /* align for .text.__pthread_mutex_trylock_owner */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutex_trylock.o)"(.text.__pthread_mutex_trylock_owner); /* size 0x133 */
	. = ALIGN(0x4); /* align for .text.__pthread_mutex_trylock */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutex_trylock.o)"(.text.__pthread_mutex_trylock); /* size 0x1e */
	. = . + 0x2e; /* padding after .text.__pthread_mutex_trylock */
	. = ALIGN(0x4); /* align for .text.__pthread_mutex_unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutex_unlock.o)"(.text.__pthread_mutex_unlock); /* size 0x110 */
	. = . + 0x2c; /* padding after .text.__pthread_mutex_unlock */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_destroy */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutexattr_destroy.o)"(.text.pthread_mutexattr_destroy); /* size 0x3 */
	. = . + 0x5; /* padding after .text.pthread_mutexattr_destroy */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_init */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutexattr_init.o)"(.text.pthread_mutexattr_init); /* size 0x9 */
	. = . + 0x3; /* padding after .text.pthread_mutexattr_init */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_settype */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_mutexattr_settype.o)"(.text.pthread_mutexattr_settype); /* size 0x16 */
	. = . + 0x16; /* padding after .text.pthread_mutexattr_settype */
	. = ALIGN(0x4); /* align for .text.__pthread_setcancelstate */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_setcancelstate.o)"(.text.__pthread_setcancelstate); /* size 0x23 */
	. = . + 0xd; /* padding after .text.__pthread_setcancelstate */
	. = ALIGN(0x4); /* align for .text.__pthread_testcancel */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_testcancel.o)"(.text.__pthread_testcancel); /* size 0x7 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_testcancel.o)"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__vm_wait */
	"/usr/local/popcorn/x86_64/lib/libc.a(vmlock.o)"(.text.__vm_wait); /* size 0x23 */
	. = . + 0x21; /* padding after .text.__vm_wait */
	. = ALIGN(0x4); /* align for .text.__vm_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(vmlock.o)"(.text.__vm_lock); /* size 0x8 */
	. = . + 0x14; /* padding after .text.__vm_lock */
	. = ALIGN(0x4); /* align for .text.__vm_unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(vmlock.o)"(.text.__vm_unlock); /* size 0x4e */
	. = . + 0x1a; /* padding after .text.__vm_unlock */
	. = ALIGN(0x1); /* align for .text.__cleartid_exit_nostack */
	"/usr/local/popcorn/x86_64/lib/libc.a(__cleartid_exit_nostack.o)"(.text.__cleartid_exit_nostack); /* size 0x2e */
	. = ALIGN(0x10); /* align for .text.__unmapself */
	"/usr/local/popcorn/x86_64/lib/libc.a(__unmapself.o)"(.text.__unmapself); /* size 0x11 */
	. = ALIGN(0x10); /* align for .text.__clone */
	"/usr/local/popcorn/x86_64/lib/libc.a(clone.o)"(.text.__clone); /* size 0x39 */
	. = ALIGN(0x4); /* align for .text.gettimeofday */
	"/usr/local/popcorn/x86_64/lib/libc.a(gettimeofday.o)"(.text.gettimeofday); /* size 0x4c */
	. = . + 0x14; /* padding after .text.gettimeofday */
	. = ALIGN(0x4); /* align for .text.localtime */
	"/usr/local/popcorn/x86_64/lib/libc.a(localtime.o)"(.text.localtime); /* size 0xa */
	. = . + 0x2; /* padding after .text.localtime */
	. = ALIGN(0x4); /* align for .text.__localtime_r */
	"/usr/local/popcorn/x86_64/lib/libc.a(localtime_r.o)"(.text.__localtime_r); /* size 0x6b */
	. = . + 0x1d; /* padding after .text.__localtime_r */
	. = ALIGN(0x4); /* align for .text.time */
	"/usr/local/popcorn/x86_64/lib/libc.a(time.o)"(.text.time); /* size 0x2c */
	. = . + 0x10; /* padding after .text.time */
	. = ALIGN(0x4); /* align for .text.access */
	"/usr/local/popcorn/x86_64/lib/libc.a(access.o)"(.text.access); /* size 0x12 */
	. = . + 0x1e; /* padding after .text.access */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(close.o)"(.text.dummy); /* size 0x3 */
	. = . + 0x1; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.close */
	"/usr/local/popcorn/x86_64/lib/libc.a(close.o)"(.text.close); /* size 0x3b */
	. = . + 0x9; /* padding after .text.close */
	. = ALIGN(0x4); /* align for .text.fchown */
	"/usr/local/popcorn/x86_64/lib/libc.a(fchown.o)"(.text.fchown); /* size 0x72 */
	. = . + 0x26; /* padding after .text.fchown */
	. = ALIGN(0x4); /* align for .text.fsync */
	"/usr/local/popcorn/x86_64/lib/libc.a(fsync.o)"(.text.fsync); /* size 0x29 */
	. = . + 0xb; /* padding after .text.fsync */
	. = ALIGN(0x4); /* align for .text.ftruncate */
	"/usr/local/popcorn/x86_64/lib/libc.a(ftruncate.o)"(.text.ftruncate); /* size 0x12 */
	. = . + 0xe; /* padding after .text.ftruncate */
	. = ALIGN(0x4); /* align for .text.getcwd */
	"/usr/local/popcorn/x86_64/lib/libc.a(getcwd.o)"(.text.getcwd); /* size 0x68 */
	. = . + 0x20; /* padding after .text.getcwd */
	. = ALIGN(0x4); /* align for .text.geteuid */
	"/usr/local/popcorn/x86_64/lib/libc.a(geteuid.o)"(.text.geteuid); /* size 0x8 */
	. = . + 0x4; /* padding after .text.geteuid */
	. = ALIGN(0x4); /* align for .text.getpid */
	"/usr/local/popcorn/x86_64/lib/libc.a(getpid.o)"(.text.getpid); /* size 0x8 */
	. = . + 0x4; /* padding after .text.getpid */
	. = ALIGN(0x4); /* align for .text.lseek */
	"/usr/local/popcorn/x86_64/lib/libc.a(lseek.o)"(.text.lseek); /* size 0x15 */
	. = ALIGN(0x4); /* align for .text.read */
	"/usr/local/popcorn/x86_64/lib/libc.a(read.o)"(.text.read); /* size 0x28 */
	. = . + 0x8; /* padding after .text.read */
	. = ALIGN(0x4); /* align for .text.readlink */
	"/usr/local/popcorn/x86_64/lib/libc.a(readlink.o)"(.text.readlink); /* size 0xf */
	. = . + 0xd; /* padding after .text.readlink */
	. = ALIGN(0x4); /* align for .text.rmdir */
	"/usr/local/popcorn/x86_64/lib/libc.a(rmdir.o)"(.text.rmdir); /* size 0xf */
	. = . + 0x19; /* padding after .text.rmdir */
	. = ALIGN(0x4); /* align for .text.sleep */
	"/usr/local/popcorn/x86_64/lib/libc.a(sleep.o)"(.text.sleep); /* size 0x2b */
	. = . + 0xd; /* padding after .text.sleep */
	. = ALIGN(0x4); /* align for .text.unlink */
	"/usr/local/popcorn/x86_64/lib/libc.a(unlink.o)"(.text.unlink); /* size 0xf */
	. = . + 0x19; /* padding after .text.unlink */
	. = ALIGN(0x4); /* align for .text.write */
	"/usr/local/popcorn/x86_64/lib/libc.a(write.o)"(.text.write); /* size 0x2b */
	. = . + 0x5; /* padding after .text.write */
	. = ALIGN(0x4); /* align for .text.__init_tp */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.text.__init_tp); /* size 0x50 */
	. = . + 0x20; /* padding after .text.__init_tp */
	. = ALIGN(0x4); /* align for .text.__copy_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.text.__copy_tls); /* size 0xa5 */
	. = ALIGN(0x4); /* align for .text.static_init_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.text.static_init_tls); /* size 0x142 */
	. = . + 0x2; /* padding after .text.static_init_tls */
	. = ALIGN(0x4); /* align for .text.popcorn_getnid */
	"/usr/local/popcorn/x86_64/lib/libc.a(platform.o)"(.text.popcorn_getnid); /* size 0x2e */
	. = . + 0x6; /* padding after .text.popcorn_getnid */
	. = ALIGN(0x4); /* align for .text.popcorn_getthreadinfo */
	"/usr/local/popcorn/x86_64/lib/libc.a(platform.o)"(.text.popcorn_getthreadinfo); /* size 0xf */
	. = . + 0xd; /* padding after .text.popcorn_getthreadinfo */
	. = ALIGN(0x4); /* align for .text.popcorn_getnodeinfo */
	"/usr/local/popcorn/x86_64/lib/libc.a(platform.o)"(.text.popcorn_getnodeinfo); /* size 0x74 */
	. = . + 0x1c; /* padding after .text.popcorn_getnodeinfo */
	. = ALIGN(0x4); /* align for .text.__strerror_l */
	"/usr/local/popcorn/x86_64/lib/libc.a(strerror.o)"(.text.__strerror_l); /* size 0x44 */
	. = . + 0x20; /* padding after .text.__strerror_l */
	. = ALIGN(0x4); /* align for .text.strerror */
	"/usr/local/popcorn/x86_64/lib/libc.a(strerror.o)"(.text.strerror); /* size 0x15 */
	. = ALIGN(0x4); /* align for .text._Exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(_Exit.o)"(.text._Exit); /* size 0x13 */
	. = . + 0xd; /* padding after .text._Exit */
	. = ALIGN(0x10); /* align for .text.__procfdname */
	"/usr/local/popcorn/x86_64/lib/libc.a(procfdname.o)"(.text.__procfdname); /* size 0x83 */
	. = . + 0x15; /* padding after .text.__procfdname */
	. = ALIGN(0x10); /* align for .text.__syscall */
	"/usr/local/popcorn/x86_64/lib/libc.a(syscall.o)"(.text.__syscall); /* size 0x1a */
	. = . + 0xe; /* padding after .text.__syscall */
	. = ALIGN(0x4); /* align for .text.stub_dlsym */
	"/usr/local/popcorn/x86_64/lib/libc.a(__dlsym.o)"(.text.stub_dlsym); /* size 0x11 */
	. = . + 0xf; /* padding after .text.stub_dlsym */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lctrans.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__lctrans */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lctrans.o)"(.text.__lctrans); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.__lctrans_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lctrans.o)"(.text.__lctrans_cur); /* size 0x19 */
	. = ALIGN(0x10); /* align for .text.__expand_heap */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.text.__expand_heap); /* size 0x151 */
	. = . + 0x63; /* padding after .text.__expand_heap */
	. = ALIGN(0x10); /* align for .text.__expand_heap_node */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.text.__expand_heap_node); /* size 0x1ff */
	. = . + 0x39; /* padding after .text.__expand_heap_node */
	. = ALIGN(0x10); /* align for .text.popcorn_get_arena */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.text.popcorn_get_arena); /* size 0xfe */
	. = . + 0x2e; /* padding after .text.popcorn_get_arena */
	. = ALIGN(0x4); /* align for .text.__fpclassifyl */
	"/usr/local/popcorn/x86_64/lib/libc.a(__fpclassifyl.o)"(.text.__fpclassifyl); /* size 0x4e */
	. = . + 0x2; /* padding after .text.__fpclassifyl */
	. = ALIGN(0x4); /* align for .text.__signbitl */
	"/usr/local/popcorn/x86_64/lib/libc.a(__signbitl.o)"(.text.__signbitl); /* size 0xa */
	. = . + 0xa; /* padding after .text.__signbitl */
	. = ALIGN(0x4); /* align for .text.frexpl */
	"/usr/local/popcorn/x86_64/lib/libc.a(frexpl.o)"(.text.frexpl); /* size 0x7f */
	. = . + 0x35; /* padding after .text.frexpl */
	. = ALIGN(0x4); /* align for .text.__mprotect */
	"/usr/local/popcorn/x86_64/lib/libc.a(mprotect.o)"(.text.__mprotect); /* size 0x2c */
	. = . + 0x18; /* padding after .text.__mprotect */
	. = ALIGN(0x4); /* align for .text.wctomb */
	"/usr/local/popcorn/x86_64/lib/libc.a(wctomb.o)"(.text.wctomb); /* size 0x15 */
	. = . + 0x7; /* padding after .text.wctomb */
	. = ALIGN(0x4); /* align for .text.__block_all_sigs */
	"/usr/local/popcorn/x86_64/lib/libc.a(block.o)"(.text.__block_all_sigs); /* size 0x18 */
	. = . + 0x8; /* padding after .text.__block_all_sigs */
	. = ALIGN(0x4); /* align for .text.__block_app_sigs */
	"/usr/local/popcorn/x86_64/lib/libc.a(block.o)"(.text.__block_app_sigs); /* size 0x18 */
	. = . + 0x8; /* padding after .text.__block_app_sigs */
	. = ALIGN(0x4); /* align for .text.__restore_sigs */
	"/usr/local/popcorn/x86_64/lib/libc.a(block.o)"(.text.__restore_sigs); /* size 0x18 */
	. = . + 0x4; /* padding after .text.__restore_sigs */
	. = ALIGN(0x4); /* align for .text.__lockfile */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lockfile.o)"(.text.__lockfile); /* size 0x73 */
	. = ALIGN(0x4); /* align for .text.__unlockfile */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lockfile.o)"(.text.__unlockfile); /* size 0x46 */
	. = . + 0x6; /* padding after .text.__unlockfile */
	. = ALIGN(0x4); /* align for .text.__overflow */
	"/usr/local/popcorn/x86_64/lib/libc.a(__overflow.o)"(.text.__overflow); /* size 0x84 */
	. = . + 0x20; /* padding after .text.__overflow */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_close.o)"(.text.dummy); /* size 0x3 */
	. = . + 0x1; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__stdio_close */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_close.o)"(.text.__stdio_close); /* size 0x1c */
	. = . + 0xc; /* padding after .text.__stdio_close */
	. = ALIGN(0x4); /* align for .text.__stdio_seek */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_seek.o)"(.text.__stdio_seek); /* size 0x16 */
	. = ALIGN(0x4); /* align for .text.__stdio_write */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_write.o)"(.text.__stdio_write); /* size 0x117 */
	. = . + 0x15; /* padding after .text.__stdio_write */
	. = ALIGN(0x4); /* align for .text.__stdout_write */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdout_write.o)"(.text.__stdout_write); /* size 0x47 */
	. = . + 0x21; /* padding after .text.__stdout_write */
	. = ALIGN(0x4); /* align for .text.__string_read */
	"/usr/local/popcorn/x86_64/lib/libc.a(__string_read.o)"(.text.__string_read); /* size 0x79 */
	. = . + 0xb; /* padding after .text.__string_read */
	. = ALIGN(0x4); /* align for .text.__towrite */
	"/usr/local/popcorn/x86_64/lib/libc.a(__towrite.o)"(.text.__towrite); /* size 0x40 */
	. = . + 0xc; /* padding after .text.__towrite */
	. = ALIGN(0x4); /* align for .text.__towrite_needs_stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(__towrite.o)"(.text.__towrite_needs_stdio_exit); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.vfscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfscanf.o)"(.text.vfscanf); /* size 0xbad */
	. = . + 0x107; /* padding after .text.vfscanf */
	. = ALIGN(0x10); /* align for .text.memchr */
	"/usr/local/popcorn/x86_64/lib/libc.a(memchr.o)"(.text.memchr); /* size 0xb2 */
	. = ALIGN(0x10); /* align for .text.__stpcpy */
	"/usr/local/popcorn/x86_64/lib/libc.a(stpcpy.o)"(.text.__stpcpy); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.__stpncpy */
	"/usr/local/popcorn/x86_64/lib/libc.a(stpncpy.o)"(.text.__stpncpy); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.__strdup */
	"/usr/local/popcorn/x86_64/lib/libc.a(strdup.o)"(.text.__strdup); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.__timedwait_cp */
	"/usr/local/popcorn/x86_64/lib/libc.a(__timedwait.o)"(.text.__timedwait_cp); /* size 0xf3 */
	. = . + 0x21; /* padding after .text.__timedwait_cp */
	. = ALIGN(0x4); /* align for .text.__timedwait */
	"/usr/local/popcorn/x86_64/lib/libc.a(__timedwait.o)"(.text.__timedwait); /* size 0x55 */
	. = . + 0x1b; /* padding after .text.__timedwait */
	. = ALIGN(0x10); /* align for .text.__set_thread_area */
	"/usr/local/popcorn/x86_64/lib/libc.a(__set_thread_area.o)"(.text.__set_thread_area); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.__secs_to_tm */
	"/usr/local/popcorn/x86_64/lib/libc.a(__secs_to_tm.o)"(.text.__secs_to_tm); /* size 0x2a8 */
	. = . + 0x14; /* padding after .text.__secs_to_tm */
	. = ALIGN(0x4); /* align for .text.__secs_to_zone */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.__secs_to_zone); /* size 0x46c */
	. = . + 0x18; /* padding after .text.__secs_to_zone */
	. = ALIGN(0x4); /* align for .text.rule_to_secs */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.rule_to_secs); /* size 0x131 */
	. = . + 0x23; /* padding after .text.rule_to_secs */
	. = ALIGN(0x4); /* align for .text.__tzset */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.__tzset); /* size 0x1b */
	. = . + 0x15; /* padding after .text.__tzset */
	. = ALIGN(0x4); /* align for .text.__tm_to_tzname */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.__tm_to_tzname); /* size 0x7b */
	. = . + 0x2d; /* padding after .text.__tm_to_tzname */
	. = ALIGN(0x4); /* align for .text.do_tzset */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.do_tzset); /* size 0x57c */
	. = . + 0xb8; /* padding after .text.do_tzset */
	. = ALIGN(0x4); /* align for .text.getname */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.getname); /* size 0x95 */
	. = . + 0xb; /* padding after .text.getname */
	. = ALIGN(0x4); /* align for .text.getoff */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.getoff); /* size 0xe7 */
	. = . + 0x39; /* padding after .text.getoff */
	. = ALIGN(0x4); /* align for .text.getrule */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.text.getrule); /* size 0x11a */
	. = . + 0x7a; /* padding after .text.getrule */
	. = ALIGN(0x4); /* align for .text.__year_to_secs */
	"/usr/local/popcorn/x86_64/lib/libc.a(__year_to_secs.o)"(.text.__year_to_secs); /* size 0x139 */
	. = . + 0x33; /* padding after .text.__year_to_secs */
	. = ALIGN(0x4); /* align for .text.__clock_gettime */
	"/usr/local/popcorn/x86_64/lib/libc.a(clock_gettime.o)"(.text.__clock_gettime); /* size 0x56 */
	. = . + 0x1a; /* padding after .text.__clock_gettime */
	. = ALIGN(0x4); /* align for .text.nanosleep */
	"/usr/local/popcorn/x86_64/lib/libc.a(nanosleep.o)"(.text.nanosleep); /* size 0x2a */
	. = . + 0xa; /* padding after .text.nanosleep */
	. = ALIGN(0x10); /* align for .text.__floatscan */
	"/usr/local/popcorn/x86_64/lib/libc.a(floatscan.o)"(.text.__floatscan); /* size 0x185f */
	. = . + 0x71; /* padding after .text.__floatscan */
	. = ALIGN(0x10); /* align for .text.scanexp */
	"/usr/local/popcorn/x86_64/lib/libc.a(floatscan.o)"(.text.scanexp); /* size 0x20f */
	. = . + 0x41; /* padding after .text.scanexp */
	. = ALIGN(0x10); /* align for .text.__intscan */
	"/usr/local/popcorn/x86_64/lib/libc.a(intscan.o)"(.text.__intscan); /* size 0x6ac */
	. = . + 0x48; /* padding after .text.__intscan */
	. = ALIGN(0x10); /* align for .text.__shlim */
	"/usr/local/popcorn/x86_64/lib/libc.a(shgetc.o)"(.text.__shlim); /* size 0x39 */
	. = ALIGN(0x10); /* align for .text.__shgetc */
	"/usr/local/popcorn/x86_64/lib/libc.a(shgetc.o)"(.text.__shgetc); /* size 0xc1 */
	. = . + 0x1b; /* padding after .text.__shgetc */
	. = ALIGN(0x4); /* align for .text.copysignl */
	"/usr/local/popcorn/x86_64/lib/libc.a(copysignl.o)"(.text.copysignl); /* size 0x2a */
	. = . + 0x2; /* padding after .text.copysignl */
	. = ALIGN(0x4); /* align for .text.scalbn */
	"/usr/local/popcorn/x86_64/lib/libc.a(scalbn.o)"(.text.scalbn); /* size 0x8c */
	. = . + 0xc; /* padding after .text.scalbn */
	. = ALIGN(0x4); /* align for .text.scalbnl */
	"/usr/local/popcorn/x86_64/lib/libc.a(scalbnl.o)"(.text.scalbnl); /* size 0x99 */
	. = . + 0x3b; /* padding after .text.scalbnl */
	. = ALIGN(0x4); /* align for .text.fabs */
	"/usr/local/popcorn/x86_64/lib/libc.a(fabs.o)"(.text.fabs); /* size 0x12 */
	. = ALIGN(0x4); /* align for .text.fmodl */
	"/usr/local/popcorn/x86_64/lib/libc.a(fmodl.o)"(.text.fmodl); /* size 0x14 */
	. = . + 0x210; /* padding after .text.fmodl */
	. = ALIGN(0x4); /* align for .text.mbrtowc */
	"/usr/local/popcorn/x86_64/lib/libc.a(mbrtowc.o)"(.text.mbrtowc); /* size 0x129 */
	. = . + 0x1f; /* padding after .text.mbrtowc */
	. = ALIGN(0x4); /* align for .text.mbsinit */
	"/usr/local/popcorn/x86_64/lib/libc.a(mbsinit.o)"(.text.mbsinit); /* size 0x14 */
	. = . + 0x8; /* padding after .text.mbsinit */
	. = ALIGN(0x4); /* align for .text.wcrtomb */
	"/usr/local/popcorn/x86_64/lib/libc.a(wcrtomb.o)"(.text.wcrtomb); /* size 0xfd */
	. = . + 0xb; /* padding after .text.wcrtomb */
	. = ALIGN(0x4); /* align for .text.__stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_exit.o)"(.text.__stdio_exit); /* size 0x35 */
	. = . + 0x13; /* padding after .text.__stdio_exit */
	. = ALIGN(0x4); /* align for .text.close_file */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_exit.o)"(.text.close_file); /* size 0x4b */
	. = . + 0x29; /* padding after .text.close_file */
	. = ALIGN(0x4); /* align for .text.__uflow */
	"/usr/local/popcorn/x86_64/lib/libc.a(__uflow.o)"(.text.__uflow); /* size 0x41 */
	. = . + 0xb; /* padding after .text.__uflow */
	. = ALIGN(0x4); /* align for .text.__map_file */
	"/usr/local/popcorn/x86_64/lib/libc.a(__map_file.o)"(.text.__map_file); /* size 0x86 */
	. = . + 0x1a; /* padding after .text.__map_file */
	. = ALIGN(0x4); /* align for .text.__month_to_secs */
	"/usr/local/popcorn/x86_64/lib/libc.a(__month_to_secs.o)"(.text.__month_to_secs); /* size 0x1c */
	. = . + 0xc; /* padding after .text.__month_to_secs */
	. = ALIGN(0x4); /* align for .text.__toread */
	"/usr/local/popcorn/x86_64/lib/libc.a(__toread.o)"(.text.__toread); /* size 0x6e */
	. = . + 0x16; /* padding after .text.__toread */
	. = ALIGN(0x4); /* align for .text.__toread_needs_stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(__toread.o)"(.text.__toread_needs_stdio_exit); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.allocateCursor */
	"build_x86-64/sqlite3.o"(.text.allocateCursor); /* size 0x124 */
	. = ALIGN(0x10); /* align for .text.sqlite3CodeVerifyNamedSchema */
	"build_x86-64/sqlite3.o"(.text.sqlite3CodeVerifyNamedSchema); /* size 0x11a */
	. = ALIGN(0x10); /* align for .text.alloc_rev */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.text.alloc_rev); /* size 0xd7 */
	. = . + 0x1; /* padding before .text.btreeReleaseAllCursorPages */
	. = . + 0xbc; /* padding after .text.btreeReleaseAllCursorPages */
	. = . + 0xf8; /* padding after .text.sqlite3HashFind */
	. = . + 0x100; /* padding after .text.tableOfTrigger */
	. = . + 0x238; /* padding after .text.sqlite3ExprListSetName */
	. = . + 0x100; /* padding after .text.sqlite3FkReferences */
	. = . + 0x1d8; /* padding after .text.whereLoopResize */
	. = . + 0xc8; /* padding after .text.alloc_fwd */
	*(.text);
}

  .fini           :
  {
/*    KEEP (*(SORT_NONE(.fini)))*/
  }
  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);
  
.rodata	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_long_op___ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_long_op___); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_1_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_1_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_2_____finish */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_2_____finish); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_3_dbbench_sq */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_3_dbbench_sq); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_4_fillseq_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_4_fillseq_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_5_fillseqbat */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_5_fillseqbat); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_6_fillrandom */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_6_fillrandom); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_7_fillrandba */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_7_fillrandba); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_8_overwrite_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_8_overwrite_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_9_overwriteb */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_9_overwriteb); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_10_fillrandsy */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_10_fillrandsy); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_11_fillseqsyn */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_11_fillseqsyn); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_12_fillrand10 */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_12_fillrand10); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_13_fillseq100 */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_13_fillseq100); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_14_readseq_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_14_readseq_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_15_readrandom */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_15_readrandom); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_16_readrand10 */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_16_readrand10); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_17_unknown_be */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_17_unknown_be); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_18__sdbbench_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_18__sdbbench_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_19_open_error */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_19_open_error); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_20_PRAGMA_cac */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_20_PRAGMA_cac); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_21_PRAGMA_pag */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_21_PRAGMA_pag); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_22_PRAGMA_jou */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_22_PRAGMA_jou); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_23_PRAGMA_wal */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_23_PRAGMA_wal); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_24_PRAGMA_loc */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_24_PRAGMA_loc); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_25_CREATE_TAB */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_25_CREATE_TAB); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_26_skipping__ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_26_skipping__); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_27___d_ops__ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_27___d_ops__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_28_REPLACE_IN */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_28_REPLACE_IN); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_29_BEGIN_TRAN */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_29_BEGIN_TRAN); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_30_END_TRANSA */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_30_END_TRANSA); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_31_PRAGMA_syn */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_31_PRAGMA_syn); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_32_PRAGMA_syn */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_32_PRAGMA_syn); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_33__016d_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_33__016d_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_34_SELECT___F */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_34_SELECT___F); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_35_sqlite3_er */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_35_sqlite3_er); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_36_Keys______ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_36_Keys______); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_37_Values____ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_37_Values____); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_38_Entries___ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_38_Entries___); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_39_RawSize___ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_39_RawSize___); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_40___________ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_40___________); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_41_SQLite____ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_41_SQLite____); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_42_3_25_2_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_42_3_25_2_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_43__6_1f_MB_s */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_43__6_1f_MB_s); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_44___ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_44___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_45___12s____1 */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_45___12s____1); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_46_Microsecon */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_46_Microsecon); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_47_SQL_error_ */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_47_SQL_error_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.benchmark__str_48_SQL_step_e */
	"build_x86-64/benchmark.o"(.rodata.benchmark__str_48_SQL_step_e); /* size 0x1d */
	. = ALIGN(0x10); /* align for .rodata.histogram_c_bucket_limit */
	"build_x86-64/histogram.o"(.rodata.histogram_c_bucket_limit); /* size 0x4d0 */
	. = ALIGN(0x1); /* align for .rodata.histogram__str_1_Count____0 */
	"build_x86-64/histogram.o"(.rodata.histogram__str_1_Count____0); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.histogram__str_2_Min____4f_ */
	"build_x86-64/histogram.o"(.rodata.histogram__str_2_Min____4f_); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.histogram__str_3___________ */
	"build_x86-64/histogram.o"(.rodata.histogram__str_3___________); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.histogram__str_4____7_0f___ */
	"build_x86-64/histogram.o"(.rodata.histogram__str_4____7_0f___); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.main__str_fillseq_fi */
	"build_x86-64/main.o"(.rodata.main__str_fillseq_fi); /* size 0xa2 */
	. = ALIGN(0x1); /* align for .rodata.main__str_1_Usage___s_ */
	"build_x86-64/main.o"(.rodata.main__str_1_Usage___s_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.main__str_2_SQLite3_be */
	"build_x86-64/main.o"(.rodata.main__str_2_SQLite3_be); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.main__str_3__OPTION___ */
	"build_x86-64/main.o"(.rodata.main__str_3__OPTION___); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.main__str_4_____benchm */
	"build_x86-64/main.o"(.rodata.main__str_4_____benchm); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.main__str_5_____histog */
	"build_x86-64/main.o"(.rodata.main__str_5_____histog); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.main__str_6_____raw__0 */
	"build_x86-64/main.o"(.rodata.main__str_6_____raw__0); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.main__str_7_____compre */
	"build_x86-64/main.o"(.rodata.main__str_7_____compre); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.main__str_8_____use_ex */
	"build_x86-64/main.o"(.rodata.main__str_8_____use_ex); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.main__str_9_____num_IN */
	"build_x86-64/main.o"(.rodata.main__str_9_____num_IN); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.main__str_10_____reads_ */
	"build_x86-64/main.o"(.rodata.main__str_10_____reads_); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.main__str_11_____value_ */
	"build_x86-64/main.o"(.rodata.main__str_11_____value_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.main__str_12_____no_tra */
	"build_x86-64/main.o"(.rodata.main__str_12_____no_tra); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.main__str_13_____page_s */
	"build_x86-64/main.o"(.rodata.main__str_13_____page_s); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.main__str_14_____num_pa */
	"build_x86-64/main.o"(.rodata.main__str_14_____num_pa); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.main__str_15_____WAL_en */
	"build_x86-64/main.o"(.rodata.main__str_15_____WAL_en); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.main__str_16_____db_PAT */
	"build_x86-64/main.o"(.rodata.main__str_16_____db_PAT); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.main__str_17_____help__ */
	"build_x86-64/main.o"(.rodata.main__str_17_____help__); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.main__str_19__BENCH___ */
	"build_x86-64/main.o"(.rodata.main__str_19__BENCH___); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.main__str_20___fillseq_ */
	"build_x86-64/main.o"(.rodata.main__str_20___fillseq_); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.main__str_21___fillseqs */
	"build_x86-64/main.o"(.rodata.main__str_21___fillseqs); /* size 0x47 */
	. = ALIGN(0x1); /* align for .rodata.main__str_22___fillseqb */
	"build_x86-64/main.o"(.rodata.main__str_22___fillseqb); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.main__str_23___fillrand */
	"build_x86-64/main.o"(.rodata.main__str_23___fillrand); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.main__str_24___fillrand */
	"build_x86-64/main.o"(.rodata.main__str_24___fillrand); /* size 0x44 */
	. = ALIGN(0x1); /* align for .rodata.main__str_25___fillrand */
	"build_x86-64/main.o"(.rodata.main__str_25___fillrand); /* size 0x48 */
	. = ALIGN(0x1); /* align for .rodata.main__str_26___overwrit */
	"build_x86-64/main.o"(.rodata.main__str_26___overwrit); /* size 0x42 */
	. = ALIGN(0x1); /* align for .rodata.main__str_27___fillrand */
	"build_x86-64/main.o"(.rodata.main__str_27___fillrand); /* size 0x47 */
	. = ALIGN(0x1); /* align for .rodata.main__str_28___fillseq1 */
	"build_x86-64/main.o"(.rodata.main__str_28___fillseq1); /* size 0x4a */
	. = ALIGN(0x1); /* align for .rodata.main__str_29___readseq_ */
	"build_x86-64/main.o"(.rodata.main__str_29___readseq_); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.main__str_30___readrand */
	"build_x86-64/main.o"(.rodata.main__str_30___readrand); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.main__str_31___readrand */
	"build_x86-64/main.o"(.rodata.main__str_31___readrand); /* size 0x4a */
	. = ALIGN(0x1); /* align for .rodata.main__str_32____ */
	"build_x86-64/main.o"(.rodata.main__str_32____); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.main__str_33___benchmar */
	"build_x86-64/main.o"(.rodata.main__str_33___benchmar); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.main__str_34___histogra */
	"build_x86-64/main.o"(.rodata.main__str_34___histogra); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.main__str_35___raw__d_c */
	"build_x86-64/main.o"(.rodata.main__str_35___raw__d_c); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.main__str_36___compress */
	"build_x86-64/main.o"(.rodata.main__str_36___compress); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.main__str_37___use_exis */
	"build_x86-64/main.o"(.rodata.main__str_37___use_exis); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.main__str_38___num__d_c */
	"build_x86-64/main.o"(.rodata.main__str_38___num__d_c); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.main__str_39___reads__d */
	"build_x86-64/main.o"(.rodata.main__str_39___reads__d); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.main__str_40___value_si */
	"build_x86-64/main.o"(.rodata.main__str_40___value_si); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.main__str_41___no_trans */
	"build_x86-64/main.o"(.rodata.main__str_41___no_trans); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.main__str_42___page_siz */
	"build_x86-64/main.o"(.rodata.main__str_42___page_siz); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.main__str_43___num_page */
	"build_x86-64/main.o"(.rodata.main__str_43___num_page); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.main__str_44___WAL_enab */
	"build_x86-64/main.o"(.rodata.main__str_44___WAL_enab); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.main__str_45___db__ */
	"build_x86-64/main.o"(.rodata.main__str_45___db__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.main__str_46___help_ */
	"build_x86-64/main.o"(.rodata.main__str_46___help_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.main__str_47_Invalid_fl */
	"build_x86-64/main.o"(.rodata.main__str_47_Invalid_fl); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.raw__str_1___4f__ */
	"build_x86-64/raw.o"(.rodata.raw__str_1___4f__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.raw__str_2_num_time__ */
	"build_x86-64/raw.o"(.rodata.raw__str_2_num_time__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.raw__str_3__d___4f__ */
	"build_x86-64/raw.o"(.rodata.raw__str_3__d___4f__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.raw__str_4_realloc_fa */
	"build_x86-64/raw.o"(.rodata.raw__str_4_realloc_fa); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_db_status */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_db_status); /* size 0x68 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_str_vappendf */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_str_vappendf); /* size 0x3c0 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_step */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_step); /* size 0x80 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_bind_value */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_bind_value); /* size 0x20 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_complete */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_complete); /* size 0x2c0 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_config */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_config); /* size 0xd8 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_db_config */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_db_config); /* size 0x50 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_file_control */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_file_control); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_test_control */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_test_control); /* size 0xa8 */
	. = ALIGN(0x8); /* align for .rodata.unixFileControl */
	"build_x86-64/sqlite3.o"(.rodata.unixFileControl); /* size 0xa0 */
	. = ALIGN(0x8); /* align for .rodata.freeP4 */
	"build_x86-64/sqlite3.o"(.rodata.freeP4); /* size 0x58 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3VdbeExec */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3VdbeExec); /* size 0x840 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3VdbeMemCast */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3VdbeMemCast); /* size 0x28 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3VdbeSerialGet */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3VdbeSerialGet); /* size 0x60 */
	. = ALIGN(0x8); /* align for .rodata.vdbeRecordCompareInt */
	"build_x86-64/sqlite3.o"(.rodata.vdbeRecordCompareInt); /* size 0x50 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3VdbeRecordCompareWithSkip */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3VdbeRecordCompareWithSkip); /* size 0x30 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3GetToken */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3GetToken); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .rodata.resolveP2Values */
	"build_x86-64/sqlite3.o"(.rodata.resolveP2Values); /* size 0x58 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3ExprCollSeq */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3ExprCollSeq); /* size 0x38 */
	. = ALIGN(0x8); /* align for .rodata.yy_reduce */
	"build_x86-64/sqlite3.o"(.rodata.yy_reduce); /* size 0x9a8 */
	. = ALIGN(0x8); /* align for .rodata.yy_destructor */
	"build_x86-64/sqlite3.o"(.rodata.yy_destructor); /* size 0x338 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3Select */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3Select); /* size 0x30 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3Pragma */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3Pragma); /* size 0x140 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3ExprCodeTarget */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3ExprCodeTarget); /* size 0x798 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3ExprIfFalse */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3ExprIfFalse); /* size 0x4f0 */
	. = ALIGN(0x8); /* align for .rodata.valueFromExpr */
	"build_x86-64/sqlite3.o"(.rodata.valueFromExpr); /* size 0xa8 */
	. = ALIGN(0x8); /* align for .rodata.exprNodeIsConstant */
	"build_x86-64/sqlite3.o"(.rodata.exprNodeIsConstant); /* size 0xc0 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3ExprIfTrue */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3ExprIfTrue); /* size 0x4f0 */
	. = ALIGN(0x8); /* align for .rodata.resolveExprStep */
	"build_x86-64/sqlite3.o"(.rodata.resolveExprStep); /* size 0x440 */
	. = ALIGN(0x8); /* align for .rodata.selectInnerLoop */
	"build_x86-64/sqlite3.o"(.rodata.selectInnerLoop); /* size 0x70 */
	. = ALIGN(0x8); /* align for .rodata.generateOutputSubroutine */
	"build_x86-64/sqlite3.o"(.rodata.generateOutputSubroutine); /* size 0x20 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3WhereCodeOneLoopStart */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3WhereCodeOneLoopStart); /* size 0x90 */
	. = ALIGN(0x8); /* align for .rodata.updateRangeAffinityStr */
	"build_x86-64/sqlite3.o"(.rodata.updateRangeAffinityStr); /* size 0x90 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3GenerateConstraintChecks */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3GenerateConstraintChecks); /* size 0x50 */
	. = ALIGN(0x8); /* align for .rodata.getSafetyLevel */
	"build_x86-64/sqlite3.o"(.rodata.getSafetyLevel); /* size 0x20 */
	. = ALIGN(0x8); /* align for .rodata.quoteFunc */
	"build_x86-64/sqlite3.o"(.rodata.quoteFunc); /* size 0x20 */
	. = ALIGN(0x8); /* align for .rodata.strftimeFunc */
	"build_x86-64/sqlite3.o"(.rodata.strftimeFunc); /* size 0x418 */
	. = ALIGN(0x8); /* align for .rodata.isDate */
	"build_x86-64/sqlite3.o"(.rodata.isDate); /* size 0x268 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_version */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_version); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_fmtinfo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_fmtinfo); /* size 0x8a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_aPrefix */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aPrefix); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1_NaN_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1_NaN_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_3_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_3_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_4_NULL_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_4_NULL_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_5__NULL__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_5__NULL__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_6___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_6___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3UpperToLower */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3UpperToLower); /* size 0x100 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_7_unix_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_7_unix_); /* size 0x5 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_posixIoFinder */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_posixIoFinder); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_8_unix_none_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_8_unix_none_); /* size 0xa */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_nolockIoFinder */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_nolockIoFinder); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_9_unix_dotfi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_9_unix_dotfi); /* size 0xd */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_dotlockIoFinder */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_dotlockIoFinder); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_10_unix_excl_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_10_unix_excl_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_11_source_and */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_11_source_and); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_12_string_or_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_12_string_or_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_13_cannot_ope */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_13_cannot_ope); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_14_cannot_ope */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_14_cannot_ope); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_15_cannot_ope */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_15_cannot_ope); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_16_no_such_co */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_16_no_such_co); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_17_foreign_ke */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_17_foreign_ke); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_18_indexed_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_18_indexed_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_19_cannot_ope */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_19_cannot_ope); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_20__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_20__s_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_globInfo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_globInfo); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_likeInfoNorm */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_likeInfoNorm); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3CtypeMap */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3CtypeMap); /* size 0x100 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3_vtab_on_conflict_aMap */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3_vtab_on_conflict_aMap); /* size 0x5 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_zKWText */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_zKWText); /* size 0x265 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aKWOffset */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aKWOffset); /* size 0x110 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aKWLen */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aKWLen); /* size 0x88 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3_complete_trans */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3_complete_trans); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_21_create_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_21_create_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_22_trigger_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_22_trigger_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_23_temp_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_23_temp_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_24_temporary_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_24_temporary_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_25_end_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_25_end_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_26_explain_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_26_explain_); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3_db_config_aFlagOp */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3_db_config_aFlagOp); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_27_unknown_da */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_27_unknown_da); /* size 0x15 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3_errmsg16_outOfMem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3_errmsg16_outOfMem); /* size 0x1c */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3_errmsg16_misuse */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3_errmsg16_misuse); /* size 0x44 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aHardLimit */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aHardLimit); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_28_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_28_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_29_INTEGER_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_29_INTEGER_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_30_no_such_ta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_30_no_such_ta); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_31_SQLITE__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_31_SQLITE__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_32_2018_09_25 */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_32_2018_09_25); /* size 0x55 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_sqlite3DefaultMutex_sMutex */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3DefaultMutex_sMutex); /* size 0x48 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_sqlite3NoopMutex_sMutex */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3NoopMutex_sMutex); /* size 0x48 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_posixIoMethods */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_posixIoMethods); /* size 0x98 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_33_cannot_fst */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_33_cannot_fst); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_34_file_unlin */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_34_file_unlin); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_35_multiple_l */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_35_multiple_l); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_36_file_renam */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_36_file_renam); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_37_open_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_37_open_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_38_close_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_38_close_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_39_access_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_39_access_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_40_getcwd_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_40_getcwd_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_41_stat_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_41_stat_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_42_fstat_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_42_fstat_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_43_ftruncate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_43_ftruncate_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_44_fcntl_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_44_fcntl_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_45_read_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_45_read_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_46_pread_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_46_pread_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_47_pread64_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_47_pread64_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_48_write_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_48_write_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_49_pwrite_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_49_pwrite_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_50_pwrite64_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_50_pwrite64_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_51_fchmod_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_51_fchmod_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_52_fallocate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_52_fallocate_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_53_unlink_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_53_unlink_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_54_openDirect */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_54_openDirect); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_55_mkdir_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_55_mkdir_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_56_rmdir_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_56_rmdir_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_57_fchown_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_57_fchown_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_58_geteuid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_58_geteuid_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_59_mmap_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_59_mmap_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_60_munmap_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_60_munmap_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_61_mremap_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_61_mremap_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_62_getpagesiz */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_62_getpagesiz); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_63_readlink_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_63_readlink_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_64_lstat_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_64_lstat_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_65_ioctl_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_65_ioctl_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_66_attempt_to */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_66_attempt_to); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_67__dev_null_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_67__dev_null_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_68_os_unix_c_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_68_os_unix_c_); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_69_cannot_ope */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_69_cannot_ope); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_70__s_at_line */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_70__s_at_line); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_71_full_fsync */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_71_full_fsync); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_72__s_etilqs_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_72__s_etilqs_); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_73__var_tmp_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_73__var_tmp_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_74__usr_tmp_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_74__usr_tmp_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_75__tmp_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_75__tmp_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_76_SQLITE_TMP */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_76_SQLITE_TMP); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_77_TMPDIR_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_77_TMPDIR_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_78__s_shm_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_78__s_shm_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_79_readonly_s */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_79_readonly_s); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_80_modeof_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_80_modeof_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_81_psow_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_81_psow_); /* size 0x5 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_nolockIoMethods */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_nolockIoMethods); /* size 0x98 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_dotlockIoMethods */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_dotlockIoMethods); /* size 0x98 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_82__s_lock_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_82__s_lock_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_83_fsync_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_83_fsync_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_84__dev_urand */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_84__dev_urand); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_85_unknown_da */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_85_unknown_da); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_86_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_86_unable_to_); /* size 0x46 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_87__memory__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_87__memory__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_88__journal__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_88__journal__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_89__wal__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_89__wal__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_90_nolock_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_90_nolock_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_91_immutable_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_91_immutable_); /* size 0xa */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_MemJournalMethods */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_MemJournalMethods); /* size 0x98 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_92_recovered_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_92_recovered_); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_93_database_c */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_93_database_c); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_94_cannot_lim */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_94_cannot_lim); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_aJournalMagic */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aJournalMagic); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_syncJournal_zerobyte */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_syncJournal_zerobyte); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_95_recovered_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_95_recovered_); /* size 0x1b */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_zeroJournalHdr_zeroHdr */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_zeroJournalHdr_zeroHdr); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_96_destinatio */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_96_destinatio); /* size 0x1f */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_zMagicHeader */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_zMagicHeader); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_97_____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_97_____); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_98_API_called */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_98_API_called); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_99_FOREIGN_KE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_99_FOREIGN_KE); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_100__s_mjXXXXX */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_100__s_mjXXXXX); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_101_MJ_delete_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_101_MJ_delete_); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_102_MJ_collide */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_102_MJ_collide); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_103__mj_06X9_0 */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_103__mj_06X9_0); /* size 0xd */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3Utf8Trans1 */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Utf8Trans1); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_104__lld_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_104__lld_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_105____15g_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_105____15g_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_106_9223372036 */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_106_9223372036); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_107_API_called */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_107_API_called); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_108___2x_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_108___2x_); /* size 0x5 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3OpcodeName_azName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3OpcodeName_azName); /* size 0x570 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_109_Savepoint_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_109_Savepoint_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_110_AutoCommit */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_110_AutoCommit); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_111_Transactio */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_111_Transactio); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_112_SorterNext */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_112_SorterNext); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_113_Prev_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_113_Prev_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_114_Next_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_114_Next_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_115_Checkpoint */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_115_Checkpoint); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_116_JournalMod */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_116_JournalMod); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_117_Vacuum_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_117_Vacuum_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_118_VFilter_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_118_VFilter_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_119_VUpdate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_119_VUpdate_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_120_Goto_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_120_Goto_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_121_Gosub_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_121_Gosub_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_122_InitCorout */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_122_InitCorout); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_123_Yield_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_123_Yield_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_124_MustBeInt_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_124_MustBeInt_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_125_Jump_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_125_Jump_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_126_Once_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_126_Once_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_127_If_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_127_If_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_128_Not_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_128_Not_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_129_IfNot_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_129_IfNot_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_130_IfNullRow_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_130_IfNullRow_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_131_SeekLT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_131_SeekLT_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_132_SeekLE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_132_SeekLE_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_133_SeekGE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_133_SeekGE_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_134_SeekGT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_134_SeekGT_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_135_IfNoHope_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_135_IfNoHope_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_136_NoConflict */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_136_NoConflict); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_137_NotFound_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_137_NotFound_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_138_Found_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_138_Found_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_139_SeekRowid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_139_SeekRowid_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_140_NotExists_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_140_NotExists_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_141_Last_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_141_Last_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_142_IfSmaller_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_142_IfSmaller_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_143_SorterSort */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_143_SorterSort); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_144_Sort_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_144_Sort_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_145_Rewind_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_145_Rewind_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_146_IdxLE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_146_IdxLE_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_147_IdxGT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_147_IdxGT_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_148_IdxLT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_148_IdxLT_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_149_IdxGE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_149_IdxGE_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_150_RowSetRead */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_150_RowSetRead); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_151_RowSetTest */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_151_RowSetTest); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_152_Or_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_152_Or_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_153_And_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_153_And_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_154_Program_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_154_Program_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_155_FkIfZero_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_155_FkIfZero_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_156_IfPos_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_156_IfPos_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_157_IfNotZero_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_157_IfNotZero_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_158_DecrJumpZe */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_158_DecrJumpZe); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_159_IsNull_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_159_IsNull_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_160_NotNull_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_160_NotNull_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_161_Ne_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_161_Ne_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_162_Eq_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_162_Eq_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_163_Gt_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_163_Gt_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_164_Le_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_164_Le_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_165_Lt_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_165_Lt_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_166_Ge_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_166_Ge_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_167_ElseNotEq_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_167_ElseNotEq_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_168_IncrVacuum */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_168_IncrVacuum); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_169_VNext_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_169_VNext_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_170_Init_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_170_Init_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_171_PureFunc0_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_171_PureFunc0_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_172_Function0_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_172_Function0_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_173_PureFunc_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_173_PureFunc_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_174_Function_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_174_Function_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_175_Return_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_175_Return_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_176_EndCorouti */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_176_EndCorouti); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_177_HaltIfNull */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_177_HaltIfNull); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_178_Halt_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_178_Halt_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_179_Integer_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_179_Integer_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_180_Int64_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_180_Int64_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_181_String_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_181_String_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_182_Null_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_182_Null_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_183_SoftNull_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_183_SoftNull_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_184_Blob_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_184_Blob_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_185_Variable_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_185_Variable_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_186_Move_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_186_Move_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_187_Copy_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_187_Copy_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_188_SCopy_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_188_SCopy_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_189_IntCopy_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_189_IntCopy_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_190_ResultRow_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_190_ResultRow_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_191_CollSeq_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_191_CollSeq_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_192_AddImm_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_192_AddImm_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_193_RealAffini */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_193_RealAffini); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_194_Cast_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_194_Cast_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_195_Permutatio */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_195_Permutatio); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_196_Compare_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_196_Compare_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_197_IsTrue_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_197_IsTrue_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_198_Offset_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_198_Offset_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_199_Column_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_199_Column_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_200_Affinity_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_200_Affinity_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_201_BitAnd_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_201_BitAnd_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_202_BitOr_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_202_BitOr_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_203_ShiftLeft_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_203_ShiftLeft_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_204_ShiftRight */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_204_ShiftRight); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_205_Add_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_205_Add_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_206_Subtract_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_206_Subtract_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_207_Multiply_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_207_Multiply_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_208_Divide_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_208_Divide_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_209_Remainder_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_209_Remainder_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_210_Concat_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_210_Concat_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_211_MakeRecord */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_211_MakeRecord); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_212_BitNot_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_212_BitNot_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_213_Count_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_213_Count_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_214_ReadCookie */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_214_ReadCookie); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_215_String8_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_215_String8_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_216_SetCookie_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_216_SetCookie_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_217_ReopenIdx_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_217_ReopenIdx_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_218_OpenRead_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_218_OpenRead_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_219_OpenWrite_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_219_OpenWrite_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_220_OpenDup_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_220_OpenDup_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_221_OpenAutoin */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_221_OpenAutoin); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_222_OpenEpheme */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_222_OpenEpheme); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_223_SorterOpen */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_223_SorterOpen); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_224_SequenceTe */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_224_SequenceTe); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_225_OpenPseudo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_225_OpenPseudo); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_226_Close_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_226_Close_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_227_ColumnsUse */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_227_ColumnsUse); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_228_SeekHit_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_228_SeekHit_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_229_Sequence_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_229_Sequence_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_230_NewRowid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_230_NewRowid_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_231_Insert_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_231_Insert_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_232_InsertInt_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_232_InsertInt_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_233_Delete_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_233_Delete_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_234_ResetCount */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_234_ResetCount); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_235_SorterComp */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_235_SorterComp); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_236_SorterData */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_236_SorterData); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_237_RowData_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_237_RowData_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_238_Rowid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_238_Rowid_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_239_NullRow_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_239_NullRow_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_240_SeekEnd_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_240_SeekEnd_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_241_SorterInse */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_241_SorterInse); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_242_IdxInsert_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_242_IdxInsert_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_243_IdxDelete_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_243_IdxDelete_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_244_DeferredSe */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_244_DeferredSe); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_245_IdxRowid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_245_IdxRowid_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_246_Destroy_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_246_Destroy_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_247_Clear_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_247_Clear_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_248_ResetSorte */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_248_ResetSorte); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_249_CreateBtre */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_249_CreateBtre); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_250_Real_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_250_Real_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_251_SqlExec_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_251_SqlExec_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_252_ParseSchem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_252_ParseSchem); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_253_LoadAnalys */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_253_LoadAnalys); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_254_DropTable_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_254_DropTable_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_255_DropIndex_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_255_DropIndex_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_256_DropTrigge */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_256_DropTrigge); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_257_IntegrityC */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_257_IntegrityC); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_258_RowSetAdd_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_258_RowSetAdd_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_259_Param_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_259_Param_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_260_FkCounter_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_260_FkCounter_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_261_MemMax_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_261_MemMax_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_262_OffsetLimi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_262_OffsetLimi); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_263_AggInverse */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_263_AggInverse); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_264_AggStep_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_264_AggStep_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_265_AggStep1_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_265_AggStep1_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_266_AggValue_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_266_AggValue_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_267_AggFinal_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_267_AggFinal_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_268_Expire_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_268_Expire_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_269_TableLock_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_269_TableLock_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_270_VBegin_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_270_VBegin_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_271_VCreate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_271_VCreate_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_272_VDestroy_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_272_VDestroy_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_273_VOpen_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_273_VOpen_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_274_VColumn_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_274_VColumn_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_275_VRename_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_275_VRename_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_276_Pagecount_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_276_Pagecount_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_277_MaxPgcnt_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_277_MaxPgcnt_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_278_Trace_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_278_Trace_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_279_CursorHint */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_279_CursorHint); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_280_Noop_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_280_Noop_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_281_Explain_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_281_Explain_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_282_Abortable_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_282_Abortable_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_283_k__d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_283_k__d_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_284_BINARY_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_284_BINARY_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_285_B_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_285_B_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_286___s_s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_286___s_s_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_287___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_287___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_288___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_288___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_289____20s__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_289____20s__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_290__s__d__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_290__s__d__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_291__d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_291__d_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_292___16g_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_292___16g_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_293__blob__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_293__blob__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_294_vtab__p_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_294_vtab__p_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_295___d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_295___d_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_296___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_296___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_297_program_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_297_program_); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3VdbeExec_azType */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3VdbeExec_azType); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_298_NOT_NULL_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_298_NOT_NULL_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_299_UNIQUE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_299_UNIQUE_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_300_CHECK_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_300_CHECK_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_301_FOREIGN_KE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_301_FOREIGN_KE); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_302__s_constra */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_302__s_constra); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_303__z___s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_303__z___s_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_304_abort_at__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_304_abort_at__); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3VdbeExec_aLTb */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3VdbeExec_aLTb); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3VdbeExec_aEQb */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3VdbeExec_aEQb); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3VdbeExec_aGTb */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3VdbeExec_aGTb); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3VdbeExec_and_logic */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3VdbeExec_and_logic); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3VdbeExec_or_logic */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3VdbeExec_or_logic); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_305_cannot_ope */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_305_cannot_ope); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_306_no_such_sa */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_306_no_such_sa); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_307_cannot_rel */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_307_cannot_rel); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_308_cannot_com */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_308_cannot_com); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_309_cannot_sta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_309_cannot_sta); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_310_cannot_rol */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_310_cannot_rol); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_311_cannot_com */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_311_cannot_com); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_312_database_s */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_312_database_s); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_313_sqlite_mas */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_313_sqlite_mas); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_314_SELECT_nam */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_314_SELECT_nam); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_315_too_many_l */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_315_too_many_l); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_316_cannot_cha */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_316_cannot_cha); /* size 0x34 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_317_into_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_317_into_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_318_out_of_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_318_out_of_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_319_database_t */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_319_database_t); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_320_____s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_320_____s_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_321_statement_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_321_statement_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_322_out_of_mem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_322_out_of_mem); /* size 0xe */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3SmallTypeSizes */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3SmallTypeSizes); /* size 0x80 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_vdbeSorterCompareInt_aLen */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_vdbeSorterCompareInt_aLen); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_323_sqlite_tem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_323_sqlite_tem); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_324_1_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_324_1_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_325_CREATE_TAB */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_325_CREATE_TAB); /* size 0x48 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_326_attached_d */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_326_attached_d); /* size 0x44 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_327_unsupporte */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_327_unsupporte); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_328_SELECT_nam */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_328_SELECT_nam); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_329_create__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_329_create__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_330_invalid_ro */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_330_invalid_ro); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_331___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_331___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_332_malformed_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_332_malformed_); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_333__z____s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_333__z____s_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_334_sqlite_sta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_334_sqlite_sta); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_335_SELECT_tbl */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_335_SELECT_tbl); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_336_unordered_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_336_unordered_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_337_sz__0_9___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_337_sz__0_9___); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_338_noskipscan */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_338_noskipscan); /* size 0xc */
	. = ALIGN(0x2); /* align for .rodata.sqlite3___const_sqlite3DefaultRowEst_aVal_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3___const_sqlite3DefaultRowEst_aVal_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_339_Main_freel */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_339_Main_freel); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_340_max_rootpa */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_340_max_rootpa); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_341_incrementa */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_341_incrementa); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_342_Page__d_is */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_342_Page__d_is); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_343_Pointer_ma */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_343_Pointer_ma); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_344_failed_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_344_failed_to_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_345_freelist_l */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_345_freelist_l); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_346__s_is__d_b */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_346__s_is__d_b); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_347_size_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_347_size_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_348_overflow_l */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_348_overflow_l); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_349_invalid_pa */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_349_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_350_2nd_refere */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_350_2nd_refere); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_351___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_351___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_352_Failed_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_352_Failed_to_); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_353_Bad_ptr_ma */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_353_Bad_ptr_ma); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_354_Page__d___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_354_Page__d___); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_355_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_355_unable_to_); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_356_btreeInitP */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_356_btreeInitP); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_357_On_tree_pa */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_357_On_tree_pa); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_358_On_page__d */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_358_On_page__d); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_359_Offset__d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_359_Offset__d_); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_360_Extends_of */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_360_Extends_of); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_361_Rowid__lld */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_361_Rowid__lld); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_362_Child_page */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_362_Child_page); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_363_Multiple_u */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_363_Multiple_u); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_364_Fragmentat */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_364_Fragmentat); /* size 0x34 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3JournalModename_azModeName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3JournalModename_azModeName); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_365_delete_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_365_delete_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_366_persist_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_366_persist_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_367_off_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_367_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_368_truncate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_368_truncate_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_369_memory_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_369_memory_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_370_wal_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_370_wal_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_371_cannot_VAC */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_371_cannot_VAC); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_372_cannot_VAC */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_372_cannot_VAC); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_373_ATTACH__AS */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_373_ATTACH__AS); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_374_BEGIN_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_374_BEGIN_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_375_SELECT_sql */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_375_SELECT_sql); /* size 0x6c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_376_SELECT_sql */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_376_SELECT_sql); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_377_SELECT_INS */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_377_SELECT_INS); /* size 0x97 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_378_INSERT_INT */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_378_INSERT_INT); /* size 0x82 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3RunVacuum_aCopy */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3RunVacuum_aCopy); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_379_CRE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_379_CRE_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_380_INS_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_380_INS_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_381_no_such_mo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_381_no_such_mo); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_382_vtable_con */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_382_vtable_con); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_383_vtable_con */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_383_vtable_con); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_384_vtable_con */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_384_vtable_con); /* size 0x2e */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_columnNullValue_nullMem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_columnNullValue_nullMem); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_386_bind_on_a_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_386_bind_on_a_); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_387_____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_387_____); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_388_____q__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_388_____q__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_389_zeroblob__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_389_zeroblob__); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_390_x__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_390_x__); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_391__02x_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_391__02x_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_392___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_392___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aiClass */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aiClass); /* size 0x100 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aKWHash */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aKWHash); /* size 0x7f */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aKWCode */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aKWCode); /* size 0x88 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aKWNext */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aKWNext); /* size 0x88 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3OpcodeProperty */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3OpcodeProperty); /* size 0xae */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_393_cannot_ope */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_393_cannot_ope); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_394_null_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_394_null_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_395_real_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_395_real_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_396_integer_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_396_integer_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_397_no_such_ro */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_397_no_such_ro); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_398_no_such_vi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_398_no_such_vi); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_399_no_such_ta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_399_no_such_ta); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_400_pragma__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_400_pragma__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_401__s___s__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_401__s___s__s_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_402__s___s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_402__s___s_); /* size 0x7 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_pragmaVtabModule */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_pragmaVtabModule); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aPragmaName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aPragmaName); /* size 0x3b0 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_403_applicatio */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_403_applicatio); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_404_auto_vacuu */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_404_auto_vacuu); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_405_automatic_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_405_automatic_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_406_busy_timeo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_406_busy_timeo); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_407_cache_size */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_407_cache_size); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_408_cache_spil */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_408_cache_spil); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_409_case_sensi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_409_case_sensi); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_410_cell_size_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_410_cell_size_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_411_checkpoint */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_411_checkpoint); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_412_collation_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_412_collation_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_413_compile_op */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_413_compile_op); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_414_count_chan */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_414_count_chan); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_415_data_versi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_415_data_versi); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_416_database_l */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_416_database_l); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_417_default_ca */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_417_default_ca); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_418_defer_fore */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_418_defer_fore); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_419_empty_resu */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_419_empty_resu); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_420_encoding_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_420_encoding_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_421_foreign_ke */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_421_foreign_ke); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_422_foreign_ke */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_422_foreign_ke); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_423_foreign_ke */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_423_foreign_ke); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_424_freelist_c */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_424_freelist_c); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_425_full_colum */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_425_full_colum); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_426_fullfsync_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_426_fullfsync_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_427_ignore_che */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_427_ignore_che); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_428_incrementa */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_428_incrementa); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_429_index_info */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_429_index_info); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_430_index_list */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_430_index_list); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_431_index_xinf */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_431_index_xinf); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_432_integrity_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_432_integrity_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_433_journal_mo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_433_journal_mo); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_434_journal_si */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_434_journal_si); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_435_legacy_alt */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_435_legacy_alt); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_436_legacy_fil */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_436_legacy_fil); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_437_locking_mo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_437_locking_mo); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_438_max_page_c */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_438_max_page_c); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_439_mmap_size_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_439_mmap_size_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_440_optimize_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_440_optimize_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_441_page_count */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_441_page_count); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_442_page_size_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_442_page_size_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_443_query_only */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_443_query_only); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_444_quick_chec */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_444_quick_chec); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_445_read_uncom */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_445_read_uncom); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_446_recursive_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_446_recursive_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_447_reverse_un */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_447_reverse_un); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_448_schema_ver */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_448_schema_ver); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_449_secure_del */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_449_secure_del); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_450_short_colu */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_450_short_colu); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_451_shrink_mem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_451_shrink_mem); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_452_soft_heap_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_452_soft_heap_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_453_synchronou */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_453_synchronou); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_454_table_info */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_454_table_info); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_455_temp_store */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_455_temp_store); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_456_temp_store */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_456_temp_store); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_457_threads_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_457_threads_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_458_user_versi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_458_user_versi); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_459_wal_autoch */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_459_wal_autoch); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_460_wal_checkp */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_460_wal_checkp); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_461_writable_s */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_461_writable_s); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_462_CREATE_TAB */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_462_CREATE_TAB); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_463__c__s__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_463__c__s__); /* size 0x7 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_pragCName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_pragCName); /* size 0x1a0 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_464____s__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_464____s__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_465__arg_HIDDE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_465__arg_HIDDE); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_466__schema_HI */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_466__schema_HI); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_467_cid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_467_cid_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_468_name_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_468_name_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_469_type_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_469_type_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_470_notnull_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_470_notnull_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_471_dflt_value */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_471_dflt_value); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_472_pk_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_472_pk_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_473_tbl_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_473_tbl_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_474_idx_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_474_idx_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_475_wdth_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_475_wdth_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_476_hght_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_476_hght_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_477_flgs_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_477_flgs_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_478_seqno_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_478_seqno_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_479_desc_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_479_desc_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_480_coll_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_480_coll_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_481_key_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_481_key_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_482_seq_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_482_seq_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_483_unique_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_483_unique_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_484_origin_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_484_origin_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_485_partial_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_485_partial_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_486_file_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_486_file_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_487_builtin_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_487_builtin_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_488_id_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_488_id_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_489_table_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_489_table_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_490_from_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_490_from_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_491_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_491_to_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_492_on_update_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_492_on_update_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_493_on_delete_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_493_on_delete_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_494_match_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_494_match_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_495_rowid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_495_rowid_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_496_parent_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_496_parent_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_497_fkid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_497_fkid_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_498_busy_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_498_busy_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_499_log_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_499_log_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_500_checkpoint */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_500_checkpoint); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_501_timeout_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_501_timeout_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_502_database_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_502_database_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_503_status_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_503_status_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_504_PRAGMA__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_504_PRAGMA__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_505__Q__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_505__Q__); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_506___Q_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_506___Q_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_507_unopened_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_507_unopened_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_508_API_call_w */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_508_API_call_w); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_509_so_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_509_so_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_510_not_author */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_510_not_author); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_511_sqlite3_ex */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_511_sqlite3_ex); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_512__s__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_512__s__s_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_513_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_513_unable_to_); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_515_lib_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_515_lib_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_516__init_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_516__init_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_517_no_entry_p */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_517_no_entry_p); /* size 0x2b */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_sqlite3Apis */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Apis); /* size 0x780 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_518_error_duri */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_518_error_duri); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_519_database_s */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_519_database_s); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_520_statement_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_520_statement_); /* size 0x13 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3Prepare_azColName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Prepare_azColName); /* size 0x60 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_521_addr_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_521_addr_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_522_opcode_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_522_opcode_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_523_p1_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_523_p1_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_524_p2_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_524_p2_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_525_p3_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_525_p3_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_526_p4_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_526_p4_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_527_p5_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_527_p5_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_528_comment_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_528_comment_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_529_notused_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_529_notused_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_530_detail_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_530_detail_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_531_sqlite3_ge */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_531_sqlite3_ge); /* size 0x41 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_532_no_such_co */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_532_no_such_co); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_533_unrecogniz */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_533_unrecogniz); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_534__s_in___s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_534__s_in___s_); /* size 0xb */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_yyFallback */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_yyFallback); /* size 0xb6 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_yy_shift_ofst */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_yy_shift_ofst); /* size 0x412 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_yy_lookahead */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_yy_lookahead); /* size 0xfc6 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_yy_action */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_yy_action); /* size 0xfb2 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_yy_default */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_yy_default); /* size 0x412 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_yyRuleInfo */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_yyRuleInfo); /* size 0x5bc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_535_unknown_ta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_535_unknown_ta); /* size 0x1b */
	. = ALIGN(0x8); /* align for .rodata.sqlite3___const_yy_reduce_dest_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3___const_yy_reduce_dest_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_536_set_list_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_536_set_list_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_537_near___T__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_537_near___T__); /* size 0x18 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3IntTokens */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3IntTokens); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_538_qualified_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_538_qualified_); /* size 0x5f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_539_the_INDEXE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_539_the_INDEXE); /* size 0x54 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_540_the_NOT_IN */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_540_the_NOT_IN); /* size 0x55 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_541_parser_sta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_541_parser_sta); /* size 0x16 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3AutoincrementBegin_autoInc */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3AutoincrementBegin_autoInc); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3ExprCodeTarget_zAff */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3ExprCodeTarget_zAff); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_542_misuse_of_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_542_misuse_of_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_543_unknown_fu */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_543_unknown_fu); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_544__d_columns */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_544__d_columns); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_545_row_value_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_545_row_value_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_546_RAISE___ma */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_546_RAISE___ma); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_547__s_s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_547__s_s_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_548_0x_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_548_0x_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_549_hex_litera */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_549_hex_litera); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_550_sub_select */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_550_sub_select); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_551__sLIST_SUB */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_551__sLIST_SUB); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_552_CORRELATED */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_552_CORRELATED); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_553__sSCALAR_S */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_553__sSCALAR_S); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_554_USING_ROWI */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_554_USING_ROWI); /* size 0x2f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_555_USING_INDE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_555_USING_INDE); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_556_authorizer */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_556_authorizer); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_557_ROLLBACK_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_557_ROLLBACK_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_558_COMMIT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_558_COMMIT_); /* size 0x7 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3Savepoint_az */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Savepoint_az); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_559_RELEASE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_559_RELEASE_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_560_temporary_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_560_temporary_); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_561_table__T_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_561_table__T_a); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_562_there_is_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_562_there_is_a); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_563_sqlite_seq */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_563_sqlite_seq); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3StartTable_nullRow */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3StartTable_nullRow); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_564_corrupt_da */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_564_corrupt_da); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_565_unknown_da */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_565_unknown_da); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_566_sqlite__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_566_sqlite__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_567_object_nam */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_567_object_nam); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_568_AUTOINCREM */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_568_AUTOINCREM); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_569_PRIMARY_KE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_569_PRIMARY_KE); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_570_TABLE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_570_TABLE_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_571_view_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_571_view_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_572_VIEW_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_572_VIEW_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_573_CREATE__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_573_CREATE__s_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_574_UPDATE__Q_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_574_UPDATE__Q_); /* size 0x57 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_575_CREATE_TAB */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_575_CREATE_TAB); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_576_tbl_name__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_576_tbl_name__); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_577_the_____op */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_577_the_____op); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_578_second_arg */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_578_second_arg); /* size 0x47 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_579_not_author */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_579_not_author); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_580_non_determ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_580_non_determ); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_581____s___may */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_581____s___may); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_582_window_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_582_window_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_583_aggregate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_583_aggregate_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_584_misuse_of_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_584_misuse_of_); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_585_no_such_fu */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_585_no_such_fu); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_586_wrong_numb */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_586_wrong_numb); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_587_subqueries */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_587_subqueries); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_588_parameters */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_588_parameters); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_589_partial_in */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_589_partial_in); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_590_index_expr */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_590_index_expr); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_591_CHECK_cons */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_591_CHECK_cons); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_592__s_prohibi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_592__s_prohibi); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_593_new_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_593_new_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_594_old_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_594_old_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_596_misuse_of_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_596_misuse_of_); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_597_no_such_co */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_597_no_such_co); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_598_ambiguous_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_598_ambiguous_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_599__s___s__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_599__s___s__s_); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_600_ROWID_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_600_ROWID_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_601__s__z_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_601__s__z_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_602_access_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_602_access_to_); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_603_no_such_wi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_603_no_such_wi); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_604_FILTER_cla */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_604_FILTER_cla); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_row_numberName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_row_numberName); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_ntileName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_ntileName); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_dense_rankName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_dense_rankName); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_rankName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_rankName); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_percent_rankName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_percent_rankName); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_cume_distName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_cume_distName); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_605_a_GROUP_BY */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_605_a_GROUP_BY); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_606_ORDER_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_606_ORDER_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_607_GROUP_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_607_GROUP_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_608_aggregate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_608_aggregate_); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_609_too_many_r */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_609_too_many_r); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_610___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_610___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_611__s__s__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_611__s__s__s_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_612_no_such_ta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_612_no_such_ta); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_613_no_tables_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_613_no_tables_); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_614_too_many_c */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_614_too_many_c); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_615_multiple_r */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_615_multiple_r); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_616_circular_r */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_616_circular_r); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_617_table__s_h */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_617_table__s_h); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_618_multiple_r */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_618_multiple_r); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_619_recursive_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_619_recursive_); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_620_column_d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_620_column_d_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_621____z__u_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_621____z__u_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_622_subquery__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_622_subquery__); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_623___s__is_no */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_623___s__is_no); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_624_view__s_is */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_624_view__s_is); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_625_no_such_in */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_625_no_such_in); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_626_a_NATURAL_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_626_a_NATURAL_); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_627_cannot_hav */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_627_cannot_hav); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_628_cannot_joi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_628_cannot_joi); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_629__r__s_BY_t */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_629__r__s_BY_t); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_630_too_many_t */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_630_too_many_t); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_631_all_VALUES */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_631_all_VALUES); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_632_SELECTs_to */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_632_SELECTs_to); /* size 0x52 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_633_UNION_ALL_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_633_UNION_ALL_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_634_INTERSECT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_634_INTERSECT_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_635_EXCEPT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_635_EXCEPT_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_636_UNION_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_636_UNION_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_637_too_many_t */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_637_too_many_t); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_638__r_ORDER_B */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_638__r_ORDER_B); /* size 0x3d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_639_Expression */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_639_Expression); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_640___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_640___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_641_____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_641_____); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_642______ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_642______); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_643____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_643____); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_644_CREATE_TAB */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_644_CREATE_TAB); /* size 0xe */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_createTableStmt_azType */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_createTableStmt_azType); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_645__TEXT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_645__TEXT_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_646__NUM_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_646__NUM_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_647__INT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_647__INT_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_648__REAL_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_648__REAL_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_649_too_many_c */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_649_too_many_c); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_650_duplicate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_650_duplicate_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_651_default_va */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_651_default_va); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_652_true_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_652_true_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_653_false_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_653_false_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_654_table___s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_654_table___s_); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_655_AUTOINCREM */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_655_AUTOINCREM); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_656_index_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_656_index_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_657_cannot_cre */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_657_cannot_cre); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_658_altertab__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_658_altertab__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_659_table__s_m */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_659_table__s_m); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_660_views_may_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_660_views_may_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_661_virtual_ta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_661_virtual_ta); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_662_there_is_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_662_there_is_a); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_663_index__s_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_663_index__s_a); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_664_sqlite_aut */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_664_sqlite_aut); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_665_expression */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_665_expression); /* size 0x3d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_666_conflictin */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_666_conflictin); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_667_CREATE_s_I */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_667_CREATE_s_I); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_668__UNIQUE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_668__UNIQUE_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_669_INSERT_INT */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_669_INSERT_INT); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_670_name___q__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_670_name___q__); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_671__s__T_cann */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_671__s__T_cann); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_672__s_cannot_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_672__s_cannot_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_673_index___q_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_673_index___q_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_674____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_674____); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_675_foreign_ke */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_675_foreign_ke); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_676_number_of_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_676_number_of_); /* size 0x5e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_677_unknown_co */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_677_unknown_co); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_678_sqlite_sta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_678_sqlite_sta); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_679_table__s_m */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_679_table__s_m); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_680_use_DROP_T */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_680_use_DROP_T); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_681_use_DROP_V */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_681_use_DROP_V); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_682_sqlite_sta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_682_sqlite_sta); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_683_DELETE_FRO */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_683_DELETE_FRO); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_684_DELETE_FRO */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_684_DELETE_FRO); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_685_DELETE_FRO */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_685_DELETE_FRO); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_686_DELETE_FRO */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_686_DELETE_FRO); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_687_UPDATE__Q_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_687_UPDATE__Q_); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_688_parameters */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_688_parameters); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_689_expected__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_689_expected__); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_690_CO_ROUTINE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_690_CO_ROUTINE); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_691_MATERIALIZ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_691_MATERIALIZ); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_692_DISTINCT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_692_DISTINCT_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_693_GROUP_BY_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_693_GROUP_BY_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_694_RIGHT_PART */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_694_RIGHT_PART); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_695_ORDER_BY_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_695_ORDER_BY_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_696__s_clause_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_696__s_clause_); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_697_LIMIT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_697_LIMIT_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_698_COMPOUND_Q */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_698_COMPOUND_Q); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_699_LEFT_MOST_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_699_LEFT_MOST_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_700__s_USING_T */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_700__s_USING_T); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_701_SCAN__d_CO */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_701_SCAN__d_CO); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_702_S_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_702_S_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_703_SETUP_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_703_SETUP_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_704_recursive_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_704_recursive_); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_705_RECURSIVE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_705_RECURSIVE_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_706_MERGE___s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_706_MERGE___s_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_707_LEFT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_707_LEFT_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_708_RIGHT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_708_RIGHT_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_nth_valueName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_nth_valueName); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_first_valueName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_first_valueName); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_leadName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_leadName); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_lagName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_lagName); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_709_at_most__d */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_709_at_most__d); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_710_SCAN_CONST */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_710_SCAN_CONST); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_711_too_many_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_711_too_many_a); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_712_ON_clause_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_712_ON_clause_); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_exprAnalyze_ops */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_exprAnalyze_ops); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_713_NOCASE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_713_NOCASE_); /* size 0x7 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_isAuxiliaryVtabOperator_aOp */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_isAuxiliaryVtabOperator_aOp); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_714_glob_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_714_glob_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_715_like_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_715_like_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_716_regexp_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_716_regexp_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_717__s_xBestIn */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_717__s_xBestIn); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_718_no_query_s */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_718_no_query_s); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_719_automatic_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_719_automatic_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_720_auto_index */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_720_auto_index); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_721_SEARCH_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_721_SEARCH_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_722_SCAN_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_722_SCAN_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_723__SUBQUERY_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_723__SUBQUERY_); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_724__TABLE__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_724__TABLE__s_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_725__AS__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_725__AS__s_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_726_PRIMARY_KE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_726_PRIMARY_KE); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_727_AUTOMATIC_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_727_AUTOMATIC_); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_728_AUTOMATIC_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_728_AUTOMATIC_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_729_COVERING_I */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_729_COVERING_I); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_730_INDEX__s_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_730_INDEX__s_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_731__USING__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_731__USING__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_732___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_732___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_733____AND_row */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_733____AND_row); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_734___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_734___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_735___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_735___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_736__USING_INT */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_736__USING_INT); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_737__VIRTUAL_T */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_737__VIRTUAL_T); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_738____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_738____); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_739__AND__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_739__AND__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_740__s___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_740__s___); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_741_ANY__s__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_741_ANY__s__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_742__expr__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_742__expr__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_743___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_743___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3___const_sqlite3WhereCodeOneLoopStart_aMoveOp_____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3___const_sqlite3WhereCodeOneLoopStart_aMoveOp_____); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_744_MULTI_INDE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_744_MULTI_INDE); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3WhereCodeOneLoopStart_aStep */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3WhereCodeOneLoopStart_aStep); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_sqlite3WhereCodeOneLoopStart_aStart */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3WhereCodeOneLoopStart_aStart); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_windowCheckIntValue_azErr */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_windowCheckIntValue_azErr); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_745_frame_star */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_745_frame_star); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_746_frame_endi */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_746_frame_endi); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_747_second_arg */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_747_second_arg); /* size 0x38 */
	. = ALIGN(0x4); /* align for .rodata.sqlite3_c_windowCheckIntValue_aOp */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_windowCheckIntValue_aOp); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_748_min_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_748_min_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_749_max_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_749_max_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_750_USE_TEMP_B */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_750_USE_TEMP_B); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_751_DISTINCT_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_751_DISTINCT_a); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_752_SCAN_TABLE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_752_SCAN_TABLE); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_753__USING_COV */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_753__USING_COV); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_754_too_many_t */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_754_too_many_t); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_755_a_JOIN_cla */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_755_a_JOIN_cla); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_756_ON_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_756_ON_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_757_USING_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_757_USING_); /* size 0x6 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3JoinType_aKeyword */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3JoinType_aKeyword); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_758___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_758___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_759_unknown_or */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_759_unknown_or); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_760_RIGHT_and_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_760_RIGHT_and_); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_761_rows_delet */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_761_rows_delet); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_762_table__s_m */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_762_table__s_m); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_763_cannot_mod */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_763_cannot_mod); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_764____TRIGGER */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_764____TRIGGER); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_765_foreign_ke */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_765_foreign_ke); /* size 0x2d */
	. = ALIGN(0x8); /* align for .rodata.sqlite3___const_fkActionTrigger_tOld_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3___const_fkActionTrigger_tOld_); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3___const_fkActionTrigger_tNew_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3___const_fkActionTrigger_tNew_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_766_too_many_c */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_766_too_many_c); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_767_no_such_co */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_767_no_such_co); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_768_rows_updat */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_768_rows_updat); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_769__s_rowid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_769__s_rowid_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_770_table__S_h */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_770_table__S_h); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_771_table__S_h */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_771_table__S_h); /* size 0x34 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_772__d_values_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_772__d_values_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_773_rows_inser */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_773_rows_inser); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_774_ON_CONFLIC */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_774_ON_CONFLIC); /* size 0x47 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_775_variable_n */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_775_variable_n); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_776_too_many_S */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_776_too_many_S); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_777_too_many_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_777_too_many_a); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_778_DISTINCT_i */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_778_DISTINCT_i); /* size 0x2f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_779_0_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_779_0_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_780_syntax_err */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_780_syntax_err); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_781_no_such_in */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_781_no_such_in); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_782_index_asso */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_782_index_asso); /* size 0x49 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_783_DELETE_FRO */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_783_DELETE_FRO); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_784___T_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_784___T_); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3Pragma_getCacheSize */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Pragma_getCacheSize); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_785_fast_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_785_fast_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_786_normal_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_786_normal_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_787_exclusive_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_787_exclusive_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_789_not_a_writ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_789_not_a_writ); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_790_Safety_lev */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_790_Safety_lev); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_791_issisi_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_791_issisi_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_792_iisX_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_792_iisX_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_793_isiX_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_793_isiX_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_794_c_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_794_c_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_795_u_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_795_u_); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3___const_sqlite3Pragma_azOrigin_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3___const_sqlite3Pragma_azOrigin_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_796_isisi_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_796_isisi_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_797_iss_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_797_iss_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_798_is_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_798_is_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_799_iissssss_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_799_iissssss_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_800_NONE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_800_NONE_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_801_siX_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_801_siX_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_802_____in_dat */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_802_____in_dat); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_803_NULL_value */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_803_NULL_value); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_804_CHECK_cons */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_804_CHECK_cons); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_805_row__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_805_row__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_806__missing_f */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_806__missing_f); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_807_non_unique */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_807_non_unique); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_808_wrong___of */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_808_wrong___of); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_810_ok_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_810_ok_); /* size 0x3 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3Pragma_encnames */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Pragma_encnames); /* size 0x90 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_811_UTF8_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_811_UTF8_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_812_UTF_8_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_812_UTF_8_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_813_UTF_16le_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_813_UTF_16le_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_814_UTF_16be_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_814_UTF_16be_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_815_UTF16le_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_815_UTF16le_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_816_UTF16be_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_816_UTF16be_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_817_UTF_16_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_817_UTF_16_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_818_UTF16_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_818_UTF16_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_819_unsupporte */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_819_unsupporte); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_820_full_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_820_full_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_821_restart_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_821_restart_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_822_ANALYZE___ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_822_ANALYZE___); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_823_none_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_823_none_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_824_incrementa */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_824_incrementa); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_825_temporary_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_825_temporary_); /* size 0x3e */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_getSafetyLevel_zText */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_getSafetyLevel_zText); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_826_SET_NULL_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_826_SET_NULL_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_827_SET_DEFAUL */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_827_SET_DEFAUL); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_828_CASCADE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_828_CASCADE_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_829_RESTRICT_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_829_RESTRICT_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_830_NO_ACTION_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_830_NO_ACTION_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_likeInfoAlt */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_likeInfoAlt); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_831_LIKE_or_GL */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_831_LIKE_or_GL); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_832_ESCAPE_exp */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_832_ESCAPE_exp); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_833_INSERT_INT */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_833_INSERT_INT); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_834_type__trig */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_834_type__trig); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_835_temporary_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_835_temporary_); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_836_cannot_cre */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_836_cannot_cre); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_837_trigger__T */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_837_trigger__T); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_838_cannot_cre */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_838_cannot_cre); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_839_cannot_cre */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_839_cannot_cre); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_840_BEFORE_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_840_BEFORE_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_841_AFTER_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_841_AFTER_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_842_cannot_cre */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_842_cannot_cre); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_843_no_such_tr */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_843_no_such_tr); /* size 0x14 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_sqlite3Attach_attach_func */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Attach_attach_func); /* size 0x48 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_844_sqlite_att */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_844_sqlite_att); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_845_too_many_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_845_too_many_a); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_846_database__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_846_database__); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_847_database_i */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_847_database_i); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_848_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_848_unable_to_); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_849_file__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_849_file__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_850_localhost_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_850_localhost_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_851_invalid_ur */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_851_invalid_ur); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_852_vfs_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_852_vfs_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_853_cache_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_853_cache_); /* size 0x6 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3ParseUri_aCacheMode */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3ParseUri_aCacheMode); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_854_shared_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_854_shared_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_855_private_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_855_private_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_856_mode_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_856_mode_); /* size 0x5 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3ParseUri_aOpenMode */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3ParseUri_aOpenMode); /* size 0x50 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_857_ro_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_857_ro_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_858_rw_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_858_rw_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_859_rwc_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_859_rwc_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_860_no_such__s */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_860_no_such__s); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_861__s_mode_no */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_861__s_mode_no); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_862_no_such_vf */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_862_no_such_vf); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_sqlite3Detach_detach_func */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3Detach_detach_func); /* size 0x48 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_863_sqlite_det */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_863_sqlite_det); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_864_no_such_da */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_864_no_such_da); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_865_cannot_det */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_865_cannot_det); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_866_database__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_866_database__); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_867_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_867_unable_to_); /* size 0x2e */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_openStatTable_aTable */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_openStatTable_aTable); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_868_tbl_idx_st */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_868_tbl_idx_st); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_869_sqlite_sta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_869_sqlite_sta); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_870_sqlite_sta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_870_sqlite_sta); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_871_CREATE_TAB */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_871_CREATE_TAB); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_872_sqlite____ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_872_sqlite____); /* size 0xa */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_statInitFuncdef */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_statInitFuncdef); /* size 0x48 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_statPushFuncdef */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_statPushFuncdef); /* size 0x48 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_873_BBB_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_873_BBB_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_874_stat_init_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_874_stat_init_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_875_stat_push_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_875_stat_push_); /* size 0xa */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_statGetFuncdef */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_statGetFuncdef); /* size 0x48 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_876_stat_get_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_876_stat_get_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_877__llu_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_877__llu_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_878___llu_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_878___llu_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_879_there_is_a */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_879_there_is_a); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_880_view__s_ma */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_880_view__s_ma); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_881_UPDATE___w */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_881_UPDATE___w); /* size 0xa1 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_882_UPDATE__Q_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_882_UPDATE__Q_); /* size 0x115 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_883_UPDATE___w */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_883_UPDATE___w); /* size 0x3a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_884_UPDATE_sql */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_884_UPDATE_sql); /* size 0xfe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_885_table__s_m */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_885_table__s_m); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_886_SELECT_1_F */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_886_SELECT_1_F); /* size 0x90 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_887_SELECT_1_F */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_887_SELECT_1_F); /* size 0x8f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_888_Cannot_add */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_888_Cannot_add); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_889_Cannot_add */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_889_Cannot_add); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_890_Cannot_add */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_890_Cannot_add); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_891_Cannot_add */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_891_Cannot_add); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_892_Cannot_add */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_892_Cannot_add); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_893_UPDATE___w */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_893_UPDATE___w); /* size 0x6d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_894_virtual_ta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_894_virtual_ta); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_895_Cannot_add */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_895_Cannot_add); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_896_sqlite_alt */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_896_sqlite_alt); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_897_UPDATE___w */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_897_UPDATE___w); /* size 0xc2 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_898_UPDATE_tem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_898_UPDATE_tem); /* size 0x78 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_899_virtual_ta */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_899_virtual_ta); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_900_cannot_ren */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_900_cannot_ren); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_901_CREATE_VIR */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_901_CREATE_VIR); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_902_UPDATE__Q_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_902_UPDATE__Q_); /* size 0x58 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_903_name___q__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_903_name___q__); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_904_duplicate_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_904_duplicate_); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_905_RANGE_must */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_905_RANGE_must); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_906_unsupporte */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_906_unsupporte); /* size 0x25 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_yy_reduce_ofst */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_yy_reduce_ofst); /* size 0x2e4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_907_incomplete */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_907_incomplete); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_908_load_exten */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_908_load_exten); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_909_sqlite_com */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_909_sqlite_com); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_910_sqlite_com */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_910_sqlite_com); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_911_unlikely_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_911_unlikely_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_912_likelihood */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_912_likelihood); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_913_likely_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_913_likely_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_914_ltrim_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_914_ltrim_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_915_rtrim_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_915_rtrim_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_916_trim_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_916_trim_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_917_typeof_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_917_typeof_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_918_length_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_918_length_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_919_instr_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_919_instr_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_920_printf_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_920_printf_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_921_unicode_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_921_unicode_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_922_char_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_922_char_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_923_abs_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_923_abs_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_924_round_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_924_round_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_925_upper_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_925_upper_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_926_lower_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_926_lower_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_927_hex_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_927_hex_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_928_ifnull_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_928_ifnull_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_929_random_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_929_random_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_930_randomblob */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_930_randomblob); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_931_nullif_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_931_nullif_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_932_sqlite_ver */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_932_sqlite_ver); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_933_sqlite_sou */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_933_sqlite_sou); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_934_sqlite_log */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_934_sqlite_log); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_935_quote_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_935_quote_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_936_last_inser */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_936_last_inser); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_937_changes_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_937_changes_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_938_total_chan */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_938_total_chan); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_939_replace_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_939_replace_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_940_zeroblob_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_940_zeroblob_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_941_substr_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_941_substr_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_942_sum_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_942_sum_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_943_total_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_943_total_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_944_avg_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_944_avg_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_945_count_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_945_count_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_946_group_conc */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_946_group_conc); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_947_coalesce_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_947_coalesce_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_trimFunc_lenOne */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_trimFunc_lenOne); /* size 0x1 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_trimFunc_azOne */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_trimFunc_azOne); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_typeofFunc_azType */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_typeofFunc_azType); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_948_text_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_948_text_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_949_blob_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_949_blob_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_950_integer_ov */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_950_integer_ov); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_951____f_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_951____f_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_952____20e_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_952____20e_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_953_sqlite_ren */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_953_sqlite_ren); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_954_sqlite_ren */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_954_sqlite_ren); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_955_sqlite_ren */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_955_sqlite_ren); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_956___w__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_956___w__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_957_error_in__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_957_error_in__); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_958__after_ren */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_958__after_ren); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_last_valueName */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_last_valueName); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_959_argument_o */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_959_argument_o); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_960_julianday_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_960_julianday_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_961_date_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_961_date_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_962_time_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_962_time_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_963_datetime_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_963_datetime_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_964_strftime_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_964_strftime_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_965_current_ti */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_965_current_ti); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_966_current_ti */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_966_current_ti); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_967_current_da */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_967_current_da); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_968_now_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_968_now_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_969_40f_21a_21 */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_969_40f_21a_21); /* size 0xc */
	. = ALIGN(0x2); /* align for .rodata.sqlite3_c_getDigits_aMx */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_getDigits_aMx); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_970_20c_20e_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_970_20c_20e_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_971_20e_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_971_20e_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_972_20b_20e_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_972_20b_20e_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_973_non_determ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_973_non_determ); /* size 0x43 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_974_localtime_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_974_localtime_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_975_unixepoch_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_975_unixepoch_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_976_utc_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_976_utc_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_977_weekday__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_977_weekday__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_978_start_of__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_978_start_of__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_979_month_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_979_month_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_980_year_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_980_year_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_981_day_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_981_day_); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_aXformType */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_aXformType); /* size 0xc0 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_982_local_time */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_982_local_time); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_983_second_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_983_second_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_984_minute_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_984_minute_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_985_hour_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_985_hour_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_986__04d__02d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_986__04d__02d_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_987__02d__02d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_987__02d__02d_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_988__04d__02d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_988__04d__02d_); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_989__02d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_989__02d_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_990__06_3f_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_990__06_3f_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_991__03d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_991__03d_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_992__04d_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_992__04d_); /* size 0x5 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_sqlite3MemSetDefault_defaultMethods */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3MemSetDefault_defaultMethods); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_993_failed_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_993_failed_to_); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_994_failed_mem */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_994_failed_mem); /* size 0x24 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_c_sqlite3PCacheSetDefault_defaultMethods */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3PCacheSetDefault_defaultMethods); /* size 0x68 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_995_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_995_unable_to_); /* size 0x44 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3ErrStr_aMsg */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3ErrStr_aMsg); /* size 0xe8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_996_not_an_err */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_996_not_an_err); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_997_SQL_logic_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_997_SQL_logic_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_998_access_per */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_998_access_per); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_999_query_abor */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_999_query_abor); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1000_database_i */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1000_database_i); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1001_database_t */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1001_database_t); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1002_attempt_to */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1002_attempt_to); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1003_interrupte */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1003_interrupte); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1004_disk_I_O_e */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1004_disk_I_O_e); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1005_database_d */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1005_database_d); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1006_unknown_op */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1006_unknown_op); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1007_database_o */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1007_database_o); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1008_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1008_unable_to_); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1009_locking_pr */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1009_locking_pr); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1010_constraint */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1010_constraint); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1011_datatype_m */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1011_datatype_m); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1012_bad_parame */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1012_bad_parame); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1013_authorizat */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1013_authorizat); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1014_column_ind */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1014_column_ind); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1015_file_is_no */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1015_file_is_no); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1016_notificati */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1016_notificati); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1017_warning_me */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1017_warning_me); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1018_unknown_er */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1018_unknown_er); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1019_abort_due_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1019_abort_due_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1020_another_ro */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1020_another_ro); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1021_no_more_ro */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1021_no_more_ro); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1022_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1022_unable_to_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1023_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1023_unable_to_); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1024_main_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1024_main_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1025_invalid_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1025_invalid_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1026_RTRIM_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1026_RTRIM_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1027_MATCH_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1027_MATCH_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1028_automatic_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1028_automatic_); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1029_unable_to_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1029_unable_to_); /* size 0x44 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1030_misuse_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1030_misuse_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1031__ROWID__ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1031__ROWID__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1032_OID_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1032_OID_); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.sqlite3_c_sqlite3azCompileOpt */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_sqlite3azCompileOpt); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1033_COMPILER_c */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1033_COMPILER_c); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.sqlite3__str_1034_THREADSAFE */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3__str_1034_THREADSAFE); /* size 0xd */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_switch_table_sqlite3Pragma_1037_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_switch_table_sqlite3Pragma_1037_); /* size 0x20 */
	. = ALIGN(0x8); /* align for .rodata.sqlite3_switch_table_multiSelectOrderBy_ */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_switch_table_multiSelectOrderBy_); /* size 0x18 */
	. = ALIGN(0x8); /* align for .rodata.sysconf */
	"/usr/local/popcorn/x86_64/lib/libc.a(sysconf.o)"(.rodata.sysconf); /* size 0x50 */
	. = ALIGN(0x10); /* align for .rodata.src_conf_sysconf_c_sysconf_values */
	"/usr/local/popcorn/x86_64/lib/libc.a(sysconf.o)"(.rodata.src_conf_sysconf_c_sysconf_values); /* size 0x1f2 */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_); /* size 0x1 */
	. = ALIGN(0x10); /* align for .rodata.src_env___libc_start_main___const___init_libc_pfd_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main___const___init_libc_pfd_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_1__dev_null_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_1__dev_null_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_ldso_dlerror__str_Dynamic_li */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlerror.o)"(.rodata.src_ldso_dlerror__str_Dynamic_li); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.src_ldso_dlerror__str_1_Invalid_li */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlerror.o)"(.rodata.src_ldso_dlerror__str_1_Invalid_li); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_ldso_dlopen__str_Dynamic_lo */
	"/usr/local/popcorn/x86_64/lib/libc.a(dlopen.o)"(.rodata.src_ldso_dlopen__str_Dynamic_lo); /* size 0x1e */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_malloc_c_bin_tab */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.rodata.src_malloc_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_popcorn_malloc_c_bin_tab */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.rodata.src_malloc_popcorn_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x8); /* align for .rodata.stderr */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.rodata.stderr); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.stdout */
	"/usr/local/popcorn/x86_64/lib/libc.a(stdout.o)"(.rodata.stdout); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.printf_core */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.printf_core); /* size 0x170 */
	. = ALIGN(0x8); /* align for .rodata.pop_arg */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.pop_arg); /* size 0x90 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str______0X0x_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str______0X0x_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_1__null__ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_1__null__); /* size 0x7 */
	. = ALIGN(0x10); /* align for .rodata.src_stdio_vfprintf_c_states */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf_c_states); /* size 0x1d0 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_3__0X_0X_0X_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_3__0X_0X_0X_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_4_inf_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_4_inf_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_5_INF_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_5_INF_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_6_nan_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_6_nan_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_7_NAN_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_7_NAN_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_8___ */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_8___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.src_errno_strerror_c_errmsg */
	"/usr/local/popcorn/x86_64/lib/libc.a(strerror.o)"(.rodata.src_errno_strerror_c_errmsg); /* size 0x70c */
	. = ALIGN(0x1); /* align for .rodata.src_ldso___dlsym__str_Symbol_not */
	"/usr/local/popcorn/x86_64/lib/libc.a(__dlsym.o)"(.rodata.src_ldso___dlsym__str_Symbol_not); /* size 0x15 */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_all_mask */
	"/usr/local/popcorn/x86_64/lib/libc.a(block.o)"(.rodata.src_signal_block_c_all_mask); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_app_mask */
	"/usr/local/popcorn/x86_64/lib/libc.a(block.o)"(.rodata.src_signal_block_c_app_mask); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.vfscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a(vfscanf.o)"(.rodata.vfscanf); /* size 0x338 */
	. = ALIGN(0x1); /* align for .rodata.src_time___secs_to_tm_c___secs_to_tm_days_in_month */
	"/usr/local/popcorn/x86_64/lib/libc.a(__secs_to_tm.o)"(.rodata.src_time___secs_to_tm_c___secs_to_tm_days_in_month); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.__gmt */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.rodata.__gmt); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_); /* size 0x1 */
	. = ALIGN(0x10); /* align for .rodata.src_time___tz_c_do_tzset_search */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.rodata.src_time___tz_c_do_tzset_search); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_1_TZ_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_1_TZ_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_2__etc_local */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_2__etc_local); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_3_TZif_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_3_TZif_); /* size 0x5 */
	. = ALIGN(0x4); /* align for .rodata.src_internal_floatscan_switch_table___floatscan_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan_switch_table___floatscan_); /* size 0xc */
	. = ALIGN(0x4); /* align for .rodata.src_internal_floatscan_switch_table___floatscan_2_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan_switch_table___floatscan_2_); /* size 0xc */
	. = ALIGN(0x10); /* align for .rodata.src_internal_intscan_c_table */
	"/usr/local/popcorn/x86_64/lib/libc.a(intscan.o)"(.rodata.src_internal_intscan_c_table); /* size 0x101 */
	. = ALIGN(0x1); /* align for .rodata.src_internal_intscan__str__________ */
	"/usr/local/popcorn/x86_64/lib/libc.a(intscan.o)"(.rodata.src_internal_intscan__str__________); /* size 0x9 */
	. = ALIGN(0x10); /* align for .rodata.src_time___month_to_secs_c___month_to_secs_secs_through_month */
	"/usr/local/popcorn/x86_64/lib/libc.a(__month_to_secs.o)"(.rodata.src_time___month_to_secs_c___month_to_secs_secs_through_month); /* size 0x30 */
	. = ALIGN(0x10); /* align for .rodata.__fsmu8 */
	"/usr/local/popcorn/x86_64/lib/libc.a(internal.o)"(.rodata.__fsmu8); /* size 0xcc */
	. = ALIGN(0x1); /* align for .rodata.sqlite3_c_synthCollSeq_aEnc */
	"build_x86-64/sqlite3.o"(.rodata.sqlite3_c_synthCollSeq_aEnc); /* size 0x3 */
	. = . + 0x8c; /* padding after .rodata.impliesNotNullRow */
	. = . + 0x1; /* padding before .rodata.sqlite3one */
	. = . + 0x4; /* padding after .rodata.sqlite3one */
	. = . + 0x9; /* padding after .rodata.sqlite3__str_595_excluded_ */
	*(.rodata);
}
  
  .rodata1        : { *(.rodata1) }
  
.data	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .data.sqlite3_c_sqlite3Config */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3Config); /* size 0x1b0 */
	. = ALIGN(0x8); /* align for .data.sqlite3_c_sqlite3OomStr */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3OomStr); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.sqlite3_c_sqlite3_os_init_aVfs */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3_os_init_aVfs); /* size 0x2a0 */
	. = ALIGN(0x4); /* align for .data.sqlite3_c_sqlite3PendingByte */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3PendingByte); /* size 0x4 */
	. = ALIGN(0x10); /* align for .data.sqlite3_c_aSyscall */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_aSyscall); /* size 0x2b8 */
	. = ALIGN(0x10); /* align for .data.sqlite3_c_unixTempFileDir_azDirs */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_unixTempFileDir_azDirs); /* size 0x30 */
	. = ALIGN(0x10); /* align for .data.sqlite3_c_sqlite3RegisterBuiltinFunctions_aBuiltinFunc */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3RegisterBuiltinFunctions_aBuiltinFunc); /* size 0x1098 */
	. = ALIGN(0x10); /* align for .data.sqlite3_c_sqlite3AlterFunctions_aAlterTableFuncs */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3AlterFunctions_aAlterTableFuncs); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .data.sqlite3_c_sqlite3WindowFunctions_aWindowFuncs */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3WindowFunctions_aWindowFuncs); /* size 0x438 */
	. = ALIGN(0x10); /* align for .data.sqlite3_c_sqlite3RegisterDateTimeFunctions_aDateTimeFuncs */
	"build_x86-64/sqlite3.o"(.data.sqlite3_c_sqlite3RegisterDateTimeFunctions_aDateTimeFuncs); /* size 0x240 */
	. = ALIGN(0x8); /* align for .data.src_stdio_stderr_c_f */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.data.src_stdio_stderr_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stderr_used */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.data.__stderr_used); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_stdio_stdout_c_f */
	"/usr/local/popcorn/x86_64/lib/libc.a(stdout.o)"(.data.src_stdio_stdout_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stdout_used */
	"/usr/local/popcorn/x86_64/lib/libc.a(stdout.o)"(.data.__stdout_used); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.__default_stacksize */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.data.__default_stacksize); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.__default_guardsize */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.data.__default_guardsize); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_time___tz_c_old_tz */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.data.src_time___tz_c_old_tz); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_time___tz_c_old_tz_size */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.data.src_time___tz_c_old_tz_size); /* size 0x8 */
	*(.data);
}

  .data1          : { *(.data1) }
  _edata = .; PROVIDE (edata = .);
  /*. = ALIGN(0x100); . = .;*/
 
 __bss_start = .;

.bss	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .bss.last_op_finish_ */
	"build_x86-64/benchmark.o"(.bss.last_op_finish_); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.hist_ */
	"build_x86-64/benchmark.o"(.bss.hist_); /* size 0x4f8 */
	. = ALIGN(0x8); /* align for .bss.raw_ */
	"build_x86-64/benchmark.o"(.bss.raw_); /* size 0x18 */
	. = ALIGN(0x4); /* align for .bss.done_ */
	"build_x86-64/benchmark.o"(.bss.done_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.next_report_ */
	"build_x86-64/benchmark.o"(.bss.next_report_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.db_ */
	"build_x86-64/benchmark.o"(.bss.db_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.db_num_ */
	"build_x86-64/benchmark.o"(.bss.db_num_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.num_ */
	"build_x86-64/benchmark.o"(.bss.num_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.reads_ */
	"build_x86-64/benchmark.o"(.bss.reads_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.bytes_ */
	"build_x86-64/benchmark.o"(.bss.bytes_); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.gen_ */
	"build_x86-64/benchmark.o"(.bss.gen_); /* size 0x18 */
	. = ALIGN(0x4); /* align for .bss.rand_ */
	"build_x86-64/benchmark.o"(.bss.rand_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.message_ */
	"build_x86-64/benchmark.o"(.bss.message_); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.start_ */
	"build_x86-64/benchmark.o"(.bss.start_); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.FLAGS_benchmarks */
	"build_x86-64/main.o"(.bss.FLAGS_benchmarks); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_num */
	"build_x86-64/main.o"(.bss.FLAGS_num); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_reads */
	"build_x86-64/main.o"(.bss.FLAGS_reads); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_value_size */
	"build_x86-64/main.o"(.bss.FLAGS_value_size); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_histogram */
	"build_x86-64/main.o"(.bss.FLAGS_histogram); /* size 0x1 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_raw */
	"build_x86-64/main.o"(.bss.FLAGS_raw); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.FLAGS_compression_ratio */
	"build_x86-64/main.o"(.bss.FLAGS_compression_ratio); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_page_size */
	"build_x86-64/main.o"(.bss.FLAGS_page_size); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_num_pages */
	"build_x86-64/main.o"(.bss.FLAGS_num_pages); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_use_existing_db */
	"build_x86-64/main.o"(.bss.FLAGS_use_existing_db); /* size 0x1 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_transaction */
	"build_x86-64/main.o"(.bss.FLAGS_transaction); /* size 0x1 */
	. = ALIGN(0x4); /* align for .bss.FLAGS_WAL_enabled */
	"build_x86-64/main.o"(.bss.FLAGS_WAL_enabled); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.FLAGS_db */
	"build_x86-64/main.o"(.bss.FLAGS_db); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3Stat */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3Stat); /* size 0xa0 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_vfsList */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_vfsList); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_mem0 */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_mem0); /* size 0x18 */
	. = ALIGN(0x4); /* align for .bss.sqlite3_c_sqlite3Prng */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3Prng); /* size 0x103 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_unixBigLock */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_unixBigLock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_temp_directory */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_temp_directory); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_data_directory */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_data_directory); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3BuiltinFunctions */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3BuiltinFunctions); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .bss.sqlite3_c_pthreadMutexAlloc_staticMutexes */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_pthreadMutexAlloc_staticMutexes); /* size 0x1e0 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_inodeList */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_inodeList); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.sqlite3_c_randomnessPid */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_randomnessPid); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_pcache1_g */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_pcache1_g); /* size 0x90 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3SharedCacheList */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3SharedCacheList); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.sqlite3_c_sqlite3VdbeExec_aZero */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3VdbeExec_aZero); /* size 0x10 */
	. = ALIGN(0x1); /* align for .bss.sqlite3_c_sqlite3BtreeFakeValidCursor_fakeCursor */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3BtreeFakeValidCursor_fakeCursor); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_findElementWithHash_nullElement */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_findElementWithHash_nullElement); /* size 0x20 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3VdbeGetOp_dummy */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3VdbeGetOp_dummy); /* size 0x18 */
	. = ALIGN(0x4); /* align for .bss.sqlite3_c_pcache1Create_dummyCurrentPage */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_pcache1Create_dummyCurrentPage); /* size 0x4 */
	. = ALIGN(0x1); /* align for .bss.sqlite3_c_sqlite3SavedPrng */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3SavedPrng); /* size 0x103 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3Autoext_0 */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3Autoext_0); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3Autoext_1 */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3Autoext_1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3Hooks_0 */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3Hooks_0); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.sqlite3_c_sqlite3Hooks_1 */
	"build_x86-64/sqlite3.o"(.bss.sqlite3_c_sqlite3Hooks_1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__popcorn_stack_base */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.bss.__popcorn_stack_base); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname */
	"/usr/local/popcorn/x86_64/lib/libc.a(libc.o)"(.bss.__progname); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname_full */
	"/usr/local/popcorn/x86_64/lib/libc.a(libc.o)"(.bss.__progname_full); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_cur); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_end */
	"/usr/local/popcorn/x86_64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_end); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_lock); /* size 0x8 */
	. = ALIGN(0x1000); /* align for .bss.src_malloc_malloc_c_mal */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_mal); /* size 0x1000 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_expand_heap_heap_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_malloc_c_expand_heap_end */
	"/usr/local/popcorn/x86_64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_expand_heap_end); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_end */
	"/usr/local/popcorn/x86_64/lib/libc.a(popcorn_malloc.o)"(.bss.src_malloc_popcorn_malloc_c_expand_heap_end); /* size 0x100 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_fflush_c_dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(fflush.o)"(.bss.src_stdio_fflush_c_dummy); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_stdio_ofl_c_ofl_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_ofl_c_ofl_head */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_head); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_stdio_stderr_c_buf */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.bss.src_stdio_stderr_c_buf); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_stdio_stdout_c_buf */
	"/usr/local/popcorn/x86_64/lib/libc.a(stdout.o)"(.bss.src_stdio_stdout_c_buf); /* size 0x408 */
	. = ALIGN(0x8); /* align for .bss.src_thread_pthread_create_c_dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.bss.src_thread_pthread_create_c_dummy); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_thread_pthread_create_c_dummy_tsd */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.bss.src_thread_pthread_create_c_dummy_tsd); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.__block_new_threads */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.bss.__block_new_threads); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_thread_pthread_create_c_dummy_file */
	"/usr/local/popcorn/x86_64/lib/libc.a(pthread_create.o)"(.bss.src_thread_pthread_create_c_dummy_file); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_thread_vmlock_c_vmlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(vmlock.o)"(.bss.src_thread_vmlock_c_vmlock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time_localtime_c_localtime_tm */
	"/usr/local/popcorn/x86_64/lib/libc.a(localtime.o)"(.bss.src_time_localtime_c_localtime_tm); /* size 0x38 */
	. = ALIGN(0x8); /* align for .bss.__environ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__environ.o)"(.bss.__environ); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_env___init_tls_c_main_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_main_tls); /* size 0x30 */
	. = ALIGN(0x10); /* align for .bss.src_env___init_tls_c_builtin_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_builtin_tls); /* size 0x1a8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c___expand_heap_brk */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_brk); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c___expand_heap_mmap_step */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_mmap_step); /* size 0x4 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes); /* size 0x100 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c_arena_start */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c_arena_start); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c_set_arena_start_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c_set_arena_start_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__timezone */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.__timezone); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.__daylight */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.__daylight); /* size 0x4 */
	. = ALIGN(0x10); /* align for .bss.__tzname */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.__tzname); /* size 0x10 */
	. = ALIGN(0x4); /* align for .bss.src_time___tz_c_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_zi */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_zi); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_types */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_types); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_abbrevs */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_abbrevs); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_time___tz_c_r0 */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_r0); /* size 0x14 */
	. = ALIGN(0x10); /* align for .bss.src_time___tz_c_r1 */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_r1); /* size 0x14 */
	. = ALIGN(0x4); /* align for .bss.src_time___tz_c_dst_off */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_dst_off); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_abbrevs_end */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_abbrevs_end); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_map_size */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_map_size); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_trans */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_trans); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_index */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_index); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_time___tz_c_std_name */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_std_name); /* size 0x7 */
	. = ALIGN(0x4); /* align for .bss.src_time___tz_c_dst_name */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_dst_name); /* size 0x7 */
	. = ALIGN(0x10); /* align for .bss.src_time___tz_c_old_tz_buf */
	"/usr/local/popcorn/x86_64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_old_tz_buf); /* size 0x20 */
	. = ALIGN(0x4); /* align for .bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state */
	"/usr/local/popcorn/x86_64/lib/libc.a(mbrtowc.o)"(.bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_stdio___stdio_exit_c_dummy_file */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_exit.o)"(.bss.src_stdio___stdio_exit_c_dummy_file); /* size 0x8 */
	*(.bss);
}

  .lbss   :
  {
    *(.dynlbss)
    *(.lbss .lbss.* .gnu.linkonce.lb.*)
    *(LARGE_COMMON)
  }
  . = ALIGN(64 / 8);
  . = SEGMENT_START("ldata-segment", .);
  .lrodata   ALIGN(CONSTANT (MAXPAGESIZE)) + (. & (CONSTANT (MAXPAGESIZE) - 1)) :
  {
    *(.lrodata .lrodata.* .gnu.linkonce.lr.*)
  }
  .ldata   ALIGN(CONSTANT (MAXPAGESIZE)) + (. & (CONSTANT (MAXPAGESIZE) - 1)) :
  {
    *(.ldata .ldata.* .gnu.linkonce.l.*)
    . = ALIGN(. != 0 ? 64 / 8 : 1);
  }
  .eh_frame_hdr : { *(.eh_frame_hdr) }
  .eh_frame       : ONLY_IF_RO { KEEP (*(.eh_frame)) }

  .gcc_except_table   : ONLY_IF_RO { *(.gcc_except_table
  .gcc_except_table.*) }
  /* These sections are generated by the Sun/Oracle C++ compiler.  */
  .exception_ranges   : ONLY_IF_RO { *(.exception_ranges
  .exception_ranges*) }
  /* Adjust the address for the data segment.  We want to adjust up to
     the same address within the page on the next page up.  */
  . = ALIGN (CONSTANT (MAXPAGESIZE)) - ((CONSTANT (MAXPAGESIZE) - .) & (CONSTANT (MAXPAGESIZE) - 1)); . = DATA_SEGMENT_ALIGN (CONSTANT (MAXPAGESIZE), CONSTANT (COMMONPAGESIZE));
  /* Exception handling  */
  .eh_frame       : ONLY_IF_RW { KEEP (*(.eh_frame)) }
  .gcc_except_table   : ONLY_IF_RW { *(.gcc_except_table .gcc_except_table.*) }
  .exception_ranges   : ONLY_IF_RW { *(.exception_ranges .exception_ranges*) }
  /* Thread Local Storage sections  */

.tdata	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	*(.tdata);
}

.tbss	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	*(.tbss);
}

.preinit_array     :
  {
    PROVIDE_HIDDEN (__preinit_array_start = .);
    KEEP (*(.preinit_array))
    PROVIDE_HIDDEN (__preinit_array_end = .);
  }
  .init_array     :
  {
    PROVIDE_HIDDEN (__init_array_start = .);
    /*KEEP ( *(SORT_BY_INIT_PRIORITY (.init_array.*) SORT_BY_INIT_PRIORITY(.ctors.*)) )*/
    KEEP (*(.init_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .ctors))
    PROVIDE_HIDDEN (__init_array_end = .);
  }
  .fini_array     :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    /*KEEP (*(SORT_BY_INIT_PRIORITY(.fini_array.*) SORT_BY_INIT_PRIORITY(.dtors.*)))*/
    KEEP (*(.fini_array EXCLUDE_FILE (*crtbegin.o *crtbegin?.o *crtend.o *crtend?.o ) .dtors))
    PROVIDE_HIDDEN (__fini_array_end = .);
  }
  .ctors          :
  {
    /* gcc uses crtbegin.o to find the start of
       the constructors, so we make sure it is
       first.  Because this is a wildcard, it
       doesn't matter if the user does not
       actually link against crtbegin.o; the
       linker won't look for a file to match a
       wildcard.  The wildcard also means that it
       doesn't matter which directory crtbegin.o
       is in.  */
    KEEP (*crtbegin.o(.ctors))
    KEEP (*crtbegin?.o(.ctors))
    /* We don't want to include the .ctor section from
       the crtend.o file until after the sorted ctors.
       The .ctor section from the crtend file contains the
       end of ctors marker and it must be last */
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .ctors))
    KEEP (*(SORT(.ctors.*)))
    KEEP (*(.ctors))
  }
  .dtors          :
  {
    KEEP (*crtbegin.o(.dtors))
    KEEP (*crtbegin?.o(.dtors))
    KEEP (*(EXCLUDE_FILE (*crtend.o *crtend?.o ) .dtors))
    KEEP (*(SORT(.dtors.*)))
    KEEP (*(.dtors))
  }
  .jcr            : { KEEP (*(.jcr)) }
  .data.rel.ro : 
  { 
	*(.data.rel.ro.local* .gnu.linkonce.d.rel.ro.local.*) 
	*(.data.rel.ro .data.rel.ro.* .gnu.linkonce.d.rel.ro.*) 
  }
  .dynamic        : { *(.dynamic) }
  .got            : { *(.got) *(.igot) }
  . = DATA_SEGMENT_RELRO_END (SIZEOF (.got.plt) >= 24 ? 24 : 0, .);
  .got.plt        : { *(.got.plt)  *(.igot.plt) }
  .llvm_stackmaps : ALIGN(0x1000) { *(.llvm_stackmaps) }
  .llvm_pcn_stackmaps : ALIGN(0x1000) { *(.llvm_pcn_stackmaps) }
  . = ALIGN(64 / 8);
  _end = .; PROVIDE (end = .);
  . = DATA_SEGMENT_END (.);
  /* Stabs debugging sections.  */
  .stab          0 : { *(.stab) }
  .stabstr       0 : { *(.stabstr) }
  .stab.excl     0 : { *(.stab.excl) }
  .stab.exclstr  0 : { *(.stab.exclstr) }
  .stab.index    0 : { *(.stab.index) }
  .stab.indexstr 0 : { *(.stab.indexstr) }
  .comment       0 : { *(.comment) }
  /* DWARF debug sections.
     Symbols in the DWARF debugging sections are relative to the beginning
     of the section so we begin them at 0.  */
  /* DWARF 1 */
  .debug          0 : { *(.debug) }
  .line           0 : { *(.line) }
  /* GNU DWARF 1 extensions */
  .debug_srcinfo  0 : { *(.debug_srcinfo) }
  .debug_sfnames  0 : { *(.debug_sfnames) }
  /* DWARF 1.1 and DWARF 2 */
  .debug_aranges  0 : { *(.debug_aranges) }
  .debug_pubnames 0 : { *(.debug_pubnames) }
  /* DWARF 2 */
  .debug_info     0 : { *(.debug_info .gnu.linkonce.wi.*) }
  .debug_abbrev   0 : { *(.debug_abbrev) }
  .debug_line     0 : { *(.debug_line .debug_line.* .debug_line_end ) }
  .debug_frame    0 : { *(.debug_frame) }
  .debug_str      0 : { *(.debug_str) }
  .debug_loc      0 : { *(.debug_loc) }
  .debug_macinfo  0 : { *(.debug_macinfo) }
  /* SGI/MIPS DWARF 2 extensions */
  .debug_weaknames 0 : { *(.debug_weaknames) }
  .debug_funcnames 0 : { *(.debug_funcnames) }
  .debug_typenames 0 : { *(.debug_typenames) }
  .debug_varnames  0 : { *(.debug_varnames) }
  /* DWARF 3 */
  .debug_pubtypes 0 : { *(.debug_pubtypes) }
  .debug_ranges   0 : { *(.debug_ranges) }
  /* DWARF Extension.  */
  .debug_macro    0 : { *(.debug_macro) }
  .gnu.attributes 0 : { KEEP (*(.gnu.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) *(.note.gnu.build-id) }
}