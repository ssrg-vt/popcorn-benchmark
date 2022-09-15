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
	. = ALIGN(0x10); /* align for .text.second */
	"linpack-pc_x86_64.o"(.text.second); /* size 0x4f */
	. = . + 0x15; /* padding after .text.second */
	. = ALIGN(0x10); /* align for .text.what_date */
	"linpack-pc_x86_64.o"(.text.what_date); /* size 0xf */
	. = . + 0xd; /* padding after .text.what_date */
	. = ALIGN(0x10); /* align for .text.main */
	"linpack-pc_x86_64.o"(.text.main); /* size 0x107a */
	. = ALIGN(0x10); /* align for .text.matgen */
	"linpack-pc_x86_64.o"(.text.matgen); /* size 0x25b */
	. = . + 0x21; /* padding after .text.matgen */
	. = ALIGN(0x10); /* align for .text.dgefa */
	"linpack-pc_x86_64.o"(.text.dgefa); /* size 0x396 */
	. = . + 0x22; /* padding after .text.dgefa */
	. = ALIGN(0x10); /* align for .text.dgesl */
	"linpack-pc_x86_64.o"(.text.dgesl); /* size 0x41d */
	. = ALIGN(0x10); /* align for .text.dmxpy */
	"linpack-pc_x86_64.o"(.text.dmxpy); /* size 0x78f */
	. = ALIGN(0x10); /* align for .text.epslon */
	"linpack-pc_x86_64.o"(.text.epslon); /* size 0xeb */
	. = ALIGN(0x10); /* align for .text.print_time */
	"linpack-pc_x86_64.o"(.text.print_time); /* size 0x24 */
	. = . + 0x1c; /* padding after .text.print_time */
	. = ALIGN(0x10); /* align for .text.idamax */
	"linpack-pc_x86_64.o"(.text.idamax); /* size 0x231 */
	. = ALIGN(0x10); /* align for .text.dscal */
	"linpack-pc_x86_64.o"(.text.dscal); /* size 0x12d */
	. = . + 0x17; /* padding after .text.dscal */
	. = ALIGN(0x10); /* align for .text.daxpy */
	"linpack-pc_x86_64.o"(.text.daxpy); /* size 0x203 */
	. = . + 0x5; /* padding after .text.daxpy */
	. = ALIGN(0x10); /* align for .text.ddot */
	"linpack-pc_x86_64.o"(.text.ddot); /* size 0x1ff */
	. = . + 0x5; /* padding after .text.ddot */
	. = ALIGN(0x4); /* align for .text._start_c */
	"/usr/local/popcorn/x86_64/lib/crt1.o"(.text._start_c); /* size 0x1f */
	. = . + 0x11; /* padding after .text._start_c */
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
	. = ALIGN(0x4); /* align for .text.libc_exit_fini */
	"/usr/local/popcorn/x86_64/lib/libc.a(exit.o)"(.text.libc_exit_fini); /* size 0x35 */
	. = . + 0x13; /* padding after .text.libc_exit_fini */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(exit.o)"(.text.dummy); /* size 0x1 */
	. = . + 0x3; /* padding after .text.dummy */
	. = ALIGN(0x4); /* align for .text.fprintf */
	"/usr/local/popcorn/x86_64/lib/libc.a(fprintf.o)"(.text.fprintf); /* size 0x81 */
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
	. = ALIGN(0x10); /* align for .text.strnlen */
	"/usr/local/popcorn/x86_64/lib/libc.a(strnlen.o)"(.text.strnlen); /* size 0x2c */
	. = . + 0xc; /* padding after .text.strnlen */
	. = ALIGN(0x4); /* align for .text.memset */
	"/usr/local/popcorn/x86_64/lib/libc.a(memset.o)"(.text.memset); /* size 0xc4 */
	. = . + 0x7c; /* padding after .text.memset */
	. = ALIGN(0x4); /* align for .text.clock */
	"/usr/local/popcorn/x86_64/lib/libc.a(clock.o)"(.text.clock); /* size 0x82 */
	. = . + 0x6; /* padding after .text.clock */
	. = ALIGN(0x4); /* align for .text.__clock_gettime */
	"/usr/local/popcorn/x86_64/lib/libc.a(clock_gettime.o)"(.text.__clock_gettime); /* size 0x56 */
	. = . + 0x1a; /* padding after .text.__clock_gettime */
	. = ALIGN(0x4); /* align for .text.__init_tp */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.text.__init_tp); /* size 0x50 */
	. = . + 0x20; /* padding after .text.__init_tp */
	. = ALIGN(0x4); /* align for .text.__copy_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.text.__copy_tls); /* size 0xa5 */
	. = ALIGN(0x4); /* align for .text.static_init_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.text.static_init_tls); /* size 0x142 */
	. = . + 0x2; /* padding after .text.static_init_tls */
	. = ALIGN(0x4); /* align for .text.__errno_location */
	"/usr/local/popcorn/x86_64/lib/libc.a(__errno_location.o)"(.text.__errno_location); /* size 0xe */
	. = ALIGN(0x4); /* align for .text.__strerror_l */
	"/usr/local/popcorn/x86_64/lib/libc.a(strerror.o)"(.text.__strerror_l); /* size 0x44 */
	. = . + 0x20; /* padding after .text.__strerror_l */
	. = ALIGN(0x4); /* align for .text.strerror */
	"/usr/local/popcorn/x86_64/lib/libc.a(strerror.o)"(.text.strerror); /* size 0x15 */
	. = ALIGN(0x4); /* align for .text._Exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(_Exit.o)"(.text._Exit); /* size 0x13 */
	. = . + 0xd; /* padding after .text._Exit */
	. = ALIGN(0x10); /* align for .text.__syscall_ret */
	"/usr/local/popcorn/x86_64/lib/libc.a(syscall_ret.o)"(.text.__syscall_ret); /* size 0x22 */
	. = . + 0xe; /* padding after .text.__syscall_ret */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lctrans.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__lctrans */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lctrans.o)"(.text.__lctrans); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.__lctrans_cur */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lctrans.o)"(.text.__lctrans_cur); /* size 0x19 */
	. = ALIGN(0x4); /* align for .text.__fpclassifyl */
	"/usr/local/popcorn/x86_64/lib/libc.a(__fpclassifyl.o)"(.text.__fpclassifyl); /* size 0x4e */
	. = . + 0x2; /* padding after .text.__fpclassifyl */
	. = ALIGN(0x4); /* align for .text.__signbitl */
	"/usr/local/popcorn/x86_64/lib/libc.a(__signbitl.o)"(.text.__signbitl); /* size 0xa */
	. = . + 0xa; /* padding after .text.__signbitl */
	. = ALIGN(0x4); /* align for .text.frexpl */
	"/usr/local/popcorn/x86_64/lib/libc.a(frexpl.o)"(.text.frexpl); /* size 0x7f */
	. = . + 0x35; /* padding after .text.frexpl */
	. = ALIGN(0x4); /* align for .text.wctomb */
	"/usr/local/popcorn/x86_64/lib/libc.a(wctomb.o)"(.text.wctomb); /* size 0x15 */
	. = . + 0x7; /* padding after .text.wctomb */
	. = ALIGN(0x4); /* align for .text.__lockfile */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lockfile.o)"(.text.__lockfile); /* size 0x73 */
	. = ALIGN(0x4); /* align for .text.__unlockfile */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lockfile.o)"(.text.__unlockfile); /* size 0x46 */
	. = . + 0x6; /* padding after .text.__unlockfile */
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
	. = ALIGN(0x4); /* align for .text.__fwritex */
	"/usr/local/popcorn/x86_64/lib/libc.a(fwrite.o)"(.text.__fwritex); /* size 0xbb */
	. = . + 0x3d; /* padding after .text.__fwritex */
	. = ALIGN(0x4); /* align for .text.fwrite */
	"/usr/local/popcorn/x86_64/lib/libc.a(fwrite.o)"(.text.fwrite); /* size 0x8a */
	. = . + 0x12; /* padding after .text.fwrite */
	. = ALIGN(0x10); /* align for .text.memchr */
	"/usr/local/popcorn/x86_64/lib/libc.a(memchr.o)"(.text.memchr); /* size 0xb2 */
	. = ALIGN(0x4); /* align for .text.memcpy */
	"/usr/local/popcorn/x86_64/lib/libc.a(memcpy.o)"(.text.memcpy); /* size 0x32 */
	. = . + 0x3ce; /* padding after .text.memcpy */
	. = ALIGN(0x4); /* align for .text.__wait */
	"/usr/local/popcorn/x86_64/lib/libc.a(__wait.o)"(.text.__wait); /* size 0x78 */
	. = . + 0x4c; /* padding after .text.__wait */
	. = ALIGN(0x10); /* align for .text.__set_thread_area */
	"/usr/local/popcorn/x86_64/lib/libc.a(__set_thread_area.o)"(.text.__set_thread_area); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.wcrtomb */
	"/usr/local/popcorn/x86_64/lib/libc.a(wcrtomb.o)"(.text.wcrtomb); /* size 0xfd */
	. = . + 0xb; /* padding after .text.wcrtomb */
	. = ALIGN(0x4); /* align for .text.__towrite */
	"/usr/local/popcorn/x86_64/lib/libc.a(__towrite.o)"(.text.__towrite); /* size 0x40 */
	. = . + 0xc; /* padding after .text.__towrite */
	. = ALIGN(0x4); /* align for .text.__towrite_needs_stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(__towrite.o)"(.text.__towrite_needs_stdio_exit); /* size 0x5 */
	. = ALIGN(0x4); /* align for .text.__stdio_exit */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_exit.o)"(.text.__stdio_exit); /* size 0x35 */
	. = . + 0x13; /* padding after .text.__stdio_exit */
	. = ALIGN(0x4); /* align for .text.close_file */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_exit.o)"(.text.close_file); /* size 0x4b */
	. = . + 0x29; /* padding after .text.close_file */
	. = ALIGN(0x4); /* align for .text.__ofl_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.text.__ofl_lock); /* size 0x12 */
	. = . + 0x12; /* padding after .text.__ofl_lock */
	. = ALIGN(0x4); /* align for .text.__ofl_unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.text.__ofl_unlock); /* size 0xa */
	. = . + 0x2; /* padding after .text.__ofl_unlock */
	. = ALIGN(0x4); /* align for .text.__lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lock.o)"(.text.__lock); /* size 0x47 */
	. = . + 0x19; /* padding after .text.__lock */
	. = ALIGN(0x4); /* align for .text.__unlock */
	"/usr/local/popcorn/x86_64/lib/libc.a(__lock.o)"(.text.__unlock); /* size 0x3d */
	. = . + 0x17; /* padding after .text.__unlock */
	. = ALIGN(0x10); /* align for .text.check_migrate */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a(migrate.o)"(.text.check_migrate); /* size 0x24 */
	. = . + 0x10; /* padding after .text.check_migrate */
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
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_INSERT_COM */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_INSERT_COM); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_1_INSERT_OPT */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_1_INSERT_OPT); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_2_Rolled__ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_2_Rolled__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_3_Single__ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_3_Single__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_4_Precision_ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_4_Precision_); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_5_Compiler__ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_5_Compiler__); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_6_Optimisati */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_6_Optimisati); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_7_norm_resid */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_7_norm_resid); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_8__________x */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_8__________x); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_9__6_1f__17_ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_9__6_1f__17_); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_10_Times_are_ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_10_Times_are_); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_11_1_pass_tim */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_11_1_pass_tim); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_12_______dgef */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_12_______dgef); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_13_______rati */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_13_______rati); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_14__Calculati */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_14__Calculati); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_15__10d_times */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_15__10d_times); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_16_Overhead_f */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_16_Overhead_f); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_17_Calculatin */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_17_Calculatin); /* size 0x2f */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_18_Passes_use */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_18_Passes_use); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_19_Times_for_ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_19_Times_for_); /* size 0x2f */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_20_Average___ */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_20_Average___); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.linpack_pc__str_21__Calculati */
	"linpack-pc_x86_64.o"(.rodata.linpack_pc__str_21__Calculati); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_); /* size 0x1 */
	. = ALIGN(0x10); /* align for .rodata.src_env___libc_start_main___const___init_libc_pfd_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main___const___init_libc_pfd_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_1__dev_null_ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_1__dev_null_); /* size 0xa */
	. = ALIGN(0x8); /* align for .rodata.stderr */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.rodata.stderr); /* size 0x8 */
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
	*(.rodata);
}
  
  .rodata1        : { *(.rodata1) }
  
.data	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .data.src_stdio_stderr_c_f */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.data.src_stdio_stderr_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stderr_used */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.data.__stderr_used); /* size 0x8 */
	. = ALIGN(0x4); /* align for .data.__indicator */
	"/usr/local/popcorn/x86_64/lib/libmigrate.a(migrate.o)"(.data.__indicator); /* size 0x4 */
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
	. = ALIGN(0x10); /* align for .bss.linpack_pc_c_main_aa */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_aa); /* size 0x27100 */
	. = ALIGN(0x10); /* align for .bss.linpack_pc_c_main_a */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_a); /* size 0x27420 */
	. = ALIGN(0x10); /* align for .bss.linpack_pc_c_main_b */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_b); /* size 0x320 */
	. = ALIGN(0x10); /* align for .bss.linpack_pc_c_main_x */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_x); /* size 0x320 */
	. = ALIGN(0x10); /* align for .bss.linpack_pc_c_main_ipvt */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_ipvt); /* size 0x320 */
	. = ALIGN(0x4); /* align for .bss.linpack_pc_c_main_n */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_n); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.linpack_pc_c_main_i */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_i); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.linpack_pc_c_main_j */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_j); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.linpack_pc_c_main_ntimes */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_ntimes); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.linpack_pc_c_main_info */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_info); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.linpack_pc_c_main_lda */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_lda); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.linpack_pc_c_main_ldaa */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_main_ldaa); /* size 0x4 */
	. = ALIGN(0x10); /* align for .bss.linpack_pc_c_atime */
	"linpack-pc_x86_64.o"(.bss.linpack_pc_c_atime); /* size 0x21c */
	. = ALIGN(0x8); /* align for .bss.__popcorn_stack_base */
	"/usr/local/popcorn/x86_64/lib/libc.a(__libc_start_main.o)"(.bss.__popcorn_stack_base); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname */
	"/usr/local/popcorn/x86_64/lib/libc.a(libc.o)"(.bss.__progname); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname_full */
	"/usr/local/popcorn/x86_64/lib/libc.a(libc.o)"(.bss.__progname_full); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_stdio_stderr_c_buf */
	"/usr/local/popcorn/x86_64/lib/libc.a(stderr.o)"(.bss.src_stdio_stderr_c_buf); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__environ */
	"/usr/local/popcorn/x86_64/lib/libc.a(__environ.o)"(.bss.__environ); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_env___init_tls_c_main_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_main_tls); /* size 0x30 */
	. = ALIGN(0x10); /* align for .bss.src_env___init_tls_c_builtin_tls */
	"/usr/local/popcorn/x86_64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_builtin_tls); /* size 0x1a8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio___stdio_exit_c_dummy_file */
	"/usr/local/popcorn/x86_64/lib/libc.a(__stdio_exit.o)"(.bss.src_stdio___stdio_exit_c_dummy_file); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_stdio_ofl_c_ofl_lock */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_ofl_c_ofl_head */
	"/usr/local/popcorn/x86_64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_head); /* size 0x8 */
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
