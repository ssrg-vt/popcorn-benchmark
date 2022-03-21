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
	"/usr/local/popcorn/x86_64/lib/libc.a:exit.o"(.text.exit); /* size 0x1d */
	. = . + 0x7; /* padding after .text.exit */
	. = ALIGN(0x10); /* align for .text.add */
	"add_x86_64.o"(.text.add); /* size 0x17b */
	. = . + 0x29; /* padding after .text.add */
	. = ALIGN(0x10); /* align for .text.adi */
	"adi_x86_64.o"(.text.adi); /* size 0x39 */
	. = ALIGN(0x10); /* align for .text.c_print_results */
	"c_print_results_x86_64.o"(.text.c_print_results); /* size 0x31e */
	. = ALIGN(0x10); /* align for .text.timer_clear */
	"c_timers_x86_64.o"(.text.timer_clear); /* size 0x34 */
	. = . + 0x1c; /* padding after .text.timer_clear */
	. = ALIGN(0x10); /* align for .text.timer_start */
	"c_timers_x86_64.o"(.text.timer_start); /* size 0x36 */
	. = . + 0x1e; /* padding after .text.timer_start */
	. = ALIGN(0x10); /* align for .text.elapsed_time */
	"c_timers_x86_64.o"(.text.elapsed_time); /* size 0x38 */
	. = . + 0x10; /* padding after .text.elapsed_time */
	. = ALIGN(0x10); /* align for .text.timer_stop */
	"c_timers_x86_64.o"(.text.timer_stop); /* size 0x6b */
	. = . + 0x19; /* padding after .text.timer_stop */
	. = ALIGN(0x10); /* align for .text.timer_read */
	"c_timers_x86_64.o"(.text.timer_read); /* size 0x3e */
	. = . + 0x1e; /* padding after .text.timer_read */
	. = ALIGN(0x10); /* align for .text.error_norm */
	"error_x86_64.o"(.text.error_norm); /* size 0x2c5 */
	. = . + 0x2b; /* padding after .text.error_norm */
	. = ALIGN(0x10); /* align for .text.rhs_norm */
	"error_x86_64.o"(.text.rhs_norm); /* size 0x23a */
	. = . + 0x2a; /* padding after .text.rhs_norm */
	. = ALIGN(0x10); /* align for .text.exact_rhs */
	"exact_rhs_x86_64.o"(.text.exact_rhs); /* size 0x28e5 */
	. = ALIGN(0x10); /* align for .text.exact_solution */
	"exact_solution_x86_64.o"(.text.exact_solution); /* size 0x189 */
	. = ALIGN(0x10); /* align for .text.initialize */
	"initialize_x86_64.o"(.text.initialize); /* size 0xd46 */
	. = . + 0xe; /* padding after .text.initialize */
	. = ALIGN(0x10); /* align for .text.lhsinit */
	"initialize_x86_64.o"(.text.lhsinit); /* size 0x1eb */
	. = . + 0x21; /* padding after .text.lhsinit */
	. = ALIGN(0x10); /* align for .text.lhsinitj */
	"initialize_x86_64.o"(.text.lhsinitj); /* size 0x1e8 */
	. = . + 0x24; /* padding after .text.lhsinitj */
	. = ALIGN(0x10); /* align for .text.ninvr */
	"ninvr_x86_64.o"(.text.ninvr); /* size 0x340 */
	. = ALIGN(0x10); /* align for .text.pinvr */
	"pinvr_x86_64.o"(.text.pinvr); /* size 0x340 */
	. = ALIGN(0x10); /* align for .text.print_results */
	"print_results_x86_64.o"(.text.print_results); /* size 0x380 */
	. = ALIGN(0x10); /* align for .text.randlc */
	"randdp_x86_64.o"(.text.randlc); /* size 0x1d6 */
	. = ALIGN(0x10); /* align for .text.vranlc */
	"randdp_x86_64.o"(.text.vranlc); /* size 0x249 */
	. = ALIGN(0x10); /* align for .text.compute_rhs */
	"rhs_x86_64.o"(.text.compute_rhs); /* size 0x30cc */
	. = ALIGN(0x10); /* align for .text.set_constants */
	"set_constants_x86_64.o"(.text.set_constants); /* size 0xc88 */
	. = ALIGN(0x10); /* align for .text.main */
	"sp_x86_64.o"(.text.main); /* size 0x99d */
	. = ALIGN(0x10); /* align for .text.txinvr */
	"txinvr_x86_64.o"(.text.txinvr); /* size 0x519 */
	. = ALIGN(0x10); /* align for .text.tzetar */
	"tzetar_x86_64.o"(.text.tzetar); /* size 0x518 */
	. = ALIGN(0x10); /* align for .text.verify */
	"verify_x86_64.o"(.text.verify); /* size 0xd69 */
	. = . + 0xbb; /* padding after .text.verify */
	. = ALIGN(0x10); /* align for .text.wtime_ */
	"wtime_x86_64.o"(.text.wtime_); /* size 0x86 */
	. = . + 0x1a; /* padding after .text.wtime_ */
	. = ALIGN(0x10); /* align for .text.x_solve */
	"x_solve_x86_64.o"(.text.x_solve); /* size 0x2124 */
	. = ALIGN(0x10); /* align for .text.y_solve */
	"y_solve_x86_64.o"(.text.y_solve); /* size 0x21ef */
	. = ALIGN(0x10); /* align for .text.z_solve */
	"z_solve_x86_64.o"(.text.z_solve); /* size 0x2239 */
	. = ALIGN(0x4); /* align for .text._start_c */
	"/usr/local/popcorn/x86_64/lib/crt1.o"(.text._start_c); /* size 0x1f */
	. = . + 0x11; /* padding after .text._start_c */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.dummy1 */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.text.dummy1); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy1 */
	. = ALIGN(0x4); /* align for .text.__init_libc */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.text.__init_libc); /* size 0x19f */
	. = . + 0x41; /* padding after .text.__init_libc */
	. = ALIGN(0x4); /* align for .text.libc_start_init */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.text.libc_start_init); /* size 0x31 */
	. = . + 0x1b; /* padding after .text.libc_start_init */
	. = ALIGN(0x4); /* align for .text.__libc_start_main */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.text.__libc_start_main); /* size 0x43 */
	. = . + 0xd; /* padding after .text.__libc_start_main */
	. = ALIGN(0x4); /* align for .text.libc_exit_fini */
	"/usr/local/popcorn/x86_64/lib/libc.a:exit.o"(.text.libc_exit_fini); /* size 0x35 */
	. = . + 0x13; /* padding after .text.libc_exit_fini */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:exit.o"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.pow */
	"/usr/local/popcorn/x86_64/lib/libc.a:pow.o"(.text.pow); /* size 0x7bf */
	. = . + 0x41; /* padding after .text.pow */
	. = ALIGN(0x4); /* align for .text.scalbn */
	"/usr/local/popcorn/x86_64/lib/libc.a:scalbn.o"(.text.scalbn); /* size 0x8c */
	. = . + 0xc; /* padding after .text.scalbn */
	. = ALIGN(0x4); /* align for .text.fabs */
	"/usr/local/popcorn/x86_64/lib/libc.a:fabs.o"(.text.fabs); /* size 0x12 */
	. = ALIGN(0x4); /* align for .text.sqrt */
	"/usr/local/popcorn/x86_64/lib/libc.a:sqrt.o"(.text.sqrt); /* size 0x5 */
	. = . + 0x3; /* padding after .text.sqrt */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:fclose.o"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.fclose */
	"/usr/local/popcorn/x86_64/lib/libc.a:fclose.o"(.text.fclose); /* size 0xb3 */
	. = . + 0x21; /* padding after .text.fclose */
	. = ALIGN(0x4); /* align for .text.fflush */
	"/usr/local/popcorn/x86_64/lib/libc.a:fflush.o"(.text.fflush); /* size 0x124 */
	. = . + 0x38; /* padding after .text.fflush */
	. = ALIGN(0x4); /* align for .text.fgetc */
	"/usr/local/popcorn/x86_64/lib/libc.a:fgetc.o"(.text.fgetc); /* size 0x76 */
	. = . + 0x2a; /* padding after .text.fgetc */
	. = ALIGN(0x4); /* align for .text.fopen */
	"/usr/local/popcorn/x86_64/lib/libc.a:fopen.o"(.text.fopen); /* size 0x90 */
	. = . + 0x30; /* padding after .text.fopen */
	. = ALIGN(0x4); /* align for .text.fscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a:fscanf.o"(.text.fscanf); /* size 0x81 */
	. = ALIGN(0x4); /* align for .text.__ofl_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a:ofl.o"(.text.__ofl_lock); /* size 0x12 */
	. = . + 0x12; /* padding after .text.__ofl_lock */
	. = ALIGN(0x4); /* align for .text.__ofl_unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a:ofl.o"(.text.__ofl_unlock); /* size 0xa */
	. = . + 0x2; /* padding after .text.__ofl_unlock */
	. = ALIGN(0x4); /* align for .text.printf */
	"/usr/local/popcorn/x86_64/lib/libc.a:printf.o"(.text.printf); /* size 0x92 */
	. = ALIGN(0x4); /* align for .text.sprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a:sprintf.o"(.text.sprintf); /* size 0x81 */
	. = ALIGN(0x4); /* align for .text.vfprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.text.vfprintf); /* size 0x1ab */
	. = ALIGN(0x4); /* align for .text.printf_core */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.text.printf_core); /* size 0x1bc3 */
	. = ALIGN(0x4); /* align for .text.pop_arg */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.text.pop_arg); /* size 0x1cc */
	. = . + 0xa0; /* padding after .text.pop_arg */
	. = ALIGN(0x4); /* align for .text.pad */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.text.pad); /* size 0xbc */
	. = . + 0x1c; /* padding after .text.pad */
	. = ALIGN(0x4); /* align for .text.vfscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfscanf.o"(.text.vfscanf); /* size 0xbad */
	. = . + 0x107; /* padding after .text.vfscanf */
	. = ALIGN(0x4); /* align for .text.vsprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a:vsprintf.o"(.text.vsprintf); /* size 0x10 */
	. = . + 0x24; /* padding after .text.vsprintf */
	. = ALIGN(0x10); /* align for .text.strchr */
	"/usr/local/popcorn/x86_64/lib/libc.a:strchr.o"(.text.strchr); /* size 0x12 */
	. = . + 0x1a; /* padding after .text.strchr */
	. = ALIGN(0x10); /* align for .text.__strchrnul */
	"/usr/local/popcorn/x86_64/lib/libc.a:strchrnul.o"(.text.__strchrnul); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.strlen */
	"/usr/local/popcorn/x86_64/lib/libc.a:strlen.o"(.text.strlen); /* size 0x7e */
	. = ALIGN(0x10); /* align for .text.strnlen */
	"/usr/local/popcorn/x86_64/lib/libc.a:strnlen.o"(.text.strnlen); /* size 0x2c */
	. = . + 0xc; /* padding after .text.strnlen */
	. = ALIGN(0x4); /* align for .text.memset */
	"/usr/local/popcorn/x86_64/lib/libc.a:memset.o"(.text.memset); /* size 0xc4 */
	. = . + 0x7c; /* padding after .text.memset */
	. = ALIGN(0x4); /* align for .text.__lock */
	"/usr/local/popcorn/x86_64/lib/libc.a:__lock.o"(.text.__lock); /* size 0x47 */
	. = . + 0x19; /* padding after .text.__lock */
	. = ALIGN(0x4); /* align for .text.__unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a:__lock.o"(.text.__unlock); /* size 0x3d */
	. = . + 0x17; /* padding after .text.__unlock */
	. = ALIGN(0x4); /* align for .text.__wait */
	"/usr/local/popcorn/x86_64/lib/libc.a:__wait.o"(.text.__wait); /* size 0x78 */
	. = . + 0x4c; /* padding after .text.__wait */
	. = ALIGN(0x4); /* align for .text.gettimeofday */
	"/usr/local/popcorn/x86_64/lib/libc.a:gettimeofday.o"(.text.gettimeofday); /* size 0x4c */
	. = . + 0x14; /* padding after .text.gettimeofday */
	. = ALIGN(0x4); /* align for .text.__init_tp */
	"/usr/local/popcorn/x86_64/lib/libc.a:__init_tls.o"(.text.__init_tp); /* size 0x50 */
	. = . + 0x20; /* padding after .text.__init_tp */
	. = ALIGN(0x4); /* align for .text.__copy_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a:__init_tls.o"(.text.__copy_tls); /* size 0xa5 */
	. = ALIGN(0x4); /* align for .text.static_init_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a:__init_tls.o"(.text.static_init_tls); /* size 0x142 */
	. = . + 0x2; /* padding after .text.static_init_tls */
	. = ALIGN(0x4); /* align for .text.__errno_location */
	"/usr/local/popcorn/x86_64/lib/libc.a:__errno_location.o"(.text.__errno_location); /* size 0xe */
	. = ALIGN(0x4); /* align for .text.__strerror_l */
	"/usr/local/popcorn/x86_64/lib/libc.a:strerror.o"(.text.__strerror_l); /* size 0x44 */
	. = . + 0x20; /* padding after .text.__strerror_l */
	. = ALIGN(0x4); /* align for .text.strerror */
	"/usr/local/popcorn/x86_64/lib/libc.a:strerror.o"(.text.strerror); /* size 0x15 */
	. = ALIGN(0x4); /* align for .text._Exit */
	"/usr/local/popcorn/x86_64/lib/libc.a:_Exit.o"(.text._Exit); /* size 0x13 */
	. = . + 0xd; /* padding after .text._Exit */
	. = ALIGN(0x10); /* align for .text.__floatscan */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.text.__floatscan); /* size 0x185f */
	. = . + 0x71; /* padding after .text.__floatscan */
	. = ALIGN(0x10); /* align for .text.scanexp */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.text.scanexp); /* size 0x20f */
	. = . + 0x41; /* padding after .text.scanexp */
	. = ALIGN(0x10); /* align for .text.__intscan */
	"/usr/local/popcorn/x86_64/lib/libc.a:intscan.o"(.text.__intscan); /* size 0x6ac */
	. = . + 0x48; /* padding after .text.__intscan */
	. = ALIGN(0x10); /* align for .text.__shlim */
	"/usr/local/popcorn/x86_64/lib/libc.a:shgetc.o"(.text.__shlim); /* size 0x39 */
	. = ALIGN(0x10); /* align for .text.__shgetc */
	"/usr/local/popcorn/x86_64/lib/libc.a:shgetc.o"(.text.__shgetc); /* size 0xc1 */
	. = . + 0x1b; /* padding after .text.__shgetc */
	. = ALIGN(0x10); /* align for .text.__syscall_ret */
	"/usr/local/popcorn/x86_64/lib/libc.a:syscall_ret.o"(.text.__syscall_ret); /* size 0x22 */
	. = . + 0xe; /* padding after .text.__syscall_ret */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:__lctrans.o"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__lctrans */
	"/usr/local/popcorn/x86_64/lib/libc.a:__lctrans.o"(.text.__lctrans); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.__lctrans_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a:__lctrans.o"(.text.__lctrans_cur); /* size 0x19 */
	. = ALIGN(0x10); /* align for .text.__simple_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:lite_malloc.o"(.text.__simple_malloc); /* size 0xfc */
	. = . + 0x14; /* padding after .text.__simple_malloc */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.__init_malloc); /* size 0x11 */
	. = . + 0x3; /* padding after .text.__init_malloc */
	. = ALIGN(0x10); /* align for .text.malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.malloc); /* size 0x5ab */
	. = . + 0x25; /* padding after .text.malloc */
	. = ALIGN(0x10); /* align for .text.alloc_rev */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.alloc_rev); /* size 0xe8 */
	. = ALIGN(0x10); /* align for .text.lock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.lock_bin); /* size 0x96 */
	. = . + 0x32; /* padding after .text.lock_bin */
	. = ALIGN(0x10); /* align for .text.unbin */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.unbin); /* size 0x52 */
	. = . + 0x4a; /* padding after .text.unbin */
	. = ALIGN(0x10); /* align for .text.unlock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.unlock_bin); /* size 0x59 */
	. = . + 0x1b; /* padding after .text.unlock_bin */
	. = ALIGN(0x10); /* align for .text.__malloc0 */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.__malloc0); /* size 0xaf */
	. = . + 0x79; /* padding after .text.__malloc0 */
	. = ALIGN(0x10); /* align for .text.realloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.realloc); /* size 0x49c */
	. = ALIGN(0x10); /* align for .text.free */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.text.free); /* size 0x6b2 */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.__init_malloc); /* size 0x11 */
	. = . + 0x3; /* padding after .text.__init_malloc */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.popcorn_malloc); /* size 0x837 */
	. = . + 0x265; /* padding after .text.popcorn_malloc */
	. = ALIGN(0x10); /* align for .text.lock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.lock_bin); /* size 0xb3 */
	. = . + 0x21; /* padding after .text.lock_bin */
	. = ALIGN(0x10); /* align for .text.unbin */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.unbin); /* size 0x59 */
	. = . + 0x47; /* padding after .text.unbin */
	. = ALIGN(0x10); /* align for .text.unlock_bin */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.unlock_bin); /* size 0x6a */
	. = . + 0x16; /* padding after .text.unlock_bin */
	. = ALIGN(0x10); /* align for .text.__popcorn_malloc0 */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.__popcorn_malloc0); /* size 0xaf */
	. = . + 0x79; /* padding after .text.__popcorn_malloc0 */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.popcorn_malloc_cur); /* size 0x16 */
	. = . + 0x12; /* padding after .text.popcorn_malloc_cur */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.popcorn_realloc); /* size 0x23e */
	. = . + 0x32; /* padding after .text.popcorn_realloc */
	. = ALIGN(0x10); /* align for .text.popcorn_free */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.popcorn_free); /* size 0x50e */
	. = . + 0x27a; /* padding after .text.popcorn_free */
	. = ALIGN(0x10); /* align for .text.alloc_fwd */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.alloc_fwd); /* size 0xe0 */
	. = . + 0x4; /* padding after .text.alloc_fwd */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.popcorn_realloc_cur); /* size 0x25 */
	. = . + 0xb; /* padding after .text.popcorn_realloc_cur */
	. = ALIGN(0x4); /* align for .text.__fpclassifyl */
	"/usr/local/popcorn/x86_64/lib/libc.a:__fpclassifyl.o"(.text.__fpclassifyl); /* size 0x4e */
	. = . + 0x2; /* padding after .text.__fpclassifyl */
	. = ALIGN(0x4); /* align for .text.__signbitl */
	"/usr/local/popcorn/x86_64/lib/libc.a:__signbitl.o"(.text.__signbitl); /* size 0xa */
	. = . + 0xa; /* padding after .text.__signbitl */
	. = ALIGN(0x4); /* align for .text.copysignl */
	"/usr/local/popcorn/x86_64/lib/libc.a:copysignl.o"(.text.copysignl); /* size 0x2a */
	. = . + 0x2; /* padding after .text.copysignl */
	. = ALIGN(0x4); /* align for .text.frexpl */
	"/usr/local/popcorn/x86_64/lib/libc.a:frexpl.o"(.text.frexpl); /* size 0x7f */
	. = . + 0x35; /* padding after .text.frexpl */
	. = ALIGN(0x4); /* align for .text.scalbnl */
	"/usr/local/popcorn/x86_64/lib/libc.a:scalbnl.o"(.text.scalbnl); /* size 0x99 */
	. = . + 0x3b; /* padding after .text.scalbnl */
	. = ALIGN(0x4); /* align for .text.fmodl */
	"/usr/local/popcorn/x86_64/lib/libc.a:fmodl.o"(.text.fmodl); /* size 0x14 */
	. = . + 0x210; /* padding after .text.fmodl */
	. = ALIGN(0x4); /* align for .text.__madvise */
	"/usr/local/popcorn/x86_64/lib/libc.a:madvise.o"(.text.__madvise); /* size 0x12 */
	. = . + 0xe; /* padding after .text.__madvise */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:mmap.o"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__mmap */
	"/usr/local/popcorn/x86_64/lib/libc.a:mmap.o"(.text.__mmap); /* size 0xb5 */
	. = . + 0x7; /* padding after .text.__mmap */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:mremap.o"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__mremap */
	"/usr/local/popcorn/x86_64/lib/libc.a:mremap.o"(.text.__mremap); /* size 0x117 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:munmap.o"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__munmap */
	"/usr/local/popcorn/x86_64/lib/libc.a:munmap.o"(.text.__munmap); /* size 0x2b */
	. = . + 0xd; /* padding after .text.__munmap */
	. = ALIGN(0x4); /* align for .text.mbrtowc */
	"/usr/local/popcorn/x86_64/lib/libc.a:mbrtowc.o"(.text.mbrtowc); /* size 0x129 */
	. = . + 0x1f; /* padding after .text.mbrtowc */
	. = ALIGN(0x4); /* align for .text.mbsinit */
	"/usr/local/popcorn/x86_64/lib/libc.a:mbsinit.o"(.text.mbsinit); /* size 0x14 */
	. = . + 0x8; /* padding after .text.mbsinit */
	. = ALIGN(0x4); /* align for .text.wctomb */
	"/usr/local/popcorn/x86_64/lib/libc.a:wctomb.o"(.text.wctomb); /* size 0x15 */
	. = . + 0x7; /* padding after .text.wctomb */
	. = ALIGN(0x4); /* align for .text.__fdopen */
	"/usr/local/popcorn/x86_64/lib/libc.a:__fdopen.o"(.text.__fdopen); /* size 0x179 */
	. = . + 0x27; /* padding after .text.__fdopen */
	. = ALIGN(0x4); /* align for .text.__fmodeflags */
	"/usr/local/popcorn/x86_64/lib/libc.a:__fmodeflags.o"(.text.__fmodeflags); /* size 0x89 */
	. = . + 0xb; /* padding after .text.__fmodeflags */
	. = ALIGN(0x4); /* align for .text.__lockfile */
	"/usr/local/popcorn/x86_64/lib/libc.a:__lockfile.o"(.text.__lockfile); /* size 0x73 */
	. = ALIGN(0x4); /* align for .text.__unlockfile */
	"/usr/local/popcorn/x86_64/lib/libc.a:__lockfile.o"(.text.__unlockfile); /* size 0x46 */
	. = . + 0x6; /* padding after .text.__unlockfile */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_close.o"(.text.dummy); /* size 0x3 */
	. = . + 0x1; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.__stdio_close */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_close.o"(.text.__stdio_close); /* size 0x1c */
	. = . + 0xc; /* padding after .text.__stdio_close */
	. = ALIGN(0x4); /* align for .text.__stdio_read */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_read.o"(.text.__stdio_read); /* size 0xaf */
	. = . + 0x35; /* padding after .text.__stdio_read */
	. = ALIGN(0x4); /* align for .text.__stdio_seek */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_seek.o"(.text.__stdio_seek); /* size 0x16 */
	. = ALIGN(0x4); /* align for .text.__stdio_write */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_write.o"(.text.__stdio_write); /* size 0x117 */
	. = . + 0x15; /* padding after .text.__stdio_write */
	. = ALIGN(0x4); /* align for .text.__stdout_write */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdout_write.o"(.text.__stdout_write); /* size 0x47 */
	. = . + 0x21; /* padding after .text.__stdout_write */
	. = ALIGN(0x4); /* align for .text.__uflow */
	"/usr/local/popcorn/x86_64/lib/libc.a:__uflow.o"(.text.__uflow); /* size 0x41 */
	. = . + 0xb; /* padding after .text.__uflow */
	. = ALIGN(0x4); /* align for .text.__fwritex */
	"/usr/local/popcorn/x86_64/lib/libc.a:fwrite.o"(.text.__fwritex); /* size 0xbb */
	. = . + 0x3d; /* padding after .text.__fwritex */
	. = ALIGN(0x4); /* align for .text.fwrite */
	"/usr/local/popcorn/x86_64/lib/libc.a:fwrite.o"(.text.fwrite); /* size 0x8a */
	. = . + 0x12; /* padding after .text.fwrite */
	. = ALIGN(0x4); /* align for .text.__ofl_add */
	"/usr/local/popcorn/x86_64/lib/libc.a:ofl_add.o"(.text.__ofl_add); /* size 0x29 */
	. = . + 0x17; /* padding after .text.__ofl_add */
	. = ALIGN(0x4); /* align for .text.vsnprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a:vsnprintf.o"(.text.vsnprintf); /* size 0xc1 */
	. = . + 0xf; /* padding after .text.vsnprintf */
	. = ALIGN(0x4); /* align for .text.sn_write */
	"/usr/local/popcorn/x86_64/lib/libc.a:vsnprintf.o"(.text.sn_write); /* size 0xb7 */
	. = . + 0x21; /* padding after .text.sn_write */
	. = ALIGN(0x10); /* align for .text.memchr */
	"/usr/local/popcorn/x86_64/lib/libc.a:memchr.o"(.text.memchr); /* size 0xb2 */
	. = ALIGN(0x4); /* align for .text.memcpy */
	"/usr/local/popcorn/x86_64/lib/libc.a:memcpy.o"(.text.memcpy); /* size 0x32 */
	. = . + 0x3ce; /* padding after .text.memcpy */
	. = ALIGN(0x10); /* align for .text.__set_thread_area */
	"/usr/local/popcorn/x86_64/lib/libc.a:__set_thread_area.o"(.text.__set_thread_area); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.__clock_gettime */
	"/usr/local/popcorn/x86_64/lib/libc.a:clock_gettime.o"(.text.__clock_gettime); /* size 0x56 */
	. = . + 0x1a; /* padding after .text.__clock_gettime */
	. = ALIGN(0x4); /* align for .text.popcorn_getnid */
	"/usr/local/popcorn/x86_64/lib/libc.a:platform.o"(.text.popcorn_getnid); /* size 0x2e */
	. = . + 0x6; /* padding after .text.popcorn_getnid */
	. = ALIGN(0x4); /* align for .text.popcorn_getthreadinfo */
	"/usr/local/popcorn/x86_64/lib/libc.a:platform.o"(.text.popcorn_getthreadinfo); /* size 0xf */
	. = . + 0xd; /* padding after .text.popcorn_getthreadinfo */
	. = ALIGN(0x4); /* align for .text.popcorn_getnodeinfo */
	"/usr/local/popcorn/x86_64/lib/libc.a:platform.o"(.text.popcorn_getnodeinfo); /* size 0x74 */
	. = . + 0x1c; /* padding after .text.popcorn_getnodeinfo */
	. = ALIGN(0x10); /* align for .text.__expand_heap */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.text.__expand_heap); /* size 0x151 */
	. = . + 0x63; /* padding after .text.__expand_heap */
	. = ALIGN(0x10); /* align for .text.__expand_heap_node */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.text.__expand_heap_node); /* size 0x1ff */
	. = . + 0x39; /* padding after .text.__expand_heap_node */
	. = ALIGN(0x10); /* align for .text.popcorn_get_arena */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.text.popcorn_get_arena); /* size 0xfe */
	. = . + 0x2e; /* padding after .text.popcorn_get_arena */
	. = ALIGN(0x4); /* align for .text.wcrtomb */
	"/usr/local/popcorn/x86_64/lib/libc.a:wcrtomb.o"(.text.wcrtomb); /* size 0xfd */
	. = . + 0xb; /* padding after .text.wcrtomb */
	. = ALIGN(0x4); /* align for .text.__toread */
	"/usr/local/popcorn/x86_64/lib/libc.a:__toread.o"(.text.__toread); /* size 0x6e */
	. = . + 0x16; /* padding after .text.__toread */
	. = ALIGN(0x4); /* align for .text.__toread_needs_stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a:__toread.o"(.text.__toread_needs_stdio_exit); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.__towrite */
	"/usr/local/popcorn/x86_64/lib/libc.a:__towrite.o"(.text.__towrite); /* size 0x40 */
	. = . + 0xc; /* padding after .text.__towrite */
	. = ALIGN(0x4); /* align for .text.__towrite_needs_stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a:__towrite.o"(.text.__towrite_needs_stdio_exit); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.__stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_exit.o"(.text.__stdio_exit); /* size 0x35 */
	. = . + 0x13; /* padding after .text.__stdio_exit */
	. = ALIGN(0x4); /* align for .text.close_file */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_exit.o"(.text.close_file); /* size 0x4b */
	. = . + 0x29; /* padding after .text.close_file */
	. = ALIGN(0x10); /* align for .text.node_available */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.node_available); /* size 0x49 */
	. = . + 0xf; /* padding after .text.node_available */
	. = ALIGN(0x10); /* align for .text.current_arch */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.current_arch); /* size 0x59 */
	. = . + 0x17; /* padding after .text.current_arch */
	. = ALIGN(0x10); /* align for .text.current_nid */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.current_nid); /* size 0xd */
	. = . + 0x7; /* padding after .text.current_nid */
	. = ALIGN(0x10); /* align for .text.__init_nodes_info */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.__init_nodes_info); /* size 0x2b */
	. = . + 0xd; /* padding after .text.__init_nodes_info */
	. = ALIGN(0x10); /* align for .text.__migrate_shim_internal */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.__migrate_shim_internal); /* size 0x682 */
	. = ALIGN(0x10); /* align for .text.get_thread_pointer */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.get_thread_pointer); /* size 0xa7 */
	. = ALIGN(0x10); /* align for .text.check_migrate */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.check_migrate); /* size 0x50 */
	. = . + 0x18; /* padding after .text.check_migrate */
	. = ALIGN(0x10); /* align for .text.do_migrate */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.do_migrate); /* size 0x3d */
	. = . + 0x13; /* padding after .text.do_migrate */
	. = ALIGN(0x10); /* align for .text.migrate */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.migrate); /* size 0x3d */
	. = . + 0x17; /* padding after .text.migrate */
	. = ALIGN(0x10); /* align for .text.migrate_schedule */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.migrate_schedule); /* size 0x50 */
	. = . + 0x18; /* padding after .text.migrate_schedule */
	. = ALIGN(0x10); /* align for .text.get_call_site */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.text.get_call_site); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.__migrate_fixup_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate_powerpc64.o"(.text.__migrate_fixup_powerpc64); /* size 0x0 */
	. = ALIGN(0x10); /* align for .text.__migrate_fixup_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate_aarch64.o"(.text.__migrate_fixup_aarch64); /* size 0x0 */
	. = . + 0x7c; /* padding after .text.__migrate_fixup_aarch64 */
	. = ALIGN(0x4); /* align for .text.__migrate_fixup_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate_x86_64.o"(.text.__migrate_fixup_x86_64); /* size 0x69 */
	. = ALIGN(0x10); /* align for .text.__migrate_fixup_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate_riscv64.o"(.text.__migrate_fixup_riscv64); /* size 0x0 */
	. = ALIGN(0x10); /* align for .text.set_default_node */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.text.set_default_node); /* size 0x13 */
	. = . + 0xd; /* padding after .text.set_default_node */
	. = ALIGN(0x10); /* align for .text.cleanup */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.text.cleanup); /* size 0xae */
	. = . + 0x16; /* padding after .text.cleanup */
	. = ALIGN(0x10); /* align for .text.region_compare */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.text.region_compare); /* size 0x68 */
	. = . + 0xc; /* padding after .text.region_compare */
	. = ALIGN(0x10); /* align for .text.read_mapping_schedule */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.text.read_mapping_schedule); /* size 0x27a */
	. = . + 0xa; /* padding after .text.read_mapping_schedule */
	. = ALIGN(0x10); /* align for .text.region_find */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.text.region_find); /* size 0x65 */
	. = . + 0xb; /* padding after .text.region_find */
	. = ALIGN(0x10); /* align for .text.get_node_mapping */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.text.get_node_mapping); /* size 0xaa */
	. = . + 0x1a; /* padding after .text.get_node_mapping */
	. = ALIGN(0x10); /* align for .text.__st_userspace_ctor */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.text.__st_userspace_ctor); /* size 0x435 */
	. = ALIGN(0x10); /* align for .text.__st_userspace_dtor */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.text.__st_userspace_dtor); /* size 0x9c */
	. = . + 0x28; /* padding after .text.__st_userspace_dtor */
	. = ALIGN(0x10); /* align for .text.get_stack_bounds */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.text.get_stack_bounds); /* size 0xc9 */
	. = . + 0x27; /* padding after .text.get_stack_bounds */
	. = ALIGN(0x10); /* align for .text.st_userspace_rewrite */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.text.st_userspace_rewrite); /* size 0x176 */
	. = . + 0xa; /* padding after .text.st_userspace_rewrite */
	. = ALIGN(0x10); /* align for .text.__st_ctor */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.text.__st_ctor); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.__st_dtor */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.text.__st_dtor); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.st_init */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.text.st_init); /* size 0x20c */
	. = ALIGN(0x10); /* align for .text.st_destroy */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.text.st_destroy); /* size 0x23 */
	. = . + 0x15; /* padding after .text.st_destroy */
	. = ALIGN(0x10); /* align for .text.st_rewrite_stack */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.text.st_rewrite_stack); /* size 0x76b */
	. = ALIGN(0x10); /* align for .text.rewrite_frame */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.text.rewrite_frame); /* size 0x45d */
	. = . + 0x3b; /* padding after .text.rewrite_frame */
	. = ALIGN(0x10); /* align for .text.st_rewrite_ondemand */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.text.st_rewrite_ondemand); /* size 0x26 */
	. = . + 0x6; /* padding after .text.st_rewrite_ondemand */
	. = ALIGN(0x10); /* align for .text.rewrite_val */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.text.rewrite_val); /* size 0x2b4 */
	. = . + 0x54; /* padding after .text.rewrite_val */
	. = ALIGN(0x10); /* align for .text.first_frame */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.first_frame); /* size 0x8 */
	. = . + 0x4; /* padding after .text.first_frame */
	. = ALIGN(0x10); /* align for .text.calculate_cfa */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.calculate_cfa); /* size 0x2d */
	. = . + 0xf; /* padding after .text.calculate_cfa */
	. = ALIGN(0x10); /* align for .text.bootstrap_first_frame */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.bootstrap_first_frame); /* size 0x2d */
	. = . + 0x7; /* padding after .text.bootstrap_first_frame */
	. = ALIGN(0x10); /* align for .text.bootstrap_first_frame_funcentry */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.bootstrap_first_frame_funcentry); /* size 0x4b */
	. = . + 0x19; /* padding after .text.bootstrap_first_frame_funcentry */
	. = ALIGN(0x10); /* align for .text.pop_frame */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.pop_frame); /* size 0x21b */
	. = . + 0x19; /* padding after .text.pop_frame */
	. = ALIGN(0x10); /* align for .text.pop_frame_funcentry */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.pop_frame_funcentry); /* size 0x14b */
	. = . + 0x41; /* padding after .text.pop_frame_funcentry */
	. = ALIGN(0x10); /* align for .text.get_register_save_loc */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.get_register_save_loc); /* size 0x63 */
	. = . + 0x21; /* padding after .text.get_register_save_loc */
	. = ALIGN(0x10); /* align for .text.clear_activation */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.text.clear_activation); /* size 0x48 */
	. = . + 0x4; /* padding after .text.clear_activation */
	. = ALIGN(0x10); /* align for .text.arch_name */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.arch_name); /* size 0x48 */
	. = . + 0x20; /* padding after .text.arch_name */
	. = ALIGN(0x10); /* align for .text.get_regops */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_regops); /* size 0x45 */
	. = . + 0x1f; /* padding after .text.get_regops */
	. = ALIGN(0x10); /* align for .text.get_properties */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_properties); /* size 0x45 */
	. = . + 0x1f; /* padding after .text.get_properties */
	. = ALIGN(0x10); /* align for .text.get_section */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_section); /* size 0xac */
	. = . + 0x10; /* padding after .text.get_section */
	. = ALIGN(0x10); /* align for .text.get_num_entries */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_num_entries); /* size 0x59 */
	. = . + 0x7; /* padding after .text.get_num_entries */
	. = ALIGN(0x10); /* align for .text.get_section_data */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_section_data); /* size 0x24 */
	. = . + 0x4; /* padding after .text.get_section_data */
	. = ALIGN(0x10); /* align for .text.get_site_by_addr */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_site_by_addr); /* size 0x8a */
	. = ALIGN(0x10); /* align for .text.get_site_by_id */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_site_by_id); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.get_unwind_offset_by_addr */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_unwind_offset_by_addr); /* size 0x8c */
	. = . + 0x8; /* padding after .text.get_unwind_offset_by_addr */
	. = ALIGN(0x10); /* align for .text.get_function_address */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.text.get_function_address); /* size 0x84 */
	. = . + 0x4; /* padding after .text.get_function_address */
	. = ALIGN(0x10); /* align for .text.align_sp_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.align_sp_aarch64); /* size 0xb */
	. = . + 0x1; /* padding after .text.align_sp_aarch64 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.is_callee_saved_aarch64); /* size 0x1e */
	. = . + 0xe; /* padding after .text.is_callee_saved_aarch64 */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.callee_reg_size_aarch64); /* size 0x42 */
	. = . + 0x1a; /* padding after .text.callee_reg_size_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_default_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_default_aarch64); /* size 0xf */
	. = ALIGN(0x10); /* align for .text.regset_init_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_init_aarch64); /* size 0x1f */
	. = . + 0xd; /* padding after .text.regset_init_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_free_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_free_aarch64); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.regset_clone_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_clone_aarch64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_clone_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyin_aarch64); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.regset_copyout_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyout_aarch64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_copyout_aarch64 */
	. = ALIGN(0x10); /* align for .text.pc_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.pc_aarch64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.pc_aarch64 */
	. = ALIGN(0x10); /* align for .text.sp_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.sp_aarch64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.sp_aarch64 */
	. = ALIGN(0x10); /* align for .text.fbp_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.fbp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.ra_reg_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_pc_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_pc_aarch64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_pc_aarch64 */
	. = ALIGN(0x10); /* align for .text.set_sp_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_sp_aarch64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.set_sp_aarch64 */
	. = ALIGN(0x10); /* align for .text.set_fbp_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_fbp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_ra_reg_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.setup_fbp_aarch64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_size_aarch64); /* size 0x39 */
	. = . + 0x1b; /* padding after .text.reg_size_aarch64 */
	. = ALIGN(0x10); /* align for .text.reg_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_aarch64); /* size 0x211 */
	. = . + 0x37; /* padding after .text.reg_aarch64 */
	. = ALIGN(0x10); /* align for .text.align_sp_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.align_sp_powerpc64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.is_callee_saved_powerpc64); /* size 0x19 */
	. = . + 0x1f; /* padding after .text.is_callee_saved_powerpc64 */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.callee_reg_size_powerpc64); /* size 0x3a */
	. = . + 0x22; /* padding after .text.callee_reg_size_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_default_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_default_powerpc64); /* size 0xf */
	. = ALIGN(0x10); /* align for .text.regset_init_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_init_powerpc64); /* size 0x1f */
	. = . + 0xd; /* padding after .text.regset_init_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_free_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_free_powerpc64); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.regset_clone_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_clone_powerpc64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_clone_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyin_powerpc64); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.regset_copyout_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyout_powerpc64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_copyout_powerpc64 */
	. = ALIGN(0x10); /* align for .text.pc_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.pc_powerpc64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.pc_powerpc64 */
	. = ALIGN(0x10); /* align for .text.sp_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.sp_powerpc64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.sp_powerpc64 */
	. = ALIGN(0x10); /* align for .text.fbp_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.fbp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.ra_reg_powerpc64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.ra_reg_powerpc64 */
	. = ALIGN(0x10); /* align for .text.set_pc_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_pc_powerpc64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.set_pc_powerpc64 */
	. = ALIGN(0x10); /* align for .text.set_sp_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_sp_powerpc64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_sp_powerpc64 */
	. = ALIGN(0x10); /* align for .text.set_fbp_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_fbp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_ra_reg_powerpc64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_ra_reg_powerpc64 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.setup_fbp_powerpc64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_size_powerpc64); /* size 0x42 */
	. = . + 0x1e; /* padding after .text.reg_size_powerpc64 */
	. = ALIGN(0x10); /* align for .text.reg_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_powerpc64); /* size 0x2c6 */
	. = . + 0x9a; /* padding after .text.reg_powerpc64 */
	. = ALIGN(0x10); /* align for .text.align_sp_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.align_sp_riscv64); /* size 0xb */
	. = . + 0x1; /* padding after .text.align_sp_riscv64 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.is_callee_saved_riscv64); /* size 0x1e */
	. = . + 0x12; /* padding after .text.is_callee_saved_riscv64 */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.callee_reg_size_riscv64); /* size 0x3e */
	. = . + 0x22; /* padding after .text.callee_reg_size_riscv64 */
	. = ALIGN(0x10); /* align for .text.regset_default_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_default_riscv64); /* size 0xf */
	. = ALIGN(0x10); /* align for .text.regset_init_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_init_riscv64); /* size 0x1f */
	. = . + 0xd; /* padding after .text.regset_init_riscv64 */
	. = ALIGN(0x10); /* align for .text.regset_free_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_free_riscv64); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.regset_clone_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_clone_riscv64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_clone_riscv64 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyin_riscv64); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.regset_copyout_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyout_riscv64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_copyout_riscv64 */
	. = ALIGN(0x10); /* align for .text.pc_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.pc_riscv64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.pc_riscv64 */
	. = ALIGN(0x10); /* align for .text.sp_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.sp_riscv64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.sp_riscv64 */
	. = ALIGN(0x10); /* align for .text.fbp_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.fbp_riscv64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.fbp_riscv64 */
	. = ALIGN(0x10); /* align for .text.ra_reg_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.ra_reg_riscv64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.ra_reg_riscv64 */
	. = ALIGN(0x10); /* align for .text.set_pc_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_pc_riscv64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.set_pc_riscv64 */
	. = ALIGN(0x10); /* align for .text.set_sp_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_sp_riscv64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_sp_riscv64 */
	. = ALIGN(0x10); /* align for .text.set_fbp_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_fbp_riscv64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_fbp_riscv64 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_ra_reg_riscv64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_ra_reg_riscv64 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.setup_fbp_riscv64); /* size 0x9 */
	. = . + 0x3; /* padding after .text.setup_fbp_riscv64 */
	. = ALIGN(0x10); /* align for .text.reg_size_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_size_riscv64); /* size 0x2c */
	. = . + 0x14; /* padding after .text.reg_size_riscv64 */
	. = ALIGN(0x10); /* align for .text.reg_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_riscv64); /* size 0x33 */
	. = . + 0xd; /* padding after .text.reg_riscv64 */
	. = ALIGN(0x10); /* align for .text.align_sp_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.align_sp_x86_64); /* size 0xf */
	. = . + 0x1; /* padding after .text.align_sp_x86_64 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.is_callee_saved_x86_64); /* size 0x18 */
	. = . + 0x10; /* padding after .text.is_callee_saved_x86_64 */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.text.callee_reg_size_x86_64); /* size 0x3b */
	. = . + 0x19; /* padding after .text.callee_reg_size_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_default_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_default_x86_64); /* size 0xf */
	. = ALIGN(0x10); /* align for .text.regset_init_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_init_x86_64); /* size 0x1f */
	. = . + 0xd; /* padding after .text.regset_init_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_free_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_free_x86_64); /* size 0x5 */
	. = ALIGN(0x10); /* align for .text.regset_clone_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_clone_x86_64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_clone_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyin_x86_64); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.regset_copyout_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.regset_copyout_x86_64); /* size 0x13 */
	. = . + 0x1; /* padding after .text.regset_copyout_x86_64 */
	. = ALIGN(0x10); /* align for .text.pc_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.pc_x86_64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.pc_x86_64 */
	. = ALIGN(0x10); /* align for .text.sp_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.sp_x86_64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.sp_x86_64 */
	. = ALIGN(0x10); /* align for .text.fbp_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.fbp_x86_64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.fbp_x86_64 */
	. = ALIGN(0x10); /* align for .text.ra_reg_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.ra_reg_x86_64); /* size 0x26 */
	. = . + 0x6; /* padding after .text.ra_reg_x86_64 */
	. = ALIGN(0x10); /* align for .text.set_pc_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_pc_x86_64); /* size 0x4 */
	. = . + 0x4; /* padding after .text.set_pc_x86_64 */
	. = ALIGN(0x10); /* align for .text.set_sp_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_sp_x86_64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_sp_x86_64 */
	. = ALIGN(0x10); /* align for .text.set_fbp_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_fbp_x86_64); /* size 0x5 */
	. = . + 0x3; /* padding after .text.set_fbp_x86_64 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.set_ra_reg_x86_64); /* size 0x26 */
	. = . + 0x6; /* padding after .text.set_ra_reg_x86_64 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.setup_fbp_x86_64); /* size 0x9 */
	. = . + 0x3; /* padding after .text.setup_fbp_x86_64 */
	. = ALIGN(0x10); /* align for .text.reg_size_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_size_x86_64); /* size 0x35 */
	. = . + 0x1f; /* padding after .text.reg_size_x86_64 */
	. = ALIGN(0x10); /* align for .text.reg_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.text.reg_x86_64); /* size 0x117 */
	. = . + 0x39; /* padding after .text.reg_x86_64 */
	. = ALIGN(0x10); /* align for .text.put_val */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.put_val); /* size 0x22f */
	. = . + 0x61; /* padding after .text.put_val */
	. = ALIGN(0x10); /* align for .text.get_dest_loc */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.get_dest_loc); /* size 0xa8 */
	. = . + 0x2c; /* padding after .text.get_dest_loc */
	. = ALIGN(0x10); /* align for .text.put_val_arch */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.put_val_arch); /* size 0x42f */
	. = . + 0x31; /* padding after .text.put_val_arch */
	. = ALIGN(0x10); /* align for .text.put_val_data */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.put_val_data); /* size 0xd7 */
	. = . + 0x3d; /* padding after .text.put_val_data */
	. = ALIGN(0x10); /* align for .text.points_to_stack */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.points_to_stack); /* size 0x123 */
	. = . + 0x4d; /* padding after .text.points_to_stack */
	. = ALIGN(0x10); /* align for .text.points_to_data */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.points_to_data); /* size 0x142 */
	. = . + 0x76; /* padding after .text.points_to_data */
	. = ALIGN(0x10); /* align for .text.set_return_address */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.set_return_address); /* size 0x1d */
	. = . + 0x7; /* padding after .text.set_return_address */
	. = ALIGN(0x10); /* align for .text.set_return_address_funcentry */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.set_return_address_funcentry); /* size 0x3d */
	. = . + 0xb; /* padding after .text.set_return_address_funcentry */
	. = ALIGN(0x10); /* align for .text.get_savedfbp_loc */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.text.get_savedfbp_loc); /* size 0x6f */
	. = . + 0x21; /* padding after .text.get_savedfbp_loc */
	. = ALIGN(0x10); /* align for .text.elf_begin */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.text.elf_begin); /* size 0xda5 */
	. = ALIGN(0x10); /* align for .text._elf_check_type */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.text._elf_check_type); /* size 0x260 */
	. = . + 0x6c; /* padding after .text._elf_check_type */
	. = ALIGN(0x10); /* align for .text.elf_memory */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.text.elf_memory); /* size 0x88 */
	. = . + 0x48; /* padding after .text.elf_memory */
	. = ALIGN(0x10); /* align for .text.gelf_getclass */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.text.gelf_getclass); /* size 0x1c */
	. = . + 0xc; /* padding after .text.gelf_getclass */
	. = ALIGN(0x10); /* align for .text.elf_end */
	"/usr/local/popcorn/x86_64/lib/libelf.a:end.o"(.text.elf_end); /* size 0x200 */
	. = ALIGN(0x10); /* align for .text.elf_getdata */
	"/usr/local/popcorn/x86_64/lib/libelf.a:getdata.o"(.text.elf_getdata); /* size 0x24a */
	. = . + 0xe; /* padding after .text.elf_getdata */
	. = ALIGN(0x10); /* align for .text.elf_getident */
	"/usr/local/popcorn/x86_64/lib/libelf.a:getident.o"(.text.elf_getident); /* size 0x6e */
	. = . + 0x26; /* padding after .text.elf_getident */
	. = ALIGN(0x10); /* align for .text.elf_nextscn */
	"/usr/local/popcorn/x86_64/lib/libelf.a:nextscn.o"(.text.elf_nextscn); /* size 0x7e */
	. = . + 0x56; /* padding after .text.elf_nextscn */
	. = ALIGN(0x10); /* align for .text.elf_strptr */
	"/usr/local/popcorn/x86_64/lib/libelf.a:strptr.o"(.text.elf_strptr); /* size 0x166 */
	. = . + 0x36; /* padding after .text.elf_strptr */
	. = ALIGN(0x10); /* align for .text.elf_version */
	"/usr/local/popcorn/x86_64/lib/libelf.a:version.o"(.text.elf_version); /* size 0x5e */
	. = . + 0x32; /* padding after .text.elf_version */
	. = ALIGN(0x10); /* align for .text._elf_getehdr */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.getehdr.o"(.text._elf_getehdr); /* size 0x5a */
	. = . + 0x3a; /* padding after .text._elf_getehdr */
	. = ALIGN(0x10); /* align for .text.elf32_getehdr */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.getehdr.o"(.text.elf32_getehdr); /* size 0x5b */
	. = . + 0x39; /* padding after .text.elf32_getehdr */
	. = ALIGN(0x10); /* align for .text.elf64_getehdr */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.getehdr.o"(.text.elf64_getehdr); /* size 0x5b */
	. = . + 0x39; /* padding after .text.elf64_getehdr */
	. = ALIGN(0x10); /* align for .text._elf32_xltsize */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text._elf32_xltsize); /* size 0x8a */
	. = . + 0x22; /* padding after .text._elf32_xltsize */
	. = ALIGN(0x10); /* align for .text.elf32_xlatetom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.elf32_xlatetom); /* size 0xfb */
	. = . + 0x35; /* padding after .text.elf32_xlatetom */
	. = ALIGN(0x10); /* align for .text.elf32_xlatetof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.elf32_xlatetof); /* size 0xfb */
	. = . + 0x35; /* padding after .text.elf32_xlatetof */
	. = ALIGN(0x10); /* align for .text.byte_copy */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.byte_copy); /* size 0x20 */
	. = . + 0xd0; /* padding after .text.byte_copy */
	. = ALIGN(0x10); /* align for .text.addr_32L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.addr_32L__tom); /* size 0xcf */
	. = ALIGN(0x10); /* align for .text.addr_32L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.addr_32L__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.dyn_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.dyn_32L11_tom); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.dyn_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.dyn_32L11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.ehdr_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.ehdr_32L11_tom); /* size 0xc1 */
	. = . + 0x1f; /* padding after .text.ehdr_32L11_tom */
	. = ALIGN(0x10); /* align for .text.ehdr_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.ehdr_32L11_tof); /* size 0x166 */
	. = . + 0x46; /* padding after .text.ehdr_32L11_tof */
	. = ALIGN(0x10); /* align for .text.half_32L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.half_32L__tom); /* size 0x139 */
	. = ALIGN(0x10); /* align for .text.half_32L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.half_32L__tof); /* size 0x159 */
	. = ALIGN(0x10); /* align for .text.off_32L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.off_32L__tom); /* size 0xcf */
	. = ALIGN(0x10); /* align for .text.off_32L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.off_32L__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.phdr_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.phdr_32L11_tom); /* size 0x6e */
	. = ALIGN(0x10); /* align for .text.phdr_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.phdr_32L11_tof); /* size 0x151 */
	. = ALIGN(0x10); /* align for .text.rela_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rela_32L11_tom); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.rela_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rela_32L11_tof); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.rel_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rel_32L11_tom); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.rel_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rel_32L11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.shdr_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.shdr_32L11_tom); /* size 0x95 */
	. = ALIGN(0x10); /* align for .text.shdr_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.shdr_32L11_tof); /* size 0x1c0 */
	. = ALIGN(0x10); /* align for .text.sword_32L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sword_32L__tom); /* size 0xcf */
	. = ALIGN(0x10); /* align for .text.sword_32L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sword_32L__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.sym_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sym_32L11_tom); /* size 0x61 */
	. = ALIGN(0x10); /* align for .text.sym_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sym_32L11_tof); /* size 0xc1 */
	. = ALIGN(0x10); /* align for .text.word_32L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.word_32L__tom); /* size 0xcf */
	. = ALIGN(0x10); /* align for .text.word_32L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.word_32L__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.addr_32M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.addr_32M__tom); /* size 0x11f */
	. = ALIGN(0x10); /* align for .text.addr_32M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.addr_32M__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.dyn_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.dyn_32M11_tom); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.dyn_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.dyn_32M11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.ehdr_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.ehdr_32M11_tom); /* size 0xf2 */
	. = . + 0x42; /* padding after .text.ehdr_32M11_tom */
	. = ALIGN(0x10); /* align for .text.ehdr_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.ehdr_32M11_tof); /* size 0x166 */
	. = . + 0x46; /* padding after .text.ehdr_32M11_tof */
	. = ALIGN(0x10); /* align for .text.half_32M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.half_32M__tom); /* size 0x185 */
	. = ALIGN(0x10); /* align for .text.half_32M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.half_32M__tof); /* size 0x195 */
	. = ALIGN(0x10); /* align for .text.off_32M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.off_32M__tom); /* size 0x11f */
	. = ALIGN(0x10); /* align for .text.off_32M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.off_32M__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.phdr_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.phdr_32M11_tom); /* size 0x7d */
	. = . + 0x7; /* padding after .text.phdr_32M11_tom */
	. = ALIGN(0x10); /* align for .text.phdr_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.phdr_32M11_tof); /* size 0x151 */
	. = ALIGN(0x10); /* align for .text.rela_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rela_32M11_tom); /* size 0x62 */
	. = . + 0x2; /* padding after .text.rela_32M11_tom */
	. = ALIGN(0x10); /* align for .text.rela_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rela_32M11_tof); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.rel_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rel_32M11_tom); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.rel_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.rel_32M11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.shdr_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.shdr_32M11_tom); /* size 0xa8 */
	. = . + 0x10; /* padding after .text.shdr_32M11_tom */
	. = ALIGN(0x10); /* align for .text.shdr_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.shdr_32M11_tof); /* size 0x1b0 */
	. = ALIGN(0x10); /* align for .text.sword_32M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sword_32M__tom); /* size 0x11f */
	. = ALIGN(0x10); /* align for .text.sword_32M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sword_32M__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.sym_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sym_32M11_tom); /* size 0x6b */
	. = ALIGN(0x10); /* align for .text.sym_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.sym_32M11_tof); /* size 0xc1 */
	. = ALIGN(0x10); /* align for .text.word_32M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.word_32M__tom); /* size 0x11f */
	. = ALIGN(0x10); /* align for .text.word_32M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.text.word_32M__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text._elf_scn_type */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.text._elf_scn_type); /* size 0x61 */
	. = . + 0x43; /* padding after .text._elf_scn_type */
	. = ALIGN(0x10); /* align for .text._elf_xlatetom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.text._elf_xlatetom); /* size 0x43 */
	. = . + 0xd; /* padding after .text._elf_xlatetom */
	. = ALIGN(0x10); /* align for .text._elf_cook */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.text._elf_cook); /* size 0x769 */
	. = . + 0x6b; /* padding after .text._elf_cook */
	. = ALIGN(0x10); /* align for .text._elf_item */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.text._elf_item); /* size 0x1a1 */
	. = . + 0x1f; /* padding after .text._elf_item */
	. = ALIGN(0x10); /* align for .text._elf_read */
	"/usr/local/popcorn/x86_64/lib/libelf.a:input.o"(.text._elf_read); /* size 0xfe */
	. = . + 0x22; /* padding after .text._elf_read */
	. = ALIGN(0x10); /* align for .text._elf_mmap */
	"/usr/local/popcorn/x86_64/lib/libelf.a:input.o"(.text._elf_mmap); /* size 0x44 */
	. = . + 0x1c; /* padding after .text._elf_mmap */
	. = ALIGN(0x10); /* align for .text.elf_getphdrnum */
	"/usr/local/popcorn/x86_64/lib/libelf.a:x.elfext.o"(.text.elf_getphdrnum); /* size 0x5b */
	. = . + 0x15; /* padding after .text.elf_getphdrnum */
	. = ALIGN(0x10); /* align for .text.elf_getshdrnum */
	"/usr/local/popcorn/x86_64/lib/libelf.a:x.elfext.o"(.text.elf_getshdrnum); /* size 0x71 */
	. = . + 0xb; /* padding after .text.elf_getshdrnum */
	. = ALIGN(0x10); /* align for .text.elf_getshdrstrndx */
	"/usr/local/popcorn/x86_64/lib/libelf.a:x.elfext.o"(.text.elf_getshdrstrndx); /* size 0xd1 */
	. = . + 0x3b; /* padding after .text.elf_getshdrstrndx */
	. = ALIGN(0x10); /* align for .text.elf_getphnum */
	"/usr/local/popcorn/x86_64/lib/libelf.a:x.elfext.o"(.text.elf_getphnum); /* size 0x5b */
	. = . + 0x15; /* padding after .text.elf_getphnum */
	. = ALIGN(0x10); /* align for .text.elf_getshnum */
	"/usr/local/popcorn/x86_64/lib/libelf.a:x.elfext.o"(.text.elf_getshnum); /* size 0x71 */
	. = . + 0xb; /* padding after .text.elf_getshnum */
	. = ALIGN(0x10); /* align for .text.elf_getshstrndx */
	"/usr/local/popcorn/x86_64/lib/libelf.a:x.elfext.o"(.text.elf_getshstrndx); /* size 0xd1 */
	. = . + 0x3f; /* padding after .text.elf_getshstrndx */
	. = ALIGN(0x10); /* align for .text.elfx_update_shstrndx */
	"/usr/local/popcorn/x86_64/lib/libelf.a:x.elfext.o"(.text.elfx_update_shstrndx); /* size 0xbc */
	. = . + 0x3c; /* padding after .text.elfx_update_shstrndx */
	. = ALIGN(0x10); /* align for .text._elf64_xltsize */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text._elf64_xltsize); /* size 0x8a */
	. = . + 0x22; /* padding after .text._elf64_xltsize */
	. = ALIGN(0x10); /* align for .text.elf64_xlatetom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.elf64_xlatetom); /* size 0xfb */
	. = . + 0x35; /* padding after .text.elf64_xlatetom */
	. = ALIGN(0x10); /* align for .text.elf64_xlatetof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.elf64_xlatetof); /* size 0xfb */
	. = . + 0x35; /* padding after .text.elf64_xlatetof */
	. = ALIGN(0x10); /* align for .text.gelf_xlatetom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.gelf_xlatetom); /* size 0x154 */
	. = . + 0x50; /* padding after .text.gelf_xlatetom */
	. = ALIGN(0x10); /* align for .text.gelf_xlatetof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.gelf_xlatetof); /* size 0x154 */
	. = . + 0x50; /* padding after .text.gelf_xlatetof */
	. = ALIGN(0x10); /* align for .text.byte_copy */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.byte_copy); /* size 0x20 */
	. = . + 0xd0; /* padding after .text.byte_copy */
	. = ALIGN(0x10); /* align for .text.addr_64L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.addr_64L__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.addr_64L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.addr_64L__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.dyn_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.dyn_64L11_tom); /* size 0x59 */
	. = . + 0xb; /* padding after .text.dyn_64L11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.dyn_64L11_tof); /* size 0x59 */
	. = . + 0xb; /* padding after .text.dyn_64L11_tof */
	. = ALIGN(0x10); /* align for .text.ehdr_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.ehdr_64L11_tom); /* size 0x121 */
	. = ALIGN(0x10); /* align for .text.ehdr_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.ehdr_64L11_tof); /* size 0x1b5 */
	. = ALIGN(0x10); /* align for .text.half_64L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.half_64L__tom); /* size 0x139 */
	. = ALIGN(0x10); /* align for .text.half_64L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.half_64L__tof); /* size 0x159 */
	. = ALIGN(0x10); /* align for .text.off_64L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.off_64L__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.off_64L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.off_64L__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.phdr_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.phdr_64L11_tom); /* size 0xed */
	. = ALIGN(0x10); /* align for .text.phdr_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.phdr_64L11_tof); /* size 0x131 */
	. = ALIGN(0x10); /* align for .text.rela_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rela_64L11_tom); /* size 0x8a */
	. = ALIGN(0x10); /* align for .text.rela_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rela_64L11_tof); /* size 0x8a */
	. = ALIGN(0x10); /* align for .text.rel_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rel_64L11_tom); /* size 0x59 */
	. = . + 0xb; /* padding after .text.rel_64L11_tom */
	. = ALIGN(0x10); /* align for .text.rel_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rel_64L11_tof); /* size 0x59 */
	. = . + 0xb; /* padding after .text.rel_64L11_tof */
	. = ALIGN(0x10); /* align for .text.shdr_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.shdr_64L11_tom); /* size 0xe2 */
	. = ALIGN(0x10); /* align for .text.shdr_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.shdr_64L11_tof); /* size 0x16a */
	. = ALIGN(0x10); /* align for .text.sword_64L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sword_64L__tom); /* size 0xcf */
	. = ALIGN(0x10); /* align for .text.sword_64L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sword_64L__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.sym_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sym_64L11_tom); /* size 0x9d */
	. = ALIGN(0x10); /* align for .text.sym_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sym_64L11_tof); /* size 0xbd */
	. = . + 0x3; /* padding after .text.sym_64L11_tof */
	. = ALIGN(0x10); /* align for .text.word_64L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.word_64L__tom); /* size 0xcf */
	. = ALIGN(0x10); /* align for .text.word_64L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.word_64L__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.sxword_64L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sxword_64L__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.sxword_64L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sxword_64L__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.xword_64L__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.xword_64L__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.xword_64L__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.xword_64L__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.addr_64M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.addr_64M__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.addr_64M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.addr_64M__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.dyn_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.dyn_64M11_tom); /* size 0x59 */
	. = . + 0xb; /* padding after .text.dyn_64M11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.dyn_64M11_tof); /* size 0x59 */
	. = . + 0xb; /* padding after .text.dyn_64M11_tof */
	. = ALIGN(0x10); /* align for .text.ehdr_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.ehdr_64M11_tom); /* size 0x145 */
	. = ALIGN(0x10); /* align for .text.ehdr_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.ehdr_64M11_tof); /* size 0x1b5 */
	. = ALIGN(0x10); /* align for .text.half_64M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.half_64M__tom); /* size 0x185 */
	. = ALIGN(0x10); /* align for .text.half_64M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.half_64M__tof); /* size 0x195 */
	. = ALIGN(0x10); /* align for .text.off_64M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.off_64M__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.off_64M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.off_64M__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.phdr_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.phdr_64M11_tom); /* size 0xf1 */
	. = ALIGN(0x10); /* align for .text.phdr_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.phdr_64M11_tof); /* size 0x131 */
	. = ALIGN(0x10); /* align for .text.rela_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rela_64M11_tom); /* size 0x8a */
	. = ALIGN(0x10); /* align for .text.rela_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rela_64M11_tof); /* size 0x8a */
	. = ALIGN(0x10); /* align for .text.rel_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rel_64M11_tom); /* size 0x59 */
	. = . + 0xb; /* padding after .text.rel_64M11_tom */
	. = ALIGN(0x10); /* align for .text.rel_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.rel_64M11_tof); /* size 0x59 */
	. = . + 0xb; /* padding after .text.rel_64M11_tof */
	. = ALIGN(0x10); /* align for .text.shdr_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.shdr_64M11_tom); /* size 0xea */
	. = ALIGN(0x10); /* align for .text.shdr_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.shdr_64M11_tof); /* size 0x16a */
	. = ALIGN(0x10); /* align for .text.sword_64M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sword_64M__tom); /* size 0x11f */
	. = ALIGN(0x10); /* align for .text.sword_64M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sword_64M__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.sym_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sym_64M11_tom); /* size 0xb3 */
	. = ALIGN(0x10); /* align for .text.sym_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sym_64M11_tof); /* size 0xed */
	. = ALIGN(0x10); /* align for .text.word_64M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.word_64M__tom); /* size 0x11f */
	. = ALIGN(0x10); /* align for .text.word_64M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.word_64M__tof); /* size 0xa9 */
	. = ALIGN(0x10); /* align for .text.sxword_64M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sxword_64M__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.sxword_64M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.sxword_64M__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.xword_64M__tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.xword_64M__tom); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.xword_64M__tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.text.xword_64M__tof); /* size 0x5a */
	. = ALIGN(0x10); /* align for .text.gelf_getshdr */
	"/usr/local/popcorn/x86_64/lib/libelf.a:gelfshdr.o"(.text.gelf_getshdr); /* size 0x106 */
	. = ALIGN(0x10); /* align for .text.gelf_update_shdr */
	"/usr/local/popcorn/x86_64/lib/libelf.a:gelfshdr.o"(.text.gelf_update_shdr); /* size 0xea */
	. = . + 0x2; /* padding after .text.gelf_update_shdr */
	. = ALIGN(0x10); /* align for .text._elf_load_u64L */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_load_u64L); /* size 0x4 */
	. = . + 0x4; /* padding after .text._elf_load_u64L */
	. = ALIGN(0x10); /* align for .text._elf_load_u64M */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_load_u64M); /* size 0x7 */
	. = . + 0x5; /* padding after .text._elf_load_u64M */
	. = ALIGN(0x10); /* align for .text._elf_load_i64L */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_load_i64L); /* size 0x4 */
	. = . + 0x4; /* padding after .text._elf_load_i64L */
	. = ALIGN(0x10); /* align for .text._elf_load_i64M */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_load_i64M); /* size 0x7 */
	. = . + 0x5; /* padding after .text._elf_load_i64M */
	. = ALIGN(0x10); /* align for .text._elf_store_u64L */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_store_u64L); /* size 0x4 */
	. = . + 0x4; /* padding after .text._elf_store_u64L */
	. = ALIGN(0x10); /* align for .text._elf_store_u64M */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_store_u64M); /* size 0x7 */
	. = . + 0x5; /* padding after .text._elf_store_u64M */
	. = ALIGN(0x10); /* align for .text._elf_store_i64L */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_store_i64L); /* size 0x4 */
	. = . + 0x4; /* padding after .text._elf_store_i64L */
	. = ALIGN(0x10); /* align for .text._elf_store_i64M */
	"/usr/local/popcorn/x86_64/lib/libelf.a:swap64.o"(.text._elf_store_i64M); /* size 0x7 */
	. = . + 0x5; /* padding after .text._elf_store_i64M */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tof.o"(.text._elf_verdef_32L11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tof.o"(.text.xlt_verdef); /* size 0x27f */
	. = . + 0x1; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tof.o"(.text._elf_verdef_32M11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tof.o"(.text._elf_verneed_32L11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tof.o"(.text.xlt_verneed); /* size 0x330 */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tof.o"(.text._elf_verneed_32M11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tom.o"(.text._elf_verdef_32L11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tom.o"(.text.xlt_verdef); /* size 0x303 */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tom.o"(.text._elf_verdef_32M11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tom.o"(.text._elf_verneed_32L11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tom.o"(.text.xlt_verneed); /* size 0x2b3 */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_32_tom.o"(.text._elf_verneed_32M11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tof.o"(.text._elf_verdef_64L11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tof.o"(.text.xlt_verdef); /* size 0x27f */
	. = . + 0x1; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tof.o"(.text._elf_verdef_64M11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64L11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tof.o"(.text._elf_verneed_64L11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tof.o"(.text.xlt_verneed); /* size 0x330 */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64M11_tof */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tof.o"(.text._elf_verneed_64M11_tof); /* size 0xa */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tom.o"(.text._elf_verdef_64L11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tom.o"(.text.xlt_verdef); /* size 0x303 */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tom.o"(.text._elf_verdef_64M11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64L11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tom.o"(.text._elf_verneed_64L11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tom.o"(.text.xlt_verneed); /* size 0x2b3 */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64M11_tom */
	"/usr/local/popcorn/x86_64/lib/libelf.a:verdef_64_tom.o"(.text._elf_verneed_64M11_tom); /* size 0xa */
	. = ALIGN(0x10); /* align for .text.elf_getscn */
	"/usr/local/popcorn/x86_64/lib/libelf.a:getscn.o"(.text.elf_getscn); /* size 0x6e */
	. = . + 0x22; /* padding after .text.elf_getscn */
	. = ALIGN(0x10); /* align for .text._elf_update_shnum */
	"/usr/local/popcorn/x86_64/lib/libelf.a:newscn.o"(.text._elf_update_shnum); /* size 0x74 */
	. = . + 0x8; /* padding after .text._elf_update_shnum */
	. = ALIGN(0x10); /* align for .text._elf_first_scn */
	"/usr/local/popcorn/x86_64/lib/libelf.a:newscn.o"(.text._elf_first_scn); /* size 0xed */
	. = . + 0x27; /* padding after .text._elf_first_scn */
	. = ALIGN(0x10); /* align for .text.elf_newscn */
	"/usr/local/popcorn/x86_64/lib/libelf.a:newscn.o"(.text.elf_newscn); /* size 0x223 */
	. = . + 0x61; /* padding after .text.elf_newscn */
	. = ALIGN(0x10); /* align for .text.elf32_fsize */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.fsize.o"(.text.elf32_fsize); /* size 0x3d */
	. = . + 0xf; /* padding after .text.elf32_fsize */
	. = ALIGN(0x10); /* align for .text.elf64_fsize */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.fsize.o"(.text.elf64_fsize); /* size 0x3d */
	. = . + 0xf; /* padding after .text.elf64_fsize */
	. = ALIGN(0x10); /* align for .text.gelf_fsize */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.fsize.o"(.text.gelf_fsize); /* size 0x75 */
	. = . + 0x1b; /* padding after .text.gelf_fsize */
	. = ALIGN(0x10); /* align for .text.gelf_msize */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.fsize.o"(.text.gelf_msize); /* size 0x7b */
	. = . + 0x2d; /* padding after .text.gelf_msize */
	. = ALIGN(0x4); /* align for .text.__crash_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libc.a:arch_crash.o"(.text.__crash_aarch64); /* size 0x3 */
	. = . + 0x2d; /* padding after .text.__crash_aarch64 */
	. = ALIGN(0x4); /* align for .text.__crash_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libc.a:arch_crash.o"(.text.__crash_powerpc64); /* size 0x3 */
	. = . + 0x5; /* padding after .text.__crash_powerpc64 */
	. = ALIGN(0x4); /* align for .text.__crash_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libc.a:arch_crash.o"(.text.__crash_riscv64); /* size 0x3 */
	. = . + 0x5; /* padding after .text.__crash_riscv64 */
	. = ALIGN(0x4); /* align for .text.__crash_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libc.a:arch_crash.o"(.text.__crash_x86_64); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.__crash */
	"/usr/local/popcorn/x86_64/lib/libc.a:arch_crash.o"(.text.__crash); /* size 0x18 */
	. = . + 0x18; /* padding after .text.__crash */
	. = ALIGN(0x4); /* align for .text.getenv */
	"/usr/local/popcorn/x86_64/lib/libc.a:getenv.o"(.text.getenv); /* size 0x80 */
	. = . + 0xc; /* padding after .text.getenv */
	. = ALIGN(0x4); /* align for .text.__assert_fail */
	"/usr/local/popcorn/x86_64/lib/libc.a:assert.o"(.text.__assert_fail); /* size 0x2c */
	. = . + 0x10; /* padding after .text.__assert_fail */
	. = ALIGN(0x4); /* align for .text.open */
	"/usr/local/popcorn/x86_64/lib/libc.a:open.o"(.text.open); /* size 0x113 */
	. = ALIGN(0x10); /* align for .text.calloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:calloc.o"(.text.calloc); /* size 0x34 */
	. = . + 0x14; /* padding after .text.calloc */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc */
	"/usr/local/popcorn/x86_64/lib/libc.a:calloc.o"(.text.popcorn_calloc); /* size 0x38 */
	. = . + 0x14; /* padding after .text.popcorn_calloc */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a:calloc.o"(.text.popcorn_calloc_cur); /* size 0x52 */
	. = . + 0x12; /* padding after .text.popcorn_calloc_cur */
	. = ALIGN(0x4); /* align for .text.getrlimit */
	"/usr/local/popcorn/x86_64/lib/libc.a:getrlimit.o"(.text.getrlimit); /* size 0xb0 */
	. = . + 0x34; /* padding after .text.getrlimit */
	. = ALIGN(0x4); /* align for .text.fprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a:fprintf.o"(.text.fprintf); /* size 0x81 */
	. = ALIGN(0x4); /* align for .text.__fseeko_unlocked */
	"/usr/local/popcorn/x86_64/lib/libc.a:fseek.o"(.text.__fseeko_unlocked); /* size 0x7c */
	. = . + 0x3c; /* padding after .text.__fseeko_unlocked */
	. = ALIGN(0x4); /* align for .text.__fseeko */
	"/usr/local/popcorn/x86_64/lib/libc.a:fseek.o"(.text.__fseeko); /* size 0x60 */
	. = . + 0x1c; /* padding after .text.__fseeko */
	. = ALIGN(0x4); /* align for .text.fseek */
	"/usr/local/popcorn/x86_64/lib/libc.a:fseek.o"(.text.fseek); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.getc */
	"/usr/local/popcorn/x86_64/lib/libc.a:getc.o"(.text.getc); /* size 0x76 */
	. = . + 0x2a; /* padding after .text.getc */
	. = ALIGN(0x4); /* align for .text.getline */
	"/usr/local/popcorn/x86_64/lib/libc.a:getline.o"(.text.getline); /* size 0xd */
	. = ALIGN(0x4); /* align for .text.perror */
	"/usr/local/popcorn/x86_64/lib/libc.a:perror.o"(.text.perror); /* size 0xb9 */
	. = . + 0x17; /* padding after .text.perror */
	. = ALIGN(0x4); /* align for .text.snprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a:snprintf.o"(.text.snprintf); /* size 0x7d */
	. = ALIGN(0x4); /* align for .text.sscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a:sscanf.o"(.text.sscanf); /* size 0x81 */
	. = ALIGN(0x4); /* align for .text.vsscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a:vsscanf.o"(.text.vsscanf); /* size 0x63 */
	. = . + 0x15; /* padding after .text.vsscanf */
	. = ALIGN(0x4); /* align for .text.do_read */
	"/usr/local/popcorn/x86_64/lib/libc.a:vsscanf.o"(.text.do_read); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.bsearch */
	"/usr/local/popcorn/x86_64/lib/libc.a:bsearch.o"(.text.bsearch); /* size 0x6e */
	. = . + 0x16; /* padding after .text.bsearch */
	. = ALIGN(0x4); /* align for .text.qsort */
	"/usr/local/popcorn/x86_64/lib/libc.a:qsort.o"(.text.qsort); /* size 0x37e */
	. = ALIGN(0x4); /* align for .text.sift */
	"/usr/local/popcorn/x86_64/lib/libc.a:qsort.o"(.text.sift); /* size 0x112 */
	. = ALIGN(0x4); /* align for .text.trinkle */
	"/usr/local/popcorn/x86_64/lib/libc.a:qsort.o"(.text.trinkle); /* size 0x1f6 */
	. = ALIGN(0x4); /* align for .text.cycle */
	"/usr/local/popcorn/x86_64/lib/libc.a:qsort.o"(.text.cycle); /* size 0x8a */
	. = . + 0x32; /* padding after .text.cycle */
	. = ALIGN(0x4); /* align for .text.strtoull */
	"/usr/local/popcorn/x86_64/lib/libc.a:strtol.o"(.text.strtoull); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.strtox */
	"/usr/local/popcorn/x86_64/lib/libc.a:strtol.o"(.text.strtox); /* size 0xa3 */
	. = . + 0xd; /* padding after .text.strtox */
	. = ALIGN(0x4); /* align for .text.strtoll */
	"/usr/local/popcorn/x86_64/lib/libc.a:strtol.o"(.text.strtoll); /* size 0xf */
	. = ALIGN(0x4); /* align for .text.strtoul */
	"/usr/local/popcorn/x86_64/lib/libc.a:strtol.o"(.text.strtoul); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.strtol */
	"/usr/local/popcorn/x86_64/lib/libc.a:strtol.o"(.text.strtol); /* size 0xf */
	. = ALIGN(0x4); /* align for .text.strtoimax */
	"/usr/local/popcorn/x86_64/lib/libc.a:strtol.o"(.text.strtoimax); /* size 0xf */
	. = ALIGN(0x4); /* align for .text.strtoumax */
	"/usr/local/popcorn/x86_64/lib/libc.a:strtol.o"(.text.strtoumax); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.strcmp */
	"/usr/local/popcorn/x86_64/lib/libc.a:strcmp.o"(.text.strcmp); /* size 0x35 */
	. = ALIGN(0x10); /* align for .text.strncmp */
	"/usr/local/popcorn/x86_64/lib/libc.a:strncmp.o"(.text.strncmp); /* size 0x3f */
	. = . + 0x9; /* padding after .text.strncmp */
	. = ALIGN(0x4); /* align for .text.sccp */
	"/usr/local/popcorn/x86_64/lib/libc.a:__syscall_cp.o"(.text.sccp); /* size 0x13 */
	. = ALIGN(0x4); /* align for .text.__syscall_cp */
	"/usr/local/popcorn/x86_64/lib/libc.a:__syscall_cp.o"(.text.__syscall_cp); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getdetachstate */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getdetachstate); /* size 0x8 */
	. = . + 0x8; /* padding after .text.pthread_attr_getdetachstate */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getguardsize */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getguardsize); /* size 0xa */
	. = . + 0x6; /* padding after .text.pthread_attr_getguardsize */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getinheritsched */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getinheritsched); /* size 0x8 */
	. = . + 0x8; /* padding after .text.pthread_attr_getinheritsched */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getschedparam */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getschedparam); /* size 0x8 */
	. = . + 0x8; /* padding after .text.pthread_attr_getschedparam */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getschedpolicy */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getschedpolicy); /* size 0x8 */
	. = . + 0x8; /* padding after .text.pthread_attr_getschedpolicy */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getscope */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getscope); /* size 0x9 */
	. = . + 0x3; /* padding after .text.pthread_attr_getscope */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getstack */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getstack); /* size 0x1e */
	. = . + 0xe; /* padding after .text.pthread_attr_getstack */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getstacksize */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_attr_getstacksize); /* size 0x9 */
	. = . + 0x7; /* padding after .text.pthread_attr_getstacksize */
	. = ALIGN(0x4); /* align for .text.pthread_barrierattr_getpshared */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_barrierattr_getpshared); /* size 0xd */
	. = . + 0xb; /* padding after .text.pthread_barrierattr_getpshared */
	. = ALIGN(0x4); /* align for .text.pthread_condattr_getclock */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_condattr_getclock); /* size 0xc */
	. = . + 0x8; /* padding after .text.pthread_condattr_getclock */
	. = ALIGN(0x4); /* align for .text.pthread_condattr_getpshared */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_condattr_getpshared); /* size 0xa */
	. = . + 0xa; /* padding after .text.pthread_condattr_getpshared */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getprotocol */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_mutexattr_getprotocol); /* size 0x9 */
	. = . + 0x3; /* padding after .text.pthread_mutexattr_getprotocol */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getpshared */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_mutexattr_getpshared); /* size 0xd */
	. = . + 0x7; /* padding after .text.pthread_mutexattr_getpshared */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getrobust */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_mutexattr_getrobust); /* size 0xd */
	. = . + 0x7; /* padding after .text.pthread_mutexattr_getrobust */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_gettype */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_mutexattr_gettype); /* size 0xa */
	. = . + 0xa; /* padding after .text.pthread_mutexattr_gettype */
	. = ALIGN(0x4); /* align for .text.pthread_rwlockattr_getpshared */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_attr_get.o"(.text.pthread_rwlockattr_getpshared); /* size 0x7 */
	. = . + 0x9; /* padding after .text.pthread_rwlockattr_getpshared */
	. = ALIGN(0x4); /* align for .text.pthread_getattr_np */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_getattr_np.o"(.text.pthread_getattr_np); /* size 0x10d */
	. = . + 0x3; /* padding after .text.pthread_getattr_np */
	. = ALIGN(0x4); /* align for .text.pthread_set_migrate_args */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_migrate.o"(.text.pthread_set_migrate_args); /* size 0x11 */
	. = ALIGN(0x4); /* align for .text.pthread_get_migrate_args */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_migrate.o"(.text.pthread_get_migrate_args); /* size 0x11 */
	. = ALIGN(0x4); /* align for .text.__pthread_self_internal */
	"/usr/local/popcorn/x86_64/lib/libc.a:pthread_self.o"(.text.__pthread_self_internal); /* size 0xa */
	. = . + 0x2; /* padding after .text.__pthread_self_internal */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:close.o"(.text.dummy); /* size 0x3 */
	. = . + 0x1; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.close */
	"/usr/local/popcorn/x86_64/lib/libc.a:close.o"(.text.close); /* size 0x3b */
	. = . + 0x9; /* padding after .text.close */
	. = ALIGN(0x4); /* align for .text.getpid */
	"/usr/local/popcorn/x86_64/lib/libc.a:getpid.o"(.text.getpid); /* size 0x8 */
	. = . + 0x4; /* padding after .text.getpid */
	. = ALIGN(0x4); /* align for .text.lseek */
	"/usr/local/popcorn/x86_64/lib/libc.a:lseek.o"(.text.lseek); /* size 0x15 */
	. = ALIGN(0x4); /* align for .text.read */
	"/usr/local/popcorn/x86_64/lib/libc.a:read.o"(.text.read); /* size 0x28 */
	. = . + 0x8; /* padding after .text.read */
	. = ALIGN(0x4); /* align for .text.abort */
	"/usr/local/popcorn/x86_64/lib/libc.a:abort.o"(.text.abort); /* size 0x27 */
	. = . + 0xd; /* padding after .text.abort */
	. = ALIGN(0x10); /* align for .text.__syscall */
	"/usr/local/popcorn/x86_64/lib/libc.a:syscall.o"(.text.__syscall); /* size 0x1a */
	. = . + 0xe; /* padding after .text.__syscall */
	. = ALIGN(0x4); /* align for .text.__block_all_sigs */
	"/usr/local/popcorn/x86_64/lib/libc.a:block.o"(.text.__block_all_sigs); /* size 0x18 */
	. = . + 0x8; /* padding after .text.__block_all_sigs */
	. = ALIGN(0x4); /* align for .text.__block_app_sigs */
	"/usr/local/popcorn/x86_64/lib/libc.a:block.o"(.text.__block_app_sigs); /* size 0x18 */
	. = . + 0x8; /* padding after .text.__block_app_sigs */
	. = ALIGN(0x4); /* align for .text.__restore_sigs */
	"/usr/local/popcorn/x86_64/lib/libc.a:block.o"(.text.__restore_sigs); /* size 0x18 */
	. = . + 0x4; /* padding after .text.__restore_sigs */
	. = ALIGN(0x4); /* align for .text.raise */
	"/usr/local/popcorn/x86_64/lib/libc.a:raise.o"(.text.raise); /* size 0x4d */
	. = . + 0xb; /* padding after .text.raise */
	. = ALIGN(0x4); /* align for .text.__string_read */
	"/usr/local/popcorn/x86_64/lib/libc.a:__string_read.o"(.text.__string_read); /* size 0x79 */
	. = . + 0xb; /* padding after .text.__string_read */
	. = ALIGN(0x4); /* align for .text.fputc */
	"/usr/local/popcorn/x86_64/lib/libc.a:fputc.o"(.text.fputc); /* size 0x9c */
	. = . + 0x38; /* padding after .text.fputc */
	. = ALIGN(0x4); /* align for .text.getdelim */
	"/usr/local/popcorn/x86_64/lib/libc.a:getdelim.o"(.text.getdelim); /* size 0x273 */
	. = . + 0x1; /* padding after .text.getdelim */
	. = ALIGN(0x4); /* align for .text.__overflow */
	"/usr/local/popcorn/x86_64/lib/libc.a:__overflow.o"(.text.__overflow); /* size 0x84 */
	. = . + 0x20; /* padding after .text.__overflow */
	. = ALIGN(0x10); /* align for .text.alloc_rev */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.text.alloc_rev); /* size 0xd7 */
	. = ALIGN(0x4); /* align for .text.memmove */
	"/usr/local/popcorn/x86_64/lib/libc.a:memmove.o"(.text.memmove); /* size 0x25 */
	. = . + 0x3; /* padding before .text.alloc_fwd */
	. = . + 0xc8; /* padding after .text.alloc_fwd */
	. = . + 0x138; /* padding after .text.array_copy */
	. = . + 0x138; /* padding after .text.array_copy */
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
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_____s_Benc */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_____s_Benc); /* size 0x1b */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_1__Class____ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_1__Class____); /* size 0x2e */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_2__Size_____ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_2__Size_____); /* size 0x26 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_3__Size_____ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_3__Size_____); /* size 0x2c */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_4__Iteration */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_4__Iteration); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_5__Time_in_s */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_5__Time_in_s); /* size 0x27 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_6__Mop_s_tot */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_6__Mop_s_tot); /* size 0x27 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_7__Operation */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_7__Operation); /* size 0x19 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_8__Verificat */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_8__Verificat); /* size 0x2d */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_9__Verificat */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_9__Verificat); /* size 0x2d */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_10__Verificat */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_10__Verificat); /* size 0x2d */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_11__Version__ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_11__Version__); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_12__Compile_d */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_12__Compile_d); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_13___Compile_ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_13___Compile_); /* size 0x14 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_14_____CC____ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_14_____CC____); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_15_____CLINK_ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_15_____CLINK_); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_16_____C_LIB_ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_16_____C_LIB_); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_17_____C_INC_ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_17_____C_INC_); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_18_____CFLAGS */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_18_____CFLAGS); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_19_____CLINKF */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_19_____CLINKF); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_20___________ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_20___________); /* size 0x29 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_21__Please_se */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_21__Please_se); /* size 0x27 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_22__Center_fo */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_22__Center_fo); /* size 0x22 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_23__cmp_aces_ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_23__cmp_aces_); /* size 0x15 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_24__http___ac */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_24__http___ac); /* size 0x18 */
	. = ALIGN(0x4); /* align for .rodata.c_print_results__str_25___________ */
	"c_print_results_x86_64.o"(.rodata.c_print_results__str_25___________); /* size 0x28 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_____s_Benc */
	"print_results_x86_64.o"(.rodata.print_results__str_____s_Benc); /* size 0x1c */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_1__Class____ */
	"print_results_x86_64.o"(.rodata.print_results__str_1__Class____); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_2__15_0lf_ */
	"print_results_x86_64.o"(.rodata.print_results__str_2__15_0lf_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_3__Size_____ */
	"print_results_x86_64.o"(.rodata.print_results__str_3__Size_____); /* size 0x22 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_4__Size_____ */
	"print_results_x86_64.o"(.rodata.print_results__str_4__Size_____); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_5__Size_____ */
	"print_results_x86_64.o"(.rodata.print_results__str_5__Size_____); /* size 0x2a */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_6__Iteration */
	"print_results_x86_64.o"(.rodata.print_results__str_6__Iteration); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_7__Time_in_s */
	"print_results_x86_64.o"(.rodata.print_results__str_7__Time_in_s); /* size 0x28 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_8__Mop_s_tot */
	"print_results_x86_64.o"(.rodata.print_results__str_8__Mop_s_tot); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_9__Operation */
	"print_results_x86_64.o"(.rodata.print_results__str_9__Operation); /* size 0x19 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_10__Verificat */
	"print_results_x86_64.o"(.rodata.print_results__str_10__Verificat); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_11_SUCCESSFUL */
	"print_results_x86_64.o"(.rodata.print_results__str_11_SUCCESSFUL); /* size 0xb */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_12_UNSUCCESSF */
	"print_results_x86_64.o"(.rodata.print_results__str_12_UNSUCCESSF); /* size 0xd */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_13__Version__ */
	"print_results_x86_64.o"(.rodata.print_results__str_13__Version__); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_14__Compile_d */
	"print_results_x86_64.o"(.rodata.print_results__str_14__Compile_d); /* size 0x25 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_15___Compile_ */
	"print_results_x86_64.o"(.rodata.print_results__str_15___Compile_); /* size 0x2a */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_16_____CLINK_ */
	"print_results_x86_64.o"(.rodata.print_results__str_16_____CLINK_); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_17_____C_LIB_ */
	"print_results_x86_64.o"(.rodata.print_results__str_17_____C_LIB_); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_18_____C_INC_ */
	"print_results_x86_64.o"(.rodata.print_results__str_18_____C_INC_); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_19_____CFLAGS */
	"print_results_x86_64.o"(.rodata.print_results__str_19_____CFLAGS); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_20_____CLINKF */
	"print_results_x86_64.o"(.rodata.print_results__str_20_____CLINKF); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_21_____RAND__ */
	"print_results_x86_64.o"(.rodata.print_results__str_21_____RAND__); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.print_results__str_22___________ */
	"print_results_x86_64.o"(.rodata.print_results__str_22___________); /* size 0xc3 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"sp_x86_64.o"(.rodata.cst8); /* size 0x38 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_timer_flag */
	"sp_x86_64.o"(.rodata.sp__str_timer_flag); /* size 0xb */
	. = ALIGN(0x4); /* align for .rodata.sp__str_1_r_ */
	"sp_x86_64.o"(.rodata.sp__str_1_r_); /* size 0x2 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_2_total_ */
	"sp_x86_64.o"(.rodata.sp__str_2_total_); /* size 0x6 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_3_rhsx_ */
	"sp_x86_64.o"(.rodata.sp__str_3_rhsx_); /* size 0x5 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_4_rhsy_ */
	"sp_x86_64.o"(.rodata.sp__str_4_rhsy_); /* size 0x5 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_5_rhsz_ */
	"sp_x86_64.o"(.rodata.sp__str_5_rhsz_); /* size 0x5 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_6_rhs_ */
	"sp_x86_64.o"(.rodata.sp__str_6_rhs_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_7_xsolve_ */
	"sp_x86_64.o"(.rodata.sp__str_7_xsolve_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_8_ysolve_ */
	"sp_x86_64.o"(.rodata.sp__str_8_ysolve_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_9_zsolve_ */
	"sp_x86_64.o"(.rodata.sp__str_9_zsolve_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_10_redist1_ */
	"sp_x86_64.o"(.rodata.sp__str_10_redist1_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_11_redist2_ */
	"sp_x86_64.o"(.rodata.sp__str_11_redist2_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_12_tzetar_ */
	"sp_x86_64.o"(.rodata.sp__str_12_tzetar_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_13_ninvr_ */
	"sp_x86_64.o"(.rodata.sp__str_13_ninvr_); /* size 0x6 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_14_pinvr_ */
	"sp_x86_64.o"(.rodata.sp__str_14_pinvr_); /* size 0x6 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_15_txinvr_ */
	"sp_x86_64.o"(.rodata.sp__str_15_txinvr_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_16_add_ */
	"sp_x86_64.o"(.rodata.sp__str_16_add_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_17____NAS_Par */
	"sp_x86_64.o"(.rodata.sp__str_17____NAS_Par); /* size 0x3b */
	. = ALIGN(0x4); /* align for .rodata.sp__str_18_inputsp_da */
	"sp_x86_64.o"(.rodata.sp__str_18_inputsp_da); /* size 0xd */
	. = ALIGN(0x4); /* align for .rodata.sp__str_19__Reading_f */
	"sp_x86_64.o"(.rodata.sp__str_19__Reading_f); /* size 0x27 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_20__d_ */
	"sp_x86_64.o"(.rodata.sp__str_20__d_); /* size 0x3 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_21__lf_ */
	"sp_x86_64.o"(.rodata.sp__str_21__lf_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_22__d_d_d_ */
	"sp_x86_64.o"(.rodata.sp__str_22__d_d_d_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_23__No_input_ */
	"sp_x86_64.o"(.rodata.sp__str_23__No_input_); /* size 0x36 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_24__Size___4d */
	"sp_x86_64.o"(.rodata.sp__str_24__Size___4d); /* size 0x14 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_25__Iteration */
	"sp_x86_64.o"(.rodata.sp__str_25__Iteration); /* size 0x20 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_26___ */
	"sp_x86_64.o"(.rodata.sp__str_26___); /* size 0x2 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_27___d___d___ */
	"sp_x86_64.o"(.rodata.sp__str_27___d___d___); /* size 0xd */
	. = ALIGN(0x4); /* align for .rodata.sp__str_28__Problem_s */
	"sp_x86_64.o"(.rodata.sp__str_28__Problem_s); /* size 0x30 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_29_goin_to_mi */
	"sp_x86_64.o"(.rodata.sp__str_29_goin_to_mi); /* size 0x17 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_30__Time_step */
	"sp_x86_64.o"(.rodata.sp__str_30__Time_step); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_31___migrated */
	"sp_x86_64.o"(.rodata.sp__str_31___migrated); /* size 0x18 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_32_SP_ */
	"sp_x86_64.o"(.rodata.sp__str_32_SP_); /* size 0x3 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_33___________ */
	"sp_x86_64.o"(.rodata.sp__str_33___________); /* size 0x19 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_34_3_3_1_ */
	"sp_x86_64.o"(.rodata.sp__str_34_3_3_1_); /* size 0x6 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_35_03_Nov_201 */
	"sp_x86_64.o"(.rodata.sp__str_35_03_Nov_201); /* size 0xc */
	. = ALIGN(0x4); /* align for .rodata.sp__str_36_gcc_ */
	"sp_x86_64.o"(.rodata.sp__str_36_gcc_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_37___CC__ */
	"sp_x86_64.o"(.rodata.sp__str_37___CC__); /* size 0x6 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_38__lm_ */
	"sp_x86_64.o"(.rodata.sp__str_38__lm_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_39__I___commo */
	"sp_x86_64.o"(.rodata.sp__str_39__I___commo); /* size 0xc */
	. = ALIGN(0x4); /* align for .rodata.sp__str_40__g__Wall__ */
	"sp_x86_64.o"(.rodata.sp__str_40__g__Wall__); /* size 0x1d */
	. = ALIGN(0x4); /* align for .rodata.sp__str_41__O3__mcmod */
	"sp_x86_64.o"(.rodata.sp__str_41__O3__mcmod); /* size 0x14 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_42__none__ */
	"sp_x86_64.o"(.rodata.sp__str_42__none__); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_43___SECTION_ */
	"sp_x86_64.o"(.rodata.sp__str_43___SECTION_); /* size 0x19 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_44_____8s__9_ */
	"sp_x86_64.o"(.rodata.sp__str_44_____8s__9_); /* size 0x19 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_45__________8 */
	"sp_x86_64.o"(.rodata.sp__str_45__________8); /* size 0x1e */
	. = ALIGN(0x4); /* align for .rodata.sp__str_46_sub_rhs_ */
	"sp_x86_64.o"(.rodata.sp__str_46_sub_rhs_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_47_rest_rhs_ */
	"sp_x86_64.o"(.rodata.sp__str_47_rest_rhs_); /* size 0x9 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_48_sub_zsol_ */
	"sp_x86_64.o"(.rodata.sp__str_48_sub_zsol_); /* size 0x9 */
	. = ALIGN(0x4); /* align for .rodata.sp__str_49_redist_ */
	"sp_x86_64.o"(.rodata.sp__str_49_redist_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.verify__str__Verificat */
	"verify_x86_64.o"(.rodata.verify__str__Verificat); /* size 0x2c */
	. = ALIGN(0x4); /* align for .rodata.verify__str_1__accuracy_ */
	"verify_x86_64.o"(.rodata.verify__str_1__accuracy_); /* size 0x29 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_2__DT_does_n */
	"verify_x86_64.o"(.rodata.verify__str_2__DT_does_n); /* size 0x32 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_3__Unknown_c */
	"verify_x86_64.o"(.rodata.verify__str_3__Unknown_c); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_4__Compariso */
	"verify_x86_64.o"(.rodata.verify__str_4__Compariso); /* size 0x26 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_5__RMS_norms */
	"verify_x86_64.o"(.rodata.verify__str_5__RMS_norms); /* size 0x18 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_6___________ */
	"verify_x86_64.o"(.rodata.verify__str_6___________); /* size 0x16 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_7___________ */
	"verify_x86_64.o"(.rodata.verify__str_7___________); /* size 0x24 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_8__FAILURE__ */
	"verify_x86_64.o"(.rodata.verify__str_8__FAILURE__); /* size 0x24 */
	. = ALIGN(0x4); /* align for .rodata.verify__str_9__Compariso */
	"verify_x86_64.o"(.rodata.verify__str_9__Compariso); /* size 0x2c */
	. = ALIGN(0x4); /* align for .rodata.verify__str_10__RMS_norms */
	"verify_x86_64.o"(.rodata.verify__str_10__RMS_norms); /* size 0x1e */
	. = ALIGN(0x4); /* align for .rodata.verify__str_11__No_refere */
	"verify_x86_64.o"(.rodata.verify__str_11__No_refere); /* size 0x1f */
	. = ALIGN(0x4); /* align for .rodata.verify__str_12__No_verifi */
	"verify_x86_64.o"(.rodata.verify__str_12__No_verifi); /* size 0x1c */
	. = ALIGN(0x4); /* align for .rodata.verify__str_13__Verificat */
	"verify_x86_64.o"(.rodata.verify__str_13__Verificat); /* size 0x1a */
	. = ALIGN(0x4); /* align for .rodata.verify__str_14__Verificat */
	"verify_x86_64.o"(.rodata.verify__str_14__Verificat); /* size 0x16 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"wtime_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.src_env___libc_start_main__str_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.rodata.src_env___libc_start_main__str_); /* size 0x1 */
	. = ALIGN(0x10); /* align for .rodata.src_env___libc_start_main___const___init_libc_pfd_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.rodata.src_env___libc_start_main___const___init_libc_pfd_); /* size 0x18 */
	. = ALIGN(0x4); /* align for .rodata.src_env___libc_start_main__str_1__dev_null_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.rodata.src_env___libc_start_main__str_1__dev_null_); /* size 0xa */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"/usr/local/popcorn/x86_64/lib/libc.a:pow.o"(.rodata.cst8); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .rodata.src_math_pow_c_bp */
	"/usr/local/popcorn/x86_64/lib/libc.a:pow.o"(.rodata.src_math_pow_c_bp); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.src_math_pow_c_dp_l */
	"/usr/local/popcorn/x86_64/lib/libc.a:pow.o"(.rodata.src_math_pow_c_dp_l); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.src_math_pow_c_dp_h */
	"/usr/local/popcorn/x86_64/lib/libc.a:pow.o"(.rodata.src_math_pow_c_dp_h); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_fopen__str_rwa_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:fopen.o"(.rodata.src_stdio_fopen__str_rwa_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .rodata.stdout */
	"/usr/local/popcorn/x86_64/lib/libc.a:stdout.o"(.rodata.stdout); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.cst16); /* size 0x10 */
	. = . + 0xa0; /* padding after .rodata.cst16 */
	. = ALIGN(0x8); /* align for .rodata.printf_core */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.printf_core); /* size 0x170 */
	. = ALIGN(0x8); /* align for .rodata.pop_arg */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.pop_arg); /* size 0x90 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str______0X0x_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str______0X0x_); /* size 0xa */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str_1__null__ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str_1__null__); /* size 0x7 */
	. = ALIGN(0x10); /* align for .rodata.src_stdio_vfprintf_c_states */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf_c_states); /* size 0x1d0 */
	. = ALIGN(0x10); /* align for .rodata.src_stdio_vfprintf_c_xdigits */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf_c_xdigits); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str_3__0X_0X_0X_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str_3__0X_0X_0X_); /* size 0x13 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str_4_inf_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str_4_inf_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str_5_INF_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str_5_INF_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str_6_nan_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str_6_nan_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str_7_NAN_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str_7_NAN_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio_vfprintf__str_8___ */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.src_stdio_vfprintf__str_8___); /* size 0x2 */
	. = ALIGN(0x8); /* align for .rodata.vfscanf */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfscanf.o"(.rodata.vfscanf); /* size 0x338 */
	. = ALIGN(0x10); /* align for .rodata.src_errno_strerror_c_errid */
	"/usr/local/popcorn/x86_64/lib/libc.a:strerror.o"(.rodata.src_errno_strerror_c_errid); /* size 0x60 */
	. = ALIGN(0x10); /* align for .rodata.src_errno_strerror_c_errmsg */
	"/usr/local/popcorn/x86_64/lib/libc.a:strerror.o"(.rodata.src_errno_strerror_c_errmsg); /* size 0x70c */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.rodata.cst16); /* size 0x60 */
	. = ALIGN(0x10); /* align for .rodata.src_internal_floatscan_c_decfloat_p10s */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.rodata.src_internal_floatscan_c_decfloat_p10s); /* size 0x20 */
	. = ALIGN(0x4); /* align for .rodata.src_internal_floatscan_switch_table___floatscan_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.rodata.src_internal_floatscan_switch_table___floatscan_); /* size 0xc */
	. = ALIGN(0x4); /* align for .rodata.src_internal_floatscan_switch_table___floatscan_2_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.rodata.src_internal_floatscan_switch_table___floatscan_2_); /* size 0xc */
	. = ALIGN(0x10); /* align for .rodata.src_internal_intscan_c_table */
	"/usr/local/popcorn/x86_64/lib/libc.a:intscan.o"(.rodata.src_internal_intscan_c_table); /* size 0x101 */
	. = ALIGN(0x4); /* align for .rodata.src_internal_intscan__str__________ */
	"/usr/local/popcorn/x86_64/lib/libc.a:intscan.o"(.rodata.src_internal_intscan__str__________); /* size 0x9 */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_malloc_c_bin_tab */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.rodata.src_malloc_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_popcorn_malloc_c_bin_tab */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.rodata.src_malloc_popcorn_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libc.a:scalbnl.o"(.rodata.cst16); /* size 0x20 */
	. = ALIGN(0x4); /* align for .rodata.src_stdio___fdopen__str_rwa_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:__fdopen.o"(.rodata.src_stdio___fdopen__str_rwa_); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.__fsmu8 */
	"/usr/local/popcorn/x86_64/lib/libc.a:internal.o"(.rodata.__fsmu8); /* size 0xcc */
	. = ALIGN(0x8); /* align for .rodata.__migrate_shim_internal */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.__migrate_shim_internal); /* size 0x20 */
	. = ALIGN(0x8); /* align for .rodata.get_thread_pointer */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.get_thread_pointer); /* size 0x20 */
	. = ALIGN(0x4); /* align for .rodata.src_migrate__str_Destinatio */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.src_migrate__str_Destinatio); /* size 0x29 */
	. = ALIGN(0x4); /* align for .rodata.src_migrate__str_1_0_____Unsu */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.src_migrate__str_1_0_____Unsu); /* size 0x21 */
	. = ALIGN(0x4); /* align for .rodata.src_migrate__str_2_src_migrat */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.src_migrate__str_2_src_migrat); /* size 0xe */
	. = ALIGN(0x4); /* align for .rodata.src_migrate___func_____migrate_shim_internal___migrate_ */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.src_migrate___func_____migrate_shim_internal___migrate_); /* size 0x18 */
	. = ALIGN(0x4); /* align for .rodata.src_migrate__str_3_Could_not_ */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.src_migrate__str_3_Could_not_); /* size 0x1a */
	. = ALIGN(0x4); /* align for .rodata.src_migrate__str_4_Could_not_ */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.src_migrate__str_4_Could_not_); /* size 0x1a */
	. = ALIGN(0x4); /* align for .rodata.src_migrate___func___get_thread_pointer_get_thread */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.rodata.src_migrate___func___get_thread_pointer_get_thread); /* size 0x13 */
	. = ALIGN(0x4); /* align for .rodata.src_mapping__str_POPCORN_TH */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.rodata.src_mapping__str_POPCORN_TH); /* size 0x18 */
	. = ALIGN(0x4); /* align for .rodata.src_mapping__str_1_thread_sch */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.rodata.src_mapping__str_1_thread_sch); /* size 0x14 */
	. = ALIGN(0x4); /* align for .rodata.src_mapping__str_2_r_ */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.rodata.src_mapping__str_2_r_); /* size 0x2 */
	. = ALIGN(0x4); /* align for .rodata.src_mapping__str_3__lu__lu_ */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.rodata.src_mapping__str_3__lu__lu_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.src_mapping__str_4__d_ */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.rodata.src_mapping__str_4__d_); /* size 0x3 */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_ST_AARCH64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_ST_AARCH64); /* size 0xf */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_1__s_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_1__s_aarch64); /* size 0xb */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_2_ST_POWERPC */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_2_ST_POWERPC); /* size 0x11 */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_3__s_powerpc */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_3__s_powerpc); /* size 0xd */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_4_ST_RISCV64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_4_ST_RISCV64); /* size 0xf */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_5__s_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_5__s_riscv64); /* size 0xb */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_6_ST_X86_64_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_6_ST_X86_64_); /* size 0xe */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_7__s_x86_64_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_7__s_x86_64_); /* size 0xa */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_8__proc__d_m */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_8__proc__d_m); /* size 0xe */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_9_r_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_9_r_); /* size 0x2 */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_10__lx__lx__s */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_10__lx__lx__s); /* size 0x19 */
	. = ALIGN(0x4); /* align for .rodata.src_userspace__str_11__stack__ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace__str_11__stack__); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.src_userspace_switch_table_st_userspace_rewrite_12_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.rodata.src_userspace_switch_table_st_userspace_rewrite_12_); /* size 0x20 */
	. = ALIGN(0x4); /* align for .rodata.src_init__str__stack_tra */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.rodata.src_init__str__stack_tra); /* size 0x1f */
	. = ALIGN(0x4); /* align for .rodata.src_init__str_1__stack_tra */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.rodata.src_init__str_1__stack_tra); /* size 0x18 */
	. = ALIGN(0x4); /* align for .rodata.src_init__str_2__stack_tra */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.rodata.src_init__str_2__stack_tra); /* size 0x14 */
	. = ALIGN(0x4); /* align for .rodata.src_init__str_3__stack_tra */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.rodata.src_init__str_3__stack_tra); /* size 0x16 */
	. = ALIGN(0x4); /* align for .rodata.src_init__str_4__stack_tra */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.rodata.src_init__str_4__stack_tra); /* size 0x16 */
	. = ALIGN(0x4); /* align for .rodata.src_init__str_5__stack_tra */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:init.o"(.rodata.src_init__str_5__stack_tra); /* size 0x1c */
	. = ALIGN(0x4); /* align for .rodata.src_rewrite__str__src_rewri */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.rodata.src_rewrite__str__src_rewri); /* size 0x42 */
	. = ALIGN(0x4); /* align for .rodata.src_rewrite__str_1__src_rewri */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.rodata.src_rewrite__str_1__src_rewri); /* size 0x68 */
	. = ALIGN(0x4); /* align for .rodata.src_rewrite__str_2__src_rewri */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.rodata.src_rewrite__str_2__src_rewri); /* size 0x54 */
	. = ALIGN(0x4); /* align for .rodata.src_rewrite__str_3__src_rewri */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.rodata.src_rewrite__str_3__src_rewri); /* size 0x61 */
	. = ALIGN(0x4); /* align for .rodata.src_util__str_aarch64_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.rodata.src_util__str_aarch64_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.src_util__str_1_powerpc64_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.rodata.src_util__str_1_powerpc64_); /* size 0xa */
	. = ALIGN(0x4); /* align for .rodata.src_util__str_2_riscv64_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.rodata.src_util__str_2_riscv64_); /* size 0x8 */
	. = ALIGN(0x4); /* align for .rodata.src_util__str_3_x86_64_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.rodata.src_util__str_3_x86_64_); /* size 0x7 */
	. = ALIGN(0x4); /* align for .rodata.src_util__str_4_unknown_un */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:util.o"(.rodata.src_util__str_4_unknown_un); /* size 0x21 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_aarch64_properties_c_callee_saved_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_aarch64_properties_c_callee_saved_aarch64); /* size 0x28 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_aarch64_properties_c_callee_saved_size_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_aarch64_properties_c_callee_saved_size_aarch64); /* size 0x28 */
	. = ALIGN(0x8); /* align for .rodata.properties_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.properties_aarch64); /* size 0x38 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_aarch64_properties__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_aarch64_properties__str__src_arch_); /* size 0x51 */
	. = ALIGN(0x8); /* align for .rodata.reg_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.reg_aarch64); /* size 0x300 */
	. = ALIGN(0x8); /* align for .rodata.regs_aarch64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.regs_aarch64); /* size 0xa8 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_aarch64_regs__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_aarch64_regs__str__src_arch_); /* size 0x4c */
	. = ALIGN(0x4); /* align for .rodata.src_arch_aarch64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_aarch64_regs__str_1__src_arch_); /* size 0x4c */
	. = ALIGN(0x8); /* align for .rodata.is_callee_saved_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.is_callee_saved_powerpc64); /* size 0x208 */
	. = ALIGN(0x8); /* align for .rodata.callee_reg_size_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.callee_reg_size_powerpc64); /* size 0x210 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_powerpc64_properties_c_callee_saved_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_powerpc64_properties_c_callee_saved_powerpc64); /* size 0x4e */
	. = ALIGN(0x10); /* align for .rodata.src_arch_powerpc64_properties_c_callee_saved_size_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_powerpc64_properties_c_callee_saved_size_powerpc64); /* size 0x4c */
	. = ALIGN(0x8); /* align for .rodata.properties_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.properties_powerpc64); /* size 0x38 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_powerpc64_properties__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_powerpc64_properties__str__src_arch_); /* size 0x56 */
	. = ALIGN(0x8); /* align for .rodata.reg_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.reg_powerpc64); /* size 0x218 */
	. = ALIGN(0x8); /* align for .rodata.regs_powerpc64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.regs_powerpc64); /* size 0xa8 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_powerpc64_regs__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_powerpc64_regs__str__src_arch_); /* size 0x50 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_powerpc64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_powerpc64_regs__str_1__src_arch_); /* size 0x50 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_riscv64_properties_c_callee_saved_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_riscv64_properties_c_callee_saved_riscv64); /* size 0x30 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_riscv64_properties_c_callee_saved_size_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_riscv64_properties_c_callee_saved_size_riscv64); /* size 0x30 */
	. = ALIGN(0x8); /* align for .rodata.properties_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.properties_riscv64); /* size 0x38 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_riscv64_properties__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_riscv64_properties__str__src_arch_); /* size 0x52 */
	. = ALIGN(0x8); /* align for .rodata.regs_riscv64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.regs_riscv64); /* size 0xa8 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_riscv64_regs__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_riscv64_regs__str__src_arch_); /* size 0x4c */
	. = ALIGN(0x4); /* align for .rodata.src_arch_riscv64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_riscv64_regs__str_1__src_arch_); /* size 0x4c */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_properties_c_callee_saved_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_x86_64_properties_c_callee_saved_x86_64); /* size 0xe */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_properties_c_callee_saved_size_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_x86_64_properties_c_callee_saved_size_x86_64); /* size 0xe */
	. = ALIGN(0x8); /* align for .rodata.properties_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.properties_x86_64); /* size 0x38 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_properties__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:properties.o"(.rodata.src_arch_x86_64_properties__str__src_arch_); /* size 0x4f */
	. = ALIGN(0x8); /* align for .rodata.reg_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.reg_x86_64); /* size 0x108 */
	. = ALIGN(0x8); /* align for .rodata.regs_x86_64 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.regs_x86_64); /* size 0xa8 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_regs__str__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_x86_64_regs__str__src_arch_); /* size 0x4b */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_x86_64_regs__str_1__src_arch_); /* size 0x4b */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_regs__str_2__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_x86_64_regs__str_2__src_arch_); /* size 0x4a */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_regs__str_3__src_arch_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_x86_64_regs__str_3__src_arch_); /* size 0x4a */
	. = ALIGN(0x8); /* align for .rodata.put_val_arch */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.put_val_arch); /* size 0xb0 */
	. = ALIGN(0x8); /* align for .rodata.points_to_stack */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.points_to_stack); /* size 0x28 */
	. = ALIGN(0x4); /* align for .rodata.src_data__str__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str__src_data_); /* size 0x50 */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_1__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_1__src_data_); /* size 0x3d */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_2__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_2__src_data_); /* size 0x30 */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_3__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_3__src_data_); /* size 0x49 */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_4__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_4__src_data_); /* size 0x3f */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_5__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_5__src_data_); /* size 0x3d */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_6__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_6__src_data_); /* size 0x3f */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_7__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_7__src_data_); /* size 0x37 */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_8__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_8__src_data_); /* size 0x37 */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_9__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_9__src_data_); /* size 0x3f */
	. = ALIGN(0x4); /* align for .rodata.src_data__str_10__src_data_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:data.o"(.rodata.src_data__str_10__src_data_); /* size 0x3f */
	. = ALIGN(0x8); /* align for .rodata.elf_begin */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.rodata.elf_begin); /* size 0x40 */
	. = ALIGN(0x8); /* align for .rodata.begin_c__elf_init */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.rodata.begin_c__elf_init); /* size 0xe0 */
	. = ALIGN(0x4); /* align for .rodata.begin_c_fmag */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.rodata.begin_c_fmag); /* size 0x3 */
	. = ALIGN(0x4); /* align for .rodata.begin__str__ELF_ */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.rodata.begin__str__ELF_); /* size 0x5 */
	. = ALIGN(0x4); /* align for .rodata.begin__str_1___arch___ */
	"/usr/local/popcorn/x86_64/lib/libelf.a:begin.o"(.rodata.begin__str_1___arch___); /* size 0x9 */
	. = ALIGN(0x4); /* align for .rodata.version__str_LIBELF_SAN */
	"/usr/local/popcorn/x86_64/lib/libelf.a:version.o"(.rodata.version__str_LIBELF_SAN); /* size 0x15 */
	. = ALIGN(0x10); /* align for .rodata.32_xlatetof_c_xlate32_11 */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.rodata.32_xlatetof_c_xlate32_11); /* size 0x220 */
	. = ALIGN(0x8); /* align for .rodata._elf_scn_type */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.rodata._elf_scn_type); /* size 0x88 */
	. = ALIGN(0x8); /* align for .rodata._elf_cook */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.rodata._elf_cook); /* size 0x110 */
	. = ALIGN(0x8); /* align for .rodata._elf_scn_init */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.rodata._elf_scn_init); /* size 0xa0 */
	. = ALIGN(0x8); /* align for .rodata._elf_data_init */
	"/usr/local/popcorn/x86_64/lib/libelf.a:cook.o"(.rodata._elf_data_init); /* size 0x58 */
	. = ALIGN(0x10); /* align for .rodata.64_xlatetof_c_xlate64_11 */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.rodata.64_xlatetof_c_xlate64_11); /* size 0x220 */
	. = ALIGN(0x10); /* align for .rodata._elf_fmsize */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.fsize.o"(.rodata._elf_fmsize); /* size 0x220 */
	. = ALIGN(0x4); /* align for .rodata.src_exit_assert__str_Assertion_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:assert.o"(.rodata.src_exit_assert__str_Assertion_); /* size 0x23 */
	. = ALIGN(0x8); /* align for .rodata.stderr */
	"/usr/local/popcorn/x86_64/lib/libc.a:stderr.o"(.rodata.stderr); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.src_stdlib_qsort___const_qsort_p_ */
	"/usr/local/popcorn/x86_64/lib/libc.a:qsort.o"(.rodata.src_stdlib_qsort___const_qsort_p_); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_all_mask */
	"/usr/local/popcorn/x86_64/lib/libc.a:block.o"(.rodata.src_signal_block_c_all_mask); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_app_mask */
	"/usr/local/popcorn/x86_64/lib/libc.a:block.o"(.rodata.src_signal_block_c_app_mask); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"exact_rhs_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"exact_rhs_x86_64.o"(.rodata.cst8); /* size 0x30 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"initialize_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"ninvr_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"ninvr_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"pinvr_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"pinvr_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"print_results_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"randdp_x86_64.o"(.rodata.cst8); /* size 0x28 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"rhs_x86_64.o"(.rodata.cst8); /* size 0x30 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"set_constants_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"txinvr_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"verify_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"x_solve_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"x_solve_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"y_solve_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"y_solve_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"z_solve_x86_64.o"(.rodata.cst8); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"z_solve_x86_64.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libc.a:pow.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"/usr/local/popcorn/x86_64/lib/libc.a:scalbn.o"(.rodata.cst8); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.cst4 */
	"/usr/local/popcorn/x86_64/lib/libc.a:vfprintf.o"(.rodata.cst4); /* size 0x1c */
	. = ALIGN(0x4); /* align for .rodata.cst4 */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.rodata.cst4); /* size 0xc */
	. = ALIGN(0x8); /* align for .rodata.cst8 */
	"/usr/local/popcorn/x86_64/lib/libc.a:floatscan.o"(.rodata.cst8); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.cst4 */
	"/usr/local/popcorn/x86_64/lib/libc.a:frexpl.o"(.rodata.cst4); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:unwind.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.src_arch_x86_64_regs_switch_table_reg_size_x86_64_ */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:regs.o"(.rodata.src_arch_x86_64_regs_switch_table_reg_size_x86_64_); /* size 0x42 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libelf.a:32.xlatetof.o"(.rodata.cst16); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.cst16 */
	"/usr/local/popcorn/x86_64/lib/libelf.a:64.xlatetof.o"(.rodata.cst16); /* size 0x20 */
	. = . + 0x20; /* padding after .rodata.cst16 */
	. = . + 0x20; /* padding after .rodata.cst16 */
	. = . + 0x30; /* padding after .rodata.cst16 */
	. = . + 0x8; /* padding after .rodata.cst8 */
	*(.rodata);
}
  
  .rodata1        : { *(.rodata1) }
  
.data	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x4); /* align for .data.wtime_c_wtime__sec */
	"wtime_x86_64.o"(.data.wtime_c_wtime__sec); /* size 0x4 */
	. = ALIGN(0x8); /* align for .data.src_stdio_stdout_c_f */
	"/usr/local/popcorn/x86_64/lib/libc.a:stdout.o"(.data.src_stdio_stdout_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stdout_used */
	"/usr/local/popcorn/x86_64/lib/libc.a:stdout.o"(.data.__stdout_used); /* size 0x8 */
	. = ALIGN(0x4); /* align for .data.src_migrate_c_origin_nid */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.data.src_migrate_c_origin_nid); /* size 0x4 */
	. = ALIGN(0x4); /* align for .data._elf_sanity_checks */
	"/usr/local/popcorn/x86_64/lib/libelf.a:data.o"(.data._elf_sanity_checks); /* size 0x4 */
	. = ALIGN(0x8); /* align for .data.src_stdio_stderr_c_f */
	"/usr/local/popcorn/x86_64/lib/libc.a:stderr.o"(.data.src_stdio_stderr_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stderr_used */
	"/usr/local/popcorn/x86_64/lib/libc.a:stderr.o"(.data.__stderr_used); /* size 0x8 */
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
	. = ALIGN(0x10); /* align for .bss.c_timers_c_elapsed */
	"c_timers_x86_64.o"(.bss.c_timers_c_elapsed); /* size 0x200 */
	. = ALIGN(0x10); /* align for .bss.c_timers_c_start */
	"c_timers_x86_64.o"(.bss.c_timers_c_start); /* size 0x200 */
	. = ALIGN(0x4); /* align for .bss.timeron */
	"sp_x86_64.o"(.bss.timeron); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.dt */
	"sp_x86_64.o"(.bss.dt); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.grid_points */
	"sp_x86_64.o"(.bss.grid_points); /* size 0xc */
	. = ALIGN(0x4); /* align for .bss.nx2 */
	"sp_x86_64.o"(.bss.nx2); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ny2 */
	"sp_x86_64.o"(.bss.ny2); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.nz2 */
	"sp_x86_64.o"(.bss.nz2); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.tx1 */
	"sp_x86_64.o"(.bss.tx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.tx2 */
	"sp_x86_64.o"(.bss.tx2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.tx3 */
	"sp_x86_64.o"(.bss.tx3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ty1 */
	"sp_x86_64.o"(.bss.ty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ty2 */
	"sp_x86_64.o"(.bss.ty2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ty3 */
	"sp_x86_64.o"(.bss.ty3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.tz1 */
	"sp_x86_64.o"(.bss.tz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.tz2 */
	"sp_x86_64.o"(.bss.tz2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.tz3 */
	"sp_x86_64.o"(.bss.tz3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx1 */
	"sp_x86_64.o"(.bss.dx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx2 */
	"sp_x86_64.o"(.bss.dx2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx3 */
	"sp_x86_64.o"(.bss.dx3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx4 */
	"sp_x86_64.o"(.bss.dx4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx5 */
	"sp_x86_64.o"(.bss.dx5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy1 */
	"sp_x86_64.o"(.bss.dy1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy2 */
	"sp_x86_64.o"(.bss.dy2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy3 */
	"sp_x86_64.o"(.bss.dy3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy4 */
	"sp_x86_64.o"(.bss.dy4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy5 */
	"sp_x86_64.o"(.bss.dy5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz1 */
	"sp_x86_64.o"(.bss.dz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz2 */
	"sp_x86_64.o"(.bss.dz2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz3 */
	"sp_x86_64.o"(.bss.dz3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz4 */
	"sp_x86_64.o"(.bss.dz4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz5 */
	"sp_x86_64.o"(.bss.dz5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dssp */
	"sp_x86_64.o"(.bss.dssp); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.ce */
	"sp_x86_64.o"(.bss.ce); /* size 0x208 */
	. = ALIGN(0x8); /* align for .bss.dxmax */
	"sp_x86_64.o"(.bss.dxmax); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dymax */
	"sp_x86_64.o"(.bss.dymax); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dzmax */
	"sp_x86_64.o"(.bss.dzmax); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.xxcon1 */
	"sp_x86_64.o"(.bss.xxcon1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.xxcon2 */
	"sp_x86_64.o"(.bss.xxcon2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.xxcon3 */
	"sp_x86_64.o"(.bss.xxcon3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.xxcon4 */
	"sp_x86_64.o"(.bss.xxcon4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.xxcon5 */
	"sp_x86_64.o"(.bss.xxcon5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx1tx1 */
	"sp_x86_64.o"(.bss.dx1tx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx2tx1 */
	"sp_x86_64.o"(.bss.dx2tx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx3tx1 */
	"sp_x86_64.o"(.bss.dx3tx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx4tx1 */
	"sp_x86_64.o"(.bss.dx4tx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dx5tx1 */
	"sp_x86_64.o"(.bss.dx5tx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.yycon1 */
	"sp_x86_64.o"(.bss.yycon1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.yycon2 */
	"sp_x86_64.o"(.bss.yycon2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.yycon3 */
	"sp_x86_64.o"(.bss.yycon3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.yycon4 */
	"sp_x86_64.o"(.bss.yycon4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.yycon5 */
	"sp_x86_64.o"(.bss.yycon5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy1ty1 */
	"sp_x86_64.o"(.bss.dy1ty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy2ty1 */
	"sp_x86_64.o"(.bss.dy2ty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy3ty1 */
	"sp_x86_64.o"(.bss.dy3ty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy4ty1 */
	"sp_x86_64.o"(.bss.dy4ty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dy5ty1 */
	"sp_x86_64.o"(.bss.dy5ty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.zzcon1 */
	"sp_x86_64.o"(.bss.zzcon1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.zzcon2 */
	"sp_x86_64.o"(.bss.zzcon2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.zzcon3 */
	"sp_x86_64.o"(.bss.zzcon3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.zzcon4 */
	"sp_x86_64.o"(.bss.zzcon4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.zzcon5 */
	"sp_x86_64.o"(.bss.zzcon5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz1tz1 */
	"sp_x86_64.o"(.bss.dz1tz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz2tz1 */
	"sp_x86_64.o"(.bss.dz2tz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz3tz1 */
	"sp_x86_64.o"(.bss.dz3tz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz4tz1 */
	"sp_x86_64.o"(.bss.dz4tz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dz5tz1 */
	"sp_x86_64.o"(.bss.dz5tz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dnxm1 */
	"sp_x86_64.o"(.bss.dnxm1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dnym1 */
	"sp_x86_64.o"(.bss.dnym1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dnzm1 */
	"sp_x86_64.o"(.bss.dnzm1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c1c2 */
	"sp_x86_64.o"(.bss.c1c2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c1c5 */
	"sp_x86_64.o"(.bss.c1c5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c3c4 */
	"sp_x86_64.o"(.bss.c3c4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c1345 */
	"sp_x86_64.o"(.bss.c1345); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.conz1 */
	"sp_x86_64.o"(.bss.conz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c1 */
	"sp_x86_64.o"(.bss.c1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c2 */
	"sp_x86_64.o"(.bss.c2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c3 */
	"sp_x86_64.o"(.bss.c3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c4 */
	"sp_x86_64.o"(.bss.c4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c5 */
	"sp_x86_64.o"(.bss.c5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c4dssp */
	"sp_x86_64.o"(.bss.c4dssp); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c5dssp */
	"sp_x86_64.o"(.bss.c5dssp); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dtdssp */
	"sp_x86_64.o"(.bss.dtdssp); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dttx1 */
	"sp_x86_64.o"(.bss.dttx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.bt */
	"sp_x86_64.o"(.bss.bt); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dttx2 */
	"sp_x86_64.o"(.bss.dttx2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dtty1 */
	"sp_x86_64.o"(.bss.dtty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dtty2 */
	"sp_x86_64.o"(.bss.dtty2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dttz1 */
	"sp_x86_64.o"(.bss.dttz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.dttz2 */
	"sp_x86_64.o"(.bss.dttz2); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c2dttx1 */
	"sp_x86_64.o"(.bss.c2dttx1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c2dtty1 */
	"sp_x86_64.o"(.bss.c2dtty1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c2dttz1 */
	"sp_x86_64.o"(.bss.c2dttz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.comz1 */
	"sp_x86_64.o"(.bss.comz1); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.comz4 */
	"sp_x86_64.o"(.bss.comz4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.comz5 */
	"sp_x86_64.o"(.bss.comz5); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.comz6 */
	"sp_x86_64.o"(.bss.comz6); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c3c4tx3 */
	"sp_x86_64.o"(.bss.c3c4tx3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c3c4ty3 */
	"sp_x86_64.o"(.bss.c3c4ty3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c3c4tz3 */
	"sp_x86_64.o"(.bss.c3c4tz3); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.c2iv */
	"sp_x86_64.o"(.bss.c2iv); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.con43 */
	"sp_x86_64.o"(.bss.con43); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.con16 */
	"sp_x86_64.o"(.bss.con16); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.u */
	"sp_x86_64.o"(.bss.u); /* size 0xa50a00 */
	. = ALIGN(0x10); /* align for .bss.us */
	"sp_x86_64.o"(.bss.us); /* size 0x210200 */
	. = ALIGN(0x10); /* align for .bss.vs */
	"sp_x86_64.o"(.bss.vs); /* size 0x210200 */
	. = ALIGN(0x10); /* align for .bss.ws */
	"sp_x86_64.o"(.bss.ws); /* size 0x210200 */
	. = ALIGN(0x10); /* align for .bss.qs */
	"sp_x86_64.o"(.bss.qs); /* size 0x210200 */
	. = ALIGN(0x10); /* align for .bss.rho_i */
	"sp_x86_64.o"(.bss.rho_i); /* size 0x210200 */
	. = ALIGN(0x10); /* align for .bss.speed */
	"sp_x86_64.o"(.bss.speed); /* size 0x210200 */
	. = ALIGN(0x10); /* align for .bss.square */
	"sp_x86_64.o"(.bss.square); /* size 0x210200 */
	. = ALIGN(0x10); /* align for .bss.rhs */
	"sp_x86_64.o"(.bss.rhs); /* size 0xa50a00 */
	. = ALIGN(0x10); /* align for .bss.forcing */
	"sp_x86_64.o"(.bss.forcing); /* size 0xa50a00 */
	. = ALIGN(0x10); /* align for .bss.cv */
	"sp_x86_64.o"(.bss.cv); /* size 0x200 */
	. = ALIGN(0x10); /* align for .bss.rhon */
	"sp_x86_64.o"(.bss.rhon); /* size 0x200 */
	. = ALIGN(0x10); /* align for .bss.rhos */
	"sp_x86_64.o"(.bss.rhos); /* size 0x200 */
	. = ALIGN(0x10); /* align for .bss.rhoq */
	"sp_x86_64.o"(.bss.rhoq); /* size 0x200 */
	. = ALIGN(0x10); /* align for .bss.cuf */
	"sp_x86_64.o"(.bss.cuf); /* size 0x200 */
	. = ALIGN(0x10); /* align for .bss.q */
	"sp_x86_64.o"(.bss.q); /* size 0x200 */
	. = ALIGN(0x10); /* align for .bss.ue */
	"sp_x86_64.o"(.bss.ue); /* size 0xa00 */
	. = ALIGN(0x10); /* align for .bss.buf */
	"sp_x86_64.o"(.bss.buf); /* size 0xa00 */
	. = ALIGN(0x10); /* align for .bss.lhs */
	"sp_x86_64.o"(.bss.lhs); /* size 0x29428 */
	. = ALIGN(0x10); /* align for .bss.lhsp */
	"sp_x86_64.o"(.bss.lhsp); /* size 0x29428 */
	. = ALIGN(0x10); /* align for .bss.lhsm */
	"sp_x86_64.o"(.bss.lhsm); /* size 0x29428 */
	. = ALIGN(0x8); /* align for .bss.__popcorn_stack_base */
	"/usr/local/popcorn/x86_64/lib/libc.a:__libc_start_main.o"(.bss.__popcorn_stack_base); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname */
	"/usr/local/popcorn/x86_64/lib/libc.a:libc.o"(.bss.__progname); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname_full */
	"/usr/local/popcorn/x86_64/lib/libc.a:libc.o"(.bss.__progname_full); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_fflush_c_dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a:fflush.o"(.bss.src_stdio_fflush_c_dummy); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_stdio_ofl_c_ofl_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a:ofl.o"(.bss.src_stdio_ofl_c_ofl_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_ofl_c_ofl_head */
	"/usr/local/popcorn/x86_64/lib/libc.a:ofl.o"(.bss.src_stdio_ofl_c_ofl_head); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_stdio_stdout_c_buf */
	"/usr/local/popcorn/x86_64/lib/libc.a:stdout.o"(.bss.src_stdio_stdout_c_buf); /* size 0x408 */
	. = ALIGN(0x8); /* align for .bss.__environ */
	"/usr/local/popcorn/x86_64/lib/libc.a:__environ.o"(.bss.__environ); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_env___init_tls_c_main_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a:__init_tls.o"(.bss.src_env___init_tls_c_main_tls); /* size 0x30 */
	. = ALIGN(0x10); /* align for .bss.src_env___init_tls_c_builtin_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a:__init_tls.o"(.bss.src_env___init_tls_c_builtin_tls); /* size 0x1a8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a:lite_malloc.o"(.bss.src_malloc_lite_malloc_c___simple_malloc_cur); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_end */
	"/usr/local/popcorn/x86_64/lib/libc.a:lite_malloc.o"(.bss.src_malloc_lite_malloc_c___simple_malloc_end); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a:lite_malloc.o"(.bss.src_malloc_lite_malloc_c___simple_malloc_lock); /* size 0x8 */
	. = ALIGN(0x1000); /* align for .bss.src_malloc_malloc_c_mal */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.bss.src_malloc_malloc_c_mal); /* size 0x1000 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.bss.src_malloc_malloc_c_expand_heap_heap_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_malloc_c_expand_heap_end */
	"/usr/local/popcorn/x86_64/lib/libc.a:malloc.o"(.bss.src_malloc_malloc_c_expand_heap_end); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_end */
	"/usr/local/popcorn/x86_64/lib/libc.a:popcorn_malloc.o"(.bss.src_malloc_popcorn_malloc_c_expand_heap_end); /* size 0x100 */
	. = ALIGN(0x4); /* align for .bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state */
	"/usr/local/popcorn/x86_64/lib/libc.a:mbrtowc.o"(.bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c___expand_heap_brk */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.bss.src_malloc_expand_heap_c___expand_heap_brk); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c___expand_heap_mmap_step */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.bss.src_malloc_expand_heap_c___expand_heap_mmap_step); /* size 0x4 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes); /* size 0x100 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c_arena_start */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.bss.src_malloc_expand_heap_c_arena_start); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c_set_arena_start_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a:expand_heap.o"(.bss.src_malloc_expand_heap_c_set_arena_start_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio___stdio_exit_c_dummy_file */
	"/usr/local/popcorn/x86_64/lib/libc.a:__stdio_exit.o"(.bss.src_stdio___stdio_exit_c_dummy_file); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_migrate_c_ni */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:migrate.o"(.bss.src_migrate_c_ni); /* size 0x180 */
	. = ALIGN(0x4); /* align for .bss.src_mapping_c_default_node */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.bss.src_mapping_c_default_node); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_mapping_c_mappings */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.bss.src_mapping_c_mappings); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_mapping_c_num_mappings */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a:mapping.o"(.bss.src_mapping_c_num_mappings); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.aarch64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.aarch64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.powerpc64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.powerpc64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.riscv64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.riscv64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.x86_64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.x86_64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_aarch64_handle */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_aarch64_handle); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_userspace_c_alloc_aarch64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_alloc_aarch64_fn); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_powerpc64_handle */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_powerpc64_handle); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_userspace_c_alloc_powerpc64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_alloc_powerpc64_fn); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_riscv64_handle */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_riscv64_handle); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_userspace_c_alloc_riscv64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_alloc_riscv64_fn); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_x86_64_handle */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_x86_64_handle); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_userspace_c_alloc_x86_64_fn */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.bss.src_userspace_c_alloc_x86_64_fn); /* size 0x1 */
	. = ALIGN(0x4); /* align for .bss._elf_version */
	"/usr/local/popcorn/x86_64/lib/libelf.a:data.o"(.bss._elf_version); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss._elf_errno */
	"/usr/local/popcorn/x86_64/lib/libelf.a:data.o"(.bss._elf_errno); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss._elf_fill */
	"/usr/local/popcorn/x86_64/lib/libelf.a:data.o"(.bss._elf_fill); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.src_stdio_stderr_c_buf */
	"/usr/local/popcorn/x86_64/lib/libc.a:stderr.o"(.bss.src_stdio_stderr_c_buf); /* size 0x8 */
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
	. = ALIGN(0x8); /* align for .tbss.src_userspace_c_bounds */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:userspace.o"(.tbss.src_userspace_c_bounds); /* size 0x10 */
	. = ALIGN(0x8); /* align for .tbss.src_rewrite_c_src_ctx */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.tbss.src_rewrite_c_src_ctx); /* size 0xb050 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_src_regs */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.tbss.src_rewrite_c_src_regs); /* size 0x62000 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_src_callee */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.tbss.src_rewrite_c_src_callee); /* size 0x2000 */
	. = ALIGN(0x8); /* align for .tbss.src_rewrite_c_dest_ctx */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.tbss.src_rewrite_c_dest_ctx); /* size 0xb050 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_dest_regs */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.tbss.src_rewrite_c_dest_regs); /* size 0x62000 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_dest_callee */
	"/usr/local/popcorn/x86_64/lib/libstack-transform.a:rewrite.o"(.tbss.src_rewrite_c_dest_callee); /* size 0x2000 */
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