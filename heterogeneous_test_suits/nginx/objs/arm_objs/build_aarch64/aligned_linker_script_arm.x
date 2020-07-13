/* Default linker script, for normal executables */
OUTPUT_FORMAT("elf64-littleaarch64", "elf64-bigaarch64",
	      "elf64-littleaarch64")
OUTPUT_ARCH(aarch64)
ENTRY(_start)
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
    /*KEEP (*(SORT_NONE(.init)))*/
  }
  .plt            : ALIGN(16) { *(.plt) *(.iplt) }
  
.text	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x4); /* align for .text.exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.text.exit); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.main */
	"objs/arm_objs/src/core/nginx.o"(.text.main); /* size 0x5e8 */
	. = . + 0xbf; /* padding after .text.main */
	. = ALIGN(0x10); /* align for .text.ngx_get_options */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_get_options); /* size 0x488 */
	. = . + 0x51; /* padding after .text.ngx_get_options */
	. = ALIGN(0x10); /* align for .text.ngx_write_stderr */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_write_stderr); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_save_argv */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_save_argv); /* size 0x198 */
	. = ALIGN(0x10); /* align for .text.ngx_process_options */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_process_options); /* size 0x2e8 */
	. = . + 0x59; /* padding after .text.ngx_process_options */
	. = ALIGN(0x10); /* align for .text.ngx_add_inherited_sockets */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_add_inherited_sockets); /* size 0x224 */
	. = . + 0x4c; /* padding after .text.ngx_add_inherited_sockets */
	. = ALIGN(0x10); /* align for .text.ngx_set_environment */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_set_environment); /* size 0x490 */
	. = . + 0x76; /* padding after .text.ngx_set_environment */
	. = ALIGN(0x10); /* align for .text.ngx_exec_new_binary */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_exec_new_binary); /* size 0x354 */
	. = . + 0x1c; /* padding after .text.ngx_exec_new_binary */
	. = ALIGN(0x10); /* align for .text.ngx_get_cpu_affinity */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_get_cpu_affinity); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.ngx_core_module_create_conf */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_core_module_create_conf); /* size 0x10c */
	. = . + 0x24; /* padding after .text.ngx_core_module_create_conf */
	. = ALIGN(0x10); /* align for .text.ngx_core_module_init_conf */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_core_module_init_conf); /* size 0x57c */
	. = . + 0xaa; /* padding after .text.ngx_core_module_init_conf */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_array_init); /* size 0xdc */
	. = ALIGN(0x10); /* align for .text.ngx_set_worker_processes */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_set_worker_processes); /* size 0x114 */
	. = ALIGN(0x10); /* align for .text.ngx_set_user */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_set_user); /* size 0x1e4 */
	. = . + 0x2; /* padding after .text.ngx_set_user */
	. = ALIGN(0x10); /* align for .text.ngx_set_priority */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_set_priority); /* size 0x164 */
	. = . + 0x5; /* padding after .text.ngx_set_priority */
	. = ALIGN(0x10); /* align for .text.ngx_set_cpu_affinity */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_set_cpu_affinity); /* size 0x274 */
	. = . + 0x2; /* padding after .text.ngx_set_cpu_affinity */
	. = ALIGN(0x10); /* align for .text.ngx_set_env */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_set_env); /* size 0x110 */
	. = . + 0x8; /* padding after .text.ngx_set_env */
	. = ALIGN(0x10); /* align for .text.ngx_write_fd */
	"objs/arm_objs/src/core/nginx.o"(.text.ngx_write_fd); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_log_error_core */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_log_error_core); /* size 0x324 */
	. = . + 0xe6; /* padding after .text.ngx_log_error_core */
	. = ALIGN(0x10); /* align for .text.ngx_log_errno */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_log_errno); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_write_fd */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_write_fd); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_log_abort */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_log_abort); /* size 0x130 */
	. = . + 0xca; /* padding after .text.ngx_log_abort */
	. = ALIGN(0x10); /* align for .text.ngx_log_stderr */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_log_stderr); /* size 0x180 */
	. = . + 0xc6; /* padding after .text.ngx_log_stderr */
	. = ALIGN(0x10); /* align for .text.ngx_log_init */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_log_init); /* size 0x1d8 */
	. = . + 0x14; /* padding after .text.ngx_log_init */
	. = ALIGN(0x10); /* align for .text.ngx_log_create */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_log_create); /* size 0x84 */
	. = . + 0x2; /* padding after .text.ngx_log_create */
	. = ALIGN(0x10); /* align for .text.ngx_log_set_levels */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_log_set_levels); /* size 0x280 */
	. = ALIGN(0x10); /* align for .text.ngx_error_log */
	"objs/arm_objs/src/core/ngx_log.o"(.text.ngx_error_log); /* size 0x120 */
	. = . + 0x12; /* padding after .text.ngx_error_log */
	. = ALIGN(0x10); /* align for .text.ngx_create_pool */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_create_pool); /* size 0x118 */
	. = ALIGN(0x10); /* align for .text.ngx_destroy_pool */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_destroy_pool); /* size 0xec */
	. = . + 0x8; /* padding after .text.ngx_destroy_pool */
	. = ALIGN(0x10); /* align for .text.ngx_reset_pool */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_reset_pool); /* size 0x98 */
	. = . + 0x1; /* padding after .text.ngx_reset_pool */
	. = ALIGN(0x10); /* align for .text.ngx_palloc */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_palloc); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_palloc_block */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_palloc_block); /* size 0x15c */
	. = . + 0x5; /* padding after .text.ngx_palloc_block */
	. = ALIGN(0x10); /* align for .text.ngx_palloc_large */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_palloc_large); /* size 0x110 */
	. = . + 0x15; /* padding after .text.ngx_palloc_large */
	. = ALIGN(0x10); /* align for .text.ngx_pnalloc */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pnalloc); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.ngx_pmemalign */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pmemalign); /* size 0xb0 */
	. = . + 0x3; /* padding after .text.ngx_pmemalign */
	. = ALIGN(0x10); /* align for .text.ngx_pfree */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pfree); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_pcalloc */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pcalloc); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_pool_cleanup_add */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pool_cleanup_add); /* size 0xc0 */
	. = . + 0x5; /* padding after .text.ngx_pool_cleanup_add */
	. = ALIGN(0x10); /* align for .text.ngx_pool_run_cleanup_file */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pool_run_cleanup_file); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_pool_cleanup_file */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pool_cleanup_file); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.ngx_pool_delete_file */
	"objs/arm_objs/src/core/ngx_palloc.o"(.text.ngx_pool_delete_file); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_array_create */
	"objs/arm_objs/src/core/ngx_array.o"(.text.ngx_array_create); /* size 0xb8 */
	. = . + 0x4; /* padding after .text.ngx_array_create */
	. = ALIGN(0x10); /* align for .text.ngx_array_destroy */
	"objs/arm_objs/src/core/ngx_array.o"(.text.ngx_array_destroy); /* size 0x9c */
	. = ALIGN(0x10); /* align for .text.ngx_array_push */
	"objs/arm_objs/src/core/ngx_array.o"(.text.ngx_array_push); /* size 0x164 */
	. = ALIGN(0x10); /* align for .text.ngx_array_push_n */
	"objs/arm_objs/src/core/ngx_array.o"(.text.ngx_array_push_n); /* size 0x1c8 */
	. = ALIGN(0x10); /* align for .text.ngx_list_create */
	"objs/arm_objs/src/core/ngx_list.o"(.text.ngx_list_create); /* size 0xd4 */
	. = . + 0x5; /* padding after .text.ngx_list_create */
	. = ALIGN(0x10); /* align for .text.ngx_list_push */
	"objs/arm_objs/src/core/ngx_list.o"(.text.ngx_list_push); /* size 0x118 */
	. = ALIGN(0x10); /* align for .text.ngx_hash_find */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_find); /* size 0x12c */
	. = ALIGN(0x10); /* align for .text.ngx_hash_find_wc_head */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_find_wc_head); /* size 0x1c4 */
	. = . + 0x12; /* padding after .text.ngx_hash_find_wc_head */
	. = ALIGN(0x10); /* align for .text.ngx_hash_find_wc_tail */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_find_wc_tail); /* size 0x154 */
	. = ALIGN(0x10); /* align for .text.ngx_hash_find_combined */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_find_combined); /* size 0x11c */
	. = . + 0x18; /* padding after .text.ngx_hash_find_combined */
	. = ALIGN(0x10); /* align for .text.ngx_hash_init */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_init); /* size 0x9c8 */
	. = ALIGN(0x10); /* align for .text.ngx_hash_wildcard_init */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_wildcard_init); /* size 0x50c */
	. = . + 0x7; /* padding after .text.ngx_hash_wildcard_init */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_hash_key */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_key); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_hash_key_lc */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_key_lc); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.ngx_hash_strlow */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_strlow); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.ngx_hash_keys_array_init */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_keys_array_init); /* size 0x198 */
	. = . + 0x37; /* padding after .text.ngx_hash_keys_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_hash_add_key */
	"objs/arm_objs/src/core/ngx_hash.o"(.text.ngx_hash_add_key); /* size 0xa48 */
	. = . + 0x3c; /* padding after .text.ngx_hash_add_key */
	. = ALIGN(0x10); /* align for .text.ngx_create_temp_buf */
	"objs/arm_objs/src/core/ngx_buf.o"(.text.ngx_create_temp_buf); /* size 0xd0 */
	. = ALIGN(0x10); /* align for .text.ngx_alloc_chain_link */
	"objs/arm_objs/src/core/ngx_buf.o"(.text.ngx_alloc_chain_link); /* size 0x7c */
	. = . + 0x2; /* padding after .text.ngx_alloc_chain_link */
	. = ALIGN(0x10); /* align for .text.ngx_create_chain_of_bufs */
	"objs/arm_objs/src/core/ngx_buf.o"(.text.ngx_create_chain_of_bufs); /* size 0x160 */
	. = ALIGN(0x10); /* align for .text.ngx_chain_add_copy */
	"objs/arm_objs/src/core/ngx_buf.o"(.text.ngx_chain_add_copy); /* size 0xd4 */
	. = . + 0x3; /* padding after .text.ngx_chain_add_copy */
	. = ALIGN(0x10); /* align for .text.ngx_chain_get_free_buf */
	"objs/arm_objs/src/core/ngx_buf.o"(.text.ngx_chain_get_free_buf); /* size 0xc4 */
	. = . + 0x2; /* padding after .text.ngx_chain_get_free_buf */
	. = ALIGN(0x10); /* align for .text.ngx_chain_update_chains */
	"objs/arm_objs/src/core/ngx_buf.o"(.text.ngx_chain_update_chains); /* size 0x1e8 */
	. = ALIGN(0x10); /* align for .text.ngx_queue_middle */
	"objs/arm_objs/src/core/ngx_queue.o"(.text.ngx_queue_middle); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.ngx_queue_sort */
	"objs/arm_objs/src/core/ngx_queue.o"(.text.ngx_queue_sort); /* size 0x11c */
	. = ALIGN(0x10); /* align for .text.ngx_output_chain */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.text.ngx_output_chain); /* size 0x734 */
	. = . + 0x85; /* padding after .text.ngx_output_chain */
	. = ALIGN(0x10); /* align for .text.ngx_output_chain_as_is */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.text.ngx_output_chain_as_is); /* size 0x248 */
	. = . + 0x49; /* padding after .text.ngx_output_chain_as_is */
	. = ALIGN(0x10); /* align for .text.ngx_output_chain_add_copy */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.text.ngx_output_chain_add_copy); /* size 0xd4 */
	. = . + 0x4; /* padding after .text.ngx_output_chain_add_copy */
	. = ALIGN(0x10); /* align for .text.ngx_output_chain_align_file_buf */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.text.ngx_output_chain_align_file_buf); /* size 0x170 */
	. = ALIGN(0x10); /* align for .text.ngx_output_chain_get_buf */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.text.ngx_output_chain_get_buf); /* size 0x238 */
	. = . + 0x5; /* padding after .text.ngx_output_chain_get_buf */
	. = ALIGN(0x10); /* align for .text.ngx_output_chain_copy_buf */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.text.ngx_output_chain_copy_buf); /* size 0x6bc */
	. = ALIGN(0x10); /* align for .text.ngx_chain_writer */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.text.ngx_chain_writer); /* size 0x584 */
	. = . + 0x52; /* padding after .text.ngx_chain_writer */
	. = ALIGN(0x10); /* align for .text.ngx_strlow */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_strlow); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.ngx_cpystrn */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_cpystrn); /* size 0x98 */
	. = . + 0x6; /* padding after .text.ngx_cpystrn */
	. = ALIGN(0x10); /* align for .text.ngx_pstrdup */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_pstrdup); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.ngx_sprintf */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_sprintf); /* size 0xbc */
	. = . + 0xae; /* padding after .text.ngx_sprintf */
	. = ALIGN(0x10); /* align for .text.ngx_vslprintf */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_vslprintf); /* size 0x1570 */
	. = . + 0x19a; /* padding after .text.ngx_vslprintf */
	. = ALIGN(0x10); /* align for .text.ngx_snprintf */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_snprintf); /* size 0xbc */
	. = . + 0xb7; /* padding after .text.ngx_snprintf */
	. = ALIGN(0x10); /* align for .text.ngx_slprintf */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_slprintf); /* size 0xb8 */
	. = . + 0xaf; /* padding after .text.ngx_slprintf */
	. = ALIGN(0x10); /* align for .text.ngx_sprintf_num */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_sprintf_num); /* size 0x278 */
	. = ALIGN(0x10); /* align for .text.ngx_strcasecmp */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_strcasecmp); /* size 0xec */
	. = ALIGN(0x10); /* align for .text.ngx_strncasecmp */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_strncasecmp); /* size 0x10c */
	. = . + 0x3; /* padding after .text.ngx_strncasecmp */
	. = ALIGN(0x10); /* align for .text.ngx_strnstr */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_strnstr); /* size 0xe8 */
	. = . + 0xf; /* padding after .text.ngx_strnstr */
	. = ALIGN(0x10); /* align for .text.ngx_strstrn */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_strstrn); /* size 0xa4 */
	. = . + 0x5; /* padding after .text.ngx_strstrn */
	. = ALIGN(0x10); /* align for .text.ngx_strcasestrn */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_strcasestrn); /* size 0x118 */
	. = ALIGN(0x10); /* align for .text.ngx_strlcasestrn */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_strlcasestrn); /* size 0x13c */
	. = ALIGN(0x10); /* align for .text.ngx_rstrncmp */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_rstrncmp); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.ngx_rstrncasecmp */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_rstrncasecmp); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_memn2cmp */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_memn2cmp); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_dns_strcmp */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_dns_strcmp); /* size 0x13c */
	. = . + 0x1; /* padding after .text.ngx_dns_strcmp */
	. = ALIGN(0x10); /* align for .text.ngx_atoi */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_atoi); /* size 0xc0 */
	. = . + 0x2; /* padding after .text.ngx_atoi */
	. = ALIGN(0x10); /* align for .text.ngx_atofp */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_atofp); /* size 0x144 */
	. = . + 0x12; /* padding after .text.ngx_atofp */
	. = ALIGN(0x10); /* align for .text.ngx_atosz */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_atosz); /* size 0xc0 */
	. = . + 0x2; /* padding after .text.ngx_atosz */
	. = ALIGN(0x10); /* align for .text.ngx_atoof */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_atoof); /* size 0xc0 */
	. = . + 0x2; /* padding after .text.ngx_atoof */
	. = ALIGN(0x10); /* align for .text.ngx_atotm */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_atotm); /* size 0xc0 */
	. = . + 0x2; /* padding after .text.ngx_atotm */
	. = ALIGN(0x10); /* align for .text.ngx_hextoi */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_hextoi); /* size 0x104 */
	. = . + 0xd; /* padding after .text.ngx_hextoi */
	. = ALIGN(0x10); /* align for .text.ngx_hex_dump */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_hex_dump); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_encode_base64 */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_encode_base64); /* size 0x278 */
	. = ALIGN(0x10); /* align for .text.ngx_decode_base64 */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_decode_base64); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_decode_base64_internal */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_decode_base64_internal); /* size 0x298 */
	. = ALIGN(0x10); /* align for .text.ngx_decode_base64url */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_decode_base64url); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_utf8_decode */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_utf8_decode); /* size 0x180 */
	. = ALIGN(0x10); /* align for .text.ngx_utf8_length */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_utf8_length); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.ngx_utf8_cpystrn */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_utf8_cpystrn); /* size 0x130 */
	. = . + 0x9; /* padding after .text.ngx_utf8_cpystrn */
	. = ALIGN(0x10); /* align for .text.ngx_escape_uri */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_escape_uri); /* size 0x1d8 */
	. = ALIGN(0x10); /* align for .text.ngx_unescape_uri */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_unescape_uri); /* size 0x3bc */
	. = . + 0x39; /* padding after .text.ngx_unescape_uri */
	. = ALIGN(0x10); /* align for .text.ngx_escape_html */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_escape_html); /* size 0x324 */
	. = ALIGN(0x10); /* align for .text.ngx_str_rbtree_insert_value */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_str_rbtree_insert_value); /* size 0x190 */
	. = ALIGN(0x10); /* align for .text.ngx_str_rbtree_lookup */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_str_rbtree_lookup); /* size 0x178 */
	. = ALIGN(0x10); /* align for .text.ngx_sort */
	"objs/arm_objs/src/core/ngx_string.o"(.text.ngx_sort); /* size 0x150 */
	. = ALIGN(0x10); /* align for .text.ngx_parse_size */
	"objs/arm_objs/src/core/ngx_parse.o"(.text.ngx_parse_size); /* size 0x110 */
	. = ALIGN(0x10); /* align for .text.ngx_parse_offset */
	"objs/arm_objs/src/core/ngx_parse.o"(.text.ngx_parse_offset); /* size 0x150 */
	. = ALIGN(0x10); /* align for .text.ngx_parse_time */
	"objs/arm_objs/src/core/ngx_parse.o"(.text.ngx_parse_time); /* size 0x4d8 */
	. = ALIGN(0x10); /* align for .text.ngx_inet_addr */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_inet_addr); /* size 0x154 */
	. = ALIGN(0x10); /* align for .text.ngx_sock_ntop */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_sock_ntop); /* size 0x184 */
	. = . + 0x2e; /* padding after .text.ngx_sock_ntop */
	. = ALIGN(0x10); /* align for .text.ngx_inet_ntop */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_inet_ntop); /* size 0x90 */
	. = . + 0x4; /* padding after .text.ngx_inet_ntop */
	. = ALIGN(0x10); /* align for .text.ngx_ptocidr */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_ptocidr); /* size 0x1bc */
	. = ALIGN(0x10); /* align for .text.ngx_strlchr */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_strlchr); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.ngx_parse_addr */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_parse_addr); /* size 0xd0 */
	. = ALIGN(0x10); /* align for .text.ngx_parse_url */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_parse_url); /* size 0x94 */
	. = . + 0x6; /* padding after .text.ngx_parse_url */
	. = ALIGN(0x10); /* align for .text.ngx_parse_unix_domain_url */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_parse_unix_domain_url); /* size 0x260 */
	. = . + 0x25; /* padding after .text.ngx_parse_unix_domain_url */
	. = ALIGN(0x10); /* align for .text.ngx_parse_inet6_url */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_parse_inet6_url); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.ngx_parse_inet_url */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_parse_inet_url); /* size 0x574 */
	. = ALIGN(0x10); /* align for .text.ngx_inet_resolve_host */
	"objs/arm_objs/src/core/ngx_inet.o"(.text.ngx_inet_resolve_host); /* size 0x414 */
	. = . + 0x3d; /* padding after .text.ngx_inet_resolve_host */
	. = ALIGN(0x10); /* align for .text.ngx_write_chain_to_temp_file */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_write_chain_to_temp_file); /* size 0x160 */
	. = . + 0x16; /* padding after .text.ngx_write_chain_to_temp_file */
	. = ALIGN(0x10); /* align for .text.ngx_create_temp_file */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_create_temp_file); /* size 0x280 */
	. = . + 0xb; /* padding after .text.ngx_create_temp_file */
	. = ALIGN(0x10); /* align for .text.ngx_next_temp_number */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_next_temp_number); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_create_hashed_filename */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_create_hashed_filename); /* size 0x100 */
	. = ALIGN(0x10); /* align for .text.ngx_create_path */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_create_path); /* size 0x14c */
	. = ALIGN(0x10); /* align for .text.ngx_create_full_path */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_create_full_path); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_path_slot */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_conf_set_path_slot); /* size 0x290 */
	. = ALIGN(0x10); /* align for .text.ngx_add_path */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_add_path); /* size 0x370 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_merge_path_value */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_conf_merge_path_value); /* size 0x1ec */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_access_slot */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_conf_set_access_slot); /* size 0x210 */
	. = . + 0x14; /* padding after .text.ngx_conf_set_access_slot */
	. = ALIGN(0x10); /* align for .text.ngx_create_paths */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_create_paths); /* size 0x318 */
	. = ALIGN(0x10); /* align for .text.ngx_ext_rename_file */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_ext_rename_file); /* size 0x530 */
	. = . + 0x5e; /* padding after .text.ngx_ext_rename_file */
	. = ALIGN(0x10); /* align for .text.ngx_copy_file */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_copy_file); /* size 0x530 */
	. = . + 0x65; /* padding after .text.ngx_copy_file */
	. = ALIGN(0x10); /* align for .text.ngx_write_fd */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_write_fd); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_walk_tree */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_walk_tree); /* size 0x5c8 */
	. = . + 0x96; /* padding after .text.ngx_walk_tree */
	. = ALIGN(0x10); /* align for .text.ngx_de_info */
	"objs/arm_objs/src/core/ngx_file.o"(.text.ngx_de_info); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_table_init */
	"objs/arm_objs/src/core/ngx_crc32.o"(.text.ngx_crc32_table_init); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_murmur_hash2 */
	"objs/arm_objs/src/core/ngx_murmurhash.o"(.text.ngx_murmur_hash2); /* size 0x1bc */
	. = ALIGN(0x10); /* align for .text.ngx_md5_init */
	"objs/arm_objs/src/core/ngx_md5.o"(.text.ngx_md5_init); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.ngx_md5_update */
	"objs/arm_objs/src/core/ngx_md5.o"(.text.ngx_md5_update); /* size 0x138 */
	. = . + 0x5; /* padding after .text.ngx_md5_update */
	. = ALIGN(0x10); /* align for .text.ngx_md5_body */
	"objs/arm_objs/src/core/ngx_md5.o"(.text.ngx_md5_body); /* size 0x1e90 */
	. = ALIGN(0x10); /* align for .text.ngx_md5_final */
	"objs/arm_objs/src/core/ngx_md5.o"(.text.ngx_md5_final); /* size 0x338 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_insert */
	"objs/arm_objs/src/core/ngx_rbtree.o"(.text.ngx_rbtree_insert); /* size 0x2b0 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_left_rotate */
	"objs/arm_objs/src/core/ngx_rbtree.o"(.text.ngx_rbtree_left_rotate); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_right_rotate */
	"objs/arm_objs/src/core/ngx_rbtree.o"(.text.ngx_rbtree_right_rotate); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_insert_value */
	"objs/arm_objs/src/core/ngx_rbtree.o"(.text.ngx_rbtree_insert_value); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_insert_timer_value */
	"objs/arm_objs/src/core/ngx_rbtree.o"(.text.ngx_rbtree_insert_timer_value); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_delete */
	"objs/arm_objs/src/core/ngx_rbtree.o"(.text.ngx_rbtree_delete); /* size 0x5d0 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_min */
	"objs/arm_objs/src/core/ngx_rbtree.o"(.text.ngx_rbtree_min); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_radix_tree_create */
	"objs/arm_objs/src/core/ngx_radix_tree.o"(.text.ngx_radix_tree_create); /* size 0x1dc */
	. = . + 0x26; /* padding after .text.ngx_radix_tree_create */
	. = ALIGN(0x10); /* align for .text.ngx_radix_alloc */
	"objs/arm_objs/src/core/ngx_radix_tree.o"(.text.ngx_radix_alloc); /* size 0xec */
	. = ALIGN(0x10); /* align for .text.ngx_radix32tree_insert */
	"objs/arm_objs/src/core/ngx_radix_tree.o"(.text.ngx_radix32tree_insert); /* size 0x198 */
	. = . + 0x2; /* padding after .text.ngx_radix32tree_insert */
	. = ALIGN(0x10); /* align for .text.ngx_radix32tree_delete */
	"objs/arm_objs/src/core/ngx_radix_tree.o"(.text.ngx_radix32tree_delete); /* size 0x1ac */
	. = . + 0xa; /* padding after .text.ngx_radix32tree_delete */
	. = ALIGN(0x10); /* align for .text.ngx_radix32tree_find */
	"objs/arm_objs/src/core/ngx_radix_tree.o"(.text.ngx_radix32tree_find); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.ngx_slab_init */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_init); /* size 0x2e4 */
	. = ALIGN(0x10); /* align for .text.ngx_slab_alloc */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_alloc); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_slab_alloc_locked */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_alloc_locked); /* size 0xac0 */
	. = ALIGN(0x10); /* align for .text.ngx_slab_alloc_pages */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_alloc_pages); /* size 0x21c */
	. = ALIGN(0x10); /* align for .text.ngx_slab_free */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_free); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_slab_free_locked */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_free_locked); /* size 0x738 */
	. = ALIGN(0x10); /* align for .text.ngx_slab_error */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_error); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.ngx_slab_free_pages */
	"objs/arm_objs/src/core/ngx_slab.o"(.text.ngx_slab_free_pages); /* size 0xe0 */
	. = ALIGN(0x10); /* align for .text.ngx_time_init */
	"objs/arm_objs/src/core/ngx_times.o"(.text.ngx_time_init); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_time_update */
	"objs/arm_objs/src/core/ngx_times.o"(.text.ngx_time_update); /* size 0x66c */
	. = . + 0xe5; /* padding after .text.ngx_time_update */
	. = ALIGN(0x10); /* align for .text.ngx_gmtime */
	"objs/arm_objs/src/core/ngx_times.o"(.text.ngx_gmtime); /* size 0x2d8 */
	. = . + 0x4b; /* padding after .text.ngx_gmtime */
	. = ALIGN(0x10); /* align for .text.ngx_time_sigsafe_update */
	"objs/arm_objs/src/core/ngx_times.o"(.text.ngx_time_sigsafe_update); /* size 0x1ec */
	. = ALIGN(0x10); /* align for .text.ngx_http_time */
	"objs/arm_objs/src/core/ngx_times.o"(.text.ngx_http_time); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_cookie_time */
	"objs/arm_objs/src/core/ngx_times.o"(.text.ngx_http_cookie_time); /* size 0x11c */
	. = ALIGN(0x10); /* align for .text.ngx_next_time */
	"objs/arm_objs/src/core/ngx_times.o"(.text.ngx_next_time); /* size 0x120 */
	. = ALIGN(0x10); /* align for .text.ngx_shmtx_create */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.text.ngx_shmtx_create); /* size 0xec */
	. = ALIGN(0x10); /* align for .text.ngx_shmtx_destroy */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.text.ngx_shmtx_destroy); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.ngx_shmtx_trylock */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.text.ngx_shmtx_trylock); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.ngx_shmtx_lock */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.text.ngx_shmtx_lock); /* size 0x294 */
	. = ALIGN(0x10); /* align for .text.ngx_shmtx_unlock */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.text.ngx_shmtx_unlock); /* size 0x9c */
	. = ALIGN(0x10); /* align for .text.ngx_shmtx_wakeup */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.text.ngx_shmtx_wakeup); /* size 0x124 */
	. = ALIGN(0x10); /* align for .text.ngx_shmtx_force_unlock */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.text.ngx_shmtx_force_unlock); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_create_listening */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_create_listening); /* size 0x22c */
	. = ALIGN(0x10); /* align for .text.ngx_set_inherited_sockets */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_set_inherited_sockets); /* size 0x620 */
	. = ALIGN(0x10); /* align for .text.ngx_open_listening_sockets */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_open_listening_sockets); /* size 0x7b8 */
	. = ALIGN(0x10); /* align for .text.ngx_configure_listening_sockets */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_configure_listening_sockets); /* size 0x878 */
	. = ALIGN(0x10); /* align for .text.ngx_close_listening_sockets */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_close_listening_sockets); /* size 0x2dc */
	. = ALIGN(0x10); /* align for .text.ngx_free_connection */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_free_connection); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.ngx_get_connection */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_get_connection); /* size 0x2ec */
	. = ALIGN(0x10); /* align for .text.ngx_drain_connections */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_drain_connections); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_close_connection */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_close_connection); /* size 0x3a8 */
	. = . + 0x6; /* padding after .text.ngx_close_connection */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_reusable_connection */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_reusable_connection); /* size 0xc0 */
	. = . + 0x25; /* padding after .text.ngx_reusable_connection */
	. = ALIGN(0x10); /* align for .text.ngx_connection_local_sockaddr */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_connection_local_sockaddr); /* size 0x134 */
	. = . + 0x29; /* padding after .text.ngx_connection_local_sockaddr */
	. = ALIGN(0x10); /* align for .text.ngx_connection_error */
	"objs/arm_objs/src/core/ngx_connection.o"(.text.ngx_connection_error); /* size 0x140 */
	. = ALIGN(0x10); /* align for .text.ngx_init_cycle */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_init_cycle); /* size 0x1f10 */
	. = . + 0x400; /* padding after .text.ngx_init_cycle */
	. = ALIGN(0x10); /* align for .text.ngx_list_init */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_list_init); /* size 0xac */
	. = . + 0x2; /* padding after .text.ngx_list_init */
	. = ALIGN(0x10); /* align for .text.ngx_destroy_cycle_pools */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_destroy_cycle_pools); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_create_pidfile */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_create_pidfile); /* size 0x234 */
	. = ALIGN(0x10); /* align for .text.ngx_delete_pidfile */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_delete_pidfile); /* size 0xd0 */
	. = ALIGN(0x10); /* align for .text.ngx_test_lockfile */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_test_lockfile); /* size 0x1c */
	. = ALIGN(0x10); /* align for .text.ngx_init_zone_pool */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_init_zone_pool); /* size 0x124 */
	. = . + 0x15; /* padding after .text.ngx_init_zone_pool */
	. = ALIGN(0x10); /* align for .text.ngx_cmp_sockaddr */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_cmp_sockaddr); /* size 0x108 */
	. = ALIGN(0x10); /* align for .text.ngx_clean_old_cycles */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_clean_old_cycles); /* size 0x1c0 */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_signal_process */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_signal_process); /* size 0x31c */
	. = ALIGN(0x10); /* align for .text.ngx_reopen_files */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_reopen_files); /* size 0x800 */
	. = ALIGN(0x10); /* align for .text.ngx_write_fd */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_write_fd); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_shared_memory_add */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_shared_memory_add); /* size 0x2a8 */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/core/ngx_cycle.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_spinlock */
	"objs/arm_objs/src/core/ngx_spinlock.o"(.text.ngx_spinlock); /* size 0x15c */
	. = ALIGN(0x10); /* align for .text.ngx_cpuinfo */
	"objs/arm_objs/src/core/ngx_cpuinfo.o"(.text.ngx_cpuinfo); /* size 0x4 */
	. = . + 0x152; /* padding after .text.ngx_cpuinfo */
	. = ALIGN(0x10); /* align for .text.ngx_conf_flush_files */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_flush_files); /* size 0x204 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_param */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_param); /* size 0x14c */
	. = . + 0x1e; /* padding after .text.ngx_conf_param */
	. = ALIGN(0x10); /* align for .text.ngx_conf_parse */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_parse); /* size 0x508 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_log_error */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_log_error); /* size 0x20c */
	. = . + 0xef; /* padding after .text.ngx_conf_log_error */
	. = ALIGN(0x10); /* align for .text.ngx_conf_read_token */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_read_token); /* size 0x99c */
	. = . + 0x17d; /* padding after .text.ngx_conf_read_token */
	. = ALIGN(0x10); /* align for .text.ngx_conf_handler */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_handler); /* size 0x550 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_include */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_include); /* size 0x19c */
	. = . + 0x3b; /* padding after .text.ngx_conf_include */
	. = ALIGN(0x10); /* align for .text.ngx_conf_full_name */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_full_name); /* size 0x128 */
	. = . + 0xb; /* padding after .text.ngx_conf_full_name */
	. = ALIGN(0x10); /* align for .text.ngx_conf_test_full_name */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_test_full_name); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_open_file */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_open_file); /* size 0x1e0 */
	. = . + 0x2; /* padding after .text.ngx_conf_open_file */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_flag_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_flag_slot); /* size 0x148 */
	. = . + 0x7; /* padding after .text.ngx_conf_set_flag_slot */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_str_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_str_slot); /* size 0xd0 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_str_array_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_str_array_slot); /* size 0x124 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_keyval_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_keyval_slot); /* size 0x134 */
	. = . + 0x2; /* padding after .text.ngx_conf_set_keyval_slot */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_num_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_num_slot); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_size_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_size_slot); /* size 0xf0 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_off_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_off_slot); /* size 0xf0 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_msec_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_msec_slot); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_sec_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_sec_slot); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_bufs_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_bufs_slot); /* size 0x100 */
	. = . + 0x2; /* padding after .text.ngx_conf_set_bufs_slot */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_enum_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_enum_slot); /* size 0x160 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_set_bitmask_slot */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_set_bitmask_slot); /* size 0x230 */
	. = ALIGN(0x10); /* align for .text.ngx_conf_deprecated */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_deprecated); /* size 0x60 */
	. = . + 0x4; /* padding after .text.ngx_conf_deprecated */
	. = ALIGN(0x10); /* align for .text.ngx_conf_check_num_bounds */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_conf_check_num_bounds); /* size 0x114 */
	. = ALIGN(0x10); /* align for .text.ngx_write_fd */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.text.ngx_write_fd); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_create */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_create); /* size 0x528 */
	. = . + 0x12f; /* padding after .text.ngx_resolver_create */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_cleanup */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_cleanup); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_rbtree_insert_value */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_rbtree_insert_value); /* size 0x140 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_resend_handler */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_resend_handler); /* size 0xd8 */
	. = . + 0x12; /* padding after .text.ngx_resolver_resend_handler */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_resolve_start */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolve_start); /* size 0xe8 */
	. = . + 0xd; /* padding after .text.ngx_resolve_start */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_calloc */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_calloc); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_resolve_name */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolve_name); /* size 0xbc */
	. = . + 0x12; /* padding after .text.ngx_resolve_name */
	. = ALIGN(0x10); /* align for .text.ngx_resolve_name_locked */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolve_name_locked); /* size 0x6b4 */
	. = . + 0x6e; /* padding after .text.ngx_resolve_name_locked */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_free */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_free); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.ngx_resolve_name_done */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolve_name_done); /* size 0x1ac */
	. = . + 0x20; /* padding after .text.ngx_resolve_name_done */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_short */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_crc32_short); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_lookup_name */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_lookup_name); /* size 0x120 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_expire */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_expire); /* size 0xe0 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_free_locked */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_free_locked); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.ngx_resolve_addr */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolve_addr); /* size 0x45c */
	. = . + 0x61; /* padding after .text.ngx_resolve_addr */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_lookup_addr */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_lookup_addr); /* size 0xa4 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_dup */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_dup); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_alloc */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_alloc); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_create_addr_query */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_create_addr_query); /* size 0x1bc */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_send_query */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_send_query); /* size 0x1e8 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_timeout_handler */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_timeout_handler); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_resolve_addr_done */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolve_addr_done); /* size 0x1b4 */
	. = . + 0x43; /* padding after .text.ngx_resolve_addr_done */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_strerror */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_strerror); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.ngx_udp_connect */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_udp_connect); /* size 0x354 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_cleanup_tree */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_cleanup_tree); /* size 0xf0 */
	. = . + 0x1; /* padding after .text.ngx_resolver_cleanup_tree */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_min */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_rbtree_min); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_free_node */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_free_node); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_rotate */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_rotate); /* size 0x104 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_create_name_query */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_create_name_query); /* size 0x2bc */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_log_error */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_log_error); /* size 0xa8 */
	. = . + 0x7; /* padding after .text.ngx_resolver_log_error */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_read_response */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_read_response); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_process_response */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_process_response); /* size 0x564 */
	. = . + 0xc6; /* padding after .text.ngx_resolver_process_response */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_process_a */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_process_a); /* size 0xb70 */
	. = . + 0x22c; /* padding after .text.ngx_resolver_process_a */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_process_ptr */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_process_ptr); /* size 0x6e8 */
	. = . + 0x12d; /* padding after .text.ngx_resolver_process_ptr */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_copy */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_copy); /* size 0x2c0 */
	. = . + 0x22; /* padding after .text.ngx_resolver_copy */
	. = ALIGN(0x10); /* align for .text.ngx_resolver_resend */
	"objs/arm_objs/src/core/ngx_resolver.o"(.text.ngx_resolver_resend); /* size 0x150 */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_cache_init */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_cache_init); /* size 0x114 */
	. = . + 0x4; /* padding after .text.ngx_open_file_cache_init */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_cache_rbtree_insert_value */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_cache_rbtree_insert_value); /* size 0x128 */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_cache_cleanup */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_cache_cleanup); /* size 0x1e4 */
	. = ALIGN(0x10); /* align for .text.ngx_open_cached_file */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_cached_file); /* size 0xd50 */
	. = . + 0x206; /* padding after .text.ngx_open_cached_file */
	. = ALIGN(0x10); /* align for .text.ngx_file_info_wrapper */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_file_info_wrapper); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_open_and_stat_file */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_and_stat_file); /* size 0x4d4 */
	. = . + 0x7c; /* padding after .text.ngx_open_and_stat_file */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_long */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_crc32_long); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_lookup */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_lookup); /* size 0x114 */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_add_event */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_add_event); /* size 0x1c0 */
	. = . + 0x29; /* padding after .text.ngx_open_file_add_event */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_del_event */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_del_event); /* size 0xb4 */
	. = . + 0x6; /* padding after .text.ngx_open_file_del_event */
	. = ALIGN(0x10); /* align for .text.ngx_expire_old_cached_files */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_expire_old_cached_files); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_cleanup */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_cleanup); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_close_cached_file */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_close_cached_file); /* size 0x1a8 */
	. = . + 0x7; /* padding after .text.ngx_close_cached_file */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_wrapper */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_wrapper); /* size 0x9c */
	. = ALIGN(0x10); /* align for .text.ngx_open_file_cache_remove */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.text.ngx_open_file_cache_remove); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.ngx_crypt */
	"objs/arm_objs/src/core/ngx_crypt.o"(.text.ngx_crypt); /* size 0xb8 */
	. = . + 0x12; /* padding after .text.ngx_crypt */
	. = ALIGN(0x10); /* align for .text.ngx_crypt_apr1 */
	"objs/arm_objs/src/core/ngx_crypt.o"(.text.ngx_crypt_apr1); /* size 0x4b8 */
	. = . + 0xc1; /* padding after .text.ngx_crypt_apr1 */
	. = ALIGN(0x10); /* align for .text.ngx_crypt_plain */
	"objs/arm_objs/src/core/ngx_crypt.o"(.text.ngx_crypt_plain); /* size 0xb0 */
	. = . + 0x9; /* padding after .text.ngx_crypt_plain */
	. = ALIGN(0x10); /* align for .text.ngx_crypt_to64 */
	"objs/arm_objs/src/core/ngx_crypt.o"(.text.ngx_crypt_to64); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.ngx_event_core_create_conf */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_core_create_conf); /* size 0xac */
	. = . + 0x8; /* padding after .text.ngx_event_core_create_conf */
	. = ALIGN(0x10); /* align for .text.ngx_event_core_init_conf */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_core_init_conf); /* size 0x2d0 */
	. = . + 0x16; /* padding after .text.ngx_event_core_init_conf */
	. = ALIGN(0x10); /* align for .text.ngx_event_module_init */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_module_init); /* size 0x388 */
	. = . + 0x3a; /* padding after .text.ngx_event_module_init */
	. = ALIGN(0x10); /* align for .text.ngx_event_process_init */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_process_init); /* size 0x954 */
	. = . + 0xd6; /* padding after .text.ngx_event_process_init */
	. = ALIGN(0x10); /* align for .text.ngx_process_events_and_timers */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_process_events_and_timers); /* size 0x25c */
	. = . + 0x12; /* padding after .text.ngx_process_events_and_timers */
	. = ALIGN(0x10); /* align for .text.ngx_handle_read_event */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_handle_read_event); /* size 0x2b4 */
	. = . + 0x23; /* padding after .text.ngx_handle_read_event */
	. = ALIGN(0x10); /* align for .text.ngx_handle_write_event */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_handle_write_event); /* size 0x2dc */
	. = . + 0x2b; /* padding after .text.ngx_handle_write_event */
	. = ALIGN(0x10); /* align for .text.ngx_send_lowat */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_send_lowat); /* size 0xec */
	. = . + 0x5; /* padding after .text.ngx_send_lowat */
	. = ALIGN(0x10); /* align for .text.ngx_event_init_conf */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_init_conf); /* size 0xbc */
	. = ALIGN(0x10); /* align for .text.ngx_events_block */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_events_block); /* size 0x3b0 */
	. = . + 0x69; /* padding after .text.ngx_events_block */
	. = ALIGN(0x10); /* align for .text.ngx_event_connections */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_connections); /* size 0x154 */
	. = ALIGN(0x10); /* align for .text.ngx_event_use */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_use); /* size 0x290 */
	. = . + 0x4; /* padding after .text.ngx_event_use */
	. = ALIGN(0x10); /* align for .text.ngx_event_debug_connection */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_event_debug_connection); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_timer_signal_handler */
	"objs/arm_objs/src/event/ngx_event.o"(.text.ngx_timer_signal_handler); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_event_timer_init */
	"objs/arm_objs/src/event/ngx_event_timer.o"(.text.ngx_event_timer_init); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_event_find_timer */
	"objs/arm_objs/src/event/ngx_event_timer.o"(.text.ngx_event_find_timer); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.ngx_rbtree_min */
	"objs/arm_objs/src/event/ngx_event_timer.o"(.text.ngx_rbtree_min); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_event_expire_timers */
	"objs/arm_objs/src/event/ngx_event_timer.o"(.text.ngx_event_expire_timers); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_event_process_posted */
	"objs/arm_objs/src/event/ngx_event_posted.o"(.text.ngx_event_process_posted); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_wakeup_worker_thread */
	"objs/arm_objs/src/event/ngx_event_posted.o"(.text.ngx_wakeup_worker_thread); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_event_busy_lock */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_busy_lock); /* size 0x100 */
	. = . + 0x1; /* padding after .text.ngx_event_busy_lock */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_event_busy_lock_handler */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_busy_lock_handler); /* size 0x78 */
	. = . + 0xe; /* padding after .text.ngx_event_busy_lock_handler */
	. = ALIGN(0x10); /* align for .text.ngx_event_busy_lock_cacheable */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_busy_lock_cacheable); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.ngx_event_busy_lock_look_cacheable */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_busy_lock_look_cacheable); /* size 0x238 */
	. = . + 0x2; /* padding after .text.ngx_event_busy_lock_look_cacheable */
	. = ALIGN(0x10); /* align for .text.ngx_event_busy_unlock */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_busy_unlock); /* size 0x220 */
	. = . + 0x23; /* padding after .text.ngx_event_busy_unlock */
	. = ALIGN(0x10); /* align for .text.ngx_event_busy_lock_posted_handler */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_busy_lock_posted_handler); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_event_busy_lock_cancel */
	"objs/arm_objs/src/event/ngx_event_busy_lock.o"(.text.ngx_event_busy_lock_cancel); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.ngx_event_accept */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_event_accept); /* size 0x9b4 */
	. = ALIGN(0x10); /* align for .text.ngx_enable_accept_events */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_enable_accept_events); /* size 0x10c */
	. = . + 0x2; /* padding after .text.ngx_enable_accept_events */
	. = ALIGN(0x10); /* align for .text.ngx_disable_accept_events */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_disable_accept_events); /* size 0x10c */
	. = . + 0xc; /* padding after .text.ngx_disable_accept_events */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_close_accepted_connection */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_close_accepted_connection); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_trylock_accept_mutex */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_trylock_accept_mutex); /* size 0xf8 */
	. = . + 0x14; /* padding after .text.ngx_trylock_accept_mutex */
	. = ALIGN(0x10); /* align for .text.ngx_accept_log_error */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_accept_log_error); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_event_connect_peer */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.text.ngx_event_connect_peer); /* size 0x6ac */
	. = . + 0x23; /* padding after .text.ngx_event_connect_peer */
	. = ALIGN(0x10); /* align for .text.ngx_event_get_peer */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.text.ngx_event_get_peer); /* size 0x1c */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe); /* size 0x2c0 */
	. = . + 0x4d; /* padding after .text.ngx_event_pipe */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe_write_to_downstream */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe_write_to_downstream); /* size 0x788 */
	. = . + 0x57; /* padding after .text.ngx_event_pipe_write_to_downstream */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe_read_upstream */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe_read_upstream); /* size 0x944 */
	. = . + 0x9d; /* padding after .text.ngx_event_pipe_read_upstream */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe_copy_input_filter */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe_copy_input_filter); /* size 0x214 */
	. = . + 0x9; /* padding after .text.ngx_event_pipe_copy_input_filter */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe_add_free_buf */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe_add_free_buf); /* size 0x174 */
	. = . + 0x15; /* padding after .text.ngx_event_pipe_add_free_buf */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe_write_chain_to_temp_file */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe_write_chain_to_temp_file); /* size 0x568 */
	. = . + 0x51; /* padding after .text.ngx_event_pipe_write_chain_to_temp_file */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe_remove_shadow_links */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe_remove_shadow_links); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_event_pipe_drain_chains */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.text.ngx_event_pipe_drain_chains); /* size 0x158 */
	. = . + 0x10; /* padding after .text.ngx_event_pipe_drain_chains */
	. = ALIGN(0x10); /* align for .text.ngx_timezone_update */
	"objs/arm_objs/src/os/unix/ngx_time.o"(.text.ngx_timezone_update); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.ngx_localtime */
	"objs/arm_objs/src/os/unix/ngx_time.o"(.text.ngx_localtime); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.ngx_libc_localtime */
	"objs/arm_objs/src/os/unix/ngx_time.o"(.text.ngx_libc_localtime); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_libc_gmtime */
	"objs/arm_objs/src/os/unix/ngx_time.o"(.text.ngx_libc_gmtime); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_strerror */
	"objs/arm_objs/src/os/unix/ngx_errno.o"(.text.ngx_strerror); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.ngx_strerror_init */
	"objs/arm_objs/src/os/unix/ngx_errno.o"(.text.ngx_strerror_init); /* size 0x144 */
	. = ALIGN(0x10); /* align for .text.ngx_alloc */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.text.ngx_alloc); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_calloc */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.text.ngx_calloc); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_memalign */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.text.ngx_memalign); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.ngx_read_file */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_read_file); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.ngx_write_file */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_write_file); /* size 0x118 */
	. = ALIGN(0x10); /* align for .text.ngx_open_tempfile */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_open_tempfile); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.ngx_write_chain_to_file */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_write_chain_to_file); /* size 0x400 */
	. = . + 0xf; /* padding after .text.ngx_write_chain_to_file */
	. = ALIGN(0x10); /* align for .text.ngx_set_file_time */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_set_file_time); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.ngx_create_file_mapping */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_create_file_mapping); /* size 0x210 */
	. = . + 0xb; /* padding after .text.ngx_create_file_mapping */
	. = ALIGN(0x10); /* align for .text.ngx_close_file_mapping */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_close_file_mapping); /* size 0xec */
	. = ALIGN(0x10); /* align for .text.ngx_open_dir */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_open_dir); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.ngx_read_dir */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_read_dir); /* size 0x78 */
	. = . + 0x4; /* padding after .text.ngx_read_dir */
	. = ALIGN(0x10); /* align for .text.ngx_open_glob */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_open_glob); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.ngx_read_glob */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_read_glob); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.ngx_close_glob */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_close_glob); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.ngx_trylock_fd */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_trylock_fd); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_lock_fd */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_lock_fd); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_unlock_fd */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_unlock_fd); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_read_ahead */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_read_ahead); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.ngx_directio_on */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_directio_on); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_directio_off */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_directio_off); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_fs_bsize */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.text.ngx_fs_bsize); /* size 0x64 */
	. = . + 0x7; /* padding after .text.ngx_fs_bsize */
	. = ALIGN(0x10); /* align for .text.ngx_nonblocking */
	"objs/arm_objs/src/os/unix/ngx_socket.o"(.text.ngx_nonblocking); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_blocking */
	"objs/arm_objs/src/os/unix/ngx_socket.o"(.text.ngx_blocking); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.ngx_tcp_nopush */
	"objs/arm_objs/src/os/unix/ngx_socket.o"(.text.ngx_tcp_nopush); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_tcp_push */
	"objs/arm_objs/src/os/unix/ngx_socket.o"(.text.ngx_tcp_push); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_unix_recv */
	"objs/arm_objs/src/os/unix/ngx_recv.o"(.text.ngx_unix_recv); /* size 0x170 */
	. = ALIGN(0x10); /* align for .text.ngx_readv_chain */
	"objs/arm_objs/src/os/unix/ngx_readv_chain.o"(.text.ngx_readv_chain); /* size 0x2b4 */
	. = ALIGN(0x10); /* align for .text.ngx_udp_unix_recv */
	"objs/arm_objs/src/os/unix/ngx_udp_recv.o"(.text.ngx_udp_unix_recv); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.ngx_unix_send */
	"objs/arm_objs/src/os/unix/ngx_send.o"(.text.ngx_unix_send); /* size 0x184 */
	. = ALIGN(0x10); /* align for .text.ngx_writev_chain */
	"objs/arm_objs/src/os/unix/ngx_writev_chain.o"(.text.ngx_writev_chain); /* size 0x610 */
	. = . + 0xeb; /* padding after .text.ngx_writev_chain */
	. = ALIGN(0x10); /* align for .text.ngx_write_channel */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.text.ngx_write_channel); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.ngx_read_channel */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.text.ngx_read_channel); /* size 0x270 */
	. = ALIGN(0x10); /* align for .text.ngx_add_channel_event */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.text.ngx_add_channel_event); /* size 0x1a8 */
	. = ALIGN(0x10); /* align for .text.ngx_close_channel */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.text.ngx_close_channel); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_shm_alloc */
	"objs/arm_objs/src/os/unix/ngx_shmem.o"(.text.ngx_shm_alloc); /* size 0xb8 */
	. = . + 0x5; /* padding after .text.ngx_shm_alloc */
	. = ALIGN(0x10); /* align for .text.ngx_shm_free */
	"objs/arm_objs/src/os/unix/ngx_shmem.o"(.text.ngx_shm_free); /* size 0x8c */
	. = ALIGN(0x10); /* align for .text.ngx_signal_handler */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_signal_handler); /* size 0x44c */
	. = . + 0x15; /* padding after .text.ngx_signal_handler */
	. = ALIGN(0x10); /* align for .text.ngx_spawn_process */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_spawn_process); /* size 0xad0 */
	. = ALIGN(0x10); /* align for .text.ngx_execute */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_execute); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.ngx_execute_proc */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_execute_proc); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_init_signals */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_init_signals); /* size 0x12c */
	. = . + 0x2a; /* padding after .text.ngx_init_signals */
	. = ALIGN(0x10); /* align for .text.ngx_debug_point */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_debug_point); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.ngx_os_signal_process */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_os_signal_process); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.ngx_process_get_status */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_process_get_status); /* size 0x3e8 */
	. = ALIGN(0x10); /* align for .text.ngx_unlock_mutexes */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.text.ngx_unlock_mutexes); /* size 0x194 */
	. = . + 0x2; /* padding after .text.ngx_unlock_mutexes */
	. = ALIGN(0x10); /* align for .text.ngx_daemon */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.text.ngx_daemon); /* size 0x290 */
	. = ALIGN(0x10); /* align for .text.ngx_setaffinity */
	"objs/arm_objs/src/os/unix/ngx_setaffinity.o"(.text.ngx_setaffinity); /* size 0x150 */
	. = . + 0x1d; /* padding after .text.ngx_setaffinity */
	. = ALIGN(0x10); /* align for .text.ngx_init_setproctitle */
	"objs/arm_objs/src/os/unix/ngx_setproctitle.o"(.text.ngx_init_setproctitle); /* size 0x2ec */
	. = ALIGN(0x10); /* align for .text.ngx_setproctitle */
	"objs/arm_objs/src/os/unix/ngx_setproctitle.o"(.text.ngx_setproctitle); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_os_init */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.text.ngx_os_init); /* size 0x18c */
	. = ALIGN(0x10); /* align for .text.ngx_os_status */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.text.ngx_os_status); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.ngx_libc_crypt */
	"objs/arm_objs/src/os/unix/ngx_user.o"(.text.ngx_libc_crypt); /* size 0xf4 */
	. = . + 0xd; /* padding after .text.ngx_libc_crypt */
	. = ALIGN(0x10); /* align for .text.ngx_master_process_cycle */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_master_process_cycle); /* size 0x840 */
	. = . + 0xeb; /* padding after .text.ngx_master_process_cycle */
	. = ALIGN(0x10); /* align for .text.ngx_start_worker_processes */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_start_worker_processes); /* size 0x144 */
	. = ALIGN(0x10); /* align for .text.ngx_start_cache_manager_processes */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_start_cache_manager_processes); /* size 0x224 */
	. = . + 0x5; /* padding after .text.ngx_start_cache_manager_processes */
	. = ALIGN(0x10); /* align for .text.ngx_reap_children */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_reap_children); /* size 0x598 */
	. = ALIGN(0x10); /* align for .text.ngx_master_process_exit */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_master_process_exit); /* size 0x174 */
	. = . + 0x18; /* padding after .text.ngx_master_process_exit */
	. = ALIGN(0x10); /* align for .text.ngx_signal_worker_processes */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_signal_worker_processes); /* size 0x388 */
	. = ALIGN(0x10); /* align for .text.ngx_single_process_cycle */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_single_process_cycle); /* size 0x274 */
	. = . + 0x29; /* padding after .text.ngx_single_process_cycle */
	. = ALIGN(0x10); /* align for .text.ngx_worker_process_cycle */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_worker_process_cycle); /* size 0x308 */
	. = . + 0x24; /* padding after .text.ngx_worker_process_cycle */
	. = ALIGN(0x10); /* align for .text.ngx_pass_open_channel */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_pass_open_channel); /* size 0x128 */
	. = ALIGN(0x10); /* align for .text.ngx_worker_process_init */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_worker_process_init); /* size 0x8c0 */
	. = . + 0x101; /* padding after .text.ngx_worker_process_init */
	. = ALIGN(0x10); /* align for .text.ngx_worker_process_exit */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_worker_process_exit); /* size 0x338 */
	. = . + 0x22; /* padding after .text.ngx_worker_process_exit */
	. = ALIGN(0x10); /* align for .text.ngx_channel_handler */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_channel_handler); /* size 0x264 */
	. = ALIGN(0x10); /* align for .text.ngx_cache_manager_process_cycle */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_cache_manager_process_cycle); /* size 0x1a8 */
	. = . + 0x3b; /* padding after .text.ngx_cache_manager_process_cycle */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_event_add_timer); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_event_del_timer); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.ngx_cache_manager_process_handler */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_cache_manager_process_handler); /* size 0x128 */
	. = . + 0x8; /* padding after .text.ngx_cache_manager_process_handler */
	. = ALIGN(0x10); /* align for .text.ngx_cache_loader_process_handler */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.text.ngx_cache_loader_process_handler); /* size 0xd4 */
	. = . + 0x10; /* padding after .text.ngx_cache_loader_process_handler */
	. = ALIGN(0x10); /* align for .text.ngx_os_specific_init */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.text.ngx_os_specific_init); /* size 0xd8 */
	. = . + 0x30; /* padding after .text.ngx_os_specific_init */
	. = ALIGN(0x10); /* align for .text.ngx_os_specific_status */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.text.ngx_os_specific_status); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_create_conf */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_create_conf); /* size 0x64 */
	. = . + 0x1; /* padding after .text.ngx_epoll_create_conf */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_init_conf */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_init_conf); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_add_event */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_add_event); /* size 0x17c */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_del_event */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_del_event); /* size 0x18c */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_add_connection */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_add_connection); /* size 0x104 */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_del_connection */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_del_connection); /* size 0x120 */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_process_events */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_process_events); /* size 0x4cc */
	. = . + 0xe; /* padding after .text.ngx_epoll_process_events */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_init */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_init); /* size 0x214 */
	. = ALIGN(0x10); /* align for .text.ngx_epoll_done */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.text.ngx_epoll_done); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.ngx_linux_sendfile_chain */
	"objs/arm_objs/src/os/unix/ngx_linux_sendfile_chain.o"(.text.ngx_linux_sendfile_chain); /* size 0xda8 */
	. = . + 0x25d; /* padding after .text.ngx_linux_sendfile_chain */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_location */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_add_location); /* size 0x1c8 */
	. = . + 0x6; /* padding after .text.ngx_http_add_location */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_listen */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_add_listen); /* size 0x1f4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_addresses */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_add_addresses); /* size 0x2c0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_address */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_add_address); /* size 0xf8 */
	. = . + 0x35; /* padding after .text.ngx_http_add_address */
	. = ALIGN(0x10); /* align for .text.ngx_http_types_slot */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_types_slot); /* size 0x360 */
	. = ALIGN(0x10); /* align for .text.ngx_http_merge_types */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_merge_types); /* size 0x1e0 */
	. = . + 0x23; /* padding after .text.ngx_http_merge_types */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_default_types */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_set_default_types); /* size 0xec */
	. = . + 0xd; /* padding after .text.ngx_http_set_default_types */
	. = ALIGN(0x10); /* align for .text.ngx_http_block */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_block); /* size 0x860 */
	. = ALIGN(0x10); /* align for .text.ngx_http_merge_servers */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_merge_servers); /* size 0x284 */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_locations */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_init_locations); /* size 0x278 */
	. = . + 0x1e; /* padding after .text.ngx_http_init_locations */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_static_location_trees */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_init_static_location_trees); /* size 0x144 */
	. = . + 0x1d; /* padding after .text.ngx_http_init_static_location_trees */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_phases */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_init_phases); /* size 0x174 */
	. = . + 0xca; /* padding after .text.ngx_http_init_phases */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_headers_in_hash */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_init_headers_in_hash); /* size 0x170 */
	. = . + 0x36; /* padding after .text.ngx_http_init_headers_in_hash */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_phase_handlers */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_init_phase_handlers); /* size 0x3b8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_optimize_servers */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_optimize_servers); /* size 0x18c */
	. = ALIGN(0x10); /* align for .text.ngx_http_merge_locations */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_merge_locations); /* size 0x19c */
	. = ALIGN(0x10); /* align for .text.ngx_http_cmp_locations */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_cmp_locations); /* size 0x264 */
	. = . + 0x18; /* padding after .text.ngx_http_cmp_locations */
	. = ALIGN(0x10); /* align for .text.ngx_http_join_exact_locations */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_join_exact_locations); /* size 0x15c */
	. = . + 0x9; /* padding after .text.ngx_http_join_exact_locations */
	. = ALIGN(0x10); /* align for .text.ngx_http_create_locations_list */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_create_locations_list); /* size 0x274 */
	. = ALIGN(0x10); /* align for .text.ngx_http_create_locations_tree */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_create_locations_tree); /* size 0x2e8 */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_cmp_conf_addrs */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_cmp_conf_addrs); /* size 0xec */
	. = . + 0x7; /* padding after .text.ngx_http_cmp_conf_addrs */
	. = ALIGN(0x10); /* align for .text.ngx_http_server_names */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_server_names); /* size 0x3b0 */
	. = . + 0x91; /* padding after .text.ngx_http_server_names */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_listening */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_init_listening); /* size 0x1e0 */
	. = . + 0x4; /* padding after .text.ngx_http_init_listening */
	. = ALIGN(0x10); /* align for .text.ngx_http_cmp_dns_wildcards */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_cmp_dns_wildcards); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_listening */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_add_listening); /* size 0x1d8 */
	. = . + 0x7; /* padding after .text.ngx_http_add_listening */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_addrs */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_add_addrs); /* size 0x248 */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_server */
	"objs/arm_objs/src/http/ngx_http.o"(.text.ngx_http_add_server); /* size 0x12c */
	. = . + 0x25; /* padding after .text.ngx_http_add_server */
	. = ALIGN(0x10); /* align for .text.ngx_http_handler */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_handler); /* size 0x1c8 */
	. = . + 0x85; /* padding after .text.ngx_http_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_run_phases */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_run_phases); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_generic_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_generic_phase); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_rewrite_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_rewrite_phase); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_find_config_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_find_config_phase); /* size 0x304 */
	. = . + 0x8b; /* padding after .text.ngx_http_core_find_config_phase */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_find_location */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_find_location); /* size 0x9c */
	. = ALIGN(0x10); /* align for .text.ngx_http_update_location_config */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_update_location_config); /* size 0x390 */
	. = . + 0x159; /* padding after .text.ngx_http_update_location_config */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_post_rewrite_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_post_rewrite_phase); /* size 0x144 */
	. = . + 0x22; /* padding after .text.ngx_http_core_post_rewrite_phase */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_access_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_access_phase); /* size 0x1a4 */
	. = . + 0x31; /* padding after .text.ngx_http_core_access_phase */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_post_access_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_post_access_phase); /* size 0xbc */
	. = . + 0xe; /* padding after .text.ngx_http_core_post_access_phase */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_try_files_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_try_files_phase); /* size 0x6e8 */
	. = . + 0x10b; /* padding after .text.ngx_http_core_try_files_phase */
	. = ALIGN(0x10); /* align for .text.ngx_http_map_uri_to_path */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_map_uri_to_path); /* size 0x274 */
	. = ALIGN(0x10); /* align for .text.ngx_http_named_location */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_named_location); /* size 0x2c8 */
	. = . + 0x30; /* padding after .text.ngx_http_named_location */
	. = ALIGN(0x10); /* align for .text.ngx_http_internal_redirect */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_internal_redirect); /* size 0x22c */
	. = . + 0x7b; /* padding after .text.ngx_http_internal_redirect */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_disable_symlinks */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_set_disable_symlinks); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_exten */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_set_exten); /* size 0xf4 */
	. = . + 0x10; /* padding after .text.ngx_http_set_exten */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_content_phase */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_content_phase); /* size 0x1cc */
	. = . + 0x17; /* padding after .text.ngx_http_core_content_phase */
	. = ALIGN(0x10); /* align for .text.ngx_http_test_content_type */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_test_content_type); /* size 0x19c */
	. = . + 0x12; /* padding after .text.ngx_http_test_content_type */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_content_type */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_set_content_type); /* size 0x1c4 */
	. = . + 0x3b; /* padding after .text.ngx_http_set_content_type */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_etag */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_set_etag); /* size 0x120 */
	. = . + 0x15; /* padding after .text.ngx_http_set_etag */
	. = ALIGN(0x10); /* align for .text.ngx_http_send_response */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_send_response); /* size 0x31c */
	. = . + 0x62; /* padding after .text.ngx_http_send_response */
	. = ALIGN(0x10); /* align for .text.ngx_http_send_header */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_send_header); /* size 0x54 */
	. = . + 0x3; /* padding after .text.ngx_http_send_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_output_filter */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_output_filter); /* size 0x6c */
	. = . + 0x2; /* padding after .text.ngx_http_output_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_user */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_auth_basic_user); /* size 0x294 */
	. = . + 0x49; /* padding after .text.ngx_http_auth_basic_user */
	. = ALIGN(0x10); /* align for .text.ngx_http_subrequest */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_subrequest); /* size 0x62c */
	. = . + 0x165; /* padding after .text.ngx_http_subrequest */
	. = ALIGN(0x10); /* align for .text.ngx_list_init */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_list_init); /* size 0xac */
	. = . + 0x2; /* padding after .text.ngx_list_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_cleanup_add */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_cleanup_add); /* size 0xd4 */
	. = . + 0xe; /* padding after .text.ngx_http_cleanup_add */
	. = ALIGN(0x10); /* align for .text.ngx_http_get_forwarded_addr */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_get_forwarded_addr); /* size 0x298 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_preconfiguration */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_preconfiguration); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_create_main_conf */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_create_main_conf); /* size 0x9c */
	. = . + 0x24; /* padding after .text.ngx_http_core_create_main_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_init_main_conf */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_init_main_conf); /* size 0x134 */
	. = . + 0xc; /* padding after .text.ngx_http_core_init_main_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_create_srv_conf */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_create_srv_conf); /* size 0xb4 */
	. = . + 0x27; /* padding after .text.ngx_http_core_create_srv_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_merge_srv_conf */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_merge_srv_conf); /* size 0x378 */
	. = . + 0x2b; /* padding after .text.ngx_http_core_merge_srv_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_create_loc_conf */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_create_loc_conf); /* size 0x1c4 */
	. = . + 0x13f; /* padding after .text.ngx_http_core_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_merge_loc_conf */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_merge_loc_conf); /* size 0x11c8 */
	. = . + 0x4d9; /* padding after .text.ngx_http_core_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_server */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_server); /* size 0x450 */
	. = . + 0x4f; /* padding after .text.ngx_http_core_server */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_location */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_location); /* size 0x810 */
	. = . + 0x4d; /* padding after .text.ngx_http_core_location */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_listen */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_listen); /* size 0xb08 */
	. = . + 0xa3; /* padding after .text.ngx_http_core_listen */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_server_name */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_server_name); /* size 0x2cc */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_types */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_types); /* size 0xe8 */
	. = . + 0x26; /* padding after .text.ngx_http_core_types */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_root */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_root); /* size 0x3a4 */
	. = . + 0x3f; /* padding after .text.ngx_http_core_root */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_limit_except */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_limit_except); /* size 0x424 */
	. = . + 0x28; /* padding after .text.ngx_http_core_limit_except */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_directio */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_directio); /* size 0xcc */
	. = . + 0x15; /* padding after .text.ngx_http_core_directio */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_keepalive */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_keepalive); /* size 0xfc */
	. = . + 0x11; /* padding after .text.ngx_http_core_keepalive */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_internal */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_internal); /* size 0x58 */
	. = . + 0x2; /* padding after .text.ngx_http_core_internal */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_error_page */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_error_page); /* size 0x4c4 */
	. = . + 0x1f; /* padding after .text.ngx_http_core_error_page */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_try_files */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_try_files); /* size 0x468 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_error_log */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_error_log); /* size 0x10c */
	. = . + 0x1c; /* padding after .text.ngx_http_core_error_log */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_open_file_cache */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_open_file_cache); /* size 0x2b4 */
	. = . + 0x6; /* padding after .text.ngx_http_core_open_file_cache */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_resolver */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_resolver); /* size 0xa4 */
	. = . + 0x12; /* padding after .text.ngx_http_core_resolver */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_pool_size */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_pool_size); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_regex_location */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_regex_location); /* size 0x50 */
	. = . + 0x8; /* padding after .text.ngx_http_core_regex_location */
	. = ALIGN(0x10); /* align for .text.ngx_strlchr */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_strlchr); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_type */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_type); /* size 0x2d0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_lowat_check */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_lowat_check); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.ngx_http_core_find_static_location */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.text.ngx_http_core_find_static_location); /* size 0x248 */
	. = . + 0x13; /* padding after .text.ngx_http_core_find_static_location */
	. = ALIGN(0x10); /* align for .text.ngx_http_special_response_handler */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.text.ngx_http_special_response_handler); /* size 0x3a4 */
	. = . + 0xf2; /* padding after .text.ngx_http_special_response_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_send_error_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.text.ngx_http_send_error_page); /* size 0x294 */
	. = . + 0x5f; /* padding after .text.ngx_http_send_error_page */
	. = ALIGN(0x10); /* align for .text.ngx_http_send_refresh */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.text.ngx_http_send_refresh); /* size 0x314 */
	. = . + 0x90; /* padding after .text.ngx_http_send_refresh */
	. = ALIGN(0x10); /* align for .text.ngx_http_send_special_response */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.text.ngx_http_send_special_response); /* size 0x498 */
	. = . + 0x76; /* padding after .text.ngx_http_send_special_response */
	. = ALIGN(0x10); /* align for .text.ngx_http_filter_finalize_request */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.text.ngx_http_filter_finalize_request); /* size 0x118 */
	. = ALIGN(0x10); /* align for .text.ngx_http_clean_header */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.text.ngx_http_clean_header); /* size 0x84 */
	. = . + 0x1; /* padding after .text.ngx_http_clean_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_host */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_host); /* size 0x11c */
	. = . + 0x1d; /* padding after .text.ngx_http_process_host */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_connection */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_connection); /* size 0xa4 */
	. = . + 0xd; /* padding after .text.ngx_http_process_connection */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_unique_header_line */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_unique_header_line); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_user_agent */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_user_agent); /* size 0x314 */
	. = . + 0x52; /* padding after .text.ngx_http_process_user_agent */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_header_line */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_header_line); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_cookie */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_cookie); /* size 0x6c */
	. = . + 0x8; /* padding after .text.ngx_http_process_cookie */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_connection */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_init_connection); /* size 0x1ac */
	. = . + 0x3f; /* padding after .text.ngx_http_init_connection */
	. = ALIGN(0x10); /* align for .text.ngx_http_close_connection */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_close_connection); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_error */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_log_error); /* size 0x128 */
	. = . + 0xd; /* padding after .text.ngx_http_log_error */
	. = ALIGN(0x10); /* align for .text.ngx_http_init_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_init_request); /* size 0x650 */
	. = . + 0xc6; /* padding after .text.ngx_http_init_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_empty_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_empty_handler); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_run_posted_requests */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_run_posted_requests); /* size 0xa8 */
	. = . + 0xd; /* padding after .text.ngx_http_run_posted_requests */
	. = ALIGN(0x10); /* align for .text.ngx_http_post_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_post_request); /* size 0xb4 */
	. = . + 0xc; /* padding after .text.ngx_http_post_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_finalize_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_finalize_request); /* size 0x65c */
	. = . + 0x128; /* padding after .text.ngx_http_finalize_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_finalize_connection */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_finalize_connection); /* size 0x1a8 */
	. = . + 0x31; /* padding after .text.ngx_http_finalize_connection */
	. = ALIGN(0x10); /* align for .text.ngx_http_post_action */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_post_action); /* size 0x15c */
	. = . + 0x31; /* padding after .text.ngx_http_post_action */
	. = ALIGN(0x10); /* align for .text.ngx_http_request_finalizer */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_request_finalizer); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.ngx_http_terminate_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_terminate_request); /* size 0x114 */
	. = . + 0x24; /* padding after .text.ngx_http_terminate_request */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_request_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_request_handler); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_write_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_set_write_handler); /* size 0x128 */
	. = . + 0x2c; /* padding after .text.ngx_http_set_write_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_log_request); /* size 0xa4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_request_empty_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_request_empty_handler); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_http_close_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_close_request); /* size 0xe0 */
	. = . + 0x19; /* padding after .text.ngx_http_close_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_block_reading */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_block_reading); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_test_reading */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_test_reading); /* size 0x1a4 */
	. = . + 0x16; /* padding after .text.ngx_http_test_reading */
	. = ALIGN(0x10); /* align for .text.ngx_http_send_special */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_send_special); /* size 0x134 */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_request_line */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_request_line); /* size 0x6e4 */
	. = . + 0x148; /* padding after .text.ngx_http_process_request_line */
	. = ALIGN(0x10); /* align for .text.ngx_list_init */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_list_init); /* size 0xac */
	. = . + 0x2; /* padding after .text.ngx_list_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_error_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_log_error_handler); /* size 0x300 */
	. = . + 0x5f; /* padding after .text.ngx_http_log_error_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_read_request_header */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_read_request_header); /* size 0x20c */
	. = . + 0x5; /* padding after .text.ngx_http_read_request_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_validate_host */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_validate_host); /* size 0x218 */
	. = . + 0x19; /* padding after .text.ngx_http_validate_host */
	. = ALIGN(0x10); /* align for .text.ngx_http_find_virtual_server */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_find_virtual_server); /* size 0x138 */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_request); /* size 0xe0 */
	. = . + 0xd; /* padding after .text.ngx_http_process_request */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_request_headers */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_request_headers); /* size 0x604 */
	. = . + 0x7c; /* padding after .text.ngx_http_process_request_headers */
	. = ALIGN(0x10); /* align for .text.ngx_http_alloc_large_header_buffer */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_alloc_large_header_buffer); /* size 0x548 */
	. = . + 0x8d; /* padding after .text.ngx_http_alloc_large_header_buffer */
	. = ALIGN(0x10); /* align for .text.ngx_http_process_request_header */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_process_request_header); /* size 0x33c */
	. = . + 0x77; /* padding after .text.ngx_http_process_request_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_terminate_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_terminate_handler); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_keepalive */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_set_keepalive); /* size 0x738 */
	. = . + 0x83; /* padding after .text.ngx_http_set_keepalive */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_lingering_close */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_set_lingering_close); /* size 0x1b8 */
	. = . + 0xa; /* padding after .text.ngx_http_set_lingering_close */
	. = ALIGN(0x10); /* align for .text.ngx_http_free_request */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_free_request); /* size 0x21c */
	. = . + 0x26; /* padding after .text.ngx_http_free_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_keepalive_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_keepalive_handler); /* size 0x274 */
	. = . + 0x2f; /* padding after .text.ngx_http_keepalive_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_lingering_close_handler */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_lingering_close_handler); /* size 0x18c */
	. = ALIGN(0x10); /* align for .text.ngx_http_writer */
	"objs/arm_objs/src/http/ngx_http_request.o"(.text.ngx_http_writer); /* size 0x264 */
	. = . + 0x53; /* padding after .text.ngx_http_writer */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_request_line */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_parse_request_line); /* size 0x1584 */
	. = . + 0x269; /* padding after .text.ngx_http_parse_request_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_header_line */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_parse_header_line); /* size 0x6cc */
	. = . + 0xda; /* padding after .text.ngx_http_parse_header_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_complex_uri */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_parse_complex_uri); /* size 0xa7c */
	. = . + 0x130; /* padding after .text.ngx_http_parse_complex_uri */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_status_line */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_parse_status_line); /* size 0x544 */
	. = . + 0x24; /* padding after .text.ngx_http_parse_status_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_unsafe_uri */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_parse_unsafe_uri); /* size 0x220 */
	. = . + 0x6; /* padding after .text.ngx_http_parse_unsafe_uri */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_multi_header_lines */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_parse_multi_header_lines); /* size 0x350 */
	. = ALIGN(0x10); /* align for .text.ngx_http_arg */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_arg); /* size 0x170 */
	. = . + 0x8; /* padding after .text.ngx_http_arg */
	. = ALIGN(0x10); /* align for .text.ngx_strlchr */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_strlchr); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.ngx_http_split_args */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_split_args); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_chunked */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.text.ngx_http_parse_chunked); /* size 0x654 */
	. = . + 0x4d; /* padding after .text.ngx_http_parse_chunked */
	. = ALIGN(0x10); /* align for .text.ngx_http_header_filter_init */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.text.ngx_http_header_filter_init); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.ngx_http_header_filter */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.text.ngx_http_header_filter); /* size 0x13dc */
	. = ALIGN(0x10); /* align for .text.ngx_http_write_filter */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.text.ngx_http_write_filter); /* size 0xd08 */
	. = . + 0x226; /* padding after .text.ngx_http_write_filter */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_write_filter_init */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.text.ngx_http_write_filter_init); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_copy_filter_init */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.text.ngx_http_copy_filter_init); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_copy_filter_create_conf */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.text.ngx_http_copy_filter_create_conf); /* size 0x58 */
	. = . + 0x1; /* padding after .text.ngx_http_copy_filter_create_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_copy_filter_merge_conf */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.text.ngx_http_copy_filter_merge_conf); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_copy_filter */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.text.ngx_http_copy_filter); /* size 0x304 */
	. = . + 0x42; /* padding after .text.ngx_http_copy_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_init */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_init); /* size 0x164 */
	. = . + 0x21; /* padding after .text.ngx_http_log_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_create_main_conf */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_create_main_conf); /* size 0xf4 */
	. = . + 0x1d; /* padding after .text.ngx_http_log_create_main_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_create_loc_conf); /* size 0x5c */
	. = . + 0x1; /* padding after .text.ngx_http_log_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_merge_loc_conf); /* size 0x204 */
	. = . + 0x18; /* padding after .text.ngx_http_log_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_compile_format */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_compile_format); /* size 0x5d8 */
	. = . + 0x25; /* padding after .text.ngx_http_log_compile_format */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_handler */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_handler); /* size 0x448 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_variable_compile */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_variable_compile); /* size 0x88 */
	. = . + 0x2; /* padding after .text.ngx_http_log_variable_compile */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_copy_short */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_copy_short); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_copy_long */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_copy_long); /* size 0x50 */
	. = . + 0x2; /* padding after .text.ngx_http_log_copy_long */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_pipe */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_pipe); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_time */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_time); /* size 0x54 */
	. = . + 0x3; /* padding after .text.ngx_http_log_time */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_iso8601 */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_iso8601); /* size 0x54 */
	. = . + 0x3; /* padding after .text.ngx_http_log_iso8601 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_msec */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_msec); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_request_time */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_request_time); /* size 0xc4 */
	. = . + 0x9; /* padding after .text.ngx_http_log_request_time */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_status */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_status); /* size 0x98 */
	. = . + 0x18; /* padding after .text.ngx_http_log_status */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_bytes_sent */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_bytes_sent); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_body_bytes_sent */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_body_bytes_sent); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_request_length */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_request_length); /* size 0x3c */
	. = . + 0x1; /* padding after .text.ngx_http_log_request_length */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_variable_getlen */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_variable_getlen); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_variable */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_variable); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_escape */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_escape); /* size 0x1d0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_write */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_write); /* size 0x1bc */
	. = ALIGN(0x10); /* align for .text.ngx_write_fd */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_write_fd); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_script_write */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_script_write); /* size 0x438 */
	. = . + 0x67; /* padding after .text.ngx_http_log_script_write */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_set_format */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_set_format); /* size 0x1f8 */
	. = . + 0x11; /* padding after .text.ngx_http_log_set_format */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_set_log */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_set_log); /* size 0x5ec */
	. = . + 0x2c; /* padding after .text.ngx_http_log_set_log */
	. = ALIGN(0x10); /* align for .text.ngx_http_log_open_file_cache */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.text.ngx_http_log_open_file_cache); /* size 0x3e8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_read_client_request_body */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_read_client_request_body); /* size 0x460 */
	. = . + 0x72; /* padding after .text.ngx_http_read_client_request_body */
	. = ALIGN(0x10); /* align for .text.ngx_http_test_expect */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_test_expect); /* size 0xf0 */
	. = . + 0x37; /* padding after .text.ngx_http_test_expect */
	. = ALIGN(0x10); /* align for .text.ngx_http_request_body_filter */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_request_body_filter); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.ngx_http_read_client_request_body_handler */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_read_client_request_body_handler); /* size 0x80 */
	. = . + 0xb; /* padding after .text.ngx_http_read_client_request_body_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_do_read_client_request_body */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_do_read_client_request_body); /* size 0x494 */
	. = . + 0x29; /* padding after .text.ngx_http_do_read_client_request_body */
	. = ALIGN(0x10); /* align for .text.ngx_http_write_request_body */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_write_request_body); /* size 0x284 */
	. = . + 0x66; /* padding after .text.ngx_http_write_request_body */
	. = ALIGN(0x10); /* align for .text.ngx_http_discard_request_body */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_discard_request_body); /* size 0x20c */
	. = . + 0x7b; /* padding after .text.ngx_http_discard_request_body */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_discard_request_body_filter */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_discard_request_body_filter); /* size 0x268 */
	. = . + 0x2a; /* padding after .text.ngx_http_discard_request_body_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_read_discarded_request_body */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_read_discarded_request_body); /* size 0x184 */
	. = . + 0x30; /* padding after .text.ngx_http_read_discarded_request_body */
	. = ALIGN(0x10); /* align for .text.ngx_http_discarded_request_body_handler */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_discarded_request_body_handler); /* size 0x224 */
	. = . + 0x7b; /* padding after .text.ngx_http_discarded_request_body_handler */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_request_body_chunked_filter */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_request_body_chunked_filter); /* size 0x4e4 */
	. = . + 0x6; /* padding after .text.ngx_http_request_body_chunked_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_request_body_length_filter */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_request_body_length_filter); /* size 0x270 */
	. = ALIGN(0x10); /* align for .text.ngx_http_request_body_save_filter */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.text.ngx_http_request_body_save_filter); /* size 0x5c */
	. = . + 0x5; /* padding after .text.ngx_http_request_body_save_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_variable */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_add_variable); /* size 0x284 */
	. = ALIGN(0x10); /* align for .text.ngx_http_get_variable_index */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_get_variable_index); /* size 0x1f0 */
	. = . + 0x10; /* padding after .text.ngx_http_get_variable_index */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_get_indexed_variable */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_get_indexed_variable); /* size 0x234 */
	. = ALIGN(0x10); /* align for .text.ngx_http_get_flushed_variable */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_get_flushed_variable); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.ngx_http_get_variable */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_get_variable); /* size 0x2a4 */
	. = . + 0x75; /* padding after .text.ngx_http_get_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_unknown_header_in */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_unknown_header_in); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_unknown_header_out */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_unknown_header_out); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_cookie */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_cookie); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_argument */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_argument); /* size 0xec */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_unknown_header */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_unknown_header); /* size 0x290 */
	. = ALIGN(0x10); /* align for .text.ngx_http_map_find */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_map_find); /* size 0xbc */
	. = . + 0x4; /* padding after .text.ngx_http_map_find */
	. = ALIGN(0x10); /* align for .text.ngx_http_variables_add_core_vars */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variables_add_core_vars); /* size 0x1a0 */
	. = . + 0x27; /* padding after .text.ngx_http_variables_add_core_vars */
	. = ALIGN(0x10); /* align for .text.ngx_http_variables_init_vars */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variables_init_vars); /* size 0x5fc */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_header */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_header); /* size 0xbc */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_headers */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_headers); /* size 0x2cc */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_content_length */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_content_length); /* size 0x178 */
	. = . + 0x12; /* padding after .text.ngx_http_variable_content_length */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_host */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_host); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_binary_remote_addr */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_binary_remote_addr); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_remote_addr */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_remote_addr); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_remote_port */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_remote_port); /* size 0x124 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_server_addr */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_server_addr); /* size 0x120 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_server_port */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_server_port); /* size 0x148 */
	. = . + 0x3; /* padding after .text.ngx_http_variable_server_port */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request); /* size 0xbc */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_scheme */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_scheme); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_https */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_https); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_line */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_line); /* size 0x140 */
	. = . + 0x10; /* padding after .text.ngx_http_variable_request_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_document_root */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_document_root); /* size 0x194 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_realpath_root */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_realpath_root); /* size 0x21c */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_set */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_set); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_is_args */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_is_args); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_filename */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_filename); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_server_name */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_server_name); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_method */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_method); /* size 0xb8 */
	. = . + 0x2; /* padding after .text.ngx_http_variable_request_method */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_remote_user */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_remote_user); /* size 0xe0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_bytes_sent */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_bytes_sent); /* size 0xd8 */
	. = . + 0x1; /* padding after .text.ngx_http_variable_bytes_sent */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_body_bytes_sent */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_body_bytes_sent); /* size 0xf4 */
	. = . + 0x8; /* padding after .text.ngx_http_variable_body_bytes_sent */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_completion */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_completion); /* size 0xe4 */
	. = . + 0x3; /* padding after .text.ngx_http_variable_request_completion */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_body */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_body); /* size 0x288 */
	. = . + 0xa; /* padding after .text.ngx_http_variable_request_body */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_body_file */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_body_file); /* size 0xd0 */
	. = . + 0xa; /* padding after .text.ngx_http_variable_request_body_file */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_time */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_time); /* size 0x15c */
	. = . + 0x1b; /* padding after .text.ngx_http_variable_request_time */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_status */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_status); /* size 0x134 */
	. = . + 0x1e; /* padding after .text.ngx_http_variable_status */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_sent_content_type */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_sent_content_type); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_sent_content_length */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_sent_content_length); /* size 0x17c */
	. = . + 0x19; /* padding after .text.ngx_http_variable_sent_content_length */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_sent_location */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_sent_location); /* size 0xe0 */
	. = . + 0x8; /* padding after .text.ngx_http_variable_sent_location */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_sent_last_modified */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_sent_last_modified); /* size 0x174 */
	. = . + 0x11; /* padding after .text.ngx_http_variable_sent_last_modified */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_sent_connection */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_sent_connection); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_sent_keep_alive */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_sent_keep_alive); /* size 0x138 */
	. = . + 0xa; /* padding after .text.ngx_http_variable_sent_keep_alive */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_sent_transfer_encoding */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_sent_transfer_encoding); /* size 0xa4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_set_size */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_set_size); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_request_get_size */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_request_get_size); /* size 0xe8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_connection */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_connection); /* size 0xd8 */
	. = . + 0x4; /* padding after .text.ngx_http_variable_connection */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_connection_requests */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_connection_requests); /* size 0xd8 */
	. = . + 0x4; /* padding after .text.ngx_http_variable_connection_requests */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_nginx_version */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_nginx_version); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_hostname */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_hostname); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_pid */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_pid); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_msec */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_msec); /* size 0xec */
	. = . + 0x8; /* padding after .text.ngx_http_variable_msec */
	. = ALIGN(0x10); /* align for .text.ngx_http_variable_tcpinfo */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.text.ngx_http_variable_tcpinfo); /* size 0x188 */
	. = . + 0x26; /* padding after .text.ngx_http_variable_tcpinfo */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_flush_complex_value */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_flush_complex_value); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_complex_value */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_complex_value); /* size 0x17c */
	. = . + 0x17; /* padding after .text.ngx_http_complex_value */
	. = ALIGN(0x10); /* align for .text.ngx_http_compile_complex_value */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_compile_complex_value); /* size 0x4e8 */
	. = . + 0x32; /* padding after .text.ngx_http_compile_complex_value */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_compile */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_compile); /* size 0x44c */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_complex_value_slot */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_set_complex_value_slot); /* size 0x100 */
	. = . + 0x2; /* padding after .text.ngx_http_set_complex_value_slot */
	. = ALIGN(0x10); /* align for .text.ngx_http_test_predicates */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_test_predicates); /* size 0xd0 */
	. = . + 0xb; /* padding after .text.ngx_http_test_predicates */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_predicate_slot */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_set_predicate_slot); /* size 0x15c */
	. = . + 0x5; /* padding after .text.ngx_http_set_predicate_slot */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_variables_count */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_variables_count); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_init_arrays */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_init_arrays); /* size 0x1b0 */
	. = . + 0xe; /* padding after .text.ngx_http_script_init_arrays */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_add_var_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_add_var_code); /* size 0x138 */
	. = . + 0xb; /* padding after .text.ngx_http_script_add_var_code */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_add_args_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_add_args_code); /* size 0xb0 */
	. = . + 0x5; /* padding after .text.ngx_http_script_add_args_code */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_add_copy_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_add_copy_code); /* size 0x1a0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_done */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_done); /* size 0x170 */
	. = . + 0x1d; /* padding after .text.ngx_http_script_done */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_run */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_run); /* size 0x1e0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_flush_no_cacheable_variables */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_flush_no_cacheable_variables); /* size 0x100 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_start_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_start_code); /* size 0x7c */
	. = . + 0x2; /* padding after .text.ngx_http_script_start_code */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_add_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_add_code); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_copy_len_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_copy_len_code); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_copy_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_copy_code); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_copy_var_len_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_copy_var_len_code); /* size 0xbc */
	. = . + 0x1; /* padding after .text.ngx_http_script_copy_var_len_code */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_copy_var_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_copy_var_code); /* size 0x110 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_mark_args_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_mark_args_code); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_start_args_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_start_args_code); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_return_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_return_code); /* size 0xa0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_break_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_break_code); /* size 0x38 */
	. = . + 0x10; /* padding after .text.ngx_http_script_break_code */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_if_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_if_code); /* size 0xd4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_equal_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_equal_code); /* size 0xe0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_not_equal_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_not_equal_code); /* size 0xe0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_file_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_file_code); /* size 0x4a8 */
	. = . + 0xa4; /* padding after .text.ngx_http_script_file_code */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_complex_value_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_complex_value_code); /* size 0x1a4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_value_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_value_code); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_set_var_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_set_var_code); /* size 0x130 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_var_set_handler_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_var_set_handler_code); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_var_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_var_code); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_nop_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_nop_code); /* size 0x20 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_add_full_name_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_add_full_name_code); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_full_name_len_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_full_name_len_code); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_http_script_full_name_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.text.ngx_http_script_full_name_code); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_header_line */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_header_line); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_copy_header_line */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_copy_header_line); /* size 0x90 */
	. = . + 0x4; /* padding after .text.ngx_http_upstream_copy_header_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_copy_content_type */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_copy_content_type); /* size 0x190 */
	. = . + 0x29; /* padding after .text.ngx_http_upstream_copy_content_type */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_content_length */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_content_length); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_ignore_header_line */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_ignore_header_line); /* size 0x20 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_copy_last_modified */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_copy_last_modified); /* size 0xac */
	. = . + 0x16; /* padding after .text.ngx_http_upstream_copy_last_modified */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_rewrite_location */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_rewrite_location); /* size 0xf0 */
	. = . + 0x15; /* padding after .text.ngx_http_upstream_rewrite_location */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_rewrite_refresh */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_rewrite_refresh); /* size 0x118 */
	. = . + 0x2a; /* padding after .text.ngx_http_upstream_rewrite_refresh */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_set_cookie */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_set_cookie); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_rewrite_set_cookie */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_rewrite_set_cookie); /* size 0xb4 */
	. = . + 0x10; /* padding after .text.ngx_http_upstream_rewrite_set_cookie */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_cache_control */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_cache_control); /* size 0x2cc */
	. = . + 0x64; /* padding after .text.ngx_http_upstream_process_cache_control */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_copy_multi_header_lines */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_copy_multi_header_lines); /* size 0xe0 */
	. = . + 0x17; /* padding after .text.ngx_http_upstream_copy_multi_header_lines */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_expires */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_expires); /* size 0xfc */
	. = . + 0x20; /* padding after .text.ngx_http_upstream_process_expires */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_copy_allow_ranges */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_copy_allow_ranges); /* size 0xa8 */
	. = . + 0x23; /* padding after .text.ngx_http_upstream_copy_allow_ranges */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_connection */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_connection); /* size 0x8c */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_accel_expires */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_accel_expires); /* size 0x160 */
	. = . + 0x21; /* padding after .text.ngx_http_upstream_process_accel_expires */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_limit_rate */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_limit_rate); /* size 0x90 */
	. = . + 0xe; /* padding after .text.ngx_http_upstream_process_limit_rate */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_buffering */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_buffering); /* size 0x2c0 */
	. = . + 0x10; /* padding after .text.ngx_http_upstream_process_buffering */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_charset */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_charset); /* size 0x50 */
	. = . + 0x12; /* padding after .text.ngx_http_upstream_process_charset */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_transfer_encoding */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_transfer_encoding); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_create */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_create); /* size 0x100 */
	. = . + 0x7; /* padding after .text.ngx_http_upstream_create */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_cleanup */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_cleanup); /* size 0x7c */
	. = . + 0xd; /* padding after .text.ngx_http_upstream_cleanup */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_init); /* size 0xb8 */
	. = . + 0xf; /* padding after .text.ngx_http_upstream_init */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_request */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_init_request); /* size 0x694 */
	. = . + 0x1bc; /* padding after .text.ngx_http_upstream_init_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_header_variable */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_header_variable); /* size 0x74 */
	. = . + 0x5; /* padding after .text.ngx_http_upstream_header_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_add */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_add); /* size 0x538 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_bind_set_slot */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_bind_set_slot); /* size 0x124 */
	. = . + 0x2; /* padding after .text.ngx_http_upstream_bind_set_slot */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_param_set_slot */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_param_set_slot); /* size 0x168 */
	. = . + 0x10; /* padding after .text.ngx_http_upstream_param_set_slot */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_hide_headers_hash */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_hide_headers_hash); /* size 0x478 */
	. = . + 0x54; /* padding after .text.ngx_http_upstream_hide_headers_hash */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_add_variables */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_add_variables); /* size 0x98 */
	. = . + 0x4; /* padding after .text.ngx_http_upstream_add_variables */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_create_main_conf */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_create_main_conf); /* size 0x7c */
	. = . + 0x17; /* padding after .text.ngx_http_upstream_create_main_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_main_conf */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_init_main_conf); /* size 0x23c */
	. = . + 0x42; /* padding after .text.ngx_http_upstream_init_main_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_addr_variable */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_addr_variable); /* size 0x2f4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_status_variable */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_status_variable); /* size 0x254 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_response_time_variable */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_response_time_variable); /* size 0x2c4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_response_length_variable */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_response_length_variable); /* size 0x220 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_cache_status */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_cache_status); /* size 0x114 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream); /* size 0x3e8 */
	. = . + 0x3c; /* padding after .text.ngx_http_upstream */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_server */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_server); /* size 0x4cc */
	. = . + 0xa1; /* padding after .text.ngx_http_upstream_server */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_cache */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_cache); /* size 0x4d0 */
	. = . + 0xb5; /* padding after .text.ngx_http_upstream_cache */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_rd_check_broken_connection */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_rd_check_broken_connection); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_wr_check_broken_connection */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_wr_check_broken_connection); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_finalize_request */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_finalize_request); /* size 0x3dc */
	. = . + 0x9f; /* padding after .text.ngx_http_upstream_finalize_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_connect */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_connect); /* size 0x52c */
	. = . + 0xb3; /* padding after .text.ngx_http_upstream_connect */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_resolve_handler */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_resolve_handler); /* size 0x144 */
	. = . + 0x4; /* padding after .text.ngx_http_upstream_resolve_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_cache_send */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_cache_send); /* size 0x19c */
	. = . + 0x3c; /* padding after .text.ngx_http_upstream_cache_send */
	. = ALIGN(0x10); /* align for .text.ngx_list_init */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_list_init); /* size 0xac */
	. = . + 0x2; /* padding after .text.ngx_list_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_headers */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_headers); /* size 0x4a4 */
	. = . + 0x4f; /* padding after .text.ngx_http_upstream_process_headers */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_check_broken_connection */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_check_broken_connection); /* size 0x300 */
	. = . + 0x54; /* padding after .text.ngx_http_upstream_check_broken_connection */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_next */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_next); /* size 0x2cc */
	. = . + 0x46; /* padding after .text.ngx_http_upstream_next */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_handler */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_handler); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_send_request_handler */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_send_request_handler); /* size 0xa4 */
	. = . + 0x9; /* padding after .text.ngx_http_upstream_send_request_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_header */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_header); /* size 0x54c */
	. = . + 0x117; /* padding after .text.ngx_http_upstream_process_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_reinit */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_reinit); /* size 0x244 */
	. = . + 0x67; /* padding after .text.ngx_http_upstream_reinit */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_send_request */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_send_request); /* size 0x28c */
	. = . + 0x4a; /* padding after .text.ngx_http_upstream_send_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_dummy_handler */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_dummy_handler); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_test_connect */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_test_connect); /* size 0xa4 */
	. = . + 0x3; /* padding after .text.ngx_http_upstream_test_connect */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_test_next */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_test_next); /* size 0x160 */
	. = . + 0x1a; /* padding after .text.ngx_http_upstream_test_next */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_intercept_errors */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_intercept_errors); /* size 0x238 */
	. = . + 0x3d; /* padding after .text.ngx_http_upstream_intercept_errors */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_send_response */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_send_response); /* size 0xbb4 */
	. = . + 0x19d; /* padding after .text.ngx_http_upstream_send_response */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_non_buffered_filter_init */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_non_buffered_filter_init); /* size 0x18 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_non_buffered_filter */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_non_buffered_filter); /* size 0x180 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_body_in_memory */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_body_in_memory); /* size 0x23c */
	. = . + 0x39; /* padding after .text.ngx_http_upstream_process_body_in_memory */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_non_buffered_upstream */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_non_buffered_upstream); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_non_buffered_downstream */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_non_buffered_downstream); /* size 0xb4 */
	. = . + 0xf; /* padding after .text.ngx_http_upstream_process_non_buffered_downstream */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_upstream */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_upstream); /* size 0xd4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_downstream */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_downstream); /* size 0x1f0 */
	. = . + 0x29; /* padding after .text.ngx_http_upstream_process_downstream */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_non_buffered_request */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_non_buffered_request); /* size 0x3c8 */
	. = . + 0x69; /* padding after .text.ngx_http_upstream_process_non_buffered_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_process_request */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_process_request); /* size 0x2c4 */
	. = . + 0x6b; /* padding after .text.ngx_http_upstream_process_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_store */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.text.ngx_http_upstream_store); /* size 0x280 */
	. = . + 0x3b; /* padding after .text.ngx_http_upstream_store */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_round_robin */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.text.ngx_http_upstream_init_round_robin); /* size 0xd00 */
	. = . + 0x12b; /* padding after .text.ngx_http_upstream_init_round_robin */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_round_robin_peer */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.text.ngx_http_upstream_init_round_robin_peer); /* size 0x194 */
	. = . + 0xd; /* padding after .text.ngx_http_upstream_init_round_robin_peer */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_cmp_servers */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.text.ngx_http_upstream_cmp_servers); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_get_round_robin_peer */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.text.ngx_http_upstream_get_round_robin_peer); /* size 0x2b8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_free_round_robin_peer */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.text.ngx_http_upstream_free_round_robin_peer); /* size 0x150 */
	. = . + 0x10; /* padding after .text.ngx_http_upstream_free_round_robin_peer */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_create_round_robin_peer */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.text.ngx_http_upstream_create_round_robin_peer); /* size 0x488 */
	. = . + 0x6; /* padding after .text.ngx_http_upstream_create_round_robin_peer */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_get_peer */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.text.ngx_http_upstream_get_peer); /* size 0x264 */
	. = ALIGN(0x10); /* align for .text.ngx_http_parse_time */
	"objs/arm_objs/src/http/ngx_http_parse_time.o"(.text.ngx_http_parse_time); /* size 0xb18 */
	. = ALIGN(0x10); /* align for .text.ngx_http_static_init */
	"objs/arm_objs/src/http/modules/ngx_http_static_module.o"(.text.ngx_http_static_init); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_static_handler */
	"objs/arm_objs/src/http/modules/ngx_http_static_module.o"(.text.ngx_http_static_handler); /* size 0x7fc */
	. = . + 0x142; /* padding after .text.ngx_http_static_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_index_init */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.text.ngx_http_index_init); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_index_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.text.ngx_http_index_create_loc_conf); /* size 0x64 */
	. = . + 0x1; /* padding after .text.ngx_http_index_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_index_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.text.ngx_http_index_merge_loc_conf); /* size 0x110 */
	. = . + 0x19; /* padding after .text.ngx_http_index_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_index_handler */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.text.ngx_http_index_handler); /* size 0x6c0 */
	. = . + 0x7a; /* padding after .text.ngx_http_index_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_index_error */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.text.ngx_http_index_error); /* size 0xdc */
	. = ALIGN(0x10); /* align for .text.ngx_http_index_test_dir */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.text.ngx_http_index_test_dir); /* size 0x2e4 */
	. = . + 0x1b; /* padding after .text.ngx_http_index_test_dir */
	. = ALIGN(0x10); /* align for .text.ngx_http_index_set_index */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.text.ngx_http_index_set_index); /* size 0x31c */
	. = ALIGN(0x10); /* align for .text.ngx_http_chunked_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.text.ngx_http_chunked_filter_init); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.ngx_http_chunked_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.text.ngx_http_chunked_header_filter); /* size 0x194 */
	. = . + 0x37; /* padding after .text.ngx_http_chunked_header_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_chunked_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.text.ngx_http_chunked_body_filter); /* size 0x5a4 */
	. = . + 0x8; /* padding after .text.ngx_http_chunked_body_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_header_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_header_filter_init); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_header_filter); /* size 0x3f4 */
	. = . + 0x77; /* padding after .text.ngx_http_range_header_filter */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_parse */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_parse); /* size 0x3dc */
	. = . + 0x29; /* padding after .text.ngx_http_range_parse */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_singlepart_header */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_singlepart_header); /* size 0x154 */
	. = . + 0x1d; /* padding after .text.ngx_http_range_singlepart_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_multipart_header */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_multipart_header); /* size 0x3bc */
	. = . + 0x24; /* padding after .text.ngx_http_range_multipart_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_not_satisfiable */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_not_satisfiable); /* size 0x11c */
	. = . + 0x26; /* padding after .text.ngx_http_range_not_satisfiable */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_body_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_body_filter_init); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_body_filter); /* size 0x1d8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_singlepart_body */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_singlepart_body); /* size 0x44c */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_test_overlapped */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_test_overlapped); /* size 0x258 */
	. = ALIGN(0x10); /* align for .text.ngx_http_range_multipart_body */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.text.ngx_http_range_multipart_body); /* size 0x5f0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_headers_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_headers_filter_init); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_headers_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_headers_create_conf); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_http_headers_merge_conf */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_headers_merge_conf); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_http_headers_filter */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_headers_filter); /* size 0x21c */
	. = . + 0x14; /* padding after .text.ngx_http_headers_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_expires */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_set_expires); /* size 0x450 */
	. = . + 0x5e; /* padding after .text.ngx_http_set_expires */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_headers_expires */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_headers_expires); /* size 0x378 */
	. = ALIGN(0x10); /* align for .text.ngx_http_headers_add */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_headers_add); /* size 0x214 */
	. = . + 0x8; /* padding after .text.ngx_http_headers_add */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_header */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_add_header); /* size 0x98 */
	. = . + 0x4; /* padding after .text.ngx_http_add_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_cache_control */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_add_cache_control); /* size 0x10c */
	. = . + 0x35; /* padding after .text.ngx_http_add_cache_control */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_last_modified */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_set_last_modified); /* size 0xf8 */
	. = . + 0x21; /* padding after .text.ngx_http_set_last_modified */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_response_header */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.text.ngx_http_set_response_header); /* size 0xe8 */
	. = . + 0xa; /* padding after .text.ngx_http_set_response_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_not_modified_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.text.ngx_http_not_modified_filter_init); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_not_modified_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.text.ngx_http_not_modified_header_filter); /* size 0x248 */
	. = . + 0x7c; /* padding after .text.ngx_http_not_modified_header_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_test_if_unmodified */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.text.ngx_http_test_if_unmodified); /* size 0x64 */
	. = . + 0x3; /* padding after .text.ngx_http_test_if_unmodified */
	. = ALIGN(0x10); /* align for .text.ngx_http_test_if_match */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.text.ngx_http_test_if_match); /* size 0x234 */
	. = . + 0x5; /* padding after .text.ngx_http_test_if_match */
	. = ALIGN(0x10); /* align for .text.ngx_http_test_if_modified */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.text.ngx_http_test_if_modified); /* size 0xd0 */
	. = . + 0x2; /* padding after .text.ngx_http_test_if_modified */
	. = ALIGN(0x10); /* align for .text.ngx_http_busy_lock */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.text.ngx_http_busy_lock); /* size 0x128 */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_busy_lock_cacheable */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.text.ngx_http_busy_lock_cacheable); /* size 0x108 */
	. = ALIGN(0x10); /* align for .text.ngx_http_busy_lock_look_cacheable */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.text.ngx_http_busy_lock_look_cacheable); /* size 0x258 */
	. = ALIGN(0x10); /* align for .text.ngx_http_busy_unlock */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.text.ngx_http_busy_unlock); /* size 0xa0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_busy_lock_slot */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.text.ngx_http_set_busy_lock_slot); /* size 0x438 */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_new */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_new); /* size 0xa4 */
	. = . + 0x1f; /* padding after .text.ngx_http_file_cache_new */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_create */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_create); /* size 0xc4 */
	. = . + 0xb; /* padding after .text.ngx_http_file_cache_create */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_cleanup */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_cleanup); /* size 0xac */
	. = . + 0x1; /* padding after .text.ngx_http_file_cache_cleanup */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_exists */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_exists); /* size 0x3ec */
	. = . + 0x20; /* padding after .text.ngx_http_file_cache_exists */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_name */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_name); /* size 0x12c */
	. = . + 0x5; /* padding after .text.ngx_http_file_cache_name */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_create_key */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_create_key); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_update */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_crc32_update); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_open */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_open); /* size 0x49c */
	. = . + 0xa3; /* padding after .text.ngx_http_file_cache_open */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_read */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_read); /* size 0x3c8 */
	. = . + 0x56; /* padding after .text.ngx_http_file_cache_read */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_lock */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_lock); /* size 0x1fc */
	. = . + 0x10; /* padding after .text.ngx_http_file_cache_lock */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_set_header */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_set_header); /* size 0x194 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_update */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_update); /* size 0x2b8 */
	. = . + 0x78; /* padding after .text.ngx_http_file_cache_update */
	. = ALIGN(0x10); /* align for .text.ngx_http_cache_send */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_cache_send); /* size 0x22c */
	. = . + 0x1f; /* padding after .text.ngx_http_cache_send */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_free */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_free); /* size 0x2b8 */
	. = . + 0x4c; /* padding after .text.ngx_http_file_cache_free */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_valid */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_valid); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_set_slot */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_set_slot); /* size 0xa94 */
	. = . + 0x78; /* padding after .text.ngx_http_file_cache_set_slot */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_manager */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_manager); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_loader */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_loader); /* size 0x1dc */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_init */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_init); /* size 0x3dc */
	. = . + 0x34; /* padding after .text.ngx_http_file_cache_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_valid_set_slot */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_valid_set_slot); /* size 0x2d0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_lock_wait_handler */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_lock_wait_handler); /* size 0x170 */
	. = . + 0x13; /* padding after .text.ngx_http_file_cache_lock_wait_handler */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_aio_read */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_aio_read); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_lookup */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_lookup); /* size 0x12c */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_forced_expire */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_forced_expire); /* size 0x174 */
	. = . + 0x1; /* padding after .text.ngx_http_file_cache_forced_expire */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_delete */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_delete); /* size 0x24c */
	. = . + 0x8; /* padding after .text.ngx_http_file_cache_delete */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_expire */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_expire); /* size 0x2ec */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_manage_file */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_manage_file); /* size 0x150 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_noop */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_noop); /* size 0x1c */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_delete_file */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_delete_file); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_add_file */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_add_file); /* size 0x19c */
	. = . + 0x4; /* padding after .text.ngx_http_file_cache_add_file */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_loader_sleep */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_loader_sleep); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_add */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_add); /* size 0x24c */
	. = ALIGN(0x10); /* align for .text.ngx_http_file_cache_rbtree_insert_value */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.text.ngx_http_file_cache_rbtree_insert_value); /* size 0x130 */
	. = ALIGN(0x10); /* align for .text.ngx_http_postpone_filter_init */
	"objs/arm_objs/src/http/ngx_http_postpone_filter_module.o"(.text.ngx_http_postpone_filter_init); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_postpone_filter */
	"objs/arm_objs/src/http/ngx_http_postpone_filter_module.o"(.text.ngx_http_postpone_filter); /* size 0x1dc */
	. = . + 0x35; /* padding after .text.ngx_http_postpone_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_postpone_filter_add */
	"objs/arm_objs/src/http/ngx_http_postpone_filter_module.o"(.text.ngx_http_postpone_filter_add); /* size 0x104 */
	. = . + 0x27; /* padding after .text.ngx_http_postpone_filter_add */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_preconfiguration */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_preconfiguration); /* size 0x154 */
	. = . + 0x5; /* padding after .text.ngx_http_ssi_preconfiguration */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_filter_init); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_create_main_conf */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_create_main_conf); /* size 0x90 */
	. = . + 0xc; /* padding after .text.ngx_http_ssi_create_main_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_init_main_conf */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_init_main_conf); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_create_loc_conf); /* size 0x7c */
	. = . + 0xd; /* padding after .text.ngx_http_ssi_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_merge_loc_conf); /* size 0x1d4 */
	. = . + 0x16; /* padding after .text.ngx_http_ssi_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_date_gmt_local_variable */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_date_gmt_local_variable); /* size 0x240 */
	. = . + 0xf; /* padding after .text.ngx_http_ssi_date_gmt_local_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_include */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_include); /* size 0x8bc */
	. = . + 0x167; /* padding after .text.ngx_http_ssi_include */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_echo */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_echo); /* size 0x4cc */
	. = . + 0x3b; /* padding after .text.ngx_http_ssi_echo */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_config */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_config); /* size 0xd8 */
	. = . + 0x19; /* padding after .text.ngx_http_ssi_config */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_set */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_set); /* size 0x1a0 */
	. = . + 0x11; /* padding after .text.ngx_http_ssi_set */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_if */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_if); /* size 0x678 */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_else */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_else); /* size 0x8c */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_endif */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_endif); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_block */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_block); /* size 0x128 */
	. = . + 0x6; /* padding after .text.ngx_http_ssi_block */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_endblock */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_endblock); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_evaluate_string */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_evaluate_string); /* size 0x900 */
	. = . + 0x114; /* padding after .text.ngx_http_ssi_evaluate_string */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_stub_output */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_stub_output); /* size 0xdc */
	. = . + 0x2f; /* padding after .text.ngx_http_ssi_stub_output */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_set_variable */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_set_variable); /* size 0x68 */
	. = . + 0x4; /* padding after .text.ngx_http_ssi_set_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_get_variable */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_get_variable); /* size 0x18c */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_regex_match */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_regex_match); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_header_filter); /* size 0x298 */
	. = . + 0x61; /* padding after .text.ngx_http_ssi_header_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_body_filter); /* size 0x15d0 */
	. = . + 0x16; /* padding after .text.ngx_http_ssi_body_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_parse */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_parse); /* size 0x1194 */
	. = . + 0x178; /* padding after .text.ngx_http_ssi_parse */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_output */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_output); /* size 0x2c4 */
	. = . + 0x47; /* padding after .text.ngx_http_ssi_output */
	. = ALIGN(0x10); /* align for .text.ngx_http_ssi_buffered */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.text.ngx_http_ssi_buffered); /* size 0x74 */
	. = . + 0x25; /* padding after .text.ngx_http_ssi_buffered */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_postconfiguration */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_postconfiguration); /* size 0x458 */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_create_main_conf */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_create_main_conf); /* size 0xd0 */
	. = . + 0x3e; /* padding after .text.ngx_http_charset_create_main_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_create_loc_conf); /* size 0x6c */
	. = . + 0x5; /* padding after .text.ngx_http_charset_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_merge_loc_conf); /* size 0x2c0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_header_filter); /* size 0x2cc */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_body_filter); /* size 0x478 */
	. = . + 0x30; /* padding after .text.ngx_http_charset_body_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_destination_charset */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_destination_charset); /* size 0x2a4 */
	. = . + 0x17; /* padding after .text.ngx_http_destination_charset */
	. = ALIGN(0x10); /* align for .text.ngx_http_main_request_charset */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_main_request_charset); /* size 0x154 */
	. = ALIGN(0x10); /* align for .text.ngx_http_source_charset */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_source_charset); /* size 0x198 */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_charset */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_set_charset); /* size 0x70 */
	. = . + 0x13; /* padding after .text.ngx_http_set_charset */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_ctx); /* size 0x1c4 */
	. = . + 0x48; /* padding after .text.ngx_http_charset_ctx */
	. = ALIGN(0x10); /* align for .text.ngx_http_get_charset */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_get_charset); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_recode_to_utf8 */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_recode_to_utf8); /* size 0x584 */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_recode_from_utf8 */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_recode_from_utf8); /* size 0x998 */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_recode */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_recode); /* size 0x110 */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_get_buf */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_get_buf); /* size 0xe0 */
	. = . + 0x9; /* padding after .text.ngx_http_charset_get_buf */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_get_buffer */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_get_buffer); /* size 0x17c */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_set_charset_slot */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_set_charset_slot); /* size 0x198 */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_map_block */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_map_block); /* size 0x5dc */
	. = . + 0xb6; /* padding after .text.ngx_http_charset_map_block */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_charset */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_add_charset); /* size 0x170 */
	. = ALIGN(0x10); /* align for .text.ngx_http_charset_map */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.text.ngx_http_charset_map); /* size 0x41c */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_init_worker */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_init_worker); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_add_variables */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_add_variables); /* size 0x11c */
	. = . + 0xf; /* padding after .text.ngx_http_userid_add_variables */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_init */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_init); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_create_conf); /* size 0x78 */
	. = . + 0x1; /* padding after .text.ngx_http_userid_create_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_merge_conf */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_merge_conf); /* size 0x2a4 */
	. = . + 0x28; /* padding after .text.ngx_http_userid_merge_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_got_variable */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_got_variable); /* size 0xec */
	. = . + 0x6; /* padding after .text.ngx_http_userid_got_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_set_variable */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_set_variable); /* size 0x118 */
	. = . + 0xd; /* padding after .text.ngx_http_userid_set_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_reset_variable */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_reset_variable); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_get_uid */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_get_uid); /* size 0x22c */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_variable */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_variable); /* size 0x10c */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_create_uid */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_create_uid); /* size 0x38c */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_filter */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_filter); /* size 0x100 */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_set_uid */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_set_uid); /* size 0x3f8 */
	. = . + 0x10; /* padding after .text.ngx_http_userid_set_uid */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_expires */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_expires); /* size 0x100 */
	. = . + 0xc; /* padding after .text.ngx_http_userid_expires */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_mark */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_mark); /* size 0x154 */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_domain */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_domain); /* size 0x108 */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_path */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_path); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_userid_p3p */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.text.ngx_http_userid_p3p); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.ngx_http_autoindex_init */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_http_autoindex_init); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_autoindex_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_http_autoindex_create_loc_conf); /* size 0x6c */
	. = . + 0x5; /* padding after .text.ngx_http_autoindex_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_autoindex_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_http_autoindex_merge_loc_conf); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.ngx_http_autoindex_handler */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_http_autoindex_handler); /* size 0x1514 */
	. = . + 0x2cf; /* padding after .text.ngx_http_autoindex_handler */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_autoindex_error */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_http_autoindex_error); /* size 0x8c */
	. = ALIGN(0x10); /* align for .text.ngx_de_info */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_de_info); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.ngx_http_autoindex_cmp_entries */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.text.ngx_http_autoindex_cmp_entries); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_init */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_init); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_create_loc_conf); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_merge_loc_conf); /* size 0x8c */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_handler */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_handler); /* size 0x71c */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_crypt_handler */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_crypt_handler); /* size 0x1a4 */
	. = . + 0x5; /* padding after .text.ngx_http_auth_basic_crypt_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_set_realm */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_set_realm); /* size 0xa8 */
	. = . + 0x13; /* padding after .text.ngx_http_auth_basic_set_realm */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_close */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_close); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic_user_file */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic_user_file); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_auth_basic */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.text.ngx_http_auth_basic); /* size 0x140 */
	. = ALIGN(0x10); /* align for .text.ngx_http_access_init */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.text.ngx_http_access_init); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_access_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.text.ngx_http_access_create_loc_conf); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_http_access_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.text.ngx_http_access_merge_loc_conf); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_http_access_handler */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.text.ngx_http_access_handler); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_http_access_inet */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.text.ngx_http_access_inet); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_access_found */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.text.ngx_http_access_found); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_access_rule */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.text.ngx_http_access_rule); /* size 0x1f8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_init */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_init); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_create_conf); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_merge_conf */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_merge_conf); /* size 0xa4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_handler */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_handler); /* size 0x3f0 */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_short */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_crc32_short); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_lookup */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_lookup); /* size 0x130 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_cleanup_all */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_cleanup_all); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_cleanup */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_cleanup); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_zone); /* size 0x484 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_zone); /* size 0x280 */
	. = . + 0x23; /* padding after .text.ngx_http_limit_zone */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn); /* size 0x1f0 */
	. = . + 0x19; /* padding after .text.ngx_http_limit_conn */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_init_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_init_zone); /* size 0x200 */
	. = . + 0x34; /* padding after .text.ngx_http_limit_conn_init_zone */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_conn_rbtree_insert_value */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_http_limit_conn_rbtree_insert_value); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_init */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_init); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_create_conf); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_merge_conf */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_merge_conf); /* size 0xdc */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_handler */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_handler); /* size 0x49c */
	. = . + 0xa2; /* padding after .text.ngx_http_limit_req_handler */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_short */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_crc32_short); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_lookup */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_lookup); /* size 0x43c */
	. = . + 0xa0; /* padding after .text.ngx_http_limit_req_lookup */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_account */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_account); /* size 0x258 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_delay */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_delay); /* size 0xc4 */
	. = . + 0x10; /* padding after .text.ngx_http_limit_req_delay */
	. = ALIGN(0x10); /* align for .text.ngx_event_add_timer */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_event_add_timer); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_expire */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_expire); /* size 0x1a8 */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_zone); /* size 0x5f0 */
	. = . + 0xf; /* padding after .text.ngx_http_limit_req_zone */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req); /* size 0x3cc */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_init_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_init_zone); /* size 0x250 */
	. = . + 0x25; /* padding after .text.ngx_http_limit_req_init_zone */
	. = ALIGN(0x10); /* align for .text.ngx_http_limit_req_rbtree_insert_value */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_http_limit_req_rbtree_insert_value); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_block */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_block); /* size 0x57c */
	. = . + 0x10f; /* padding after .text.ngx_http_geo_block */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo); /* size 0x23c */
	. = . + 0x22; /* padding after .text.ngx_http_geo */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_create_binary_base */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_create_binary_base); /* size 0x28c */
	. = . + 0x10; /* padding after .text.ngx_http_geo_create_binary_base */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_range_variable */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_range_variable); /* size 0x114 */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_cidr_variable */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_cidr_variable); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_include */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_include); /* size 0x1b0 */
	. = . + 0x26; /* padding after .text.ngx_http_geo_include */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_cidr_value */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_cidr_value); /* size 0xe8 */
	. = . + 0x1; /* padding after .text.ngx_http_geo_cidr_value */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_add_proxy */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_add_proxy); /* size 0xb0 */
	. = . + 0xe; /* padding after .text.ngx_http_geo_add_proxy */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_range */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_range); /* size 0x35c */
	. = . + 0x2f; /* padding after .text.ngx_http_geo_range */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_cidr */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_cidr); /* size 0x2cc */
	. = . + 0x45; /* padding after .text.ngx_http_geo_cidr */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_include_binary_base */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_include_binary_base); /* size 0x6e0 */
	. = . + 0x71; /* padding after .text.ngx_http_geo_include_binary_base */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_update */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_crc32_update); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_value */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_value); /* size 0x1d4 */
	. = . + 0x6; /* padding after .text.ngx_http_geo_value */
	. = ALIGN(0x10); /* align for .text.ngx_strlchr */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_strlchr); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_delete_range */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_delete_range); /* size 0x248 */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_add_range */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_add_range); /* size 0x99c */
	. = ALIGN(0x10); /* align for .text.ngx_crc32_long */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_crc32_long); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_copy_values */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_copy_values); /* size 0x124 */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_addr */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_addr); /* size 0xd0 */
	. = . + 0x5; /* padding after .text.ngx_http_geo_addr */
	. = ALIGN(0x10); /* align for .text.ngx_http_geo_real_addr */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.text.ngx_http_geo_real_addr); /* size 0xe0 */
	. = . + 0x7; /* padding after .text.ngx_http_geo_real_addr */
	. = ALIGN(0x10); /* align for .text.ngx_http_map_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.text.ngx_http_map_create_conf); /* size 0x64 */
	. = . + 0x1; /* padding after .text.ngx_http_map_create_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_map_block */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.text.ngx_http_map_block); /* size 0x4d0 */
	. = . + 0x1b5; /* padding after .text.ngx_http_map_block */
	. = ALIGN(0x10); /* align for .text.ngx_http_map_variable */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.text.ngx_http_map_variable); /* size 0x128 */
	. = . + 0x16; /* padding after .text.ngx_http_map_variable */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_map */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.text.ngx_http_map); /* size 0x650 */
	. = . + 0x26; /* padding after .text.ngx_http_map */
	. = ALIGN(0x10); /* align for .text.ngx_http_map_cmp_dns_wildcards */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.text.ngx_http_map_cmp_dns_wildcards); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_conf_split_clients_block */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.text.ngx_conf_split_clients_block); /* size 0x388 */
	. = . + 0x7a; /* padding after .text.ngx_conf_split_clients_block */
	. = ALIGN(0x10); /* align for .text.ngx_http_split_clients_variable */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.text.ngx_http_split_clients_variable); /* size 0x128 */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_split_clients */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.text.ngx_http_split_clients); /* size 0x1a8 */
	. = . + 0x5; /* padding after .text.ngx_http_split_clients */
	. = ALIGN(0x10); /* align for .text.ngx_http_referer_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.text.ngx_http_referer_create_conf); /* size 0x74 */
	. = . + 0xa; /* padding after .text.ngx_http_referer_create_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_referer_merge_conf */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.text.ngx_http_referer_merge_conf); /* size 0x4c8 */
	. = . + 0x6e; /* padding after .text.ngx_http_referer_merge_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_cmp_referer_wildcards */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.text.ngx_http_cmp_referer_wildcards); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.ngx_http_valid_referers */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.text.ngx_http_valid_referers); /* size 0x440 */
	. = ALIGN(0x10); /* align for .text.ngx_http_referer_variable */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.text.ngx_http_referer_variable); /* size 0x33c */
	. = . + 0x39; /* padding after .text.ngx_http_referer_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_referer */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.text.ngx_http_add_referer); /* size 0x11c */
	. = . + 0x6; /* padding after .text.ngx_http_add_referer */
	. = ALIGN(0x10); /* align for .text.ngx_http_add_regex_referer */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.text.ngx_http_add_regex_referer); /* size 0x50 */
	. = . + 0x8; /* padding after .text.ngx_http_add_regex_referer */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_add_variables */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_add_variables); /* size 0x98 */
	. = . + 0x4; /* padding after .text.ngx_http_proxy_add_variables */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_create_loc_conf); /* size 0x198 */
	. = . + 0x9f; /* padding after .text.ngx_http_proxy_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_merge_loc_conf); /* size 0x125c */
	. = . + 0x3f8; /* padding after .text.ngx_http_proxy_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_host_variable */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_host_variable); /* size 0xd4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_port_variable */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_port_variable); /* size 0xd4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_add_x_forwarded_for_variable */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_add_x_forwarded_for_variable); /* size 0x1cc */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_internal_body_length_variable */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_internal_body_length_variable); /* size 0x130 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_rewrite_complex_handler */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_rewrite_complex_handler); /* size 0xd4 */
	. = . + 0x11; /* padding after .text.ngx_http_proxy_rewrite_complex_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_handler */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_handler); /* size 0x2ec */
	. = . + 0x72; /* padding after .text.ngx_http_proxy_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_merge_headers */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_merge_headers); /* size 0xac8 */
	. = . + 0x141; /* padding after .text.ngx_http_proxy_merge_headers */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_rewrite */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_rewrite); /* size 0x1bc */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_eval */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_eval); /* size 0x3e0 */
	. = . + 0x91; /* padding after .text.ngx_http_proxy_eval */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_create_key */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_create_key); /* size 0x46c */
	. = . + 0xa5; /* padding after .text.ngx_http_proxy_create_key */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_create_request */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_create_request); /* size 0xdec */
	. = . + 0x1b5; /* padding after .text.ngx_http_proxy_create_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_reinit_request */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_reinit_request); /* size 0xc4 */
	. = . + 0x19; /* padding after .text.ngx_http_proxy_reinit_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_process_status_line */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_process_status_line); /* size 0x220 */
	. = . + 0x21; /* padding after .text.ngx_http_proxy_process_status_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_abort_request */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_abort_request); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_finalize_request */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_finalize_request); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_rewrite_redirect */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_rewrite_redirect); /* size 0x11c */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_rewrite_cookie */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_rewrite_cookie); /* size 0x1b8 */
	. = . + 0x15; /* padding after .text.ngx_http_proxy_rewrite_cookie */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_copy_filter */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_copy_filter); /* size 0x31c */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_input_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_input_filter_init); /* size 0x1e0 */
	. = . + 0x46; /* padding after .text.ngx_http_proxy_input_filter_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_non_buffered_copy_filter */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_non_buffered_copy_filter); /* size 0x1d0 */
	. = . + 0x2; /* padding after .text.ngx_http_proxy_non_buffered_copy_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_set_vars */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_set_vars); /* size 0x188 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_process_header */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_process_header); /* size 0x50c */
	. = . + 0x45; /* padding after .text.ngx_http_proxy_process_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_rewrite_cookie_value */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_rewrite_cookie_value); /* size 0x128 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_chunked_filter */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_chunked_filter); /* size 0x464 */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_non_buffered_chunked_filter */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_non_buffered_chunked_filter); /* size 0x478 */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_pass */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_pass); /* size 0x420 */
	. = . + 0x6d; /* padding after .text.ngx_http_proxy_pass */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_redirect */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_redirect); /* size 0x52c */
	. = . + 0xa9; /* padding after .text.ngx_http_proxy_redirect */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_cookie_domain */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_cookie_domain); /* size 0x2c8 */
	. = . + 0x4f; /* padding after .text.ngx_http_proxy_cookie_domain */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_cookie_path */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_cookie_path); /* size 0x2c4 */
	. = . + 0x57; /* padding after .text.ngx_http_proxy_cookie_path */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_store */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_store); /* size 0x1d8 */
	. = . + 0x1d; /* padding after .text.ngx_http_proxy_store */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_cache */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_cache); /* size 0x114 */
	. = . + 0x1a; /* padding after .text.ngx_http_proxy_cache */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_cache_key */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_cache_key); /* size 0xb8 */
	. = . + 0x8; /* padding after .text.ngx_http_proxy_cache_key */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_rewrite_regex */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_rewrite_regex); /* size 0x50 */
	. = . + 0x8; /* padding after .text.ngx_http_proxy_rewrite_regex */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_rewrite_domain_handler */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_rewrite_domain_handler); /* size 0x110 */
	. = . + 0xe; /* padding after .text.ngx_http_proxy_rewrite_domain_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_proxy_lowat_check */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.text.ngx_http_proxy_lowat_check); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_add_variables */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_add_variables); /* size 0x98 */
	. = . + 0x4; /* padding after .text.ngx_http_fastcgi_add_variables */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_create_loc_conf); /* size 0x158 */
	. = . + 0x8d; /* padding after .text.ngx_http_fastcgi_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_merge_loc_conf); /* size 0xde0 */
	. = . + 0x2c3; /* padding after .text.ngx_http_fastcgi_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_script_name_variable */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_script_name_variable); /* size 0x1d8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_path_info_variable */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_path_info_variable); /* size 0xe0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_split */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_split); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_handler */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_handler); /* size 0x294 */
	. = . + 0x57; /* padding after .text.ngx_http_fastcgi_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_merge_params */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_merge_params); /* size 0x7a4 */
	. = . + 0x1b6; /* padding after .text.ngx_http_fastcgi_merge_params */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_eval */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_eval); /* size 0x210 */
	. = . + 0x66; /* padding after .text.ngx_http_fastcgi_eval */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_create_key */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_create_key); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_create_request */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_create_request); /* size 0x1214 */
	. = . + 0x1e8; /* padding after .text.ngx_http_fastcgi_create_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_reinit_request */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_reinit_request); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_process_header */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_process_header); /* size 0xfb0 */
	. = . + 0x35d; /* padding after .text.ngx_http_fastcgi_process_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_abort_request */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_abort_request); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_finalize_request */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_finalize_request); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_input_filter */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_input_filter); /* size 0x840 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_input_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_input_filter_init); /* size 0x70 */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_process_record */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_process_record); /* size 0x320 */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_pass */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_pass); /* size 0x25c */
	. = . + 0x31; /* padding after .text.ngx_http_fastcgi_pass */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_split_path_info */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_split_path_info); /* size 0x4c */
	. = . + 0x7; /* padding after .text.ngx_http_fastcgi_split_path_info */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_store */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_store); /* size 0x1d8 */
	. = . + 0x1d; /* padding after .text.ngx_http_fastcgi_store */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_cache); /* size 0x114 */
	. = . + 0x1a; /* padding after .text.ngx_http_fastcgi_cache */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_cache_key */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_cache_key); /* size 0xb8 */
	. = . + 0x8; /* padding after .text.ngx_http_fastcgi_cache_key */
	. = ALIGN(0x10); /* align for .text.ngx_http_fastcgi_lowat_check */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.text.ngx_http_fastcgi_lowat_check); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_create_loc_conf); /* size 0x178 */
	. = . + 0x8b; /* padding after .text.ngx_http_uwsgi_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_merge_loc_conf); /* size 0xd84 */
	. = . + 0x2b6; /* padding after .text.ngx_http_uwsgi_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_handler */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_handler); /* size 0x294 */
	. = . + 0x5f; /* padding after .text.ngx_http_uwsgi_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_merge_params */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_merge_params); /* size 0x7a4 */
	. = . + 0x1b6; /* padding after .text.ngx_http_uwsgi_merge_params */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_eval */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_eval); /* size 0x210 */
	. = . + 0x66; /* padding after .text.ngx_http_uwsgi_eval */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_create_key */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_create_key); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_create_request */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_create_request); /* size 0xc08 */
	. = . + 0xf4; /* padding after .text.ngx_http_uwsgi_create_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_reinit_request */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_reinit_request); /* size 0x90 */
	. = . + 0xe; /* padding after .text.ngx_http_uwsgi_reinit_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_process_status_line */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_process_status_line); /* size 0x184 */
	. = . + 0x19; /* padding after .text.ngx_http_uwsgi_process_status_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_abort_request */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_abort_request); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_finalize_request */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_finalize_request); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_process_header */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_process_header); /* size 0x468 */
	. = . + 0x52; /* padding after .text.ngx_http_uwsgi_process_header */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_pass */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_pass); /* size 0x25c */
	. = . + 0x31; /* padding after .text.ngx_http_uwsgi_pass */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_store */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_store); /* size 0x1d8 */
	. = . + 0x1d; /* padding after .text.ngx_http_uwsgi_store */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_cache); /* size 0x114 */
	. = . + 0x1a; /* padding after .text.ngx_http_uwsgi_cache */
	. = ALIGN(0x10); /* align for .text.ngx_http_uwsgi_cache_key */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.text.ngx_http_uwsgi_cache_key); /* size 0xb8 */
	. = . + 0x8; /* padding after .text.ngx_http_uwsgi_cache_key */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_create_loc_conf); /* size 0x168 */
	. = . + 0x7d; /* padding after .text.ngx_http_scgi_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_merge_loc_conf); /* size 0xca4 */
	. = . + 0x268; /* padding after .text.ngx_http_scgi_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_handler */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_handler); /* size 0x294 */
	. = . + 0x5f; /* padding after .text.ngx_http_scgi_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_merge_params */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_merge_params); /* size 0x7d4 */
	. = . + 0x1b9; /* padding after .text.ngx_http_scgi_merge_params */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_eval */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_eval); /* size 0x210 */
	. = . + 0x66; /* padding after .text.ngx_http_scgi_eval */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_create_key */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_create_key); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_create_request */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_create_request); /* size 0xcd4 */
	. = . + 0x1c; /* padding after .text.ngx_http_scgi_create_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_reinit_request */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_reinit_request); /* size 0x90 */
	. = . + 0xe; /* padding after .text.ngx_http_scgi_reinit_request */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_process_status_line */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_process_status_line); /* size 0x184 */
	. = . + 0x19; /* padding after .text.ngx_http_scgi_process_status_line */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_abort_request */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_abort_request); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_finalize_request */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_finalize_request); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_process_header */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_process_header); /* size 0x468 */
	. = . + 0x52; /* padding after .text.ngx_http_scgi_process_header */
	. = ALIGN(0x10); /* align for .text.ngx_array_init */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_array_init); /* size 0x90 */
	. = . + 0x1; /* padding after .text.ngx_array_init */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_pass */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_pass); /* size 0x25c */
	. = . + 0x31; /* padding after .text.ngx_http_scgi_pass */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_store */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_store); /* size 0x1d8 */
	. = . + 0x1d; /* padding after .text.ngx_http_scgi_store */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_cache); /* size 0x114 */
	. = . + 0x1a; /* padding after .text.ngx_http_scgi_cache */
	. = ALIGN(0x10); /* align for .text.ngx_http_scgi_cache_key */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.text.ngx_http_scgi_cache_key); /* size 0xb8 */
	. = . + 0x8; /* padding after .text.ngx_http_scgi_cache_key */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_create_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_create_loc_conf); /* size 0x100 */
	. = . + 0x48; /* padding after .text.ngx_http_memcached_create_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_merge_loc_conf */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_merge_loc_conf); /* size 0x228 */
	. = . + 0x2b; /* padding after .text.ngx_http_memcached_merge_loc_conf */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_pass */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_pass); /* size 0x1b0 */
	. = . + 0xb; /* padding after .text.ngx_http_memcached_pass */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_handler */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_handler); /* size 0x20c */
	. = . + 0x41; /* padding after .text.ngx_http_memcached_handler */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_create_request */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_create_request); /* size 0x320 */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_reinit_request */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_reinit_request); /* size 0x18 */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_process_header */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_process_header); /* size 0x50c */
	. = . + 0x43; /* padding after .text.ngx_http_memcached_process_header */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_abort_request */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_abort_request); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_finalize_request */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_finalize_request); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_filter_init */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_filter_init); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_http_memcached_filter */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.text.ngx_http_memcached_filter); /* size 0x3d4 */
	. = . + 0x25; /* padding after .text.ngx_http_memcached_filter */
	. = ALIGN(0x10); /* align for .text.ngx_http_empty_gif */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.text.ngx_http_empty_gif); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_http_empty_gif_handler */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.text.ngx_http_empty_gif_handler); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_browser_add_variable */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_browser_add_variable); /* size 0x94 */
	. = . + 0x7; /* padding after .text.ngx_http_browser_add_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_browser_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_browser_create_conf); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_http_browser_merge_conf */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_browser_merge_conf); /* size 0x340 */
	. = ALIGN(0x10); /* align for .text.ngx_http_msie_variable */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_msie_variable); /* size 0x78 */
	. = . + 0x8; /* padding after .text.ngx_http_msie_variable */
	. = ALIGN(0x10); /* align for .text.ngx_http_browser_variable */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_browser_variable); /* size 0xf0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_browser */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_browser); /* size 0x3fc */
	. = ALIGN(0x10); /* align for .text.ngx_http_modern_browser_sort */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_modern_browser_sort); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.ngx_http_modern_browser */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_modern_browser); /* size 0x2dc */
	. = . + 0xa; /* padding after .text.ngx_http_modern_browser */
	. = ALIGN(0x10); /* align for .text.ngx_http_ancient_browser */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_ancient_browser); /* size 0x154 */
	. = ALIGN(0x10); /* align for .text.ngx_http_modern_browser_value */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_modern_browser_value); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_ancient_browser_value */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.text.ngx_http_ancient_browser_value); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_ip_hash */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.text.ngx_http_upstream_ip_hash); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_ip_hash */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.text.ngx_http_upstream_init_ip_hash); /* size 0x54 */
	. = . + 0x4; /* padding after .text.ngx_http_upstream_init_ip_hash */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_ip_hash_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.text.ngx_http_upstream_init_ip_hash_peer); /* size 0x124 */
	. = . + 0x2; /* padding after .text.ngx_http_upstream_init_ip_hash_peer */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_get_ip_hash_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.text.ngx_http_upstream_get_ip_hash_peer); /* size 0x3ac */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_least_conn_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.text.ngx_http_upstream_least_conn_create_conf); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_least_conn */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.text.ngx_http_upstream_least_conn); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_least_conn */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.text.ngx_http_upstream_init_least_conn); /* size 0xec */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_least_conn_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.text.ngx_http_upstream_init_least_conn_peer); /* size 0x100 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_get_least_conn_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.text.ngx_http_upstream_get_least_conn_peer); /* size 0x6b0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_free_least_conn_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.text.ngx_http_upstream_free_least_conn_peer); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_keepalive_create_conf */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_keepalive_create_conf); /* size 0x5c */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_keepalive */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_keepalive); /* size 0x20c */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_keepalive */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_init_keepalive); /* size 0x1e0 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_init_keepalive_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_init_keepalive_peer); /* size 0x130 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_get_keepalive_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_get_keepalive_peer); /* size 0x204 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_free_keepalive_peer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_free_keepalive_peer); /* size 0x37c */
	. = . + 0x41; /* padding after .text.ngx_http_upstream_free_keepalive_peer */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_keepalive_close */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_keepalive_close); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.ngx_event_del_timer */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_event_del_timer); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_keepalive_dummy_handler */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_keepalive_dummy_handler); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.ngx_http_upstream_keepalive_close_handler */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.text.ngx_http_upstream_keepalive_close_handler); /* size 0x128 */
	. = ALIGN(0x4); /* align for .text._start_c */
	"/usr/local/popcorn/aarch64/lib/crt1.o"(.text._start_c); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.sysconf */
	"/usr/local/popcorn/aarch64/lib/libc.a(sysconf.o)"(.text.sysconf); /* size 0x1ac */
	. = ALIGN(0x4); /* align for .text.__crypt_r */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_r.o)"(.text.__crypt_r); /* size 0x94 */
	. = ALIGN(0x4); /* align for .text.__crypt_sha256 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.text.__crypt_sha256); /* size 0x80 */
	. = ALIGN(0x4); /* align for .text.sha256crypt */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.text.sha256crypt); /* size 0x584 */
	. = . + 0x7d; /* padding after .text.sha256crypt */
	. = ALIGN(0x4); /* align for .text.sha256_update */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.text.sha256_update); /* size 0xd8 */
	. = ALIGN(0x4); /* align for .text.sha256_sum */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.text.sha256_sum); /* size 0x130 */
	. = ALIGN(0x4); /* align for .text.hashmd */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.text.hashmd); /* size 0x74 */
	. = ALIGN(0x4); /* align for .text.processblock */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.text.processblock); /* size 0x230 */
	. = ALIGN(0x4); /* align for .text.__crypt_sha512 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.text.__crypt_sha512); /* size 0x80 */
	. = ALIGN(0x4); /* align for .text.sha512crypt */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.text.sha512crypt); /* size 0x8ec */
	. = ALIGN(0x4); /* align for .text.sha512_update */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.text.sha512_update); /* size 0xd8 */
	. = ALIGN(0x4); /* align for .text.sha512_sum */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.text.sha512_sum); /* size 0x17c */
	. = ALIGN(0x4); /* align for .text.hashmd */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.text.hashmd); /* size 0x74 */
	. = ALIGN(0x4); /* align for .text.processblock */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.text.processblock); /* size 0x270 */
	. = . + 0x2e; /* padding after .text.processblock */
	. = ALIGN(0x4); /* align for .text.closedir */
	"/usr/local/popcorn/aarch64/lib/libc.a(closedir.o)"(.text.closedir); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.opendir */
	"/usr/local/popcorn/aarch64/lib/libc.a(opendir.o)"(.text.opendir); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.readdir */
	"/usr/local/popcorn/aarch64/lib/libc.a(readdir.o)"(.text.readdir); /* size 0xa0 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.dummy1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.dummy1); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__init_libc */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.__init_libc); /* size 0x1d8 */
	. = ALIGN(0x4); /* align for .text.libc_start_init */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.libc_start_init); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.__libc_start_main */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.text.__libc_start_main); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.getenv */
	"/usr/local/popcorn/aarch64/lib/libc.a(getenv.o)"(.text.getenv); /* size 0x8c */
	. = ALIGN(0x4); /* align for .text.__errno_location */
	"/usr/local/popcorn/aarch64/lib/libc.a(__errno_location.o)"(.text.__errno_location); /* size 0xc */
	. = . + 0x2; /* padding after .text.__errno_location */
	. = ALIGN(0x4); /* align for .text.__strerror_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.text.__strerror_l); /* size 0x60 */
	. = ALIGN(0x4); /* align for .text.strerror */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.text.strerror); /* size 0xc */
	. = . + 0x9; /* padding after .text.strerror */
	. = ALIGN(0x4); /* align for .text.abort */
	"/usr/local/popcorn/aarch64/lib/libc.a(abort.o)"(.text.abort); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.libc_exit_fini */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.text.libc_exit_fini); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.fcntl */
	"/usr/local/popcorn/aarch64/lib/libc.a(fcntl.o)"(.text.fcntl); /* size 0x224 */
	. = ALIGN(0x4); /* align for .text.open */
	"/usr/local/popcorn/aarch64/lib/libc.a(open.o)"(.text.open); /* size 0x104 */
	. = . + 0x22; /* padding after .text.open */
	. = ALIGN(0x4); /* align for .text.posix_fadvise */
	"/usr/local/popcorn/aarch64/lib/libc.a(posix_fadvise.o)"(.text.posix_fadvise); /* size 0x18 */
	. = ALIGN(0x10); /* align for .text.__syscall_ret */
	"/usr/local/popcorn/aarch64/lib/libc.a(syscall_ret.o)"(.text.__syscall_ret); /* size 0x60 */
	. = ALIGN(0x4); /* align for .text.getpagesize */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpagesize.o)"(.text.getpagesize); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.epoll_create */
	"/usr/local/popcorn/aarch64/lib/libc.a(epoll.o)"(.text.epoll_create); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.epoll_create1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(epoll.o)"(.text.epoll_create1); /* size 0x24 */
	. = . + 0x3; /* padding after .text.epoll_create1 */
	. = ALIGN(0x4); /* align for .text.epoll_ctl */
	"/usr/local/popcorn/aarch64/lib/libc.a(epoll.o)"(.text.epoll_ctl); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.epoll_pwait */
	"/usr/local/popcorn/aarch64/lib/libc.a(epoll.o)"(.text.epoll_pwait); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.epoll_wait */
	"/usr/local/popcorn/aarch64/lib/libc.a(epoll.o)"(.text.epoll_wait); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.prctl */
	"/usr/local/popcorn/aarch64/lib/libc.a(prctl.o)"(.text.prctl); /* size 0xe8 */
	. = . + 0x2b; /* padding after .text.prctl */
	. = ALIGN(0x4); /* align for .text.sendfile */
	"/usr/local/popcorn/aarch64/lib/libc.a(sendfile.o)"(.text.sendfile); /* size 0x14 */
	. = . + 0x4; /* padding after .text.sendfile */
	. = ALIGN(0x4); /* align for .text.__lsysinfo */
	"/usr/local/popcorn/aarch64/lib/libc.a(sysinfo.o)"(.text.__lsysinfo); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.utimes */
	"/usr/local/popcorn/aarch64/lib/libc.a(utimes.o)"(.text.utimes); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lctrans.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__lctrans */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lctrans.o)"(.text.__lctrans); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__lctrans */
	. = ALIGN(0x4); /* align for .text.__lctrans_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lctrans.o)"(.text.__lctrans_cur); /* size 0x10 */
	. = . + 0x9; /* padding after .text.__lctrans_cur */
	. = ALIGN(0x10); /* align for .text.calloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(calloc.o)"(.text.calloc); /* size 0x70 */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(calloc.o)"(.text.popcorn_calloc); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.popcorn_calloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(calloc.o)"(.text.popcorn_calloc_cur); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.__simple_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.text.__simple_malloc); /* size 0x1c4 */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.__init_malloc); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.malloc); /* size 0x274 */
	. = . + 0x6; /* padding after .text.malloc */
	. = ALIGN(0x10); /* align for .text.adjust_size */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.adjust_size); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.bin_index_up */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.bin_index_up); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.expand_heap */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.expand_heap); /* size 0x120 */
	. = ALIGN(0x10); /* align for .text.alloc_rev */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.alloc_rev); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.first_set */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.first_set); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.lock_bin */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.lock_bin); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.pretrim */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.pretrim); /* size 0x184 */
	. = ALIGN(0x10); /* align for .text.unbin */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.unbin); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.unlock_bin */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.unlock_bin); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.trim */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.trim); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.__malloc0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.__malloc0); /* size 0xa4 */
	. = . + 0x7; /* padding after .text.__malloc0 */
	. = ALIGN(0x10); /* align for .text.realloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.realloc); /* size 0x3b8 */
	. = ALIGN(0x10); /* align for .text.free */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.free); /* size 0x420 */
	. = . + 0x3; /* padding after .text.free */
	. = ALIGN(0x10); /* align for .text.alloc_fwd */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.alloc_fwd); /* size 0x9c */
	. = ALIGN(0x10); /* align for .text.bin_index */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.bin_index); /* size 0xbc */
	. = ALIGN(0x10); /* align for .text.lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.lock); /* size 0x64 */
	. = . + 0x1; /* padding after .text.lock */
	. = ALIGN(0x10); /* align for .text.unlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.unlock); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.a_or_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_or_64); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.a_ctz_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_ctz_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.a_and_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_and_64); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.a_crash */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_crash); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.a_swap */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_swap); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.a_store */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_store); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.__wake */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.__wake); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.__syscall3 */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.__syscall3); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.__init_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.__init_malloc); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_malloc); /* size 0x3e4 */
	. = . + 0x1a; /* padding after .text.popcorn_malloc */
	. = ALIGN(0x10); /* align for .text.adjust_size */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.adjust_size); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.bin_index_up */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.bin_index_up); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.lock); /* size 0x64 */
	. = . + 0x1; /* padding after .text.lock */
	. = ALIGN(0x10); /* align for .text.unlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.unlock); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.expand_heap */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.expand_heap); /* size 0x1b8 */
	. = ALIGN(0x10); /* align for .text.alloc_rev */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.alloc_rev); /* size 0xcc */
	. = ALIGN(0x10); /* align for .text.first_set */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.first_set); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.lock_bin */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.lock_bin); /* size 0x108 */
	. = ALIGN(0x10); /* align for .text.pretrim */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.pretrim); /* size 0x18c */
	. = ALIGN(0x10); /* align for .text.unbin */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.unbin); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .text.unlock_bin */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.unlock_bin); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.trim */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.trim); /* size 0xdc */
	. = ALIGN(0x10); /* align for .text.__popcorn_malloc0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.__popcorn_malloc0); /* size 0xac */
	. = . + 0x5; /* padding after .text.__popcorn_malloc0 */
	. = ALIGN(0x10); /* align for .text.popcorn_malloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_malloc_cur); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_realloc); /* size 0x3f8 */
	. = ALIGN(0x10); /* align for .text.popcorn_free */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_free); /* size 0x4b0 */
	. = ALIGN(0x10); /* align for .text.alloc_fwd */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.alloc_fwd); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.popcorn_realloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.popcorn_realloc_cur); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.bin_index */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.bin_index); /* size 0xbc */
	. = ALIGN(0x10); /* align for .text.a_or_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_or_64); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.a_swap */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_swap); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.a_store */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_store); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.__wake */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.__wake); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.__syscall3 */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.__syscall3); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.a_ctz_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_ctz_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.a_and_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_and_64); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.a_crash */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_crash); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.posix_memalign */
	"/usr/local/popcorn/aarch64/lib/libc.a(posix_memalign.o)"(.text.posix_memalign); /* size 0x78 */
	. = ALIGN(0x4); /* align for .text.getrlimit */
	"/usr/local/popcorn/aarch64/lib/libc.a(getrlimit.o)"(.text.getrlimit); /* size 0xf8 */
	. = ALIGN(0x4); /* align for .text.initgroups */
	"/usr/local/popcorn/aarch64/lib/libc.a(initgroups.o)"(.text.initgroups); /* size 0x44 */
	. = ALIGN(0x4); /* align for .text.ioctl */
	"/usr/local/popcorn/aarch64/lib/libc.a(ioctl.o)"(.text.ioctl); /* size 0xac */
	. = . + 0x30; /* padding after .text.ioctl */
	. = ALIGN(0x4); /* align for .text.realpath */
	"/usr/local/popcorn/aarch64/lib/libc.a(realpath.o)"(.text.realpath); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.setpriority */
	"/usr/local/popcorn/aarch64/lib/libc.a(setpriority.o)"(.text.setpriority); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__setrlimit */
	"/usr/local/popcorn/aarch64/lib/libc.a(setrlimit.o)"(.text.__setrlimit); /* size 0x54 */
	. = ALIGN(0x4); /* align for .text.setrlimit */
	"/usr/local/popcorn/aarch64/lib/libc.a(setrlimit.o)"(.text.setrlimit); /* size 0x60 */
	. = ALIGN(0x4); /* align for .text.do_setrlimit */
	"/usr/local/popcorn/aarch64/lib/libc.a(setrlimit.o)"(.text.do_setrlimit); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.uname */
	"/usr/local/popcorn/aarch64/lib/libc.a(uname.o)"(.text.uname); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.__madvise */
	"/usr/local/popcorn/aarch64/lib/libc.a(madvise.o)"(.text.__madvise); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(mmap.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__mmap */
	"/usr/local/popcorn/aarch64/lib/libc.a(mmap.o)"(.text.__mmap); /* size 0xc0 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(mremap.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__mremap */
	"/usr/local/popcorn/aarch64/lib/libc.a(mremap.o)"(.text.__mremap); /* size 0x110 */
	. = . + 0xe; /* padding after .text.__mremap */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(munmap.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__munmap */
	"/usr/local/popcorn/aarch64/lib/libc.a(munmap.o)"(.text.__munmap); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.accept */
	"/usr/local/popcorn/aarch64/lib/libc.a(accept.o)"(.text.accept); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.accept4 */
	"/usr/local/popcorn/aarch64/lib/libc.a(accept4.o)"(.text.accept4); /* size 0xec */
	. = ALIGN(0x4); /* align for .text.bind */
	"/usr/local/popcorn/aarch64/lib/libc.a(bind.o)"(.text.bind); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.connect */
	"/usr/local/popcorn/aarch64/lib/libc.a(connect.o)"(.text.connect); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.gethostbyname */
	"/usr/local/popcorn/aarch64/lib/libc.a(gethostbyname.o)"(.text.gethostbyname); /* size 0x8 */
	. = . + 0x2; /* padding after .text.gethostbyname */
	. = ALIGN(0x4); /* align for .text.gethostbyname2 */
	"/usr/local/popcorn/aarch64/lib/libc.a(gethostbyname2.o)"(.text.gethostbyname2); /* size 0xc8 */
	. = ALIGN(0x4); /* align for .text.gethostbyname2_r */
	"/usr/local/popcorn/aarch64/lib/libc.a(gethostbyname2_r.o)"(.text.gethostbyname2_r); /* size 0x234 */
	. = . + 0x7; /* padding after .text.gethostbyname2_r */
	. = ALIGN(0x4); /* align for .text.getsockname */
	"/usr/local/popcorn/aarch64/lib/libc.a(getsockname.o)"(.text.getsockname); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.getsockopt */
	"/usr/local/popcorn/aarch64/lib/libc.a(getsockopt.o)"(.text.getsockopt); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.__h_errno_location */
	"/usr/local/popcorn/aarch64/lib/libc.a(h_errno.o)"(.text.__h_errno_location); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.htonl */
	"/usr/local/popcorn/aarch64/lib/libc.a(htonl.o)"(.text.htonl); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.htons */
	"/usr/local/popcorn/aarch64/lib/libc.a(htons.o)"(.text.htons); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.listen */
	"/usr/local/popcorn/aarch64/lib/libc.a(listen.o)"(.text.listen); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.__lookup_name */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.text.__lookup_name); /* size 0x978 */
	. = . + 0x10; /* padding after .text.__lookup_name */
	. = ALIGN(0x4); /* align for .text.policyof */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.text.policyof); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.scopeof */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.text.scopeof); /* size 0xa0 */
	. = ALIGN(0x4); /* align for .text.addrcmp */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.text.addrcmp); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.is_valid_hostname */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.text.is_valid_hostname); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.name_from_dns */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.text.name_from_dns); /* size 0x1a0 */
	. = ALIGN(0x4); /* align for .text.dns_parse_callback */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.text.dns_parse_callback); /* size 0x10c */
	. = ALIGN(0x4); /* align for .text.ntohl */
	"/usr/local/popcorn/aarch64/lib/libc.a(ntohl.o)"(.text.ntohl); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.ntohs */
	"/usr/local/popcorn/aarch64/lib/libc.a(ntohs.o)"(.text.ntohs); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.recv */
	"/usr/local/popcorn/aarch64/lib/libc.a(recv.o)"(.text.recv); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.recvfrom */
	"/usr/local/popcorn/aarch64/lib/libc.a(recvfrom.o)"(.text.recvfrom); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.recvmsg */
	"/usr/local/popcorn/aarch64/lib/libc.a(recvmsg.o)"(.text.recvmsg); /* size 0xb8 */
	. = ALIGN(0x4); /* align for .text.__res_mkquery */
	"/usr/local/popcorn/aarch64/lib/libc.a(res_mkquery.o)"(.text.__res_mkquery); /* size 0x190 */
	. = ALIGN(0x4); /* align for .text.__res_msend_rc */
	"/usr/local/popcorn/aarch64/lib/libc.a(res_msend.o)"(.text.__res_msend_rc); /* size 0x6c8 */
	. = . + 0x140; /* padding after .text.__res_msend_rc */
	. = ALIGN(0x4); /* align for .text.cleanup */
	"/usr/local/popcorn/aarch64/lib/libc.a(res_msend.o)"(.text.cleanup); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.__res_msend */
	"/usr/local/popcorn/aarch64/lib/libc.a(res_msend.o)"(.text.__res_msend); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.__get_resolv_conf */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.text.__get_resolv_conf); /* size 0x420 */
	. = . + 0x11; /* padding after .text.__get_resolv_conf */
	. = ALIGN(0x4); /* align for .text.send */
	"/usr/local/popcorn/aarch64/lib/libc.a(send.o)"(.text.send); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.sendmsg */
	"/usr/local/popcorn/aarch64/lib/libc.a(sendmsg.o)"(.text.sendmsg); /* size 0x110 */
	. = . + 0x1f; /* padding after .text.sendmsg */
	. = ALIGN(0x4); /* align for .text.sendto */
	"/usr/local/popcorn/aarch64/lib/libc.a(sendto.o)"(.text.sendto); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.setsockopt */
	"/usr/local/popcorn/aarch64/lib/libc.a(setsockopt.o)"(.text.setsockopt); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.shutdown */
	"/usr/local/popcorn/aarch64/lib/libc.a(shutdown.o)"(.text.shutdown); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.socket */
	"/usr/local/popcorn/aarch64/lib/libc.a(socket.o)"(.text.socket); /* size 0x108 */
	. = ALIGN(0x4); /* align for .text.socketpair */
	"/usr/local/popcorn/aarch64/lib/libc.a(socketpair.o)"(.text.socketpair); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.setgrent */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.text.setgrent); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.getgrent */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.text.getgrent); /* size 0x80 */
	. = ALIGN(0x4); /* align for .text.getgrgid */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.text.getgrgid); /* size 0x54 */
	. = ALIGN(0x4); /* align for .text.getgrnam */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.text.getgrnam); /* size 0x4c */
	. = . + 0x3; /* padding after .text.getgrnam */
	. = ALIGN(0x4); /* align for .text.__getgrent_a */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent_a.o)"(.text.__getgrent_a); /* size 0x250 */
	. = ALIGN(0x4); /* align for .text.getgrouplist */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrouplist.o)"(.text.getgrouplist); /* size 0x370 */
	. = . + 0x13b; /* padding after .text.getgrouplist */
	. = ALIGN(0x4); /* align for .text.setpwent */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.text.setpwent); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.getpwent */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.text.getpwent); /* size 0x74 */
	. = ALIGN(0x4); /* align for .text.getpwuid */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.text.getpwuid); /* size 0x48 */
	. = ALIGN(0x4); /* align for .text.getpwnam */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.text.getpwnam); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.__getpwent_a */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent_a.o)"(.text.__getpwent_a); /* size 0x1e4 */
	. = ALIGN(0x4); /* align for .text.__nscd_query */
	"/usr/local/popcorn/aarch64/lib/libc.a(nscd_query.o)"(.text.__nscd_query); /* size 0x274 */
	. = ALIGN(0x4); /* align for .text.srandom */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.text.srandom); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.__srandom */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.text.__srandom); /* size 0xa8 */
	. = ALIGN(0x4); /* align for .text.initstate */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.text.initstate); /* size 0x110 */
	. = ALIGN(0x4); /* align for .text.setstate */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.text.setstate); /* size 0x94 */
	. = ALIGN(0x4); /* align for .text.random */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.text.random); /* size 0xc8 */
	. = ALIGN(0x4); /* align for .text.execve */
	"/usr/local/popcorn/aarch64/lib/libc.a(execve.o)"(.text.execve); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(fork.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.fork */
	"/usr/local/popcorn/aarch64/lib/libc.a(fork.o)"(.text.fork); /* size 0x8c */
	. = . + 0x4; /* padding after .text.fork */
	. = ALIGN(0x4); /* align for .text.waitpid */
	"/usr/local/popcorn/aarch64/lib/libc.a(waitpid.o)"(.text.waitpid); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.glob */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.text.glob); /* size 0x2b4 */
	. = ALIGN(0x4); /* align for .text.ignore_err */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.text.ignore_err); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.match_in_dir */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.text.match_in_dir); /* size 0x4dc */
	. = . + 0x6c; /* padding after .text.match_in_dir */
	. = ALIGN(0x4); /* align for .text.append */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.text.append); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.sort */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.text.sort); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.globfree */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.text.globfree); /* size 0x78 */
	. = ALIGN(0x4); /* align for .text.sched_setaffinity */
	"/usr/local/popcorn/aarch64/lib/libc.a(affinity.o)"(.text.sched_setaffinity); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.pthread_setaffinity_np */
	"/usr/local/popcorn/aarch64/lib/libc.a(affinity.o)"(.text.pthread_setaffinity_np); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.sched_getaffinity */
	"/usr/local/popcorn/aarch64/lib/libc.a(affinity.o)"(.text.sched_getaffinity); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.do_getaffinity */
	"/usr/local/popcorn/aarch64/lib/libc.a(affinity.o)"(.text.do_getaffinity); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.pthread_getaffinity_np */
	"/usr/local/popcorn/aarch64/lib/libc.a(affinity.o)"(.text.pthread_getaffinity_np); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.sched_yield */
	"/usr/local/popcorn/aarch64/lib/libc.a(sched_yield.o)"(.text.sched_yield); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.poll */
	"/usr/local/popcorn/aarch64/lib/libc.a(poll.o)"(.text.poll); /* size 0x8c */
	. = ALIGN(0x4); /* align for .text.__block_all_sigs */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.text.__block_all_sigs); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__block_app_sigs */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.text.__block_app_sigs); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__restore_sigs */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.text.__restore_sigs); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.kill */
	"/usr/local/popcorn/aarch64/lib/libc.a(kill.o)"(.text.kill); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.raise */
	"/usr/local/popcorn/aarch64/lib/libc.a(raise.o)"(.text.raise); /* size 0x58 */
	. = ALIGN(0x4); /* align for .text.setitimer */
	"/usr/local/popcorn/aarch64/lib/libc.a(setitimer.o)"(.text.setitimer); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.__get_handler_set */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.text.__get_handler_set); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.__libc_sigaction */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.text.__libc_sigaction); /* size 0x194 */
	. = ALIGN(0x4); /* align for .text.__sigaction */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.text.__sigaction); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.sigaddset */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaddset.o)"(.text.sigaddset); /* size 0x60 */
	. = ALIGN(0x4); /* align for .text.sigemptyset */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigemptyset.o)"(.text.sigemptyset); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.sigprocmask */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigprocmask.o)"(.text.sigprocmask); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.sigsuspend */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigsuspend.o)"(.text.sigsuspend); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.__restore_rt */
	"/usr/local/popcorn/aarch64/lib/libc.a(restore.o)"(.text.__restore_rt); /* size 0x8 */
	. = . + 0x1; /* padding after .text.__restore_rt */
	. = ALIGN(0x4); /* align for .text.chmod */
	"/usr/local/popcorn/aarch64/lib/libc.a(chmod.o)"(.text.chmod); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.fstat */
	"/usr/local/popcorn/aarch64/lib/libc.a(fstat.o)"(.text.fstat); /* size 0x64 */
	. = ALIGN(0x4); /* align for .text.__futimesat */
	"/usr/local/popcorn/aarch64/lib/libc.a(futimesat.o)"(.text.__futimesat); /* size 0x88 */
	. = ALIGN(0x4); /* align for .text.lstat */
	"/usr/local/popcorn/aarch64/lib/libc.a(lstat.o)"(.text.lstat); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.mkdir */
	"/usr/local/popcorn/aarch64/lib/libc.a(mkdir.o)"(.text.mkdir); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.stat */
	"/usr/local/popcorn/aarch64/lib/libc.a(stat.o)"(.text.stat); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.__statfs */
	"/usr/local/popcorn/aarch64/lib/libc.a(statvfs.o)"(.text.__statfs); /* size 0x60 */
	. = ALIGN(0x4); /* align for .text.__fstatfs */
	"/usr/local/popcorn/aarch64/lib/libc.a(statvfs.o)"(.text.__fstatfs); /* size 0x60 */
	. = ALIGN(0x4); /* align for .text.statvfs */
	"/usr/local/popcorn/aarch64/lib/libc.a(statvfs.o)"(.text.statvfs); /* size 0xf0 */
	. = . + 0x56; /* padding after .text.statvfs */
	. = ALIGN(0x4); /* align for .text.fstatvfs */
	"/usr/local/popcorn/aarch64/lib/libc.a(statvfs.o)"(.text.fstatvfs); /* size 0xf8 */
	. = . + 0x4d; /* padding after .text.fstatvfs */
	. = ALIGN(0x4); /* align for .text.umask */
	"/usr/local/popcorn/aarch64/lib/libc.a(umask.o)"(.text.umask); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.utimensat */
	"/usr/local/popcorn/aarch64/lib/libc.a(utimensat.o)"(.text.utimensat); /* size 0x28 */
	. = . + 0xb5; /* padding after .text.utimensat */
	. = ALIGN(0x4); /* align for .text.__fclose_ca */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fclose_ca.o)"(.text.__fclose_ca); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.__fdopen */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fdopen.o)"(.text.__fdopen); /* size 0x1b4 */
	. = ALIGN(0x4); /* align for .text.__fopen_rb_ca */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fopen_rb_ca.o)"(.text.__fopen_rb_ca); /* size 0xc0 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_close.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__stdio_close */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_close.o)"(.text.__stdio_close); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__stdio_read */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_read.o)"(.text.__stdio_read); /* size 0xe0 */
	. = ALIGN(0x4); /* align for .text.__stdio_seek */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_seek.o)"(.text.__stdio_seek); /* size 0x14 */
	. = . + 0x2; /* padding after .text.__stdio_seek */
	. = ALIGN(0x4); /* align for .text.__stdio_write */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_write.o)"(.text.__stdio_write); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(fclose.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.fclose */
	"/usr/local/popcorn/aarch64/lib/libc.a(fclose.o)"(.text.fclose); /* size 0xd8 */
	. = ALIGN(0x4); /* align for .text.ferror */
	"/usr/local/popcorn/aarch64/lib/libc.a(ferror.o)"(.text.ferror); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.fflush */
	"/usr/local/popcorn/aarch64/lib/libc.a(fflush.o)"(.text.fflush); /* size 0x154 */
	. = ALIGN(0x4); /* align for .text.fgets */
	"/usr/local/popcorn/aarch64/lib/libc.a(fgets.o)"(.text.fgets); /* size 0x198 */
	. = ALIGN(0x4); /* align for .text.fopen */
	"/usr/local/popcorn/aarch64/lib/libc.a(fopen.o)"(.text.fopen); /* size 0xbc */
	. = ALIGN(0x4); /* align for .text.fread */
	"/usr/local/popcorn/aarch64/lib/libc.a(fread.o)"(.text.fread); /* size 0x124 */
	. = ALIGN(0x4); /* align for .text.getc */
	"/usr/local/popcorn/aarch64/lib/libc.a(getc.o)"(.text.getc); /* size 0xa0 */
	. = ALIGN(0x4); /* align for .text.getline */
	"/usr/local/popcorn/aarch64/lib/libc.a(getline.o)"(.text.getline); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.__ofl_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.text.__ofl_lock); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__ofl_unlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.text.__ofl_unlock); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.__ofl_add */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl_add.o)"(.text.__ofl_add); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.rename */
	"/usr/local/popcorn/aarch64/lib/libc.a(rename.o)"(.text.rename); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.sprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(sprintf.o)"(.text.sprintf); /* size 0x74 */
	. = . + 0x23; /* padding after .text.sprintf */
	. = ALIGN(0x4); /* align for .text.vsprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsprintf.o)"(.text.vsprintf); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.qsort */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.qsort); /* size 0x34c */
	. = . + 0x7; /* padding after .text.qsort */
	. = ALIGN(0x4); /* align for .text.sift */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.sift); /* size 0x108 */
	. = ALIGN(0x4); /* align for .text.trinkle */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.trinkle); /* size 0x1dc */
	. = . + 0x59; /* padding after .text.trinkle */
	. = ALIGN(0x4); /* align for .text.cycle */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.text.cycle); /* size 0xbc */
	. = ALIGN(0x4); /* align for .text.strtoull */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoull); /* size 0x8 */
	. = . + 0x4; /* padding after .text.strtoull */
	. = ALIGN(0x4); /* align for .text.strtox */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtox); /* size 0xb4 */
	. = ALIGN(0x4); /* align for .text.strtoll */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoll); /* size 0x8 */
	. = . + 0x7; /* padding after .text.strtoll */
	. = ALIGN(0x4); /* align for .text.strtoul */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoul); /* size 0x8 */
	. = . + 0x4; /* padding after .text.strtoul */
	. = ALIGN(0x4); /* align for .text.strtol */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtol); /* size 0x8 */
	. = . + 0x7; /* padding after .text.strtol */
	. = ALIGN(0x4); /* align for .text.strtoimax */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoimax); /* size 0x8 */
	. = . + 0x7; /* padding after .text.strtoimax */
	. = ALIGN(0x4); /* align for .text.strtoumax */
	"/usr/local/popcorn/aarch64/lib/libc.a(strtol.o)"(.text.strtoumax); /* size 0x8 */
	. = . + 0x4; /* padding after .text.strtoumax */
	. = ALIGN(0x10); /* align for .text.memchr */
	"/usr/local/popcorn/aarch64/lib/libc.a(memchr.o)"(.text.memchr); /* size 0x1d4 */
	. = . + 0x9; /* padding after .text.memchr */
	. = ALIGN(0x10); /* align for .text.memcmp */
	"/usr/local/popcorn/aarch64/lib/libc.a(memcmp.o)"(.text.memcmp); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.strcat */
	"/usr/local/popcorn/aarch64/lib/libc.a(strcat.o)"(.text.strcat); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.strchr */
	"/usr/local/popcorn/aarch64/lib/libc.a(strchr.o)"(.text.strchr); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.__strchrnul */
	"/usr/local/popcorn/aarch64/lib/libc.a(strchrnul.o)"(.text.__strchrnul); /* size 0x1c0 */
	. = . + 0xc; /* padding after .text.__strchrnul */
	. = ALIGN(0x10); /* align for .text.strcmp */
	"/usr/local/popcorn/aarch64/lib/libc.a(strcmp.o)"(.text.strcmp); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.strcpy */
	"/usr/local/popcorn/aarch64/lib/libc.a(strcpy.o)"(.text.strcpy); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.__strdup */
	"/usr/local/popcorn/aarch64/lib/libc.a(strdup.o)"(.text.__strdup); /* size 0x68 */
	. = . + 0x3; /* padding after .text.__strdup */
	. = ALIGN(0x10); /* align for .text.strlen */
	"/usr/local/popcorn/aarch64/lib/libc.a(strlen.o)"(.text.strlen); /* size 0xf8 */
	. = . + 0x6; /* padding after .text.strlen */
	. = ALIGN(0x10); /* align for .text.strncmp */
	"/usr/local/popcorn/aarch64/lib/libc.a(strncmp.o)"(.text.strncmp); /* size 0xec */
	. = . + 0xc; /* padding after .text.strncmp */
	. = ALIGN(0x10); /* align for .text.strnlen */
	"/usr/local/popcorn/aarch64/lib/libc.a(strnlen.o)"(.text.strnlen); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.strpbrk */
	"/usr/local/popcorn/aarch64/lib/libc.a(strpbrk.o)"(.text.strpbrk); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.strstr */
	"/usr/local/popcorn/aarch64/lib/libc.a(strstr.o)"(.text.strstr); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.twobyte_strstr */
	"/usr/local/popcorn/aarch64/lib/libc.a(strstr.o)"(.text.twobyte_strstr); /* size 0xd4 */
	. = . + 0x12; /* padding after .text.twobyte_strstr */
	. = ALIGN(0x10); /* align for .text.threebyte_strstr */
	"/usr/local/popcorn/aarch64/lib/libc.a(strstr.o)"(.text.threebyte_strstr); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.fourbyte_strstr */
	"/usr/local/popcorn/aarch64/lib/libc.a(strstr.o)"(.text.fourbyte_strstr); /* size 0x10c */
	. = ALIGN(0x10); /* align for .text.twoway_strstr */
	"/usr/local/popcorn/aarch64/lib/libc.a(strstr.o)"(.text.twoway_strstr); /* size 0x780 */
	. = ALIGN(0x4); /* align for .text.memcpy */
	"/usr/local/popcorn/aarch64/lib/libc.a(memcpy.o)"(.text.memcpy); /* size 0x9d0 */
	. = ALIGN(0x4); /* align for .text.memmove */
	"/usr/local/popcorn/aarch64/lib/libc.a(memmove.o)"(.text.memmove); /* size 0x2b4 */
	. = ALIGN(0x4); /* align for .text.memset */
	"/usr/local/popcorn/aarch64/lib/libc.a(memset.o)"(.text.memset); /* size 0x31c */
	. = ALIGN(0x4); /* align for .text.__lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lock.o)"(.text.__lock); /* size 0x64 */
	. = ALIGN(0x4); /* align for .text.__unlock */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lock.o)"(.text.__unlock); /* size 0x54 */
	. = ALIGN(0x4); /* align for .text.sccp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__syscall_cp.o)"(.text.sccp); /* size 0x4 */
	. = . + 0xf; /* padding after .text.sccp */
	. = ALIGN(0x4); /* align for .text.__syscall_cp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__syscall_cp.o)"(.text.__syscall_cp); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__syscall_cp */
	. = ALIGN(0x4); /* align for .text.__wait */
	"/usr/local/popcorn/aarch64/lib/libc.a(__wait.o)"(.text.__wait); /* size 0xc4 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_cleanup_push.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text._pthread_cleanup_push */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_cleanup_push.o)"(.text._pthread_cleanup_push); /* size 0x8 */
	. = . + 0x4; /* padding after .text._pthread_cleanup_push */
	. = ALIGN(0x4); /* align for .text._pthread_cleanup_pop */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_cleanup_push.o)"(.text._pthread_cleanup_pop); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.__pthread_setcancelstate */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_setcancelstate.o)"(.text.__pthread_setcancelstate); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.pthread_sigmask */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_sigmask.o)"(.text.pthread_sigmask); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.sem_destroy */
	"/usr/local/popcorn/aarch64/lib/libc.a(sem_destroy.o)"(.text.sem_destroy); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.sem_init */
	"/usr/local/popcorn/aarch64/lib/libc.a(sem_init.o)"(.text.sem_init); /* size 0x48 */
	. = ALIGN(0x4); /* align for .text.sem_post */
	"/usr/local/popcorn/aarch64/lib/libc.a(sem_post.o)"(.text.sem_post); /* size 0xb0 */
	. = ALIGN(0x4); /* align for .text.sem_wait */
	"/usr/local/popcorn/aarch64/lib/libc.a(sem_wait.o)"(.text.sem_wait); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.__synccall */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.text.__synccall); /* size 0x328 */
	. = ALIGN(0x4); /* align for .text.handler */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.text.handler); /* size 0x134 */
	. = ALIGN(0x4); /* align for .text.__clock_gettime */
	"/usr/local/popcorn/aarch64/lib/libc.a(clock_gettime.o)"(.text.__clock_gettime); /* size 0x68 */
	. = ALIGN(0x4); /* align for .text.gettimeofday */
	"/usr/local/popcorn/aarch64/lib/libc.a(gettimeofday.o)"(.text.gettimeofday); /* size 0x64 */
	. = ALIGN(0x4); /* align for .text.__gmtime_r */
	"/usr/local/popcorn/aarch64/lib/libc.a(gmtime_r.o)"(.text.__gmtime_r); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.localtime */
	"/usr/local/popcorn/aarch64/lib/libc.a(localtime.o)"(.text.localtime); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.__localtime_r */
	"/usr/local/popcorn/aarch64/lib/libc.a(localtime_r.o)"(.text.__localtime_r); /* size 0x88 */
	. = ALIGN(0x4); /* align for .text.mktime */
	"/usr/local/popcorn/aarch64/lib/libc.a(mktime.o)"(.text.mktime); /* size 0xfc */
	. = ALIGN(0x4); /* align for .text.__strftime_fmt_1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.text.__strftime_fmt_1); /* size 0x4f4 */
	. = ALIGN(0x4); /* align for .text.week_num */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.text.week_num); /* size 0x210 */
	. = ALIGN(0x4); /* align for .text.__strftime_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.text.__strftime_l); /* size 0x248 */
	. = ALIGN(0x4); /* align for .text.strftime */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.text.strftime); /* size 0xc */
	. = . + 0x9; /* padding after .text.strftime */
	. = ALIGN(0x4); /* align for .text.time */
	"/usr/local/popcorn/aarch64/lib/libc.a(time.o)"(.text.time); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.chdir */
	"/usr/local/popcorn/aarch64/lib/libc.a(chdir.o)"(.text.chdir); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.chown */
	"/usr/local/popcorn/aarch64/lib/libc.a(chown.o)"(.text.chown); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(close.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.close */
	"/usr/local/popcorn/aarch64/lib/libc.a(close.o)"(.text.close); /* size 0x44 */
	. = ALIGN(0x4); /* align for .text.dup2 */
	"/usr/local/popcorn/aarch64/lib/libc.a(dup2.o)"(.text.dup2); /* size 0x64 */
	. = ALIGN(0x4); /* align for .text.ftruncate */
	"/usr/local/popcorn/aarch64/lib/libc.a(ftruncate.o)"(.text.ftruncate); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.geteuid */
	"/usr/local/popcorn/aarch64/lib/libc.a(geteuid.o)"(.text.geteuid); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.gethostname */
	"/usr/local/popcorn/aarch64/lib/libc.a(gethostname.o)"(.text.gethostname); /* size 0x94 */
	. = ALIGN(0x4); /* align for .text.getpid */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpid.o)"(.text.getpid); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.getppid */
	"/usr/local/popcorn/aarch64/lib/libc.a(getppid.o)"(.text.getppid); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.getuid */
	"/usr/local/popcorn/aarch64/lib/libc.a(getuid.o)"(.text.getuid); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.lseek */
	"/usr/local/popcorn/aarch64/lib/libc.a(lseek.o)"(.text.lseek); /* size 0x14 */
	. = . + 0x1; /* padding after .text.lseek */
	. = ALIGN(0x4); /* align for .text.pread */
	"/usr/local/popcorn/aarch64/lib/libc.a(pread.o)"(.text.pread); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.pwrite */
	"/usr/local/popcorn/aarch64/lib/libc.a(pwrite.o)"(.text.pwrite); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.read */
	"/usr/local/popcorn/aarch64/lib/libc.a(read.o)"(.text.read); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.readlink */
	"/usr/local/popcorn/aarch64/lib/libc.a(readlink.o)"(.text.readlink); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.readv */
	"/usr/local/popcorn/aarch64/lib/libc.a(readv.o)"(.text.readv); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.setgid */
	"/usr/local/popcorn/aarch64/lib/libc.a(setgid.o)"(.text.setgid); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.setsid */
	"/usr/local/popcorn/aarch64/lib/libc.a(setsid.o)"(.text.setsid); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.setuid */
	"/usr/local/popcorn/aarch64/lib/libc.a(setuid.o)"(.text.setuid); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.__setxid */
	"/usr/local/popcorn/aarch64/lib/libc.a(setxid.o)"(.text.__setxid); /* size 0x64 */
	. = ALIGN(0x4); /* align for .text.do_setxid */
	"/usr/local/popcorn/aarch64/lib/libc.a(setxid.o)"(.text.do_setxid); /* size 0x68 */
	. = ALIGN(0x4); /* align for .text.unlink */
	"/usr/local/popcorn/aarch64/lib/libc.a(unlink.o)"(.text.unlink); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.usleep */
	"/usr/local/popcorn/aarch64/lib/libc.a(usleep.o)"(.text.usleep); /* size 0x54 */
	. = ALIGN(0x4); /* align for .text.write */
	"/usr/local/popcorn/aarch64/lib/libc.a(write.o)"(.text.write); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.writev */
	"/usr/local/popcorn/aarch64/lib/libc.a(writev.o)"(.text.writev); /* size 0x34 */
	. = ALIGN(0x4); /* align for .text.__crypt_blowfish */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.text.__crypt_blowfish); /* size 0x1a8 */
	. = . + 0x7; /* padding after .text.__crypt_blowfish */
	. = ALIGN(0x4); /* align for .text.BF_crypt */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.text.BF_crypt); /* size 0x56c */
	. = ALIGN(0x4); /* align for .text.BF_set_key */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.text.BF_set_key); /* size 0xf4 */
	. = ALIGN(0x4); /* align for .text.BF_encrypt */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.text.BF_encrypt); /* size 0xc4 */
	. = ALIGN(0x4); /* align for .text.__des_setkey */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.text.__des_setkey); /* size 0x1cc */
	. = ALIGN(0x4); /* align for .text.__do_des */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.text.__do_des); /* size 0x214 */
	. = . + 0xc; /* padding after .text.__do_des */
	. = ALIGN(0x4); /* align for .text.__crypt_des */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.text.__crypt_des); /* size 0xb0 */
	. = ALIGN(0x4); /* align for .text._crypt_extended_r_uut */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.text._crypt_extended_r_uut); /* size 0x474 */
	. = . + 0x1c; /* padding after .text._crypt_extended_r_uut */
	. = ALIGN(0x4); /* align for .text.__crypt_md5 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.text.__crypt_md5); /* size 0x80 */
	. = ALIGN(0x4); /* align for .text.md5crypt */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.text.md5crypt); /* size 0x39c */
	. = ALIGN(0x4); /* align for .text.md5_update */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.text.md5_update); /* size 0xd8 */
	. = ALIGN(0x4); /* align for .text.md5_sum */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.text.md5_sum); /* size 0x130 */
	. = ALIGN(0x4); /* align for .text.processblock */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.text.processblock); /* size 0x430 */
	. = ALIGN(0x4); /* align for .text.isalnum */
	"/usr/local/popcorn/aarch64/lib/libc.a(isalnum.o)"(.text.isalnum); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__isalnum_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(isalnum.o)"(.text.__isalnum_l); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.readdir_r */
	"/usr/local/popcorn/aarch64/lib/libc.a(readdir_r.o)"(.text.readdir_r); /* size 0xac */
	. = ALIGN(0x4); /* align for .text.rewinddir */
	"/usr/local/popcorn/aarch64/lib/libc.a(rewinddir.o)"(.text.rewinddir); /* size 0x44 */
	. = ALIGN(0x4); /* align for .text.__init_tp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.text.__init_tp); /* size 0x74 */
	. = ALIGN(0x4); /* align for .text.__copy_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.text.__copy_tls); /* size 0x9c */
	. = . + 0x2; /* padding after .text.__copy_tls */
	. = ALIGN(0x4); /* align for .text.static_init_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.text.static_init_tls); /* size 0x158 */
	. = ALIGN(0x4); /* align for .text.popcorn_getnid */
	"/usr/local/popcorn/aarch64/lib/libc.a(platform.o)"(.text.popcorn_getnid); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.popcorn_getthreadinfo */
	"/usr/local/popcorn/aarch64/lib/libc.a(platform.o)"(.text.popcorn_getthreadinfo); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.popcorn_getnodeinfo */
	"/usr/local/popcorn/aarch64/lib/libc.a(platform.o)"(.text.popcorn_getnodeinfo); /* size 0x8c */
	. = ALIGN(0x4); /* align for .text._Exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(_Exit.o)"(.text._Exit); /* size 0x20 */
	. = ALIGN(0x10); /* align for .text.__intscan */
	"/usr/local/popcorn/aarch64/lib/libc.a(intscan.o)"(.text.__intscan); /* size 0x9ec */
	. = ALIGN(0x10); /* align for .text.__isspace */
	"/usr/local/popcorn/aarch64/lib/libc.a(intscan.o)"(.text.__isspace); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.__procfdname */
	"/usr/local/popcorn/aarch64/lib/libc.a(procfdname.o)"(.text.__procfdname); /* size 0x140 */
	. = ALIGN(0x10); /* align for .text.__shlim */
	"/usr/local/popcorn/aarch64/lib/libc.a(shgetc.o)"(.text.__shlim); /* size 0x84 */
	. = . + 0x6; /* padding after .text.__shlim */
	. = ALIGN(0x10); /* align for .text.__shgetc */
	"/usr/local/popcorn/aarch64/lib/libc.a(shgetc.o)"(.text.__shgetc); /* size 0x150 */
	. = . + 0x16; /* padding after .text.__shgetc */
	. = ALIGN(0x10); /* align for .text.__syscall */
	"/usr/local/popcorn/aarch64/lib/libc.a(syscall.o)"(.text.__syscall); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.setgroups */
	"/usr/local/popcorn/aarch64/lib/libc.a(setgroups.o)"(.text.setgroups); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.__nl_langinfo_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.text.__nl_langinfo_l); /* size 0x124 */
	. = ALIGN(0x4); /* align for .text.__nl_langinfo */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.text.__nl_langinfo); /* size 0xc */
	. = . + 0x9; /* padding after .text.__nl_langinfo */
	. = ALIGN(0x10); /* align for .text.__expand_heap */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.__expand_heap); /* size 0x248 */
	. = ALIGN(0x10); /* align for .text.__syscall1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.__syscall1); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.traverses_stack_p */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.traverses_stack_p); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.__expand_heap_node */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.__expand_heap_node); /* size 0x2b4 */
	. = ALIGN(0x10); /* align for .text.popcorn_get_arena */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.popcorn_get_arena); /* size 0x6c */
	. = ALIGN(0x10); /* align for .text.set_arena_start */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.set_arena_start); /* size 0x120 */
	. = . + 0x2; /* padding after .text.set_arena_start */
	. = ALIGN(0x10); /* align for .text.a_swap */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.a_swap); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.a_store */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.a_store); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.__wake */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.__wake); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.__syscall3 */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.__syscall3); /* size 0x60 */
	. = ALIGN(0x10); /* align for .text.__memalign */
	"/usr/local/popcorn/aarch64/lib/libc.a(memalign.o)"(.text.__memalign); /* size 0x23c */
	. = ALIGN(0x4); /* align for .text.mbstowcs */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbstowcs.o)"(.text.mbstowcs); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__dn_expand */
	"/usr/local/popcorn/aarch64/lib/libc.a(dn_expand.o)"(.text.__dn_expand); /* size 0x124 */
	. = . + 0x2a; /* padding after .text.__dn_expand */
	. = ALIGN(0x4); /* align for .text.__dns_parse */
	"/usr/local/popcorn/aarch64/lib/libc.a(dns_parse.o)"(.text.__dns_parse); /* size 0x1d8 */
	. = ALIGN(0x4); /* align for .text.__lookup_ipliteral */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_ipliteral.o)"(.text.__lookup_ipliteral); /* size 0x1a4 */
	. = ALIGN(0x4); /* align for .text.__getgr_a */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgr_a.o)"(.text.__getgr_a); /* size 0x500 */
	. = . + 0x1e; /* padding after .text.__getgr_a */
	. = ALIGN(0x4); /* align for .text.__getpw_a */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpw_a.o)"(.text.__getpw_a); /* size 0x374 */
	. = . + 0x2a; /* padding after .text.__getpw_a */
	. = ALIGN(0x4); /* align for .text.fnmatch */
	"/usr/local/popcorn/aarch64/lib/libc.a(fnmatch.o)"(.text.fnmatch); /* size 0x160 */
	. = ALIGN(0x4); /* align for .text.pat_next */
	"/usr/local/popcorn/aarch64/lib/libc.a(fnmatch.o)"(.text.pat_next); /* size 0x220 */
	. = ALIGN(0x4); /* align for .text.fnmatch_internal */
	"/usr/local/popcorn/aarch64/lib/libc.a(fnmatch.o)"(.text.fnmatch_internal); /* size 0x4b4 */
	. = . + 0x35; /* padding after .text.fnmatch_internal */
	. = ALIGN(0x4); /* align for .text.str_next */
	"/usr/local/popcorn/aarch64/lib/libc.a(fnmatch.o)"(.text.str_next); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.casefold */
	"/usr/local/popcorn/aarch64/lib/libc.a(fnmatch.o)"(.text.casefold); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.match_bracket */
	"/usr/local/popcorn/aarch64/lib/libc.a(fnmatch.o)"(.text.match_bracket); /* size 0x228 */
	. = ALIGN(0x4); /* align for .text.__fmodeflags */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fmodeflags.o)"(.text.__fmodeflags); /* size 0x94 */
	. = ALIGN(0x4); /* align for .text.__lockfile */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lockfile.o)"(.text.__lockfile); /* size 0x70 */
	. = . + 0x2; /* padding after .text.__lockfile */
	. = ALIGN(0x4); /* align for .text.__unlockfile */
	"/usr/local/popcorn/aarch64/lib/libc.a(__lockfile.o)"(.text.__unlockfile); /* size 0x4c */
	. = ALIGN(0x4); /* align for .text.__toread */
	"/usr/local/popcorn/aarch64/lib/libc.a(__toread.o)"(.text.__toread); /* size 0x88 */
	. = ALIGN(0x4); /* align for .text.__toread_needs_stdio_exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(__toread.o)"(.text.__toread_needs_stdio_exit); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__toread_needs_stdio_exit */
	. = ALIGN(0x4); /* align for .text.__uflow */
	"/usr/local/popcorn/aarch64/lib/libc.a(__uflow.o)"(.text.__uflow); /* size 0x54 */
	. = ALIGN(0x4); /* align for .text.getdelim */
	"/usr/local/popcorn/aarch64/lib/libc.a(getdelim.o)"(.text.getdelim); /* size 0x270 */
	. = ALIGN(0x4); /* align for .text.snprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(snprintf.o)"(.text.snprintf); /* size 0x74 */
	. = . + 0x1e; /* padding after .text.snprintf */
	. = ALIGN(0x4); /* align for .text.vsnprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsnprintf.o)"(.text.vsnprintf); /* size 0xd4 */
	. = ALIGN(0x4); /* align for .text.sn_write */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsnprintf.o)"(.text.sn_write); /* size 0xd8 */
	. = ALIGN(0x4); /* align for .text.abs */
	"/usr/local/popcorn/aarch64/lib/libc.a(abs.o)"(.text.abs); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.atoi */
	"/usr/local/popcorn/aarch64/lib/libc.a(atoi.o)"(.text.atoi); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.__stpcpy */
	"/usr/local/popcorn/aarch64/lib/libc.a(stpcpy.o)"(.text.__stpcpy); /* size 0x158 */
	. = . + 0x7; /* padding after .text.__stpcpy */
	. = ALIGN(0x10); /* align for .text.strcspn */
	"/usr/local/popcorn/aarch64/lib/libc.a(strcspn.o)"(.text.strcspn); /* size 0x1b4 */
	. = ALIGN(0x4); /* align for .text.sem_timedwait */
	"/usr/local/popcorn/aarch64/lib/libc.a(sem_timedwait.o)"(.text.sem_timedwait); /* size 0x124 */
	. = ALIGN(0x4); /* align for .text.cleanup */
	"/usr/local/popcorn/aarch64/lib/libc.a(sem_timedwait.o)"(.text.cleanup); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.sem_trywait */
	"/usr/local/popcorn/aarch64/lib/libc.a(sem_trywait.o)"(.text.sem_trywait); /* size 0x80 */
	. = ALIGN(0x10); /* align for .text.__set_thread_area */
	"/usr/local/popcorn/aarch64/lib/libc.a(__set_thread_area.o)"(.text.__set_thread_area); /* size 0xc */
	. = . + 0x4; /* padding after .text.__set_thread_area */
	. = ALIGN(0x4); /* align for .text.__secs_to_tm */
	"/usr/local/popcorn/aarch64/lib/libc.a(__secs_to_tm.o)"(.text.__secs_to_tm); /* size 0x2f8 */
	. = ALIGN(0x4); /* align for .text.__tm_to_secs */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tm_to_secs.o)"(.text.__tm_to_secs); /* size 0xc4 */
	. = ALIGN(0x4); /* align for .text.__secs_to_zone */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.__secs_to_zone); /* size 0x50c */
	. = . + 0x23; /* padding after .text.__secs_to_zone */
	. = ALIGN(0x4); /* align for .text.rule_to_secs */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.rule_to_secs); /* size 0x16c */
	. = ALIGN(0x4); /* align for .text.__tzset */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.__tzset); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.__tm_to_tzname */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.__tm_to_tzname); /* size 0xa0 */
	. = ALIGN(0x4); /* align for .text.do_tzset */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.do_tzset); /* size 0x674 */
	. = ALIGN(0x4); /* align for .text.getname */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.getname); /* size 0x90 */
	. = . + 0x6; /* padding after .text.getname */
	. = ALIGN(0x4); /* align for .text.getoff */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.getoff); /* size 0x128 */
	. = ALIGN(0x4); /* align for .text.getrule */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.text.getrule); /* size 0x190 */
	. = ALIGN(0x4); /* align for .text.__year_to_secs */
	"/usr/local/popcorn/aarch64/lib/libc.a(__year_to_secs.o)"(.text.__year_to_secs); /* size 0x168 */
	. = ALIGN(0x4); /* align for .text.nanosleep */
	"/usr/local/popcorn/aarch64/lib/libc.a(nanosleep.o)"(.text.nanosleep); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.iswctype */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswctype.o)"(.text.iswctype); /* size 0x98 */
	. = ALIGN(0x4); /* align for .text.wctype */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswctype.o)"(.text.wctype); /* size 0x68 */
	. = ALIGN(0x4); /* align for .text.__iswctype_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswctype.o)"(.text.__iswctype_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__iswctype_l */
	. = ALIGN(0x4); /* align for .text.__wctype_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswctype.o)"(.text.__wctype_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__wctype_l */
	. = ALIGN(0x4); /* align for .text.iswgraph */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswgraph.o)"(.text.iswgraph); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.__iswgraph_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswgraph.o)"(.text.__iswgraph_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__iswgraph_l */
	. = ALIGN(0x4); /* align for .text.iswlower */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswlower.o)"(.text.iswlower); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__iswlower_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswlower.o)"(.text.__iswlower_l); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.iswprint */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswprint.o)"(.text.iswprint); /* size 0x8c */
	. = ALIGN(0x4); /* align for .text.__iswprint_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswprint.o)"(.text.__iswprint_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__iswprint_l */
	. = ALIGN(0x4); /* align for .text.iswpunct */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswpunct.o)"(.text.iswpunct); /* size 0x3c */
	. = ALIGN(0x4); /* align for .text.__iswpunct_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswpunct.o)"(.text.__iswpunct_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__iswpunct_l */
	. = ALIGN(0x4); /* align for .text.iswspace */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswspace.o)"(.text.iswspace); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.__iswspace_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswspace.o)"(.text.__iswspace_l); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.iswupper */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswupper.o)"(.text.iswupper); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__iswupper_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswupper.o)"(.text.__iswupper_l); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.iswxdigit */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswxdigit.o)"(.text.iswxdigit); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__iswxdigit_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswxdigit.o)"(.text.__iswxdigit_l); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.towupper */
	"/usr/local/popcorn/aarch64/lib/libc.a(towctrans.o)"(.text.towupper); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__towcase */
	"/usr/local/popcorn/aarch64/lib/libc.a(towctrans.o)"(.text.__towcase); /* size 0x1dc */
	. = ALIGN(0x4); /* align for .text.towlower */
	"/usr/local/popcorn/aarch64/lib/libc.a(towctrans.o)"(.text.towlower); /* size 0x28 */
	. = ALIGN(0x4); /* align for .text.__towupper_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(towctrans.o)"(.text.__towupper_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__towupper_l */
	. = ALIGN(0x4); /* align for .text.__towlower_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(towctrans.o)"(.text.__towlower_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__towlower_l */
	. = ALIGN(0x4); /* align for .text.mbsrtowcs */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbsrtowcs.o)"(.text.mbsrtowcs); /* size 0x320 */
	. = ALIGN(0x4); /* align for .text.mbtowc */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbtowc.o)"(.text.mbtowc); /* size 0x14c */
	. = ALIGN(0x4); /* align for .text.if_nametoindex */
	"/usr/local/popcorn/aarch64/lib/libc.a(if_nametoindex.o)"(.text.if_nametoindex); /* size 0x80 */
	. = ALIGN(0x4); /* align for .text.__inet_aton */
	"/usr/local/popcorn/aarch64/lib/libc.a(inet_aton.o)"(.text.__inet_aton); /* size 0x16c */
	. = ALIGN(0x4); /* align for .text.inet_pton */
	"/usr/local/popcorn/aarch64/lib/libc.a(inet_pton.o)"(.text.inet_pton); /* size 0x2e4 */
	. = ALIGN(0x4); /* align for .text.__stdio_exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_exit.o)"(.text.__stdio_exit); /* size 0x48 */
	. = ALIGN(0x4); /* align for .text.close_file */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_exit.o)"(.text.close_file); /* size 0x70 */
	. = ALIGN(0x4); /* align for .text.vfprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.vfprintf); /* size 0x1a0 */
	. = . + 0x1a; /* padding after .text.vfprintf */
	. = ALIGN(0x4); /* align for .text.printf_core */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.printf_core); /* size 0x1cc4 */
	. = . + 0x142; /* padding after .text.printf_core */
	. = ALIGN(0x4); /* align for .text.getint */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.getint); /* size 0x74 */
	. = ALIGN(0x4); /* align for .text.pop_arg */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.pop_arg); /* size 0x27c */
	. = ALIGN(0x4); /* align for .text.pad */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.text.pad); /* size 0xc4 */
	. = ALIGN(0x10); /* align for .text.strncpy */
	"/usr/local/popcorn/aarch64/lib/libc.a(strncpy.o)"(.text.strncpy); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.wcschr */
	"/usr/local/popcorn/aarch64/lib/libc.a(wcschr.o)"(.text.wcschr); /* size 0xd0 */
	. = ALIGN(0x10); /* align for .text.wcslen */
	"/usr/local/popcorn/aarch64/lib/libc.a(wcslen.o)"(.text.wcslen); /* size 0x48 */
	. = ALIGN(0x4); /* align for .text.__timedwait_cp */
	"/usr/local/popcorn/aarch64/lib/libc.a(__timedwait.o)"(.text.__timedwait_cp); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.__timedwait */
	"/usr/local/popcorn/aarch64/lib/libc.a(__timedwait.o)"(.text.__timedwait); /* size 0x70 */
	. = ALIGN(0x4); /* align for .text.__pthread_testcancel */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_testcancel.o)"(.text.__pthread_testcancel); /* size 0x4 */
	. = . + 0x3; /* padding after .text.__pthread_testcancel */
	. = ALIGN(0x4); /* align for .text.dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_testcancel.o)"(.text.dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .text.__map_file */
	"/usr/local/popcorn/aarch64/lib/libc.a(__map_file.o)"(.text.__map_file); /* size 0xac */
	. = ALIGN(0x4); /* align for .text.__month_to_secs */
	"/usr/local/popcorn/aarch64/lib/libc.a(__month_to_secs.o)"(.text.__month_to_secs); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.iswalnum */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswalnum.o)"(.text.iswalnum); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.__iswalnum_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswalnum.o)"(.text.__iswalnum_l); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.iswalpha */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswalpha.o)"(.text.iswalpha); /* size 0x48 */
	. = ALIGN(0x4); /* align for .text.__iswalpha_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswalpha.o)"(.text.__iswalpha_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__iswalpha_l */
	. = ALIGN(0x4); /* align for .text.iswblank */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswblank.o)"(.text.iswblank); /* size 0x4 */
	. = . + 0x1; /* padding after .text.iswblank */
	. = ALIGN(0x4); /* align for .text.__iswblank_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswblank.o)"(.text.__iswblank_l); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__iswblank_l */
	. = ALIGN(0x4); /* align for .text.iswcntrl */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswcntrl.o)"(.text.iswcntrl); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.__iswcntrl_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswcntrl.o)"(.text.__iswcntrl_l); /* size 0x40 */
	. = ALIGN(0x4); /* align for .text.tolower */
	"/usr/local/popcorn/aarch64/lib/libc.a(tolower.o)"(.text.tolower); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.__tolower_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(tolower.o)"(.text.__tolower_l); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.toupper */
	"/usr/local/popcorn/aarch64/lib/libc.a(toupper.o)"(.text.toupper); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.__toupper_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(toupper.o)"(.text.__toupper_l); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.__fpclassifyl */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fpclassifyl.o)"(.text.__fpclassifyl); /* size 0x54 */
	. = . + 0x1; /* padding after .text.__fpclassifyl */
	. = ALIGN(0x4); /* align for .text.__signbitl */
	"/usr/local/popcorn/aarch64/lib/libc.a(__signbitl.o)"(.text.__signbitl); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.frexpl */
	"/usr/local/popcorn/aarch64/lib/libc.a(frexpl.o)"(.text.frexpl); /* size 0xb4 */
	. = ALIGN(0x4); /* align for .text.wctomb */
	"/usr/local/popcorn/aarch64/lib/libc.a(wctomb.o)"(.text.wctomb); /* size 0x24 */
	. = ALIGN(0x4); /* align for .text.__fwritex */
	"/usr/local/popcorn/aarch64/lib/libc.a(fwrite.o)"(.text.__fwritex); /* size 0xf4 */
	. = ALIGN(0x4); /* align for .text.fwrite */
	"/usr/local/popcorn/aarch64/lib/libc.a(fwrite.o)"(.text.fwrite); /* size 0x9c */
	. = ALIGN(0x10); /* align for .text.__stpncpy */
	"/usr/local/popcorn/aarch64/lib/libc.a(stpncpy.o)"(.text.__stpncpy); /* size 0x218 */
	. = ALIGN(0x4); /* align for .text.isblank */
	"/usr/local/popcorn/aarch64/lib/libc.a(isblank.o)"(.text.isblank); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.__isblank_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(isblank.o)"(.text.__isblank_l); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.wcrtomb */
	"/usr/local/popcorn/aarch64/lib/libc.a(wcrtomb.o)"(.text.wcrtomb); /* size 0x10c */
	. = . + 0xc; /* padding after .text.wcrtomb */
	. = ALIGN(0x4); /* align for .text.__towrite */
	"/usr/local/popcorn/aarch64/lib/libc.a(__towrite.o)"(.text.__towrite); /* size 0x50 */
	. = ALIGN(0x4); /* align for .text.__towrite_needs_stdio_exit */
	"/usr/local/popcorn/aarch64/lib/libc.a(__towrite.o)"(.text.__towrite_needs_stdio_exit); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__towrite_needs_stdio_exit */
	. = ALIGN(0x10); /* align for .text.node_available */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.node_available); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.current_arch */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.current_arch); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.current_nid */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.current_nid); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.__init_nodes_info */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.__init_nodes_info); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.__migrate_shim_internal */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.__migrate_shim_internal); /* size 0x57c */
	. = ALIGN(0x10); /* align for .text.check_migrate */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.check_migrate); /* size 0x68 */
	. = ALIGN(0x10); /* align for .text.migrate */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.migrate); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.migrate_schedule */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.migrate_schedule); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.get_call_site */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.text.get_call_site); /* size 0x8 */
	. = . + 0x2; /* padding after .text.get_call_site */
	. = ALIGN(0x10); /* align for .text.__migrate_fixup_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate_aarch64.o)"(.text.__migrate_fixup_aarch64); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.__migrate_fixup_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate_powerpc64.o)"(.text.__migrate_fixup_powerpc64); /* size 0x0 */
	. = ALIGN(0x1); /* align for .text.__migrate_fixup_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate_x86_64.o)"(.text.__migrate_fixup_x86_64); /* size 0x0 */
	. = . + 0x69; /* padding after .text.__migrate_fixup_x86_64 */
	. = ALIGN(0x10); /* align for .text.set_default_node */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.set_default_node); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.cleanup */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.cleanup); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.region_compare */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.region_compare); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.read_mapping_schedule */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.read_mapping_schedule); /* size 0x360 */
	. = ALIGN(0x10); /* align for .text.region_find */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.region_find); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.get_node_mapping */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.text.get_node_mapping); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.__st_userspace_ctor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.__st_userspace_ctor); /* size 0x338 */
	. = . + 0x69; /* padding after .text.__st_userspace_ctor */
	. = ALIGN(0x10); /* align for .text.__st_userspace_dtor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.__st_userspace_dtor); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.get_stack_bounds */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.get_stack_bounds); /* size 0xe4 */
	. = ALIGN(0x10); /* align for .text.st_userspace_rewrite */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.text.st_userspace_rewrite); /* size 0x174 */
	. = ALIGN(0x10); /* align for .text.__st_ctor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.__st_ctor); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__st_ctor */
	. = ALIGN(0x10); /* align for .text.__st_dtor */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.__st_dtor); /* size 0x4 */
	. = . + 0x1; /* padding after .text.__st_dtor */
	. = ALIGN(0x10); /* align for .text.st_init */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.st_init); /* size 0x1e8 */
	. = . + 0x2a; /* padding after .text.st_init */
	. = ALIGN(0x10); /* align for .text.st_destroy */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.text.st_destroy); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.st_rewrite_stack */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.st_rewrite_stack); /* size 0x71c */
	. = . + 0xaa; /* padding after .text.st_rewrite_stack */
	. = ALIGN(0x10); /* align for .text.rewrite_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.rewrite_frame); /* size 0x4b8 */
	. = ALIGN(0x10); /* align for .text.st_rewrite_ondemand */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.st_rewrite_ondemand); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.rewrite_val */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.text.rewrite_val); /* size 0x370 */
	. = ALIGN(0x10); /* align for .text.first_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.first_frame); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.calculate_cfa */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.calculate_cfa); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.bootstrap_first_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.bootstrap_first_frame); /* size 0x34 */
	. = ALIGN(0x10); /* align for .text.bootstrap_first_frame_funcentry */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.bootstrap_first_frame_funcentry); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.pop_frame */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.pop_frame); /* size 0x258 */
	. = ALIGN(0x10); /* align for .text.pop_frame_funcentry */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.pop_frame_funcentry); /* size 0x198 */
	. = ALIGN(0x10); /* align for .text.get_register_save_loc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.get_register_save_loc); /* size 0x84 */
	. = ALIGN(0x10); /* align for .text.clear_activation */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(unwind.o)"(.text.clear_activation); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.arch_name */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.arch_name); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.get_regops */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_regops); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.get_properties */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_properties); /* size 0x48 */
	. = ALIGN(0x10); /* align for .text.get_section */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_section); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.get_num_entries */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_num_entries); /* size 0x64 */
	. = ALIGN(0x10); /* align for .text.get_section_data */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_section_data); /* size 0x3c */
	. = ALIGN(0x10); /* align for .text.get_site_by_addr */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_site_by_addr); /* size 0xa4 */
	. = ALIGN(0x10); /* align for .text.get_site_by_id */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_site_by_id); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.get_unwind_offset_by_addr */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_unwind_offset_by_addr); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.get_function_address */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.text.get_function_address); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.align_sp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.align_sp_aarch64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.is_callee_saved_aarch64); /* size 0x30 */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.callee_reg_size_aarch64); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.regset_default_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_default_aarch64); /* size 0xc */
	. = . + 0x3; /* padding after .text.regset_default_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_init_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_init_aarch64); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.regset_free_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_free_aarch64); /* size 0x4 */
	. = . + 0x1; /* padding after .text.regset_free_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_clone_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_clone_aarch64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyin_aarch64); /* size 0x8 */
	. = . + 0x2; /* padding after .text.regset_copyin_aarch64 */
	. = ALIGN(0x10); /* align for .text.regset_copyout_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyout_aarch64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.pc_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.pc_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.sp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.fbp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.fbp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.ra_reg_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_pc_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_pc_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_sp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_sp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_fbp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_fbp_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_ra_reg_aarch64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.setup_fbp_aarch64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_size_aarch64); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_aarch64); /* size 0x338 */
	. = ALIGN(0x10); /* align for .text.align_sp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.align_sp_powerpc64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.is_callee_saved_powerpc64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.callee_reg_size_powerpc64); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.regset_default_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_default_powerpc64); /* size 0xc */
	. = . + 0x3; /* padding after .text.regset_default_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_init_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_init_powerpc64); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.regset_free_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_free_powerpc64); /* size 0x4 */
	. = . + 0x1; /* padding after .text.regset_free_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_clone_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_clone_powerpc64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyin_powerpc64); /* size 0x8 */
	. = . + 0x2; /* padding after .text.regset_copyin_powerpc64 */
	. = ALIGN(0x10); /* align for .text.regset_copyout_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyout_powerpc64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.pc_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.pc_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.sp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.fbp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.fbp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.ra_reg_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_pc_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_pc_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_sp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_sp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_fbp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_fbp_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_ra_reg_powerpc64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.setup_fbp_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.setup_fbp_powerpc64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_size_powerpc64); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_powerpc64); /* size 0x35c */
	. = ALIGN(0x10); /* align for .text.align_sp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.align_sp_x86_64); /* size 0x10 */
	. = ALIGN(0x10); /* align for .text.is_callee_saved_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.is_callee_saved_x86_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.callee_reg_size_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.text.callee_reg_size_x86_64); /* size 0x54 */
	. = ALIGN(0x10); /* align for .text.regset_default_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_default_x86_64); /* size 0xc */
	. = . + 0x3; /* padding after .text.regset_default_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_init_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_init_x86_64); /* size 0x38 */
	. = ALIGN(0x10); /* align for .text.regset_free_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_free_x86_64); /* size 0x4 */
	. = . + 0x1; /* padding after .text.regset_free_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_clone_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_clone_x86_64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.regset_copyin_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyin_x86_64); /* size 0x8 */
	. = . + 0x2; /* padding after .text.regset_copyin_x86_64 */
	. = ALIGN(0x10); /* align for .text.regset_copyout_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.regset_copyout_x86_64); /* size 0x14 */
	. = ALIGN(0x10); /* align for .text.pc_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.pc_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.sp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.sp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.fbp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.fbp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.ra_reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.ra_reg_x86_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.set_pc_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_pc_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_sp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_sp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_fbp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_fbp_x86_64); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.set_ra_reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.set_ra_reg_x86_64); /* size 0x2c */
	. = ALIGN(0x10); /* align for .text.setup_fbp_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.setup_fbp_x86_64); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.reg_size_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_size_x86_64); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text.reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.text.reg_x86_64); /* size 0x1c4 */
	. = ALIGN(0x10); /* align for .text.put_val */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.put_val); /* size 0x254 */
	. = ALIGN(0x10); /* align for .text.get_dest_loc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.get_dest_loc); /* size 0xdc */
	. = ALIGN(0x10); /* align for .text.put_val_arch */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.put_val_arch); /* size 0x408 */
	. = ALIGN(0x10); /* align for .text.put_val_data */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.put_val_data); /* size 0x114 */
	. = ALIGN(0x10); /* align for .text.points_to_stack */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.points_to_stack); /* size 0x160 */
	. = ALIGN(0x10); /* align for .text.points_to_data */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.points_to_data); /* size 0x190 */
	. = ALIGN(0x10); /* align for .text.set_return_address */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.set_return_address); /* size 0x24 */
	. = ALIGN(0x10); /* align for .text.set_return_address_funcentry */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.set_return_address_funcentry); /* size 0x44 */
	. = ALIGN(0x10); /* align for .text.get_savedfbp_loc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.text.get_savedfbp_loc); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text.elf_begin */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text.elf_begin); /* size 0xaf8 */
	. = ALIGN(0x10); /* align for .text._elf_check_type */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text._elf_check_type); /* size 0x264 */
	. = . + 0xa; /* padding after .text._elf_check_type */
	. = ALIGN(0x10); /* align for .text.elf_memory */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text.elf_memory); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.gelf_getclass */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.text.gelf_getclass); /* size 0x28 */
	. = ALIGN(0x10); /* align for .text.elf_end */
	"/usr/local/popcorn/aarch64/lib/libelf.a(end.o)"(.text.elf_end); /* size 0x1ac */
	. = . + 0x10; /* padding after .text.elf_end */
	. = ALIGN(0x10); /* align for .text.elf_getdata */
	"/usr/local/popcorn/aarch64/lib/libelf.a(getdata.o)"(.text.elf_getdata); /* size 0x280 */
	. = ALIGN(0x10); /* align for .text.elf_getident */
	"/usr/local/popcorn/aarch64/lib/libelf.a(getident.o)"(.text.elf_getident); /* size 0x7c */
	. = ALIGN(0x10); /* align for .text.elf_nextscn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(nextscn.o)"(.text.elf_nextscn); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.elf_strptr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(strptr.o)"(.text.elf_strptr); /* size 0x1b0 */
	. = ALIGN(0x10); /* align for .text.elf_version */
	"/usr/local/popcorn/aarch64/lib/libelf.a(version.o)"(.text.elf_version); /* size 0x80 */
	. = ALIGN(0x10); /* align for .text._elf_getehdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.getehdr.o)"(.text._elf_getehdr); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.elf32_getehdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.getehdr.o)"(.text.elf32_getehdr); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text.elf64_getehdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.getehdr.o)"(.text.elf64_getehdr); /* size 0x88 */
	. = ALIGN(0x10); /* align for .text._elf32_xltsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text._elf32_xltsize); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.elf32_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.elf32_xlatetom); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.elf32_xlatetof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.elf32_xlatetof); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.byte_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.byte_copy); /* size 0x184 */
	. = ALIGN(0x10); /* align for .text.addr_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.addr_32L__tom */
	. = ALIGN(0x10); /* align for .text.addr_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.addr_32L__tof */
	. = ALIGN(0x10); /* align for .text.dyn_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32L11_tom); /* size 0x74 */
	. = . + 0x3; /* padding after .text.dyn_32L11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32L11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.ehdr_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32L11_tom); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.ehdr_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32L11_tof); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.half_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32L__tom); /* size 0x10c */
	. = . + 0xa8; /* padding after .text.half_32L__tom */
	. = ALIGN(0x10); /* align for .text.half_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32L__tof); /* size 0x138 */
	. = . + 0x81; /* padding after .text.half_32L__tof */
	. = ALIGN(0x10); /* align for .text.off_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.off_32L__tom */
	. = ALIGN(0x10); /* align for .text.off_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.off_32L__tof */
	. = ALIGN(0x10); /* align for .text.phdr_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32L11_tom); /* size 0x14c */
	. = ALIGN(0x10); /* align for .text.phdr_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32L11_tof); /* size 0x14c */
	. = ALIGN(0x10); /* align for .text.rela_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32L11_tom); /* size 0xb0 */
	. = . + 0xd; /* padding after .text.rela_32L11_tom */
	. = ALIGN(0x10); /* align for .text.rela_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32L11_tof); /* size 0xb0 */
	. = ALIGN(0x10); /* align for .text.rel_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32L11_tom); /* size 0x74 */
	. = . + 0x3; /* padding after .text.rel_32L11_tom */
	. = ALIGN(0x10); /* align for .text.rel_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32L11_tof); /* size 0x74 */
	. = ALIGN(0x10); /* align for .text.shdr_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32L11_tom); /* size 0x1ac */
	. = . + 0x3; /* padding after .text.shdr_32L11_tom */
	. = ALIGN(0x10); /* align for .text.shdr_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32L11_tof); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.sword_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.sword_32L__tom */
	. = ALIGN(0x10); /* align for .text.sword_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.sword_32L__tof */
	. = ALIGN(0x10); /* align for .text.sym_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32L11_tom); /* size 0xb8 */
	. = . + 0x2; /* padding after .text.sym_32L11_tom */
	. = ALIGN(0x10); /* align for .text.sym_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32L11_tof); /* size 0xb8 */
	. = ALIGN(0x10); /* align for .text.word_32L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.word_32L__tom */
	. = ALIGN(0x10); /* align for .text.word_32L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.word_32L__tof */
	. = ALIGN(0x10); /* align for .text.addr_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.addr_32M__tom */
	. = ALIGN(0x10); /* align for .text.addr_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.addr_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.addr_32M__tof */
	. = ALIGN(0x10); /* align for .text.dyn_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32M11_tom); /* size 0x70 */
	. = . + 0x7; /* padding after .text.dyn_32M11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.dyn_32M11_tof); /* size 0x70 */
	. = ALIGN(0x10); /* align for .text.ehdr_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32M11_tom); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.ehdr_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.ehdr_32M11_tof); /* size 0x1ac */
	. = ALIGN(0x10); /* align for .text.half_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32M__tom); /* size 0x108 */
	. = . + 0xac; /* padding after .text.half_32M__tom */
	. = ALIGN(0x10); /* align for .text.half_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.half_32M__tof); /* size 0x134 */
	. = . + 0x85; /* padding after .text.half_32M__tof */
	. = ALIGN(0x10); /* align for .text.off_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.off_32M__tom */
	. = ALIGN(0x10); /* align for .text.off_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.off_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.off_32M__tof */
	. = ALIGN(0x10); /* align for .text.phdr_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32M11_tom); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.phdr_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.phdr_32M11_tof); /* size 0x148 */
	. = ALIGN(0x10); /* align for .text.rela_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32M11_tom); /* size 0xac */
	. = . + 0x1; /* padding after .text.rela_32M11_tom */
	. = ALIGN(0x10); /* align for .text.rela_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rela_32M11_tof); /* size 0xac */
	. = ALIGN(0x10); /* align for .text.rel_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32M11_tom); /* size 0x70 */
	. = . + 0x7; /* padding after .text.rel_32M11_tom */
	. = ALIGN(0x10); /* align for .text.rel_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.rel_32M11_tof); /* size 0x70 */
	. = ALIGN(0x10); /* align for .text.shdr_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32M11_tom); /* size 0x1a8 */
	. = ALIGN(0x10); /* align for .text.shdr_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.shdr_32M11_tof); /* size 0x1a8 */
	. = ALIGN(0x10); /* align for .text.sword_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.sword_32M__tom */
	. = ALIGN(0x10); /* align for .text.sword_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sword_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.sword_32M__tof */
	. = ALIGN(0x10); /* align for .text.sym_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32M11_tom); /* size 0xb4 */
	. = . + 0x6; /* padding after .text.sym_32M11_tom */
	. = ALIGN(0x10); /* align for .text.sym_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.sym_32M11_tof); /* size 0xb4 */
	. = ALIGN(0x10); /* align for .text.word_32M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.word_32M__tom */
	. = ALIGN(0x10); /* align for .text.word_32M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.word_32M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.word_32M__tof */
	. = ALIGN(0x10); /* align for .text._elf_scn_type */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_scn_type); /* size 0xac */
	. = ALIGN(0x10); /* align for .text._elf_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_xlatetom); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_cook */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_cook); /* size 0x75c */
	. = . + 0xf5; /* padding after .text._elf_cook */
	. = ALIGN(0x10); /* align for .text._elf_item */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.text._elf_item); /* size 0x1a0 */
	. = ALIGN(0x10); /* align for .text._elf_read */
	"/usr/local/popcorn/aarch64/lib/libelf.a(input.o)"(.text._elf_read); /* size 0x140 */
	. = ALIGN(0x10); /* align for .text._elf_mmap */
	"/usr/local/popcorn/aarch64/lib/libelf.a(input.o)"(.text._elf_mmap); /* size 0x58 */
	. = ALIGN(0x10); /* align for .text.elf_getphdrnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getphdrnum); /* size 0x80 */
	. = ALIGN(0x10); /* align for .text.elf_getshdrnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshdrnum); /* size 0x94 */
	. = ALIGN(0x10); /* align for .text.elf_getshdrstrndx */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshdrstrndx); /* size 0xf8 */
	. = ALIGN(0x10); /* align for .text.elf_getphnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getphnum); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text.elf_getshnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshnum); /* size 0x8c */
	. = ALIGN(0x10); /* align for .text.elf_getshstrndx */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elf_getshstrndx); /* size 0x104 */
	. = ALIGN(0x10); /* align for .text.elfx_update_shstrndx */
	"/usr/local/popcorn/aarch64/lib/libelf.a(x.elfext.o)"(.text.elfx_update_shstrndx); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text._elf64_xltsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text._elf64_xltsize); /* size 0x98 */
	. = ALIGN(0x10); /* align for .text.elf64_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.elf64_xlatetom); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.elf64_xlatetof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.elf64_xlatetof); /* size 0x158 */
	. = ALIGN(0x10); /* align for .text.gelf_xlatetom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.gelf_xlatetom); /* size 0x1b4 */
	. = ALIGN(0x10); /* align for .text.gelf_xlatetof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.gelf_xlatetof); /* size 0x1b4 */
	. = ALIGN(0x10); /* align for .text.byte_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.byte_copy); /* size 0x184 */
	. = ALIGN(0x10); /* align for .text.addr_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.addr_64L__tom */
	. = ALIGN(0x10); /* align for .text.addr_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.addr_64L__tof */
	. = ALIGN(0x10); /* align for .text.dyn_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64L11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64L11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64L11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64L11_tof */
	. = ALIGN(0x10); /* align for .text.ehdr_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64L11_tom); /* size 0x144 */
	. = . + 0x5e; /* padding after .text.ehdr_64L11_tom */
	. = ALIGN(0x10); /* align for .text.ehdr_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64L11_tof); /* size 0x144 */
	. = . + 0x3e; /* padding after .text.ehdr_64L11_tof */
	. = ALIGN(0x10); /* align for .text.half_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64L__tom); /* size 0x10c */
	. = . + 0xa8; /* padding after .text.half_64L__tom */
	. = ALIGN(0x10); /* align for .text.half_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64L__tof); /* size 0x138 */
	. = . + 0x81; /* padding after .text.half_64L__tof */
	. = ALIGN(0x10); /* align for .text.off_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.off_64L__tom */
	. = ALIGN(0x10); /* align for .text.off_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.off_64L__tof */
	. = ALIGN(0x10); /* align for .text.phdr_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64L11_tom); /* size 0x114 */
	. = . + 0xa; /* padding after .text.phdr_64L11_tom */
	. = ALIGN(0x10); /* align for .text.phdr_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64L11_tof); /* size 0x114 */
	. = . + 0x2; /* padding after .text.phdr_64L11_tof */
	. = ALIGN(0x10); /* align for .text.rela_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64L11_tom); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64L11_tom */
	. = ALIGN(0x10); /* align for .text.rela_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64L11_tof); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64L11_tof */
	. = ALIGN(0x10); /* align for .text.rel_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64L11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64L11_tom */
	. = ALIGN(0x10); /* align for .text.rel_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64L11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64L11_tof */
	. = ALIGN(0x10); /* align for .text.shdr_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64L11_tom); /* size 0x13c */
	. = . + 0x1a; /* padding after .text.shdr_64L11_tom */
	. = ALIGN(0x10); /* align for .text.shdr_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64L11_tof); /* size 0x13c */
	. = . + 0xa; /* padding after .text.shdr_64L11_tof */
	. = ALIGN(0x10); /* align for .text.sword_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.sword_64L__tom */
	. = ALIGN(0x10); /* align for .text.sword_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.sword_64L__tof */
	. = ALIGN(0x10); /* align for .text.sym_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64L11_tom); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.sym_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64L11_tof); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.word_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64L__tom); /* size 0x4c */
	. = . + 0x157; /* padding after .text.word_64L__tom */
	. = ALIGN(0x10); /* align for .text.word_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64L__tof); /* size 0x4c */
	. = . + 0x55; /* padding after .text.word_64L__tof */
	. = ALIGN(0x10); /* align for .text.sxword_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.sxword_64L__tom */
	. = ALIGN(0x10); /* align for .text.sxword_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.sxword_64L__tof */
	. = ALIGN(0x10); /* align for .text.xword_64L__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64L__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.xword_64L__tom */
	. = ALIGN(0x10); /* align for .text.xword_64L__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64L__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.xword_64L__tof */
	. = ALIGN(0x10); /* align for .text.addr_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.addr_64M__tom */
	. = ALIGN(0x10); /* align for .text.addr_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.addr_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.addr_64M__tof */
	. = ALIGN(0x10); /* align for .text.dyn_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64M11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64M11_tom */
	. = ALIGN(0x10); /* align for .text.dyn_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.dyn_64M11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.dyn_64M11_tof */
	. = ALIGN(0x10); /* align for .text.ehdr_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64M11_tom); /* size 0x144 */
	. = . + 0x5e; /* padding after .text.ehdr_64M11_tom */
	. = ALIGN(0x10); /* align for .text.ehdr_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.ehdr_64M11_tof); /* size 0x144 */
	. = . + 0x3e; /* padding after .text.ehdr_64M11_tof */
	. = ALIGN(0x10); /* align for .text.half_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64M__tom); /* size 0x108 */
	. = . + 0xac; /* padding after .text.half_64M__tom */
	. = ALIGN(0x10); /* align for .text.half_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.half_64M__tof); /* size 0x134 */
	. = . + 0x85; /* padding after .text.half_64M__tof */
	. = ALIGN(0x10); /* align for .text.off_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.off_64M__tom */
	. = ALIGN(0x10); /* align for .text.off_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.off_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.off_64M__tof */
	. = ALIGN(0x10); /* align for .text.phdr_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64M11_tom); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.phdr_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.phdr_64M11_tof); /* size 0xfc */
	. = ALIGN(0x10); /* align for .text.rela_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64M11_tom); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64M11_tom */
	. = ALIGN(0x10); /* align for .text.rela_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rela_64M11_tof); /* size 0x88 */
	. = . + 0x1; /* padding after .text.rela_64M11_tof */
	. = ALIGN(0x10); /* align for .text.rel_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64M11_tom); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64M11_tom */
	. = ALIGN(0x10); /* align for .text.rel_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.rel_64M11_tof); /* size 0x64 */
	. = . + 0x4; /* padding after .text.rel_64M11_tof */
	. = ALIGN(0x10); /* align for .text.shdr_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64M11_tom); /* size 0x124 */
	. = . + 0x8; /* padding after .text.shdr_64M11_tom */
	. = ALIGN(0x10); /* align for .text.shdr_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.shdr_64M11_tof); /* size 0x124 */
	. = ALIGN(0x10); /* align for .text.sword_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.sword_64M__tom */
	. = ALIGN(0x10); /* align for .text.sword_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sword_64M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.sword_64M__tof */
	. = ALIGN(0x10); /* align for .text.sym_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64M11_tom); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.sym_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sym_64M11_tof); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .text.word_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64M__tom); /* size 0x48 */
	. = . + 0x14b; /* padding after .text.word_64M__tom */
	. = ALIGN(0x10); /* align for .text.word_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.word_64M__tof); /* size 0x48 */
	. = . + 0x49; /* padding after .text.word_64M__tof */
	. = ALIGN(0x10); /* align for .text.sxword_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.sxword_64M__tom */
	. = ALIGN(0x10); /* align for .text.sxword_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.sxword_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.sxword_64M__tof */
	. = ALIGN(0x10); /* align for .text.xword_64M__tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64M__tom); /* size 0x54 */
	. = . + 0x8; /* padding after .text.xword_64M__tom */
	. = ALIGN(0x10); /* align for .text.xword_64M__tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.xword_64M__tof); /* size 0x54 */
	. = . + 0x7; /* padding after .text.xword_64M__tof */
	. = ALIGN(0x10); /* align for .text.gelf_getshdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(gelfshdr.o)"(.text.gelf_getshdr); /* size 0x118 */
	. = ALIGN(0x10); /* align for .text.gelf_update_shdr */
	"/usr/local/popcorn/aarch64/lib/libelf.a(gelfshdr.o)"(.text.gelf_update_shdr); /* size 0x11c */
	. = . + 0x1d; /* padding after .text.gelf_update_shdr */
	. = ALIGN(0x10); /* align for .text._elf_load_u64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_u64L); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_load_u64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_u64M); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_load_i64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_i64L); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_load_i64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_load_i64M); /* size 0x50 */
	. = ALIGN(0x10); /* align for .text._elf_store_u64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_u64L); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_store_u64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_u64M); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_store_i64L */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_i64L); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_store_i64M */
	"/usr/local/popcorn/aarch64/lib/libelf.a(swap64.o)"(.text._elf_store_i64M); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verdef_32L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text.xlt_verdef); /* size 0x2a0 */
	. = . + 0x5d; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verdef_32M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verneed_32L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text.xlt_verneed); /* size 0x2e0 */
	. = . + 0x71; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tof.o)"(.text._elf_verneed_32M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verdef_32L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text.xlt_verdef); /* size 0x2d4 */
	. = . + 0x14b; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verdef_32M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_32M11_tom */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verneed_32L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text.xlt_verneed); /* size 0x2d8 */
	. = . + 0xc9; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_32M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_32_tom.o)"(.text._elf_verneed_32M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_32M11_tom */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verdef_64L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text.xlt_verdef); /* size 0x2a0 */
	. = . + 0x5d; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verdef_64M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64L11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verneed_64L11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64L11_tof */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text.xlt_verneed); /* size 0x2e0 */
	. = . + 0x71; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64M11_tof */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tof.o)"(.text._elf_verneed_64M11_tof); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64M11_tof */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verdef_64L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verdef */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text.xlt_verdef); /* size 0x2d4 */
	. = . + 0x14b; /* padding after .text.xlt_verdef */
	. = ALIGN(0x10); /* align for .text._elf_verdef_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verdef_64M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verdef_64M11_tom */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64L11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verneed_64L11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64L11_tom */
	. = ALIGN(0x10); /* align for .text.xlt_verneed */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text.xlt_verneed); /* size 0x2d8 */
	. = . + 0xc9; /* padding after .text.xlt_verneed */
	. = ALIGN(0x10); /* align for .text._elf_verneed_64M11_tom */
	"/usr/local/popcorn/aarch64/lib/libelf.a(verdef_64_tom.o)"(.text._elf_verneed_64M11_tom); /* size 0x8 */
	. = . + 0x2; /* padding after .text._elf_verneed_64M11_tom */
	. = ALIGN(0x10); /* align for .text.elf_getscn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(getscn.o)"(.text.elf_getscn); /* size 0x90 */
	. = ALIGN(0x10); /* align for .text._elf_update_shnum */
	"/usr/local/popcorn/aarch64/lib/libelf.a(newscn.o)"(.text._elf_update_shnum); /* size 0x78 */
	. = ALIGN(0x10); /* align for .text._elf_first_scn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(newscn.o)"(.text._elf_first_scn); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .text.elf_newscn */
	"/usr/local/popcorn/aarch64/lib/libelf.a(newscn.o)"(.text.elf_newscn); /* size 0x250 */
	. = ALIGN(0x10); /* align for .text.elf32_fsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.elf32_fsize); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.elf64_fsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.elf64_fsize); /* size 0x4c */
	. = ALIGN(0x10); /* align for .text.gelf_fsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.gelf_fsize); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .text.gelf_msize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.text.gelf_msize); /* size 0xb4 */
	. = ALIGN(0x4); /* align for .text.__crash_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash_aarch64); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.__crash_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash_powerpc64); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.__crash_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash_x86_64); /* size 0x8 */
	. = . + 0x10; /* padding after .text.__crash_x86_64 */
	. = ALIGN(0x4); /* align for .text.__crash */
	"/usr/local/popcorn/aarch64/lib/libc.a(arch_crash.o)"(.text.__crash); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.__assert_fail */
	"/usr/local/popcorn/aarch64/lib/libc.a(assert.o)"(.text.__assert_fail); /* size 0x4c */
	. = ALIGN(0x4); /* align for .text.fprintf */
	"/usr/local/popcorn/aarch64/lib/libc.a(fprintf.o)"(.text.fprintf); /* size 0x74 */
	. = . + 0x23; /* padding after .text.fprintf */
	. = ALIGN(0x4); /* align for .text.fscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(fscanf.o)"(.text.fscanf); /* size 0x74 */
	. = . + 0x23; /* padding after .text.fscanf */
	. = ALIGN(0x4); /* align for .text.__fseeko_unlocked */
	"/usr/local/popcorn/aarch64/lib/libc.a(fseek.o)"(.text.__fseeko_unlocked); /* size 0xc0 */
	. = ALIGN(0x4); /* align for .text.__fseeko */
	"/usr/local/popcorn/aarch64/lib/libc.a(fseek.o)"(.text.__fseeko); /* size 0x7c */
	. = ALIGN(0x4); /* align for .text.fseek */
	"/usr/local/popcorn/aarch64/lib/libc.a(fseek.o)"(.text.fseek); /* size 0x4 */
	. = . + 0x1; /* padding after .text.fseek */
	. = ALIGN(0x4); /* align for .text.perror */
	"/usr/local/popcorn/aarch64/lib/libc.a(perror.o)"(.text.perror); /* size 0xcc */
	. = ALIGN(0x4); /* align for .text.sscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(sscanf.o)"(.text.sscanf); /* size 0x74 */
	. = . + 0x23; /* padding after .text.sscanf */
	. = ALIGN(0x4); /* align for .text.vfscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfscanf.o)"(.text.vfscanf); /* size 0xd98 */
	. = ALIGN(0x4); /* align for .text.vsscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsscanf.o)"(.text.vsscanf); /* size 0x80 */
	. = ALIGN(0x4); /* align for .text.do_read */
	"/usr/local/popcorn/aarch64/lib/libc.a(vsscanf.o)"(.text.do_read); /* size 0x4 */
	. = . + 0x1; /* padding after .text.do_read */
	. = ALIGN(0x4); /* align for .text.bsearch */
	"/usr/local/popcorn/aarch64/lib/libc.a(bsearch.o)"(.text.bsearch); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getdetachstate */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getdetachstate); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getguardsize */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getguardsize); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getinheritsched */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getinheritsched); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getschedparam */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getschedparam); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getschedpolicy */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getschedpolicy); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getscope */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getscope); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getstack */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getstack); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.pthread_attr_getstacksize */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_attr_getstacksize); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_barrierattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_barrierattr_getpshared); /* size 0x18 */
	. = ALIGN(0x4); /* align for .text.pthread_condattr_getclock */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_condattr_getclock); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_condattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_condattr_getpshared); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getprotocol */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_getprotocol); /* size 0xc */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_getpshared); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_getrobust */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_getrobust); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_mutexattr_gettype */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_mutexattr_gettype); /* size 0x14 */
	. = ALIGN(0x4); /* align for .text.pthread_rwlockattr_getpshared */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_attr_get.o)"(.text.pthread_rwlockattr_getpshared); /* size 0x10 */
	. = ALIGN(0x4); /* align for .text.pthread_getattr_np */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_getattr_np.o)"(.text.pthread_getattr_np); /* size 0xec */
	. = ALIGN(0x4); /* align for .text.pthread_set_migrate_args */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_migrate.o)"(.text.pthread_set_migrate_args); /* size 0xc */
	. = . + 0x5; /* padding after .text.pthread_set_migrate_args */
	. = ALIGN(0x4); /* align for .text.pthread_get_migrate_args */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_migrate.o)"(.text.pthread_get_migrate_args); /* size 0xc */
	. = . + 0x5; /* padding after .text.pthread_get_migrate_args */
	. = ALIGN(0x4); /* align for .text.__pthread_self_internal */
	"/usr/local/popcorn/aarch64/lib/libc.a(pthread_self.o)"(.text.__pthread_self_internal); /* size 0xc */
	. = ALIGN(0x10); /* align for .text.__floatscan */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.text.__floatscan); /* size 0x6fc */
	. = . + 0x8; /* padding after .text.__floatscan */
	. = ALIGN(0x10); /* align for .text.__isspace */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.text.__isspace); /* size 0x40 */
	. = ALIGN(0x10); /* align for .text.hexfloat */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.text.hexfloat); /* size 0x8bc */
	. = ALIGN(0x10); /* align for .text.decfloat */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.text.decfloat); /* size 0x13d8 */
	. = . + 0x83; /* padding after .text.decfloat */
	. = ALIGN(0x10); /* align for .text.scanexp */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.text.scanexp); /* size 0x378 */
	. = ALIGN(0x4); /* align for .text.copysignl */
	"/usr/local/popcorn/aarch64/lib/libc.a(copysignl.o)"(.text.copysignl); /* size 0x2c */
	. = ALIGN(0x4); /* align for .text.scalbn */
	"/usr/local/popcorn/aarch64/lib/libc.a(scalbn.o)"(.text.scalbn); /* size 0x88 */
	. = . + 0x6; /* padding after .text.scalbn */
	. = ALIGN(0x4); /* align for .text.scalbnl */
	"/usr/local/popcorn/aarch64/lib/libc.a(scalbnl.o)"(.text.scalbnl); /* size 0xd4 */
	. = ALIGN(0x4); /* align for .text.fabs */
	"/usr/local/popcorn/aarch64/lib/libc.a(fabs.o)"(.text.fabs); /* size 0x8 */
	. = . + 0xa; /* padding after .text.fabs */
	. = ALIGN(0x4); /* align for .text.fmodl */
	"/usr/local/popcorn/aarch64/lib/libc.a(fmodl.o)"(.text.fmodl); /* size 0x254 */
	. = ALIGN(0x4); /* align for .text.mbrtowc */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbrtowc.o)"(.text.mbrtowc); /* size 0x144 */
	. = ALIGN(0x4); /* align for .text.mbsinit */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbsinit.o)"(.text.mbsinit); /* size 0x1c */
	. = ALIGN(0x4); /* align for .text.__string_read */
	"/usr/local/popcorn/aarch64/lib/libc.a(__string_read.o)"(.text.__string_read); /* size 0x84 */
	. = ALIGN(0x4); /* align for .text.fputc */
	"/usr/local/popcorn/aarch64/lib/libc.a(fputc.o)"(.text.fputc); /* size 0xd4 */
	. = ALIGN(0x4); /* align for .text.__overflow */
	"/usr/local/popcorn/aarch64/lib/libc.a(__overflow.o)"(.text.__overflow); /* size 0xa8 */
	. = . + 0x47; /* padding after .text.ngx_cpuid */
	. = ALIGN(0x4); /* align for .text.a_and */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_and); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.a_fetch_and */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_fetch_and); /* size 0x58 */
	. = ALIGN(0x4); /* align for .text.a_ll */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_ll); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.a_sc */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_sc); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.a_barrier */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_barrier); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.a_or */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_or); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.a_fetch_or */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.text.a_fetch_or); /* size 0x58 */
	. = ALIGN(0x4); /* align for .text.a_ll */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_ll); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.a_sc */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_sc); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.a_barrier */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_barrier); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.a_and */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_and); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.a_fetch_and */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_fetch_and); /* size 0x58 */
	. = ALIGN(0x4); /* align for .text.a_or */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_or); /* size 0x30 */
	. = ALIGN(0x4); /* align for .text.a_fetch_or */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.text.a_fetch_or); /* size 0x58 */
	. = ALIGN(0x4); /* align for .text.a_ll */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.a_ll); /* size 0x20 */
	. = ALIGN(0x4); /* align for .text.a_sc */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.a_sc); /* size 0x38 */
	. = ALIGN(0x4); /* align for .text.a_barrier */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.text.a_barrier); /* size 0x8 */
	. = ALIGN(0x10); /* align for .text.__restore */
	"/usr/local/popcorn/aarch64/lib/libc.a(restore.o)"(.text.__restore); /* size 0x8 */
	. = ALIGN(0x4); /* align for .text.array_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.text.array_copy); /* size 0x138 */
	. = ALIGN(0x4); /* align for .text.array_copy */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.text.array_copy); /* size 0x138 */
	*(.text);
}
  
  .fini           :
  {
/*    KEEP (*(SORT_NONE(.fini)))*/
  } =0
  PROVIDE (__etext = .);
  PROVIDE (_etext = .);
  PROVIDE (etext = .);
  
.rodata	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_nginx_vers */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_nginx_vers); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_1_Usage__ngi */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_1_Usage__ngi); /* size 0x268 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_2_built_by_c */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_2_built_by_c); /* size 0x93 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_3_configurat */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_3_configurat); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_4_configurat */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_4_configurat); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_5_dup2_STDER */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_5_dup2_STDER); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_6_close___bu */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_6_close___bu); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_7_TZ_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_7_TZ_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_8_TZ__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_8_TZ__); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_9_new_binary */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_9_new_binary); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_10_NGINX__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_10_NGINX__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_11__ud__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_11__ud__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_12_SPARE_XXXX */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_12_SPARE_XXXX); /* size 0x12d */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_13_rename____ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_13_rename____); /* size 0x42 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_14_rename____ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_14_rename____); /* size 0x52 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_15_core_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_15_core_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_16_the_number */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_16_the_number); /* size 0x8b */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_17_logs_nginx */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_17_logs_nginx); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_18__oldbin_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_18__oldbin_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_19_nobody_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_19_nobody_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_20_getpwnam__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_20_getpwnam__); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_21_nogroup_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_21_nogroup_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_22_getgrnam__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_22_getgrnam__); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_23_logs_nginx */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_23_logs_nginx); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_24__lock_file */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_24__lock_file); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_25__accept_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_25__accept_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_26_daemon_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_26_daemon_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_27_master_pro */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_27_master_pro); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_28_timer_reso */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_28_timer_reso); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_29_pid_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_29_pid_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_30_lock_file_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_30_lock_file_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_31_worker_pro */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_31_worker_pro); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_32_debug_poin */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_32_debug_poin); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_33_user_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_33_user_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_34_worker_pri */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_34_worker_pri); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_35_worker_cpu */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_35_worker_cpu); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_36_worker_rli */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_36_worker_rli); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_37_worker_rli */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_37_worker_rli); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_38_worker_rli */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_38_worker_rli); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_39_working_di */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_39_working_di); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_40_env_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_40_env_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_41_is_duplica */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_41_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_42_auto_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_42_auto_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_43_invalid_va */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_43_invalid_va); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_44_stop_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_44_stop_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_45_abort_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_45_abort_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_46_the__user_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_46_the__user_); /* size 0x65 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_47_getpwnam__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_47_getpwnam__); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_48_getgrnam__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_48_getgrnam__); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_49_invalid_nu */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_49_invalid_nu); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_50__worker_cp */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_50__worker_cp); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_51_invalid_ch */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_51_invalid_ch); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_52_NGINX_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_52_NGINX_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_53_using_inhe */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_53_using_inhe); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_54_invalid_so */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_54_invalid_so); /* size 0x5c */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_55_invalid_op */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_55_invalid_op); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_56_option___p */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_56_option___p); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_57_option___c */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_57_option___c); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_58_option___g */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_58_option___g); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_59_option___s */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_59_option___s); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_60_quit_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_60_quit_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_61_reopen_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_61_reopen_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_62_reload_ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_62_reload_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_63_invalid_op */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_63_invalid_op); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_64_invalid_op */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_64_invalid_op); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_65_conf__ */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_65_conf__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_66__usr_local */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_66__usr_local); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_nginx__str_67_conf_nginx */
	"objs/arm_objs/src/core/nginx.o"(.rodata.src_core_nginx__str_67_conf_nginx); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str____V___ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str____V___); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_1__P__d___ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_1__P__d___); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_2___uA__ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_2___uA__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_3_nginx____V */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_3_nginx____V); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_4___s_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_4___s_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_5_nginx___ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_5_nginx___); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_6____d___ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_6____d___); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_7_logs_error */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_7_logs_error); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_8__usr_local */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_8__usr_local); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_9__alert__co */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_9__alert__co); /* size 0x3a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_10_duplicate_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_10_duplicate_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_11_invalid_lo */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_11_invalid_lo); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_12_errlog_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_12_errlog_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_13_error_log_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_13_error_log_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_14_is_duplica */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_14_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_15_stderr_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_15_stderr_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_16_emerg_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_16_emerg_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_17_alert_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_17_alert_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_18_crit_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_18_crit_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_19_error_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_19_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_20_warn_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_20_warn_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_21_notice_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_21_notice_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_22_info_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_22_info_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_23_debug_ */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_23_debug_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_24_debug_core */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_24_debug_core); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_25_debug_allo */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_25_debug_allo); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_26_debug_mute */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_26_debug_mute); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_27_debug_even */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_27_debug_even); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_28_debug_http */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_28_debug_http); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_29_debug_mail */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_29_debug_mail); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_log__str_30_debug_mysq */
	"objs/arm_objs/src/core/ngx_log.o"(.rodata.src_core_ngx_log__str_30_debug_mysq); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_palloc__str_close_____ */
	"objs/arm_objs/src/core/ngx_palloc.o"(.rodata.src_core_ngx_palloc__str_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_palloc__str_1_unlink____ */
	"objs/arm_objs/src/core/ngx_palloc.o"(.rodata.src_core_ngx_palloc__str_1_unlink____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_hash__str_could_not_ */
	"objs/arm_objs/src/core/ngx_hash.o"(.rodata.src_core_ngx_hash__str_could_not_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_hash__str_1_could_not_ */
	"objs/arm_objs/src/core/ngx_hash.o"(.rodata.src_core_ngx_hash__str_1_could_not_); /* size 0x59 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_output_chain__str_zero_size_ */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.rodata.src_core_ngx_output_chain__str_zero_size_); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_output_chain__str_1_fcntl__O_D */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.rodata.src_core_ngx_output_chain__str_1_fcntl__O_D); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_output_chain__str_2_fcntl_O_DI */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.rodata.src_core_ngx_output_chain__str_2_fcntl_O_DI); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_output_chain__str_3_pread___re */
	"objs/arm_objs/src/core/ngx_output_chain.o"(.rodata.src_core_ngx_output_chain__str_3_pread___re); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str__ud__ud__u */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str__ud__ud__u); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_1__ud__ud__u */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_1__ud__ud__u); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_2_unix__s_Z_ */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_2_unix__s_Z_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_3_unix__ */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_3_unix__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_4_host_not_f */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_4_host_not_f); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_5__V__d_ */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_5__V__d_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_6_no_path_in */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_6_no_path_in); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_7_too_long_p */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_7_too_long_p); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_8_invalid_ho */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_8_invalid_ho); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_9_invalid_po */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_9_invalid_po); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_10_no_host_ */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_10_no_host_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_inet__str_11_the_INET6_ */
	"objs/arm_objs/src/core/ngx_inet.o"(.rodata.src_core_ngx_inet__str_11_the_INET6_); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str__s__V_ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str__s__V_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_1__010uD_Z_ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_1__010uD_Z_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_2_open_____s */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_2_open_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_3_mkdir_____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_3_mkdir_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_4_is_duplica */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_4_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_5_invalid_va */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_5_invalid_va); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_6_user__ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_6_user__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_7_group__ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_7_group__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_8_all__ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_8_all__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_9_rw_ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_9_rw_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_10_r_ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_10_r_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_11_invalid_va */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_11_invalid_va); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_12_the_defaul */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_12_the_defaul); /* size 0x91 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_13_the_path_n */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_13_the_path_n); /* size 0x8a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_14_the_same_p */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_14_the_same_p); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_15_stat_____s */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_15_stat_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_16_chown___s_ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_16_chown___s_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_17_chmod_____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_17_chmod_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_18_utimes____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_18_utimes____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_19___s__010uD */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_19___s__010uD); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_20_unlink____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_20_unlink____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_21_rename____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_21_rename____); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_22_fstat_____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_22_fstat_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_23_read_____s */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_23_read_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_24_read___has */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_24_read___has); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_25_write_____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_25_write_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_26_write___ha */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_26_write___ha); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_27_close_____ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_27_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_28_opendir___ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_28_opendir___); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_29_readdir___ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_29_readdir___); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_file__str_30_closedir__ */
	"objs/arm_objs/src/core/ngx_file.o"(.rodata.src_core_ngx_file__str_30_closedir__); /* size 0x17 */
	. = ALIGN(0x8); /* align for .rodata.ngx_slab_free_locked */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.ngx_slab_free_locked); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_slab__str_ngx_slab_f */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.src_core_ngx_slab__str_ngx_slab_f); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_slab__str_1_ngx_slab_f */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.src_core_ngx_slab__str_1_ngx_slab_f); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_slab__str_2_ngx_slab_f */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.src_core_ngx_slab__str_2_ngx_slab_f); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_slab__str_3_ngx_slab_f */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.src_core_ngx_slab__str_3_ngx_slab_f); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_slab__str_4_ngx_slab_f */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.src_core_ngx_slab__str_4_ngx_slab_f); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_slab__str_5_ngx_slab_a */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.src_core_ngx_slab__str_5_ngx_slab_a); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_slab__str_6__s_s_ */
	"objs/arm_objs/src/core/ngx_slab.o"(.rodata.src_core_ngx_slab__str_6__s_s_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str__s___02d__ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str__s___02d__); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_1__4d__02d__ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_1__4d__02d__); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_2__02d__s__d */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_2__02d__s__d); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_3__4d__02d__ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_3__4d__02d__); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_4__s___02d__ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_4__s___02d__); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_5__s___02d__ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_5__s___02d__); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_6_Sun_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_6_Sun_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_7_Mon_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_7_Mon_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_8_Tue_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_8_Tue_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_9_Wed_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_9_Wed_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_10_Thu_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_10_Thu_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_11_Fri_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_11_Fri_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_12_Sat_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_12_Sat_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_13_Jan_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_13_Jan_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_14_Feb_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_14_Feb_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_15_Mar_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_15_Mar_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_16_Apr_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_16_Apr_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_17_May_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_17_May_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_18_Jun_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_18_Jun_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_19_Jul_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_19_Jul_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_20_Aug_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_20_Aug_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_21_Sep_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_21_Sep_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_22_Oct_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_22_Oct_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_23_Nov_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_23_Nov_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_times__str_24_Dec_ */
	"objs/arm_objs/src/core/ngx_times.o"(.rodata.src_core_ngx_times__str_24_Dec_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_shmtx__str_sem_init__ */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.rodata.src_core_ngx_shmtx__str_sem_init__); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_shmtx__str_1_sem_destro */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.rodata.src_core_ngx_shmtx__str_1_sem_destro); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_shmtx__str_2_sem_wait__ */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.rodata.src_core_ngx_shmtx__str_2_sem_wait__); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_shmtx__str_3_sem_post__ */
	"objs/arm_objs/src/core/ngx_shmtx.o"(.rodata.src_core_ngx_shmtx__str_3_sem_post__); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_getsocknam */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_getsocknam); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_1_the_inheri */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_1_the_inheri); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_2_getsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_2_getsockopt); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_3_getsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_3_getsockopt); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_4_getsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_4_getsockopt); /* size 0x34 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_5_socket____ */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_5_socket____); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_6_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_6_setsockopt); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_7_close___so */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_7_close___so); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_8_ioctl_FION */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_8_ioctl_FION); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_9_bind___to_ */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_9_bind___to_); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_10_chmod_____ */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_10_chmod_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_11_unlink____ */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_11_unlink____); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_12_listen___t */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_12_listen___t); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_13_try_again_ */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_13_try_again_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_14_still_coul */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_14_still_coul); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_15_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_15_setsockopt); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_16_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_16_setsockopt); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_17_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_17_setsockopt); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_18_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_18_setsockopt); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_19_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_19_setsockopt); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_20_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_20_setsockopt); /* size 0x2f */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_21_listen___t */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_21_listen___t); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_22_setsockopt */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_22_setsockopt); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_23_the_new_so */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_23_the_new_so); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_24__ui_worker */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_24__ui_worker); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_25_connection */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_25_connection); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_26_close___so */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_26_close___so); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_connection__str_27_getsocknam */
	"objs/arm_objs/src/core/ngx_connection.o"(.rodata.src_core_ngx_connection__str_27_getsocknam); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_gethostnam */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_gethostnam); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_1_the_config */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_1_the_config); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_2_open_____s */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_2_open_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_3_fcntl_FD_C */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_3_fcntl_FD_C); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_4_zero_size_ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_4_zero_size_); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_5_dup2_STDER */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_5_dup2_STDER); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_6_close___so */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_6_close___so); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_7_deleting_s */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_7_deleting_s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_8_unlink____ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_8_unlink____); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_9_close_____ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_9_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_10_could_not_ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_10_could_not_); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_11_close___so */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_11_close___so); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_12__P_N_ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_12__P_N_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_13_unlink____ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_13_unlink____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_14_signal_pro */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_14_signal_pro); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_15_invalid_PI */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_15_invalid_PI); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_16_write___to */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_16_write___to); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_17_write___to */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_17_write___to); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_18_stat_____s */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_18_stat_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_19_chown___s_ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_19_chown___s_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_20_chmod_____ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_20_chmod_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_21_dup2_STDER */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_21_dup2_STDER); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_22_the_shared */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_22_the_shared); /* size 0x44 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_23_the_size__ */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_23_the_size__); /* size 0x51 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_24_logs_error */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_24_logs_error); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_cycle__str_25_shared_zon */
	"objs/arm_objs/src/core/ngx_cycle.o"(.rodata.src_core_ngx_cycle__str_25_shared_zon); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_open_____s */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_open_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_1_fstat_____ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_1_fstat_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_2_unexpected */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_2_unexpected); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_3_unexpected */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_3_unexpected); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_4_block_dire */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_4_block_dire); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_5_close____s */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_5_close____s); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_6_____ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_6_____); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_7_glob_____s */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_7_glob_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_8___s_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_8___s_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_9___s_in_com */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_9___s_in_com); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_10___s_in__s_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_10___s_in__s_); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_11_is_duplica */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_11_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_12_on_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_12_on_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_13_off_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_13_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_14_invalid_va */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_14_invalid_va); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_15_invalid_nu */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_15_invalid_nu); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_16_invalid_va */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_16_invalid_va); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_17_invalid_va */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_17_invalid_va); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_18_duplicate_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_18_duplicate_); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_19_the___s__d */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_19_the___s__d); /* size 0x41 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_20_value_must */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_20_value_must); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_21_value_must */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_21_value_must); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_22_include_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_22_include_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_23_directive_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_23_directive_); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_24_directive_ */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_24_directive_); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_25___s__direc */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_25___s__direc); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_26___s__direc */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_26___s__direc); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_27_unknown_di */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_27_unknown_di); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_28_invalid_nu */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_28_invalid_nu); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_29_unexpected */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_29_unexpected); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_30_unexpected */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_30_unexpected); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_31_too_long_p */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_31_too_long_p); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_32_too_long_p */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_32_too_long_p); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_33_pread___re */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_33_pread___re); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_34_unexpected */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_34_unexpected); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_35_write___to */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_35_write___to); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_conf_file__str_36_write___to */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.rodata.src_core_ngx_conf_file__str_36_write___to); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_valid__ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_valid__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_1_invalid_pa */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_1_invalid_pa); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_2__s_in_reso */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_2__s_in_reso); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_3_could_not_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_3_could_not_); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_4_could_not_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_4_could_not_); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_5_Format_err */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_5_Format_err); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_6_Server_fai */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_6_Server_fai); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_7_Host_not_f */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_7_Host_not_f); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_8_Unimplemen */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_8_Unimplemen); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_9_Operation_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_9_Operation_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_10_Operation_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_10_Operation_); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_11_Unknown_er */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_11_Unknown_er); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_12_socket___f */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_12_socket___f); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_13_close___so */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_13_close___so); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_14_ioctl_FION */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_14_ioctl_FION); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_15_close___so */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_15_close___so); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_16_connect___ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_16_connect___); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_17_resolving_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_17_resolving_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_18_send___inc */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_18_send___inc); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_19__while__s_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_19__while__s_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_20___resolver */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_20___resolver); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_21_invalid_DN */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_21_invalid_DN); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_22_DNS_error_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_22_DNS_error_); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_23_invalid_nu */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_23_invalid_nu); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_24_zero_lengt */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_24_zero_lengt); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_25_unknown_qu */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_25_unknown_qu); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_26_unknown_qu */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_26_unknown_qu); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_27_short_dns_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_27_short_dns_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_28_DNS_error_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_28_DNS_error_); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_29_unexpected */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_29_unexpected); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_30_wrong_iden */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_30_wrong_iden); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_31_invalid_na */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_31_invalid_na); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_32_unexpected */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_32_unexpected); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_33_no_A_or_CN */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_33_no_A_or_CN); /* size 0x3e */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_34_name_is_ou */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_34_name_is_ou); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_35_compressio */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_35_compressio); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_36__in_addr_a */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_36__in_addr_a); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_37_unexpected */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_37_unexpected); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_38_wrong_iden */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_38_wrong_iden); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_39_invalid_in */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_39_invalid_in); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_40_short_DNS_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_40_short_DNS_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_41__ud_ */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_41__ud_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_resolver__str_42__in_addr_a */
	"objs/arm_objs/src/core/ngx_resolver.o"(.rodata.src_core_ngx_resolver__str_42__in_addr_a); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_open___ */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_open___); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_1_close_____ */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_1_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_2_close_____ */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_2_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_3__d_items_s */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_3__d_items_s); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_4_rbtree_sti */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_4_rbtree_sti); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_5_stat___ */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_5_stat___); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_6_fstat_____ */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_6_fstat_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_7_posix_fadv */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_7_posix_fadv); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_open_file_cache__str_8_fcntl_O_DI */
	"objs/arm_objs/src/core/ngx_open_file_cache.o"(.rodata.src_core_ngx_open_file_cache__str_8_fcntl_O_DI); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_crypt__str__apr1__ */
	"objs/arm_objs/src/core/ngx_crypt.o"(.rodata.src_core_ngx_crypt__str__apr1__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_core_ngx_crypt__str_1__PLAIN__ */
	"objs/arm_objs/src/core/ngx_crypt.o"(.rodata.src_core_ngx_crypt__str_1__PLAIN__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_setsockopt */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_setsockopt); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_1_events_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_1_events_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_2_no__events */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_2_no__events); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_3_event_core */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_3_event_core); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_4_worker_con */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_4_worker_con); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_5_connection */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_5_connection); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_6_use_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_6_use_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_7_multi_acce */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_7_multi_acce); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_8_accept_mut */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_8_accept_mut); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_9_accept_mut */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_9_accept_mut); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_10_debug_conn */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_10_debug_conn); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_11_is_duplica */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_11_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_12_the__conne */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_12_the__conne); /* size 0x5a */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_13_invalid_nu */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_13_invalid_nu); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_14_when_the_s */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_14_when_the_s); /* size 0xd4 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_15_invalid_ev */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_15_invalid_ev); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_16__debug_con */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_16__debug_con); /* size 0x60 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_17_using_the_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_17_using_the_); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_18_getrlimit_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_18_getrlimit_); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_19__ui_worker */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_19__ui_worker); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_20_nginx_shar */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_20_nginx_shar); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_21_sigaction_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_21_sigaction_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_22_setitimer_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_22_setitimer_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_23_getrlimit_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_23_getrlimit_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event__str_24_no_events_ */
	"objs/arm_objs/src/event/ngx_event.o"(.rodata.src_event_ngx_event__str_24_no_events_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_accept__str_accept4___ */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.rodata.src_event_ngx_event_accept__str_accept4___); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_accept__str_1_accept___f */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.rodata.src_event_ngx_event_accept__str_1_accept___f); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_accept__str_2_close___so */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.rodata.src_event_ngx_event_accept__str_2_close___so); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_accept__str_3_ioctl__FIO */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.rodata.src_event_ngx_event_accept__str_3_ioctl__FIO); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_accept__str_4_ioctl_FION */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.rodata.src_event_ngx_event_accept__str_4_ioctl_FION); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_accept__str_5__while_acc */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.rodata.src_event_ngx_event_accept__str_5__while_acc); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_connect__str_socket___f */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.rodata.src_event_ngx_event_connect__str_socket___f); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_connect__str_1_close___so */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.rodata.src_event_ngx_event_connect__str_1_close___so); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_connect__str_2_setsockopt */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.rodata.src_event_ngx_event_connect__str_2_setsockopt); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_connect__str_3_ioctl_FION */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.rodata.src_event_ngx_event_connect__str_3_ioctl_FION); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_connect__str_4_bind__V__f */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.rodata.src_event_ngx_event_connect__str_4_bind__V__f); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_connect__str_5_connect___ */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.rodata.src_event_ngx_event_connect__str_5_connect___); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_connect__str_6_ioctl__FIO */
	"objs/arm_objs/src/event/ngx_event_connect.o"(.rodata.src_event_ngx_event_connect__str_6_ioctl__FIO); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_pipe__str_sending_to */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.rodata.src_event_ngx_event_pipe__str_sending_to); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_pipe__str_1_reading_up */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.rodata.src_event_ngx_event_pipe__str_1_reading_up); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_event_ngx_event_pipe__str_2_recycled_b */
	"objs/arm_objs/src/event/ngx_event_pipe.o"(.rodata.src_event_ngx_event_pipe__str_2_recycled_b); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_time__str__H_ */
	"objs/arm_objs/src/os/unix/ngx_time.o"(.rodata.src_os_unix_ngx_time__str__H_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_errno__str_malloc__uz */
	"objs/arm_objs/src/os/unix/ngx_errno.o"(.rodata.src_os_unix_ngx_errno__str_malloc__uz); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_errno__str_1_Unknown_er */
	"objs/arm_objs/src/os/unix/ngx_errno.o"(.rodata.src_os_unix_ngx_errno__str_1_Unknown_er); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_alloc__str_malloc__uz */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.rodata.src_os_unix_ngx_alloc__str_malloc__uz); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_alloc__str_1_posix_mema */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.rodata.src_os_unix_ngx_alloc__str_1_posix_mema); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_pread_____ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_pread_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_1_pwrite____ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_1_pwrite____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_2_lseek_____ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_2_lseek_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_3_writev____ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_3_writev____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_4_writev____ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_4_writev____); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_5_open_____s */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_5_open_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_6_ftruncate_ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_6_ftruncate_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_7_mmap__uz__ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_7_mmap__uz__); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_8_close_____ */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_8_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_files__str_9_munmap__uz */
	"objs/arm_objs/src/os/unix/ngx_files.o"(.rodata.src_os_unix_ngx_files__str_9_munmap__uz); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_recv__str_recv___fai */
	"objs/arm_objs/src/os/unix/ngx_recv.o"(.rodata.src_os_unix_ngx_recv__str_recv___fai); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_readv_chain__str_readv___fa */
	"objs/arm_objs/src/os/unix/ngx_readv_chain.o"(.rodata.src_os_unix_ngx_readv_chain__str_readv___fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_udp_recv__str_recv___fai */
	"objs/arm_objs/src/os/unix/ngx_udp_recv.o"(.rodata.src_os_unix_ngx_udp_recv__str_recv___fai); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_send__str_send___ret */
	"objs/arm_objs/src/os/unix/ngx_send.o"(.rodata.src_os_unix_ngx_send__str_send___ret); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_send__str_1_send___fai */
	"objs/arm_objs/src/os/unix/ngx_send.o"(.rodata.src_os_unix_ngx_send__str_1_send___fai); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_writev_chain__str_writev___f */
	"objs/arm_objs/src/os/unix/ngx_writev_chain.o"(.rodata.src_os_unix_ngx_writev_chain__str_writev___f); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_channel__str_sendmsg___ */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.rodata.src_os_unix_ngx_channel__str_sendmsg___); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_channel__str_1_recvmsg___ */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.rodata.src_os_unix_ngx_channel__str_1_recvmsg___); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_channel__str_2_recvmsg___ */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.rodata.src_os_unix_ngx_channel__str_2_recvmsg___); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_channel__str_3_recvmsg___ */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.rodata.src_os_unix_ngx_channel__str_3_recvmsg___); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_channel__str_4_recvmsg___ */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.rodata.src_os_unix_ngx_channel__str_4_recvmsg___); /* size 0x3e */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_channel__str_5_recvmsg___ */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.rodata.src_os_unix_ngx_channel__str_5_recvmsg___); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_channel__str_6_close___ch */
	"objs/arm_objs/src/os/unix/ngx_channel.o"(.rodata.src_os_unix_ngx_channel__str_6_close___ch); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_shmem__str_mmap_MAP_A */
	"objs/arm_objs/src/os/unix/ngx_shmem.o"(.rodata.src_os_unix_ngx_shmem__str_mmap_MAP_A); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_shmem__str_1_munmap__p_ */
	"objs/arm_objs/src/os/unix/ngx_shmem.o"(.rodata.src_os_unix_ngx_shmem__str_1_munmap__p_); /* size 0x17 */
	. = ALIGN(0x8); /* align for .rodata.ngx_spawn_process */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.ngx_spawn_process); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_SIGHUP_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_SIGHUP_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_1_reload_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_1_reload_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_2_SIGUSR1_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_2_SIGUSR1_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_3_reopen_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_3_reopen_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_4_SIGWINCH_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_4_SIGWINCH_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_5_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_5_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_6_SIGTERM_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_6_SIGTERM_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_7_stop_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_7_stop_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_8_SIGQUIT_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_8_SIGQUIT_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_9_quit_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_9_quit_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_10_SIGUSR2_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_10_SIGUSR2_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_11_SIGALRM_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_11_SIGALRM_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_12_SIGINT_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_12_SIGINT_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_13_SIGIO_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_13_SIGIO_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_14_SIGCHLD_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_14_SIGCHLD_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_15_SIGSYS__SI */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_15_SIGSYS__SI); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_16_SIGPIPE__S */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_16_SIGPIPE__S); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_17_no_more_th */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_17_no_more_th); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_18_socketpair */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_18_socketpair); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_19_ioctl_FION */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_19_ioctl_FION); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_20_ioctl_FIOA */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_20_ioctl_FIOA); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_21_fcntl_F_SE */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_21_fcntl_F_SE); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_22_fcntl_FD_C */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_22_fcntl_FD_C); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_23_fork___fai */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_23_fork___fai); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_24_start__s__ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_24_start__s__); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_25_sigaction_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_25_sigaction_); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_26_kill__P___ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_26_kill__P___); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_27_execve___f */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_27_execve___f); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_28___shutting */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_28___shutting); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_29___exiting_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_29___exiting_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_30___stop_acc */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_30___stop_acc); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_31___reconfig */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_31___reconfig); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_32___reopenin */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_32___reopenin); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_33___ignoring */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_33___ignoring); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_34___changing */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_34___changing); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_35_signal__d_ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_35_signal__d_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_36_the_changi */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_36_the_changi); /* size 0x72 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_37_waitpid___ */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_37_waitpid___); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_38_unknown_pr */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_38_unknown_pr); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_39__s__P_exit */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_39__s__P_exit); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_40___core_dum */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_40___core_dum); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_41__s__P_exit */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_41__s__P_exit); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_42__s__P_exit */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_42__s__P_exit); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process__str_43_shared_mem */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.rodata.src_os_unix_ngx_process__str_43_shared_mem); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_daemon__str_fork___fai */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.rodata.src_os_unix_ngx_daemon__str_fork___fai); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_daemon__str_1_setsid___f */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.rodata.src_os_unix_ngx_daemon__str_1_setsid___f); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_daemon__str_2__dev_null_ */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.rodata.src_os_unix_ngx_daemon__str_2__dev_null_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_daemon__str_3_open___dev */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.rodata.src_os_unix_ngx_daemon__str_3_open___dev); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_daemon__str_4_dup2_STDIN */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.rodata.src_os_unix_ngx_daemon__str_4_dup2_STDIN); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_daemon__str_5_dup2_STDOU */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.rodata.src_os_unix_ngx_daemon__str_5_dup2_STDOU); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_daemon__str_6_close___fa */
	"objs/arm_objs/src/os/unix/ngx_daemon.o"(.rodata.src_os_unix_ngx_daemon__str_6_close___fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_setaffinity__str_sched_seta */
	"objs/arm_objs/src/os/unix/ngx_setaffinity.o"(.rodata.src_os_unix_ngx_setaffinity__str_sched_seta); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_setaffinity__str_1_sched_seta */
	"objs/arm_objs/src/os/unix/ngx_setaffinity.o"(.rodata.src_os_unix_ngx_setaffinity__str_1_sched_seta); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_setproctitle__str_nginx___ */
	"objs/arm_objs/src/os/unix/ngx_setproctitle.o"(.rodata.src_os_unix_ngx_setproctitle__str_nginx___); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_posix_init__str_getrlimit_ */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.rodata.src_os_unix_ngx_posix_init__str_getrlimit_); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_posix_init__str_1_nginx_1_3_ */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.rodata.src_os_unix_ngx_posix_init__str_1_nginx_1_3_); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_posix_init__str_2_built_by_c */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.rodata.src_os_unix_ngx_posix_init__str_2_built_by_c); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_posix_init__str_3_getrlimit_ */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.rodata.src_os_unix_ngx_posix_init__str_3_getrlimit_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_user__str_crypt_r___ */
	"objs/arm_objs/src/os/unix/ngx_user.o"(.rodata.src_os_unix_ngx_user__str_crypt_r___); /* size 0x11 */
	. = ALIGN(0x8); /* align for .rodata.ngx_channel_handler */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.ngx_channel_handler); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_sigprocmas */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_sigprocmas); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_1_setitimer_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_1_setitimer_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_2_close___so */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_2_close___so); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_3_reconfigur */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_3_reconfigur); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_4_reopening_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_4_reopening_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_5_changing_b */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_5_changing_b); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_6_start_work */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_6_start_work); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_7_worker_pro */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_7_worker_pro); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_8_exiting_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_8_exiting_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_9_gracefully */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_9_gracefully); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_10_worker_pro */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_10_worker_pro); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_11_setpriorit */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_11_setpriorit); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_12_setrlimit_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_12_setrlimit_); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_13_setrlimit_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_13_setrlimit_); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_14_setrlimit_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_14_setrlimit_); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_15_setgid__d_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_15_setgid__d_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_16_initgroups */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_16_initgroups); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_17_setuid__d_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_17_setuid__d_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_18_prctl_PR_S */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_18_prctl_PR_S); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_19_chdir___s_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_19_chdir___s_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_20_close___ch */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_20_close___ch); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_21_open_socke */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_21_open_socke); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_22_aborting_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_22_aborting_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_23_exit_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_23_exit_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_24_cache_mana */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_24_cache_mana); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_25_cache_load */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_25_cache_load); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_26_kill__P___ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_26_kill__P___); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_27_could_not_ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_27_could_not_); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_process_cycle__str_28_rename____ */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.rodata.src_os_unix_ngx_process_cycle__str_28_rename____); /* size 0x47 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_linux_init__str_uname___fa */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.rodata.src_os_unix_ngx_linux_init__str_uname___fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_linux_init__str_1_OS___s__s_ */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.rodata.src_os_unix_ngx_linux_init__str_1_OS___s__s_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_epoll_ */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_epoll_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_1_epoll_even */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_1_epoll_even); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_2_worker_aio */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_2_worker_aio); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_3_epoll_crea */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_3_epoll_crea); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_4_epoll_clos */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_4_epoll_clos); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_5_epoll_ctl_ */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_5_epoll_ctl_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_6_epoll_ctl_ */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_6_epoll_ctl_); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_7_epoll_wait */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_7_epoll_wait); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_event_modules_ngx_epoll_module__str_8_epoll_wait */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.rodata.src_event_modules_ngx_epoll_module__str_8_epoll_wait); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_linux_sendfile_chain__str_zero_size_ */
	"objs/arm_objs/src/os/unix/ngx_linux_sendfile_chain.o"(.rodata.src_os_unix_ngx_linux_sendfile_chain__str_zero_size_); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_linux_sendfile_chain__str_1_setsockopt */
	"objs/arm_objs/src/os/unix/ngx_linux_sendfile_chain.o"(.rodata.src_os_unix_ngx_linux_sendfile_chain__str_1_setsockopt); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_linux_sendfile_chain__str_2_setsockopt */
	"objs/arm_objs/src/os/unix/ngx_linux_sendfile_chain.o"(.rodata.src_os_unix_ngx_linux_sendfile_chain__str_2_setsockopt); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_linux_sendfile_chain__str_3_sendfile__ */
	"objs/arm_objs/src/os/unix/ngx_linux_sendfile_chain.o"(.rodata.src_os_unix_ngx_linux_sendfile_chain__str_3_sendfile__); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_os_unix_ngx_linux_sendfile_chain__str_4_writev___f */
	"objs/arm_objs/src/os/unix/ngx_linux_sendfile_chain.o"(.rodata.src_os_unix_ngx_linux_sendfile_chain__str_4_writev___f); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_init_phase_handlers */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.ngx_http_init_phase_handlers); /* size 0x48 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_text_html_ */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_text_html_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_1_duplicate_ */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_1_duplicate_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_2_test_types */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_2_test_types); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_3_http_ */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_3_http_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_4_duplicate_ */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_4_duplicate_); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_5_headers_in */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_5_headers_in); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_6_invalid_se */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_6_invalid_se); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_7_conflictin */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_7_conflictin); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_8_server_nam */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_8_server_nam); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_9_duplicate_ */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_9_duplicate_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_10_a_duplicat */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_10_a_duplicat); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http__str_11_a_duplicat */
	"objs/arm_objs/src/http/ngx_http.o"(.rodata.src_http_ngx_http__str_11_a_duplicat); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_GET__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_GET__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_1_client_int */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_1_client_int); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_2_rewrite_or */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_2_rewrite_or); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_3_access_for */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_3_access_for); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_4__s___s__fa */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_4__s___s__fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_5_directory_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_5_directory_); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_6_no_handler */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_6_no_handler); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_7_ETag_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_7_ETag_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_8___xT__xO__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_8___xT__xO__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_9_Location_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_9_Location_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_10__alias__ca */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_10__alias__ca); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_11_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_11_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_12_Basic__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_12_Basic__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_13_subrequest */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_13_subrequest); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_14_rewrite_or */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_14_rewrite_or); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_15_rewrite_or */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_15_rewrite_or); /* size 0x4c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_16_could_not_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_16_could_not_); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_17_the__large */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_17_the__large); /* size 0x5f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_18_html_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_18_html_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_19_types_hash */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_19_types_hash); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_20_text_plain */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_20_text_plain); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_21_gif_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_21_gif_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_22_jpg_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_22_jpg_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_23_text_html_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_23_text_html_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_24_image_gif_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_24_image_gif_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_25_image_jpeg */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_25_image_jpeg); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_26_client_bod */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_26_client_bod); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_27_variables_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_27_variables_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_28_variables_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_28_variables_); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_29_server_nam */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_29_server_nam); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_30_server_nam */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_30_server_nam); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_31_server_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_31_server_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_32_connection */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_32_connection); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_33_request_po */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_33_request_po); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_34_client_hea */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_34_client_hea); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_35_client_hea */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_35_client_hea); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_36_large_clie */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_36_large_clie); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_37_optimize_s */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_37_optimize_s); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_38_ignore_inv */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_38_ignore_inv); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_39_merge_slas */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_39_merge_slas); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_40_underscore */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_40_underscore); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_41_location_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_41_location_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_42_listen_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_42_listen_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_43_server_nam */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_43_server_nam); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_44_types_hash */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_44_types_hash); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_45_types_hash */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_45_types_hash); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_46_types_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_46_types_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_47_default_ty */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_47_default_ty); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_48_root_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_48_root_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_49_alias_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_49_alias_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_50_limit_exce */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_50_limit_exce); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_51_client_max */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_51_client_max); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_52_client_bod */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_52_client_bod); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_53_client_bod */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_53_client_bod); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_54_client_bod */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_54_client_bod); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_55_client_bod */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_55_client_bod); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_56_client_bod */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_56_client_bod); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_57_sendfile_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_57_sendfile_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_58_sendfile_m */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_58_sendfile_m); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_59_read_ahead */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_59_read_ahead); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_60_directio_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_60_directio_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_61_directio_a */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_61_directio_a); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_62_tcp_nopush */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_62_tcp_nopush); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_63_tcp_nodela */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_63_tcp_nodela); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_64_send_timeo */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_64_send_timeo); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_65_send_lowat */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_65_send_lowat); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_66_postpone_o */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_66_postpone_o); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_67_limit_rate */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_67_limit_rate); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_68_limit_rate */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_68_limit_rate); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_69_keepalive_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_69_keepalive_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_70_keepalive_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_70_keepalive_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_71_keepalive_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_71_keepalive_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_72_satisfy_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_72_satisfy_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_73_satisfy_an */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_73_satisfy_an); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_74_internal_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_74_internal_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_75_lingering_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_75_lingering_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_76_lingering_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_76_lingering_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_77_lingering_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_77_lingering_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_78_reset_time */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_78_reset_time); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_79_server_nam */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_79_server_nam); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_80_port_in_re */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_80_port_in_re); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_81_msie_paddi */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_81_msie_paddi); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_82_msie_refre */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_82_msie_refre); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_83_log_not_fo */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_83_log_not_fo); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_84_log_subreq */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_84_log_subreq); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_85_recursive_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_85_recursive_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_86_server_tok */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_86_server_tok); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_87_if_modifie */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_87_if_modifie); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_88_max_ranges */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_88_max_ranges); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_89_chunked_tr */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_89_chunked_tr); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_90_etag_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_90_etag_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_91_error_page */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_91_error_page); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_92_try_files_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_92_try_files_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_93_post_actio */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_93_post_actio); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_94_error_log_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_94_error_log_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_95_open_file_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_95_open_file_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_96_open_file_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_96_open_file_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_97_open_file_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_97_open_file_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_98_open_file_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_98_open_file_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_99_open_file_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_99_open_file_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_100_open_file_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_100_open_file_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_101_resolver_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_101_resolver_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_102_resolver_t */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_102_resolver_t); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_103_the_pool_s */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_103_the_pool_s); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_104_the_pool_s */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_104_the_pool_s); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_105_invalid_lo */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_105_invalid_lo); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_106_location__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_106_location__); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_107_location__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_107_location__); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_108_named_loca */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_108_named_loca); /* size 0x34 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_109_location__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_109_location__); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_110_using_rege */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_110_using_rege); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_111__s_in___V_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_111__s_in___V_); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_112_default_se */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_112_default_se); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_113_default_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_113_default_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_114_bind_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_114_bind_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_115_backlog__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_115_backlog__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_116_invalid_ba */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_116_invalid_ba); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_117_rcvbuf__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_117_rcvbuf__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_118_invalid_rc */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_118_invalid_rc); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_119_sndbuf__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_119_sndbuf__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_120_invalid_sn */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_120_invalid_sn); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_121_accept_fil */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_121_accept_fil); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_122_accept_fil */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_122_accept_fil); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_123_deferred_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_123_deferred_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_124_ipv6only_o */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_124_ipv6only_o); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_125_ipv6only_i */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_125_ipv6only_i); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_126_ssl_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_126_ssl_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_127_the__ssl__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_127_the__ssl__); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_128_so_keepali */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_128_so_keepali); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_129_on_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_129_on_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_130_off_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_130_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_131_invalid_so */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_131_invalid_so); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_132_invalid_pa */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_132_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_133_server_nam */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_133_server_nam); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_134_server_nam */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_134_server_nam); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_135__hostname_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_135__hostname_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_136_include_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_136_include_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_137_invalid_nu */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_137_invalid_nu); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_138_duplicate_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_138_duplicate_); /* size 0x4a */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_139___V__direc */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_139___V__direc); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_140___V__direc */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_140___V__direc); /* size 0x42 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_141_the__alias */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_141_the__alias); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_142__document_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_142__document_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_143___document */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_143___document); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_144_the__docum */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_144_the__docum); /* size 0x41 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_145__realpath_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_145__realpath_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_146___realpath */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_146___realpath); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_147_the__realp */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_147_the__realp); /* size 0x41 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_148_duplicate_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_148_duplicate_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_149_invalid_me */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_149_invalid_me); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_150_GET_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_150_GET_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_151_HEAD_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_151_HEAD_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_152_POST_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_152_POST_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_153_PUT_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_153_PUT_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_154_DELETE_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_154_DELETE_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_155_MKCOL_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_155_MKCOL_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_156_COPY_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_156_COPY_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_157_MOVE_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_157_MOVE_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_158_OPTIONS_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_158_OPTIONS_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_159_PROPFIND_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_159_PROPFIND_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_160_PROPPATCH_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_160_PROPPATCH_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_161_LOCK_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_161_LOCK_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_162_UNLOCK_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_162_UNLOCK_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_163_PATCH_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_163_PATCH_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_164_clean_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_164_clean_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_165_is_duplica */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_165_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_166_invalid_va */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_166_invalid_va); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_167__send_lowa */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_167__send_lowa); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_168_none_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_168_none_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_169_msie6_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_169_msie6_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_170_safari_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_170_safari_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_171_all_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_171_all_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_172_any_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_172_any_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_173_always_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_173_always_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_174_exact_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_174_exact_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_175_before_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_175_before_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_176_invalid_va */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_176_invalid_va); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_177_value___V_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_177_value___V_); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_178_invalid_co */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_178_invalid_co); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_179_stderr_ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_179_stderr_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_180_max__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_180_max__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_181_inactive__ */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_181_inactive__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_182_invalid__o */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_182_invalid__o); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_core_module__str_183__open_file */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.rodata.src_http_ngx_http_core_module__str_183__open_file); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_special_response__str_Location_ */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.rodata.src_http_ngx_http_special_response__str_Location_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_special_response__str_1_GET__ */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.rodata.src_http_ngx_http_special_response__str_1_GET__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_special_response__str_2_text_html_ */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.rodata.src_http_ngx_http_special_response__str_2_text_html_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_Host_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_Host_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_1_Connection */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_1_Connection); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_2_If_Modifie */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_2_If_Modifie); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_3_If_Unmodif */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_3_If_Unmodif); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_4_If_Match_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_4_If_Match_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_5_If_None_Ma */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_5_If_None_Ma); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_6_User_Agent */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_6_User_Agent); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_7_Referer_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_7_Referer_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_8_Content_Le */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_8_Content_Le); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_9_Content_Ty */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_9_Content_Ty); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_10_Range_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_10_Range_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_11_If_Range_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_11_If_Range_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_12_Transfer_E */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_12_Transfer_E); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_13_Expect_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_13_Expect_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_14_Authorizat */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_14_Authorizat); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_15_Keep_Alive */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_15_Keep_Alive); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_16_X_Forwarde */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_16_X_Forwarde); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_17_Cookie_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_17_Cookie_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_18_reading_cl */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_18_reading_cl); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_19_subrequest */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_19_subrequest); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_20_http_final */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_20_http_final); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_21_client_pre */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_21_client_pre); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_22_client_tim */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_22_client_tim); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_23_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_23_client_sen); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_24_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_24_client_sen); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_25_reading_cl */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_25_reading_cl); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_26_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_26_client_sen); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_27_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_27_client_sen); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_28_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_28_client_sen); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_29_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_29_client_sen); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_30_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_30_client_sen); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_31_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_31_client_sen); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_32_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_32_client_sen); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_33_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_33_client_sen); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_34_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_34_client_sen); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_35_chunked_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_35_chunked_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_36_identity_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_36_identity_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_37_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_37_client_sen); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_38_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_38_client_sen); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_39_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_39_client_sen); /* size 0x2f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_40___server__ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_40___server__); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_41___request_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_41___request_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_42___subreque */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_42___subreque); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_43_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_43_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_44___ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_44___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_45___upstream */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_45___upstream); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_46___host____ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_46___host____); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_47___referrer */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_47___referrer); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_48_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_48_client_sen); /* size 0x46 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_49_client_sen */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_49_client_sen); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_50_close_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_50_close_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_51_keep_alive */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_51_keep_alive); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_52_MSIE__ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_52_MSIE__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_53_SV1_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_53_SV1_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_54_Opera_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_54_Opera_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_55_Gecko__ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_55_Gecko__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_56_Chrome__ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_56_Chrome__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_57_Safari__ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_57_Safari__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_58_Mac_OS_X_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_58_Mac_OS_X_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_59_Konqueror_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_59_Konqueror_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_60_closing_re */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_60_closing_re); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_61_reading_cl */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_61_reading_cl); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_62_keepalive_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_62_keepalive_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_63_setsockopt */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_63_setsockopt); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_64_setsockopt */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_64_setsockopt); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_65_http_reque */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_65_http_reque); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_66_logging_re */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_66_logging_re); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_67_setsockopt */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_67_setsockopt); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_68_client__V_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_68_client__V_); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_69_shutdown__ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_69_shutdown__); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_70_http_reque */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_70_http_reque); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_71__while__s_ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_71__while__s_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request__str_72___client__ */
	"objs/arm_objs/src/http/ngx_http_request.o"(.rodata.src_http_ngx_http_request__str_72___client__); /* size 0xd */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_parse_request_line */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.rodata.ngx_http_parse_request_line); /* size 0x110 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_parse_header_line */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.rodata.ngx_http_parse_header_line); /* size 0x40 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_parse_complex_uri */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.rodata.ngx_http_parse_complex_uri); /* size 0x30 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_parse_status_line */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.rodata.ngx_http_parse_status_line); /* size 0x68 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_parse_chunked */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.rodata.ngx_http_parse_chunked); /* size 0xd0 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_parse__str_HTTP_ */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.rodata.src_http_ngx_http_parse__str_HTTP_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_parse__str_1_unsafe_URI */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.rodata.src_http_ngx_http_parse__str_1_unsafe_URI); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_Server_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_Server_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_1_Date_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_1_Date_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_2_Content_Le */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_2_Content_Le); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_3_Content_En */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_3_Content_En); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_4_Location_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_4_Location_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_5_Last_Modif */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_5_Last_Modif); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_6_Accept_Ran */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_6_Accept_Ran); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_7_Expires_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_7_Expires_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_8_Cache_Cont */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_8_Cache_Cont); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_9_ETag_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_9_ETag_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_10_HTTP_1_1__ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_10_HTTP_1_1__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_11__03ui_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_11__03ui_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_12_Date___ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_12_Date___); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_13_Content_Ty */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_13_Content_Ty); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_14___charset_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_14___charset_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_15_Content_Le */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_15_Content_Le); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_16_Last_Modif */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_16_Last_Modif); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_17_Location__ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_17_Location__); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_18___ui_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_18___ui_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_19_Transfer_E */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_19_Transfer_E); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_20_Connection */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_20_Connection); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_21_Keep_Alive */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_21_Keep_Alive); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_22_Connection */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_22_Connection); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_23_200_OK_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_23_200_OK_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_24_201_Create */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_24_201_Create); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_25_202_Accept */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_25_202_Accept); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_26_204_No_Con */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_26_204_No_Con); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_27_206_Partia */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_27_206_Partia); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_28_301_Moved_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_28_301_Moved_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_29_302_Moved_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_29_302_Moved_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_30_303_See_Ot */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_30_303_See_Ot); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_31_304_Not_Mo */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_31_304_Not_Mo); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_32_307_Tempor */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_32_307_Tempor); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_33_400_Bad_Re */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_33_400_Bad_Re); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_34_401_Unauth */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_34_401_Unauth); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_35_402_Paymen */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_35_402_Paymen); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_36_403_Forbid */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_36_403_Forbid); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_37_404_Not_Fo */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_37_404_Not_Fo); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_38_405_Not_Al */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_38_405_Not_Al); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_39_406_Not_Ac */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_39_406_Not_Ac); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_40_408_Reques */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_40_408_Reques); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_41_409_Confli */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_41_409_Confli); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_42_410_Gone_ */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_42_410_Gone_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_43_411_Length */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_43_411_Length); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_44_412_Precon */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_44_412_Precon); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_45_413_Reques */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_45_413_Reques); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_46_415_Unsupp */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_46_415_Unsupp); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_47_416_Reques */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_47_416_Reques); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_48_500_Intern */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_48_500_Intern); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_49_501_Not_Im */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_49_501_Not_Im); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_50_502_Bad_Ga */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_50_502_Bad_Ga); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_51_503_Servic */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_51_503_Servic); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_52_504_Gatewa */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_52_504_Gatewa); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_header_filter_module__str_53_507_Insuff */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.rodata.src_http_ngx_http_header_filter_module__str_53_507_Insuff); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_write_filter_module__str_zero_size_ */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.rodata.src_http_ngx_http_write_filter_module__str_zero_size_); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_write_filter_module__str_1_the_http_o */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.rodata.src_http_ngx_http_write_filter_module__str_1_the_http_o); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_copy_filter_module__str_output_buf */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.rodata.src_http_ngx_http_copy_filter_module__str_output_buf); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str__remote_ad */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str__remote_ad); /* size 0x71 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_1_the_closin */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_1_the_closin); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_2_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_2_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_3_pipe_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_3_pipe_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_4_time_local */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_4_time_local); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_5_time_iso86 */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_5_time_iso86); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_6_msec_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_6_msec_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_7_request_ti */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_7_request_ti); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_8_status_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_8_status_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_9_bytes_sent */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_9_bytes_sent); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_10_body_bytes */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_10_body_bytes); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_11_request_le */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_11_request_le); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_12__T__03M_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_12__T__03M_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_13__03ui_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_13__03ui_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_14__O_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_14__O_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_15_write___to */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_15_write___to); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_16_write___to */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_16_write___to); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_17_testing___ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_17_testing___); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_18__s___s__fa */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_18__s___s__fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_19_combined_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_19_combined_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_20_logs_acces */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_20_logs_acces); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_21_log_format */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_21_log_format); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_22_access_log */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_22_access_log); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_23_open_log_f */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_23_open_log_f); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_24_the__log_f */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_24_the__log_f); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_25_duplicate_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_25_duplicate_); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_26_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_26_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_27_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_27_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_28_unknown_lo */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_28_unknown_lo); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_29_buffer__ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_29_buffer__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_30_buffered_l */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_30_buffered_l); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_31_invalid_bu */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_31_invalid_bu); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_32_access_log */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_32_access_log); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_33_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_33_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_34_max__ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_34_max__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_35_inactive__ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_35_inactive__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_36_min_uses__ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_36_min_uses__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_37_valid__ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_37_valid__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_38_invalid__o */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_38_invalid__o); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_log_module__str_39__open_log_ */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.rodata.src_http_modules_ngx_http_log_module__str_39__open_log_); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request_body__str_negative_r */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.rodata.src_http_ngx_http_request_body__str_negative_r); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request_body__str_1_client_pre */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.rodata.src_http_ngx_http_request_body__str_1_client_pre); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request_body__str_2_a_client_r */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.rodata.src_http_ngx_http_request_body__str_2_a_client_r); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request_body__str_3_client_sen */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.rodata.src_http_ngx_http_request_body__str_3_client_sen); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request_body__str_4_100_contin */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.rodata.src_http_ngx_http_request_body__str_4_100_contin); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request_body__str_5_HTTP_1_1_1 */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.rodata.src_http_ngx_http_request_body__str_5_HTTP_1_1_1); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_request_body__str_6_client_int */
	"objs/arm_objs/src/http/ngx_http_request_body.o"(.rodata.src_http_ngx_http_request_body__str_6_client_int); /* size 0x39 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_variable_tcpinfo */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.ngx_http_variable_tcpinfo); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_1_1_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_1_1_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_2_the_duplic */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_2_the_duplic); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_3_conflictin */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_3_conflictin); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_4_unknown_va */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_4_unknown_va); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_5_http__ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_5_http__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_6_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_6_sent_http_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_7_upstream_h */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_7_upstream_h); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_8_cookie__ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_8_cookie__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_9_arg__ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_9_arg__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_10_unknown___ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_10_unknown___); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_11_variables_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_11_variables_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_12_http_host_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_12_http_host_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_13_http_user_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_13_http_user_); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_14_http_refer */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_14_http_refer); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_15_http_x_for */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_15_http_x_for); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_16_http_cooki */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_16_http_cooki); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_17_content_le */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_17_content_le); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_18_content_ty */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_18_content_ty); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_19_host_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_19_host_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_20_binary_rem */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_20_binary_rem); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_21_remote_add */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_21_remote_add); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_22_remote_por */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_22_remote_por); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_23_server_add */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_23_server_add); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_24_server_por */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_24_server_por); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_25_server_pro */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_25_server_pro); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_26_scheme_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_26_scheme_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_27_https_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_27_https_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_28_request_ur */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_28_request_ur); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_29_uri_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_29_uri_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_30_document_u */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_30_document_u); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_31_request_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_31_request_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_32_document_r */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_32_document_r); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_33_realpath_r */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_33_realpath_r); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_34_query_stri */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_34_query_stri); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_35_args_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_35_args_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_36_is_args_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_36_is_args_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_37_request_fi */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_37_request_fi); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_38_server_nam */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_38_server_nam); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_39_request_me */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_39_request_me); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_40_remote_use */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_40_remote_use); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_41_bytes_sent */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_41_bytes_sent); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_42_body_bytes */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_42_body_bytes); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_43_request_co */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_43_request_co); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_44_request_bo */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_44_request_bo); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_45_request_bo */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_45_request_bo); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_46_request_ti */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_46_request_ti); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_47_status_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_47_status_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_48_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_48_sent_http_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_49_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_49_sent_http_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_50_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_50_sent_http_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_51_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_51_sent_http_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_52_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_52_sent_http_); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_53_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_53_sent_http_); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_54_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_54_sent_http_); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_55_sent_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_55_sent_http_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_56_limit_rate */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_56_limit_rate); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_57_connection */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_57_connection); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_58_connection */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_58_connection); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_59_nginx_vers */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_59_nginx_vers); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_60_hostname_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_60_hostname_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_61_pid_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_61_pid_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_62_msec_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_62_msec_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_63_tcpinfo_rt */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_63_tcpinfo_rt); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_64_tcpinfo_rt */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_64_tcpinfo_rt); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_65_tcpinfo_sn */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_65_tcpinfo_sn); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_66_tcpinfo_rc */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_66_tcpinfo_rc); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_67__O_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_67__O_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_68__ui_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_68__ui_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_69_http_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_69_http_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_70_realpath__ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_70_realpath__); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_71___ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_71___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_72_OK_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_72_OK_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_73__T__03M_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_73__T__03M_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_74__03ui_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_74__03ui_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_75_keep_alive */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_75_keep_alive); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_76_close_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_76_close_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_77_timeout__T */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_77_timeout__T); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_78_chunked_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_78_chunked_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_79_invalid_si */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_79_invalid_si); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_80__uz_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_80__uz_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_81__uA_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_81__uA_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_82_1_3_9_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_82_1_3_9_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_83__P_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_83__P_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_variables__str_84__uD_ */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.rodata.src_http_ngx_http_variables__str_84__uD_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_script_file_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.rodata.ngx_http_script_file_code); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_script__str_empty_para */
	"objs/arm_objs/src/http/ngx_http_script.o"(.rodata.src_http_ngx_http_script__str_empty_para); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_script__str_1_duplicate_ */
	"objs/arm_objs/src/http/ngx_http_script.o"(.rodata.src_http_ngx_http_script__str_1_duplicate_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_script__str_2_the_closin */
	"objs/arm_objs/src/http/ngx_http_script.o"(.rodata.src_http_ngx_http_script__str_2_the_closin); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_script__str_3_invalid_va */
	"objs/arm_objs/src/http/ngx_http_script.o"(.rodata.src_http_ngx_http_script__str_3_invalid_va); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_script__str_4__s___s__fa */
	"objs/arm_objs/src/http/ngx_http_script.o"(.rodata.src_http_ngx_http_script__str_4__s___s__fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_script__str_5_ */
	"objs/arm_objs/src/http/ngx_http_script.o"(.rodata.src_http_ngx_http_script__str_5_); /* size 0x2 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_upstream_cache */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.ngx_http_upstream_cache); /* size 0x68 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_Status_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_Status_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_1_Content_Ty */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_1_Content_Ty); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_2_Content_Le */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_2_Content_Le); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_3_Date_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_3_Date_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_4_Last_Modif */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_4_Last_Modif); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_5_ETag_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_5_ETag_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_6_Server_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_6_Server_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_7_WWW_Authen */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_7_WWW_Authen); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_8_Location_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_8_Location_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_9_Refresh_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_9_Refresh_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_10_Set_Cookie */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_10_Set_Cookie); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_11_Content_Di */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_11_Content_Di); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_12_Cache_Cont */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_12_Cache_Cont); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_13_Expires_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_13_Expires_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_14_Accept_Ran */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_14_Accept_Ran); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_15_Connection */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_15_Connection); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_16_Keep_Alive */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_16_Keep_Alive); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_17_X_Powered_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_17_X_Powered_); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_18_X_Accel_Ex */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_18_X_Accel_Ex); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_19_X_Accel_Re */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_19_X_Accel_Re); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_20_X_Accel_Li */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_20_X_Accel_Li); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_21_X_Accel_Bu */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_21_X_Accel_Bu); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_22_X_Accel_Ch */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_22_X_Accel_Ch); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_23_Transfer_E */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_23_Transfer_E); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_24_GET_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_24_GET_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_25_HEAD_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_25_HEAD_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_26_POST_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_26_POST_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_27__s_in_upst */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_27__s_in_upst); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_28_duplicate_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_28_duplicate_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_29_upstream__ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_29_upstream__); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_30_upstream__ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_30_upstream__); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_31_invalid_ad */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_31_invalid_ad); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_32_if_not_emp */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_32_if_not_emp); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_33_invalid_pa */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_33_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_34_upstream_a */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_34_upstream_a); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_35_upstream_s */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_35_upstream_s); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_36_upstream_r */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_36_upstream_r); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_37_upstream_r */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_37_upstream_r); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_38_upstream_c */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_38_upstream_c); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_39__ui_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_39__ui_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_40__d__03d_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_40__d__03d_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_41__O_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_41__O_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_42_upstream_h */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_42_upstream_h); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_43_upstream_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_43_upstream_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_44_server_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_44_server_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_45_no_servers */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_45_no_servers); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_46_weight__ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_46_weight__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_47_max_fails_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_47_max_fails_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_48_fail_timeo */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_48_fail_timeo); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_49_backup_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_49_backup_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_50_down_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_50_down_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_51_no_port_in */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_51_no_port_in); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_52_no_resolve */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_52_no_resolve); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_53__V_buffer_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_53__V_buffer_); /* size 0x54 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_54_client_pre */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_54_client_pre); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_55_client_pre */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_55_client_pre); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_56_unlink____ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_56_unlink____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_57_sending_to */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_57_sending_to); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_58_connecting */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_58_connecting); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_59_no_live_up */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_59_no_live_up); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_60_upstream_t */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_60_upstream_t); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_61_reading_re */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_61_reading_re); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_62_upstream_p */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_62_upstream_p); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_63_upstream_s */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_63_upstream_s); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_64_connect___ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_64_connect___); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_65_shutdown__ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_65_shutdown__); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_66_setsockopt */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_66_setsockopt); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_67_an_upstrea */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_67_an_upstrea); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_68_reading_up */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_68_reading_up); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_69_client_tim */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_69_client_tim); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_70_upstream_b */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_70_upstream_b); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_71_sending_re */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_71_sending_re); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_72_setsockopt */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_72_setsockopt); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_73__V_could_n */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_73__V_could_n); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_74_no_cache_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_74_no_cache_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_75_no_store_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_75_no_store_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_76_private_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_76_private_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_77_max_age__ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_77_max_age__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_78_close_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_78_close_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_79_chunked_ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_79_chunked_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_80_charset__ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_80_charset__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream__str_81_url__ */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.rodata.src_http_ngx_http_upstream__str_81_url__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream_round_robin__str_no_servers */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.rodata.src_http_ngx_http_upstream_round_robin__str_no_servers); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream_round_robin__str_1_no_port_in */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.rodata.src_http_ngx_http_upstream_round_robin__str_1_no_port_in); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream_round_robin__str_2__s_in_upst */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.rodata.src_http_ngx_http_upstream_round_robin__str_2__s_in_upst); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_upstream_round_robin__str_3___d_ */
	"objs/arm_objs/src/http/ngx_http_upstream_round_robin.o"(.rodata.src_http_ngx_http_upstream_round_robin__str_3___d_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_parse_time */
	"objs/arm_objs/src/http/ngx_http_parse_time.o"(.rodata.ngx_http_parse_time); /* size 0x98 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_static_module__str__s___s__fa */
	"objs/arm_objs/src/http/modules/ngx_http_static_module.o"(.rodata.src_http_modules_ngx_http_static_module__str__s___s__fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_static_module__str_1___s__is_no */
	"objs/arm_objs/src/http/modules/ngx_http_static_module.o"(.rodata.src_http_modules_ngx_http_static_module__str_1___s__is_no); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_static_module__str_2_sending_re */
	"objs/arm_objs/src/http/modules/ngx_http_static_module.o"(.rodata.src_http_modules_ngx_http_static_module__str_2_sending_re); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str__s___s__fa */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str__s___s__fa); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_1___s__is_fo */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_1___s__is_fo); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_2___s__is_no */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_2___s__is_no); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_3_http_index */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_3_http_index); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_4___s__is_no */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_4___s__is_no); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_5_index_html */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_5_index_html); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_6_index_ */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_6_index_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_7_only_the_l */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_7_only_the_l); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_index_module__str_8_index___V_ */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.rodata.src_http_modules_ngx_http_index_module__str_8_index___V_); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_chunked_filter_module__str__xO___ */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.rodata.src_http_modules_ngx_http_chunked_filter_module__str__xO___); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_chunked_filter_module__str_1___0_____ */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.rodata.src_http_modules_ngx_http_chunked_filter_module__str_1___0_____); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_chunked_filter_module__str_2____ */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.rodata.src_http_modules_ngx_http_chunked_filter_module__str_2____); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_bytes__ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_bytes__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_1_Accept_Ran */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_1_Accept_Ran); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_2_bytes_ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_2_bytes_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_3_Content_Ra */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_3_Content_Ra); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_4_bytes__O__ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_4_bytes__O__); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_5______0muA_ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_5______0muA_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_6______0muA_ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_6______0muA_); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_7______0muA_ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_7______0muA_); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_8_multipart_ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_8_multipart_); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_9__O__O__O__ */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_9__O__O__O__); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_10_bytes____O */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_10_bytes____O); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_range_filter_module__str_11_range_in_o */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.rodata.src_http_modules_ngx_http_range_filter_module__str_11_range_in_o); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_Expires_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_Expires_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_1_Cache_Cont */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_1_Cache_Cont); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_2_Thu__01_Ja */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_2_Thu__01_Ja); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_3_no_cache_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_3_no_cache_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_4_Thu__31_De */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_4_Thu__31_De); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_5_max_age_31 */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_5_max_age_31); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_6_max_age_0_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_6_max_age_0_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_7_max_age__T */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_7_max_age__T); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_8_expires_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_8_expires_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_9_add_header */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_9_add_header); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_10_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_10_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_11_epoch_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_11_epoch_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_12_max_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_12_max_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_13_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_13_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_14_modified_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_14_modified_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_15_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_15_invalid_va); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_16_daily_time */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_16_daily_time); /* size 0x34 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_17_daily_time */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_17_daily_time); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_18_Last_Modif */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_18_Last_Modif); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_headers_filter_module__str_19_ETag_ */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.rodata.src_http_modules_ngx_http_headers_filter_module__str_19_ETag_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_busy_lock__str_is_duplica */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.rodata.src_http_ngx_http_busy_lock__str_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_busy_lock__str_1_invalid_va */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.rodata.src_http_ngx_http_busy_lock__str_1_invalid_va); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_busy_lock__str_2_duplicate_ */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.rodata.src_http_ngx_http_busy_lock__str_2_duplicate_); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_busy_lock__str_3_busy_lock_ */
	"objs/arm_objs/src/http/ngx_http_busy_lock.o"(.rodata.src_http_ngx_http_busy_lock__str_3_busy_lock_); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_MISS_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_MISS_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_1_BYPASS_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_1_BYPASS_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_2_EXPIRED_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_2_EXPIRED_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_3_STALE_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_3_STALE_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_4_UPDATING_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_4_UPDATING_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_5_HIT_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_5_HIT_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_6_open_____s */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_6_open_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_7_fstat_____ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_7_fstat_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_8_unlink____ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_8_unlink____); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_9_levels__ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_9_levels__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_10_invalid__l */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_10_invalid__l); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_11_keys_zone_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_11_keys_zone_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_12_invalid_ke */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_12_invalid_ke); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_13_inactive__ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_13_inactive__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_14_invalid_in */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_14_invalid_in); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_15_max_size__ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_15_max_size__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_16_invalid_ma */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_16_invalid_ma); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_17_loader_fil */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_17_loader_fil); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_18_invalid_lo */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_18_invalid_lo); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_19_loader_sle */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_19_loader_sle); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_20_invalid_lo */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_20_invalid_lo); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_21_loader_thr */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_21_loader_thr); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_22_invalid_lo */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_22_invalid_lo); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_23_invalid_pa */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_23_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_24___V__must_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_24___V__must_); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_25_duplicate_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_25_duplicate_); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_26_invalid_ti */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_26_invalid_ti); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_27_any_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_27_any_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_28_invalid_st */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_28_invalid_st); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_29_cache_file */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_29_cache_file); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_30_cache_file */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_30_cache_file); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_31_cache_file */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_31_cache_file); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_32_stalled_ca */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_32_stalled_ca); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_33_ignore_lon */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_33_ignore_lon); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_34_http_file_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_34_http_file_); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_35_cache___V_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_35_cache___V_); /* size 0x51 */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_36_cache___V_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_36_cache___V_); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_file_cache__str_37__in_cache_ */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.rodata.src_http_ngx_http_file_cache__str_37__in_cache_); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_ngx_http_postpone_filter_module__str_http_postp */
	"objs/arm_objs/src/http/ngx_http_postpone_filter_module.o"(.rodata.src_http_ngx_http_postpone_filter_module__str_http_postp); /* size 0x21 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_ssi_parse */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.ngx_http_ssi_parse); /* size 0xa0 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_conflictin */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_conflictin); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_1_date_local */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_1_date_local); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_2_date_gmt_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_2_date_gmt_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_3__T_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_3__T_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_4_include_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_4_include_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_5_echo_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_5_echo_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_6_config_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_6_config_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_7_set_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_7_set_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_8_if_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_8_if_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_9_elif_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_9_elif_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_10_else_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_10_else_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_11_endif_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_11_endif_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_12_block_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_12_block_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_13_endblock_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_13_endblock_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_14_inlcusion_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_14_inlcusion_); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_15_no_paramet */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_15_no_paramet); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_16__set__and_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_16__set__and_); /* size 0x42 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_17__wait__can */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_17__wait__can); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_18_no_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_18_no_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_19_yes_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_19_yes_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_20_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_20_invalid_va); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_21__stub____V */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_21__stub____V); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_22_can_only_w */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_22_can_only_w); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_23_the_closin */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_23_the_closin); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_24_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_24_invalid_va); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_25_virtual_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_25_virtual_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_26_file_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_26_file_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_27_wait_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_27_wait_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_28_stub_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_28_stub_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_29_none_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_29_none_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_30_url_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_30_url_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_31_entity_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_31_entity_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_32_unknown_en */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_32_unknown_en); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_33__none__ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_33__none__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_34_var_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_34_var_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_35_default_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_35_default_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_36_encoding_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_36_encoding_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_37_errmsg_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_37_errmsg_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_38_timefmt_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_38_timefmt_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_39_value_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_39_value_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_40_the__if__c */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_40_the__if__c); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_41_invalid_ex */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_41_invalid_ex); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_42_the_using_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_42_the_using_); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_43_expr_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_43_expr_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_44_name_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_44_name_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_45__A___d__b_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_45__A___d__b_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_46__an_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_46__an_error_); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_47_invalid_SS */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_47_invalid_SS); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_48_invalid_co */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_48_invalid_co); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_49_too_many_S */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_49_too_many_S); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_50_duplicate_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_50_duplicate_); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_51_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_51_invalid_pa); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_52_mandatory_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_52_mandatory_); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_53_the___V_c_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_53_the___V_c_); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_54_invalid___ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_54_invalid___); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_55_too_long__ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_55_too_long__); /* size 0x31 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_56_unexpected */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_56_unexpected); /* size 0x40 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_57_unexpected */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_57_unexpected); /* size 0x4a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_58_too_long__ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_58_too_long__); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_59_unexpected */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_59_unexpected); /* size 0x4e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_60_unexpected */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_60_unexpected); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_61_the_same_b */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_61_the_same_b); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_62_ssi_comman */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_62_ssi_comman); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_63_ssi_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_63_ssi_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_64_ssi_silent */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_64_ssi_silent); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_65_ssi_ignore */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_65_ssi_ignore); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_66_ssi_min_fi */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_66_ssi_min_fi); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_67_ssi_value_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_67_ssi_value_); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_ssi_filter_module__str_68_ssi_types_ */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.rodata.src_http_modules_ngx_http_ssi_filter_module__str_68_ssi_types_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_text_html_ */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_text_html_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_1_text_xml_ */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_1_text_xml_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_2_text_plain */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_2_text_plain); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_3_text_vnd_w */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_3_text_vnd_w); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_4_applicatio */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_4_applicatio); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_5_applicatio */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_5_applicatio); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_6_no__charse */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_6_no__charse); /* size 0x34 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_7_unknown_ch */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_7_unknown_ch); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_8____uD__ */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_8____uD__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_9_charset_ */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_9_charset_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_10_source_cha */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_10_source_cha); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_11_override_c */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_11_override_c); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_12_charset_ty */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_12_charset_ty); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_13_charset_ma */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_13_charset_ma); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_14_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_14_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_15_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_15_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_16_utf_8_ */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_16_utf_8_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_17__charset_m */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_17__charset_m); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_18_duplicate_ */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_18_duplicate_); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_19_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_19_invalid_pa); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_charset_filter_module__str_20_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.rodata.src_http_modules_ngx_http_charset_filter_module__str_20_invalid_va); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_uid_got_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_uid_got_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_1_client_sen */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_1_client_sen); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_2_client_sen */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_2_client_sen); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_3__V__08XD_0 */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_3__V__08XD_0); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_4_uid_set_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_4_uid_set_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_5_log_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_5_log_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_6_userid_coo */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_6_userid_coo); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_7_uid_reset_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_7_uid_reset_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_8_Set_Cookie */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_8_Set_Cookie); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_9_P3P_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_9_P3P_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_10_uid_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_10_uid_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_11_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_11_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_12___path___ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_12___path___); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_13_userid_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_13_userid_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_14_userid_ser */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_14_userid_ser); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_15_userid_nam */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_15_userid_nam); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_16_userid_dom */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_16_userid_dom); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_17_userid_pat */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_17_userid_pat); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_18_userid_exp */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_18_userid_exp); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_19_userid_p3p */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_19_userid_p3p); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_20_userid_mar */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_20_userid_mar); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_21_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_21_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_22_v1_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_22_v1_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_23_on_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_23_on_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_24_none_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_24_none_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_25___domain__ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_25___domain__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_26___path__ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_26___path__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_27_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_27_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_28_max_ */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_28_max_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_29_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_29_invalid_va); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_userid_filter_module__str_30_value_must */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.rodata.src_http_modules_ngx_http_userid_filter_module__str_30_value_must); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_Jan_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_Jan_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_1_Feb_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_1_Feb_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_2_Mar_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_2_Mar_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_3_Apr_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_3_Apr_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_4_May_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_4_May_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_5_Jun_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_5_Jun_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_6_Jul_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_6_Jul_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_7_Aug_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_7_Aug_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_8_Sep_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_8_Sep_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_9_Oct_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_9_Oct_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_10_Nov_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_10_Nov_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_11_Dec_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_11_Dec_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_12_opendir___ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_12_opendir___); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_13_text_html_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_13_text_html_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_14_closedir__ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_14_closedir__); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_15_utf_8_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_15_utf_8_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_16_readdir___ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_16_readdir___); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_17_stat_____s */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_17_stat_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_18_lstat_____ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_18_lstat_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_19_closedir__ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_19_closedir__); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_20___h1__ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_20___h1__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_21__hr__pre__ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_21__hr__pre__); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_22__a_href___ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_22__a_href___); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_23____gt___a_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_23____gt___a_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_24___a__ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_24___a__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_25__02d__s__d */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_25__02d__s__d); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_26___________ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_26___________); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_27__19O_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_27__19O_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_28_________ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_28_________); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_29__6i_c_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_29__6i_c_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_30___6i_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_30___6i_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_31___pre__hr_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_31___pre__hr_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_32_autoindex_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_32_autoindex_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_33_autoindex_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_33_autoindex_); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_autoindex_module__str_34_autoindex_ */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.rodata.src_http_modules_ngx_http_autoindex_module__str_34_autoindex_); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_no_user_pa */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_no_user_pa); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_1_open_____s */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_1_open_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_2_user___V__ */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_2_user___V__); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_3_user___V__ */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_3_user___V__); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_4_WWW_Authen */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_4_WWW_Authen); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_5_close_____ */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_5_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_6_auth_basic */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_6_auth_basic); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_7_auth_basic */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_7_auth_basic); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_8_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_8_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_9_ */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_9_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_10_Basic_real */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_10_Basic_real); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_auth_basic_module__str_11_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.rodata.src_http_modules_ngx_http_auth_basic_module__str_11_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_access_module__str_access_for */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.rodata.src_http_modules_ngx_http_access_module__str_access_for); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_access_module__str_1_allow_ */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.rodata.src_http_modules_ngx_http_access_module__str_1_allow_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_access_module__str_2_deny_ */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.rodata.src_http_modules_ngx_http_access_module__str_2_deny_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_access_module__str_3_all_ */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.rodata.src_http_modules_ngx_http_access_module__str_3_all_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_access_module__str_4_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.rodata.src_http_modules_ngx_http_access_module__str_4_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_access_module__str_5_low_addres */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.rodata.src_http_modules_ngx_http_access_module__str_5_low_addres); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_the_value_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_the_value_); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_1_limiting_c */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_1_limiting_c); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_2_limit_conn */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_2_limit_conn); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_3_limit_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_3_limit_zone); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_4_limit_conn */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_4_limit_conn); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_5_limit_conn */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_5_limit_conn); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_6_zone__ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_6_zone__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_7_invalid_zo */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_7_invalid_zo); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_8_zone___V__ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_8_zone___V__); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_9_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_9_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_10___V__must_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_10___V__must_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_11_no_variabl */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_11_no_variabl); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_12__V___V__is */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_12__V___V__is); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_13_limit_conn */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_13_limit_conn); /* size 0x57 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_14__in_limit_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_14__in_limit_); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_15_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_15_invalid_va); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_16_invalid_si */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_16_invalid_si); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_17_limit_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_17_limit_zone); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_18_limit_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_18_limit_zone); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_19_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_19_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_20_invalid_nu */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_20_invalid_nu); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_21_connection */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_21_connection); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_22_info_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_22_info_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_23_notice_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_23_notice_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_24_warn_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_24_warn_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_conn_module__str_25_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.rodata.src_http_modules_ngx_http_limit_conn_module__str_25_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_the_value_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_the_value_); /* size 0x3e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_1_limiting_r */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_1_limiting_r); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_2_delaying_r */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_2_delaying_r); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_3_limit_req_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_3_limit_req_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_4_limit_req_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_4_limit_req_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_5_limit_req_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_5_limit_req_); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_6_zone__ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_6_zone__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_7_invalid_zo */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_7_invalid_zo); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_8_zone___V__ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_8_zone___V__); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_9_rate__ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_9_rate__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_10_r_s_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_10_r_s_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_11_r_m_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_11_r_m_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_12_invalid_ra */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_12_invalid_ra); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_13_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_13_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_14___V__must_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_14___V__must_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_15_no_variabl */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_15_no_variabl); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_16__V___V__is */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_16__V___V__is); /* size 0x2a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_17_limit_req_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_17_limit_req_); /* size 0x51 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_18__in_limit_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_18__in_limit_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_19_burst__ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_19_burst__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_20_invalid_bu */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_20_invalid_bu); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_21_nodelay_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_21_nodelay_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_22_unknown_li */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_22_unknown_li); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_23_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_23_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_24_info_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_24_info_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_25_notice_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_25_notice_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_26_warn_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_26_warn_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_limit_req_module__str_27_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.rodata.src_http_modules_ngx_http_limit_req_module__str_27_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_geo_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_geo_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_1_ranges_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_1_ranges_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_2_the__range */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_2_the__range); /* size 0x46 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_3_proxy_recu */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_3_proxy_recu); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_4_invalid_nu */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_4_invalid_nu); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_5_include_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_5_include_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_6_proxy_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_6_proxy_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_7__V_bin_Z_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_7__V_bin_Z_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_8_open_____s */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_8_open_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_9_binary_geo */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_9_binary_geo); /* size 0x3e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_10_second_bin */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_10_second_bin); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_11_fstat_____ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_11_fstat_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_12_stat_____s */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_12_stat_____s); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_13_stale_bina */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_13_stale_bina); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_14_pread_____ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_14_pread_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_15_pread_____ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_15_pread_____); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_16_incompatib */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_16_incompatib); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_17_CRC32_mism */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_17_CRC32_mism); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_18_using_bina */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_18_using_bina); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_19_close_____ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_19_close_____); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_20_255_255_25 */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_20_255_255_25); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_21_invalid_ne */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_21_invalid_ne); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_22_low_addres */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_22_low_addres); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_23_default_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_23_default_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_24_duplicate_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_24_duplicate_); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_25_delete_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_25_delete_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_26_no_address */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_26_no_address); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_27_invalid_ra */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_27_invalid_ra); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_28_duplicate_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_28_duplicate_); /* size 0x33 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_29_range___V_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_29_range___V_); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_30__geo__supp */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_30__geo__supp); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_31_no_network */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_31_no_network); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_32_duplicate_ */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_32_duplicate_); /* size 0x35 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_33_invalid_ra */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_33_invalid_ra); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_geo_module__str_34_creating_b */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.rodata.src_http_modules_ngx_http_geo_module__str_34_creating_b); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_map_ */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_map_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_1_map_hash_m */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_1_map_hash_m); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_2_map_hash_b */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_2_map_hash_b); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_3_map_hash_ */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_3_map_hash_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_4_hostnames_ */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_4_hostnames_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_5_invalid_nu */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_5_invalid_nu); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_6_include_ */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_6_include_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_7_default_ */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_7_default_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_8_duplicate_ */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_8_duplicate_); /* size 0x20 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_9_invalid_ho */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_9_invalid_ho); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_map_module__str_10_conflictin */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.rodata.src_http_modules_ngx_http_map_module__str_10_conflictin); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_split_clients_module__str_split_clie */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.rodata.src_http_modules_ngx_http_split_clients_module__str_split_clie); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_split_clients_module__str_1_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.rodata.src_http_modules_ngx_http_split_clients_module__str_1_invalid_va); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_split_clients_module__str_2_percent_to */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.rodata.src_http_modules_ngx_http_split_clients_module__str_2_percent_to); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_split_clients_module__str_3_invalid_pe */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.rodata.src_http_modules_ngx_http_split_clients_module__str_3_invalid_pe); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_the__none_ */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_the__none_); /* size 0x6b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_1_referer_ha */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_1_referer_ha); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_2_valid_refe */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_2_valid_refe); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_3_referer_ha */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_3_referer_ha); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_4_referer_ha */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_4_referer_ha); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_5_invalid_re */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_5_invalid_re); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_6_invalid_re */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_6_invalid_re); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_7_none_ */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_7_none_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_8_blocked_ */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_8_blocked_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_9_server_nam */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_9_server_nam); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_10_http____ */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_10_http____); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_11_https____ */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_11_https____); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_12_invalid_ho */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_12_invalid_ho); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_13_conflictin */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_13_conflictin); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_referer_module__str_14_the_using_ */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.rodata.src_http_modules_ngx_http_referer_module__str_14_the_using_); /* size 0x32 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_proxy_host */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_proxy_host); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_1_proxy_port */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_1_proxy_port); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_2_proxy_add_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_2_proxy_add_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_3_proxy_inte */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_3_proxy_inte); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_4__O_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_4__O_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_5_proxy_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_5_proxy_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_6_there_must */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_6_there_must); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_7__proxy_bus */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_7__proxy_bus); /* size 0x8a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_8__proxy_bus */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_8__proxy_bus); /* size 0x5d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_9__proxy_tem */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_9__proxy_tem); /* size 0x8d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_10__proxy_max */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_10__proxy_max); /* size 0xc5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_11__proxy_cac */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_11__proxy_cac); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_12__proxy_no_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_12__proxy_no_); /* size 0x74 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_13___ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_13___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_14_proxy_head */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_14_proxy_head); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_15_proxy_temp */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_15_proxy_temp); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_16_Date_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_16_Date_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_17_Server_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_17_Server_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_18_X_Pad_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_18_X_Pad_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_19_X_Accel_Ex */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_19_X_Accel_Ex); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_20_X_Accel_Re */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_20_X_Accel_Re); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_21_X_Accel_Li */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_21_X_Accel_Li); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_22_X_Accel_Bu */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_22_X_Accel_Bu); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_23_X_Accel_Ch */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_23_X_Accel_Ch); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_24_http____ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_24_http____); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_25_invalid_UR */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_25_invalid_UR); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_26__s_in_upst */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_26__s_in_upst); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_27_80_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_27_80_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_28_443_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_28_443_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_29_localhost_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_29_localhost_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_30_HEAD__ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_30_HEAD__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_31_zero_lengt */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_31_zero_lengt); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_32_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_32_upstream_s); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_33_server_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_33_server_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_34_date_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_34_date_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_35_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_35_upstream_s); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_36_domain__ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_36_domain__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_37_path__ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_37_path__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_38_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_38_upstream_s); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_39_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_39_upstream_s); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_40_Host_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_40_Host_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_41__proxy_hos */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_41__proxy_hos); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_42_Connection */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_42_Connection); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_43_close_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_43_close_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_44_Content_Le */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_44_Content_Le); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_45__proxy_int */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_45__proxy_int); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_46_Transfer_E */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_46_Transfer_E); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_47_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_47_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_48_Keep_Alive */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_48_Keep_Alive); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_49_Expect_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_49_Expect_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_50_Upgrade_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_50_Upgrade_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_51_If_Modifie */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_51_If_Modifie); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_52_If_Unmodif */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_52_If_Unmodif); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_53_If_None_Ma */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_53_If_None_Ma); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_54_If_Match_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_54_If_Match_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_55_Range_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_55_Range_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_56_If_Range_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_56_If_Range_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_57_proxy_pass */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_57_proxy_pass); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_58_proxy_redi */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_58_proxy_redi); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_59_proxy_cook */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_59_proxy_cook); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_60_proxy_cook */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_60_proxy_cook); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_61_proxy_stor */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_61_proxy_stor); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_62_proxy_stor */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_62_proxy_stor); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_63_proxy_buff */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_63_proxy_buff); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_64_proxy_igno */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_64_proxy_igno); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_65_proxy_bind */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_65_proxy_bind); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_66_proxy_conn */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_66_proxy_conn); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_67_proxy_send */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_67_proxy_send); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_68_proxy_send */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_68_proxy_send); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_69_proxy_inte */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_69_proxy_inte); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_70_proxy_set_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_70_proxy_set_); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_71_proxy_head */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_71_proxy_head); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_72_proxy_head */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_72_proxy_head); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_73_proxy_set_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_73_proxy_set_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_74_proxy_meth */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_74_proxy_meth); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_75_proxy_pass */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_75_proxy_pass); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_76_proxy_pass */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_76_proxy_pass); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_77_proxy_buff */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_77_proxy_buff); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_78_proxy_read */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_78_proxy_read); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_79_proxy_buff */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_79_proxy_buff); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_80_proxy_busy */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_80_proxy_busy); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_81_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_81_proxy_cach); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_82_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_82_proxy_cach); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_83_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_83_proxy_cach); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_84_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_84_proxy_cach); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_85_proxy_no_c */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_85_proxy_no_c); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_86_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_86_proxy_cach); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_87_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_87_proxy_cach); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_88_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_88_proxy_cach); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_89_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_89_proxy_cach); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_90_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_90_proxy_cach); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_91_proxy_cach */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_91_proxy_cach); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_92_proxy_temp */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_92_proxy_temp); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_93_proxy_max_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_93_proxy_max_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_94_proxy_temp */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_94_proxy_temp); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_95_proxy_next */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_95_proxy_next); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_96_proxy_pass */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_96_proxy_pass); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_97_proxy_hide */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_97_proxy_hide); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_98_proxy_igno */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_98_proxy_igno); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_99_proxy_http */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_99_proxy_http); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_100_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_100_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_101_https____ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_101_https____); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_102_https_prot */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_102_https_prot); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_103_invalid_UR */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_103_invalid_UR); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_104__proxy_pas */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_104__proxy_pas); /* size 0x9e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_105_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_105_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_106_false_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_106_false_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_107_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_107_invalid_pa); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_108_default_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_108_default_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_109_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_109_invalid_pa); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_110__proxy_red */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_110__proxy_red); /* size 0x53 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_111__proxy_red */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_111__proxy_red); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_112_using_rege */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_112_using_rege); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_113_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_113_is_incompa); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_114_on_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_114_on_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_115__proxy_sen */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_115__proxy_sen); /* size 0x2d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_116_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_116_is_incompa); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_117_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_117_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_118_timeout_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_118_timeout_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_119_invalid_he */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_119_invalid_he); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_120_http_500_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_120_http_500_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_121_http_502_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_121_http_502_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_122_http_503_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_122_http_503_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_123_http_504_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_123_http_504_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_124_http_404_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_124_http_404_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_125_updating_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_125_updating_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_126_1_0_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_126_1_0_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_proxy_module__str_127_1_1_ */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.rodata.src_http_modules_ngx_http_proxy_module__str_127_1_1_); /* size 0x4 */
	. = ALIGN(0x8); /* align for .rodata.ngx_http_fastcgi_process_record */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.ngx_http_fastcgi_process_record); /* size 0x50 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_fastcgi_sc */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_fastcgi_sc); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_1_fastcgi_pa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_1_fastcgi_pa); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_2_fastcgi_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_2_fastcgi_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_3_there_must */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_3_there_must); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_4__fastcgi_b */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_4__fastcgi_b); /* size 0x90 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_5__fastcgi_b */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_5__fastcgi_b); /* size 0x61 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_6__fastcgi_t */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_6__fastcgi_t); /* size 0x93 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_7__fastcgi_m */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_7__fastcgi_m); /* size 0xcb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_8__fastcgi_c */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_8__fastcgi_c); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_9__fastcgi_n */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_9__fastcgi_n); /* size 0x78 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_10_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_10_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_11_fastcgi_hi */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_11_fastcgi_hi); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_12_fastcgi_te */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_12_fastcgi_te); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_13_Status_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_13_Status_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_14_X_Accel_Ex */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_14_X_Accel_Ex); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_15_X_Accel_Re */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_15_X_Accel_Re); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_16_X_Accel_Li */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_16_X_Accel_Li); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_17_X_Accel_Bu */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_17_X_Accel_Bu); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_18_X_Accel_Ch */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_18_X_Accel_Ch); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_19_ngx_http_f */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_19_ngx_http_f); /* size 0x3e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_20_fastcgi___ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_20_fastcgi___); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_21__s_in_upst */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_21__s_in_upst); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_22_fastcgi_re */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_22_fastcgi_re); /* size 0x27 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_23_HTTP__ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_23_HTTP__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_24_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_24_upstream_s); /* size 0x2c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_25_upstream_p */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_25_upstream_p); /* size 0x2b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_26_FastCGI_se */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_26_FastCGI_se); /* size 0x1e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_27_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_27_upstream_s); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_28_302_Moved_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_28_302_Moved_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_29_200_OK_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_29_200_OK_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_30_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_30_upstream_s); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_31_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_31_upstream_s); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_32_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_32_upstream_s); /* size 0x2e */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_33_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_33_upstream_s); /* size 0x3a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_34_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_34_upstream_s); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_35_fastcgi_pa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_35_fastcgi_pa); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_36_HTTP_IF_MO */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_36_HTTP_IF_MO); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_37_HTTP_IF_UN */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_37_HTTP_IF_UN); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_38_HTTP_IF_NO */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_38_HTTP_IF_NO); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_39_HTTP_IF_MA */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_39_HTTP_IF_MA); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_40_HTTP_RANGE */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_40_HTTP_RANGE); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_41_HTTP_IF_RA */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_41_HTTP_IF_RA); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_42_fastcgi_pa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_42_fastcgi_pa); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_43_fastcgi_in */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_43_fastcgi_in); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_44_fastcgi_sp */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_44_fastcgi_sp); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_45_fastcgi_st */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_45_fastcgi_st); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_46_fastcgi_st */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_46_fastcgi_st); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_47_fastcgi_ig */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_47_fastcgi_ig); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_48_fastcgi_bi */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_48_fastcgi_bi); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_49_fastcgi_co */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_49_fastcgi_co); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_50_fastcgi_se */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_50_fastcgi_se); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_51_fastcgi_se */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_51_fastcgi_se); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_52_fastcgi_bu */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_52_fastcgi_bu); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_53_fastcgi_pa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_53_fastcgi_pa); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_54_fastcgi_pa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_54_fastcgi_pa); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_55_fastcgi_in */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_55_fastcgi_in); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_56_fastcgi_re */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_56_fastcgi_re); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_57_fastcgi_bu */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_57_fastcgi_bu); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_58_fastcgi_bu */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_58_fastcgi_bu); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_59_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_59_fastcgi_ca); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_60_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_60_fastcgi_ca); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_61_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_61_fastcgi_ca); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_62_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_62_fastcgi_ca); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_63_fastcgi_no */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_63_fastcgi_no); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_64_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_64_fastcgi_ca); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_65_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_65_fastcgi_ca); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_66_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_66_fastcgi_ca); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_67_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_67_fastcgi_ca); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_68_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_68_fastcgi_ca); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_69_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_69_fastcgi_ca); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_70_fastcgi_te */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_70_fastcgi_te); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_71_fastcgi_ma */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_71_fastcgi_ma); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_72_fastcgi_te */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_72_fastcgi_te); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_73_fastcgi_ne */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_73_fastcgi_ne); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_74_fastcgi_pa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_74_fastcgi_pa); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_75_fastcgi_pa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_75_fastcgi_pa); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_76_fastcgi_hi */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_76_fastcgi_hi); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_77_fastcgi_ig */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_77_fastcgi_ig); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_78_fastcgi_ca */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_78_fastcgi_ca); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_79_fastcgi_ke */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_79_fastcgi_ke); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_80_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_80_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_81___V__requi */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_81___V__requi); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_82_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_82_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_83_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_83_is_incompa); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_84_on_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_84_on_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_85__fastcgi_s */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_85__fastcgi_s); /* size 0x2f */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_86_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_86_is_incompa); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_87_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_87_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_88_timeout_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_88_timeout_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_89_invalid_he */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_89_invalid_he); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_90_http_500_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_90_http_500_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_91_http_503_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_91_http_503_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_92_http_404_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_92_http_404_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_fastcgi_module__str_93_updating_ */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.rodata.src_http_modules_ngx_http_fastcgi_module__str_93_updating_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_uwsgi_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_uwsgi_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_1_there_must */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_1_there_must); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_2__uwsgi_bus */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_2__uwsgi_bus); /* size 0x8a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_3__uwsgi_bus */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_3__uwsgi_bus); /* size 0x5d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_4__uwsgi_tem */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_4__uwsgi_tem); /* size 0x8d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_5__uwsgi_max */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_5__uwsgi_max); /* size 0xc5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_6__uwsgi_cac */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_6__uwsgi_cac); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_7_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_7_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_8_uwsgi_hide */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_8_uwsgi_hide); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_9_uwsgi_temp */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_9_uwsgi_temp); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_10_X_Accel_Ex */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_10_X_Accel_Ex); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_11_X_Accel_Re */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_11_X_Accel_Re); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_12_X_Accel_Li */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_12_X_Accel_Li); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_13_X_Accel_Bu */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_13_X_Accel_Bu); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_14_X_Accel_Ch */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_14_X_Accel_Ch); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_15_ngx_http_u */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_15_ngx_http_u); /* size 0x3d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_16_uwsgi____ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_16_uwsgi____); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_17__s_in_upst */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_17__s_in_upst); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_18_HTTP__ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_18_HTTP__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_19_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_19_upstream_s); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_20_302_Moved_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_20_302_Moved_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_21_200_OK_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_21_200_OK_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_22_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_22_upstream_s); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_23_uwsgi_para */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_23_uwsgi_para); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_24_HTTP_IF_MO */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_24_HTTP_IF_MO); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_25_HTTP_IF_UN */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_25_HTTP_IF_UN); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_26_HTTP_IF_NO */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_26_HTTP_IF_NO); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_27_HTTP_IF_MA */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_27_HTTP_IF_MA); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_28_HTTP_RANGE */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_28_HTTP_RANGE); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_29_HTTP_IF_RA */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_29_HTTP_IF_RA); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_30_uwsgi_pass */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_30_uwsgi_pass); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_31_uwsgi_modi */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_31_uwsgi_modi); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_32_uwsgi_modi */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_32_uwsgi_modi); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_33_uwsgi_stor */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_33_uwsgi_stor); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_34_uwsgi_stor */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_34_uwsgi_stor); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_35_uwsgi_buff */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_35_uwsgi_buff); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_36_uwsgi_igno */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_36_uwsgi_igno); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_37_uwsgi_bind */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_37_uwsgi_bind); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_38_uwsgi_conn */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_38_uwsgi_conn); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_39_uwsgi_send */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_39_uwsgi_send); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_40_uwsgi_buff */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_40_uwsgi_buff); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_41_uwsgi_pass */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_41_uwsgi_pass); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_42_uwsgi_pass */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_42_uwsgi_pass); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_43_uwsgi_inte */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_43_uwsgi_inte); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_44_uwsgi_read */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_44_uwsgi_read); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_45_uwsgi_buff */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_45_uwsgi_buff); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_46_uwsgi_busy */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_46_uwsgi_busy); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_47_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_47_uwsgi_cach); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_48_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_48_uwsgi_cach); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_49_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_49_uwsgi_cach); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_50_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_50_uwsgi_cach); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_51_uwsgi_no_c */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_51_uwsgi_no_c); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_52_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_52_uwsgi_cach); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_53_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_53_uwsgi_cach); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_54_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_54_uwsgi_cach); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_55_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_55_uwsgi_cach); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_56_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_56_uwsgi_cach); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_57_uwsgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_57_uwsgi_cach); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_58_uwsgi_temp */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_58_uwsgi_temp); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_59_uwsgi_max_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_59_uwsgi_max_); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_60_uwsgi_temp */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_60_uwsgi_temp); /* size 0x1b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_61_uwsgi_next */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_61_uwsgi_next); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_62_uwsgi_para */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_62_uwsgi_para); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_63_uwsgi_stri */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_63_uwsgi_stri); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_64_uwsgi_pass */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_64_uwsgi_pass); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_65_uwsgi_hide */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_65_uwsgi_hide); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_66_uwsgi_igno */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_66_uwsgi_igno); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_67_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_67_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_68_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_68_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_69_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_69_is_incompa); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_70_on_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_70_on_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_71_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_71_is_incompa); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_72_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_72_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_73_timeout_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_73_timeout_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_74_invalid_he */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_74_invalid_he); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_75_http_500_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_75_http_500_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_76_http_503_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_76_http_503_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_77_http_404_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_77_http_404_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_uwsgi_module__str_78_updating_ */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.rodata.src_http_modules_ngx_http_uwsgi_module__str_78_updating_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_scgi_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_scgi_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_1_there_must */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_1_there_must); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_2__scgi_busy */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_2__scgi_busy); /* size 0x87 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_3__scgi_busy */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_3__scgi_busy); /* size 0x5b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_4__scgi_temp */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_4__scgi_temp); /* size 0x8a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_5__scgi_max_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_5__scgi_max_); /* size 0xc2 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_6__scgi_cach */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_6__scgi_cach); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_7_scgi_hide_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_7_scgi_hide_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_8_scgi_temp_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_8_scgi_temp_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_9_Status_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_9_Status_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_10_X_Accel_Ex */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_10_X_Accel_Ex); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_11_X_Accel_Re */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_11_X_Accel_Re); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_12_X_Accel_Li */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_12_X_Accel_Li); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_13_X_Accel_Bu */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_13_X_Accel_Bu); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_14_X_Accel_Ch */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_14_X_Accel_Ch); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_15_ngx_http_s */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_15_ngx_http_s); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_16_scgi____ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_16_scgi____); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_17__s_in_upst */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_17__s_in_upst); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_18__O_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_18__O_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_19__ui_CONTEN */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_19__ui_CONTEN); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_20_HTTP__ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_20_HTTP__); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_21_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_21_upstream_s); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_22_302_Moved_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_22_302_Moved_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_23_200_OK_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_23_200_OK_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_24_upstream_s */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_24_upstream_s); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_25_scgi_param */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_25_scgi_param); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_26_HTTP_IF_MO */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_26_HTTP_IF_MO); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_27_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_27_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_28_HTTP_IF_UN */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_28_HTTP_IF_UN); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_29_HTTP_IF_NO */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_29_HTTP_IF_NO); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_30_HTTP_IF_MA */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_30_HTTP_IF_MA); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_31_HTTP_RANGE */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_31_HTTP_RANGE); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_32_HTTP_IF_RA */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_32_HTTP_IF_RA); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_33_scgi_pass_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_33_scgi_pass_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_34_scgi_store */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_34_scgi_store); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_35_scgi_store */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_35_scgi_store); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_36_scgi_buffe */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_36_scgi_buffe); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_37_scgi_ignor */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_37_scgi_ignor); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_38_scgi_bind_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_38_scgi_bind_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_39_scgi_conne */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_39_scgi_conne); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_40_scgi_send_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_40_scgi_send_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_41_scgi_buffe */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_41_scgi_buffe); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_42_scgi_pass_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_42_scgi_pass_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_43_scgi_pass_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_43_scgi_pass_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_44_scgi_inter */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_44_scgi_inter); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_45_scgi_read_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_45_scgi_read_); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_46_scgi_buffe */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_46_scgi_buffe); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_47_scgi_busy_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_47_scgi_busy_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_48_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_48_scgi_cache); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_49_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_49_scgi_cache); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_50_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_50_scgi_cache); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_51_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_51_scgi_cache); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_52_scgi_no_ca */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_52_scgi_no_ca); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_53_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_53_scgi_cache); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_54_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_54_scgi_cache); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_55_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_55_scgi_cache); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_56_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_56_scgi_cache); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_57_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_57_scgi_cache); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_58_scgi_cache */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_58_scgi_cache); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_59_scgi_temp_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_59_scgi_temp_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_60_scgi_max_t */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_60_scgi_max_t); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_61_scgi_temp_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_61_scgi_temp_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_62_scgi_next_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_62_scgi_next_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_63_scgi_param */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_63_scgi_param); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_64_scgi_pass_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_64_scgi_pass_); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_65_scgi_hide_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_65_scgi_hide_); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_66_scgi_ignor */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_66_scgi_ignor); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_67_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_67_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_68_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_68_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_69_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_69_is_incompa); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_70_on_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_70_on_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_71_is_incompa */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_71_is_incompa); /* size 0x22 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_72_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_72_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_73_timeout_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_73_timeout_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_74_invalid_he */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_74_invalid_he); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_75_http_500_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_75_http_500_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_76_http_503_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_76_http_503_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_77_http_404_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_77_http_404_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_scgi_module__str_78_updating_ */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.rodata.src_http_modules_ngx_http_scgi_module__str_78_updating_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_memcached_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_1_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_1_memcached_); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_2_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_2_memcached_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_3_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_3_memcached_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_4_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_4_memcached_); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_5_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_5_memcached_); /* size 0x17 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_6_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_6_memcached_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_7_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_7_memcached_); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_8_is_duplica */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_8_is_duplica); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_9_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_9_memcached_); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_10_the___memc */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_10_the___memc); /* size 0x29 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_11_VALUE__ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_11_VALUE__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_12_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_12_memcached_); /* size 0x39 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_13_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_13_memcached_); /* size 0x3b */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_14_Content_En */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_14_Content_En); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_15_gzip_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_15_gzip_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_16_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_16_memcached_); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_17_END__ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_17_END__); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_18_key____V__ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_18_key____V__); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_19_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_19_memcached_); /* size 0x26 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_20_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_20_memcached_); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_21_memcached_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_21_memcached_); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_22_error_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_22_error_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_23_timeout_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_23_timeout_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_24_invalid_re */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_24_invalid_re); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_25_not_found_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_25_not_found_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_memcached_module__str_26_off_ */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.rodata.src_http_modules_ngx_http_memcached_module__str_26_off_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_empty_gif_module__str_empty_gif_ */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.rodata.src_http_modules_ngx_http_empty_gif_module__str_empty_gif_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_empty_gif_module__str_1_image_gif_ */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.rodata.src_http_modules_ngx_http_empty_gif_module__str_1_image_gif_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_msie_ */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_msie_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_1_modern_bro */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_1_modern_bro); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_2_ancient_br */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_2_ancient_br); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_3_Mozilla__ */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_3_Mozilla__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_4_modern_bro */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_4_modern_bro); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_5_ancient_br */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_5_ancient_br); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_6_unlisted_ */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_6_unlisted_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_7_unknown_br */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_7_unknown_br); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_8_invalid_br */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_8_invalid_br); /* size 0x1d */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_browser_module__str_9_netscape4_ */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.rodata.src_http_modules_ngx_http_browser_module__str_9_netscape4_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_upstream_ip_hash_module__str_ip_hash_ */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.rodata.src_http_modules_ngx_http_upstream_ip_hash_module__str_ip_hash_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_upstream_least_conn_module__str_least_conn */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.rodata.src_http_modules_ngx_http_upstream_least_conn_module__str_least_conn); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_keepalive_ */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_keepalive_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_1_invalid_va */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_1_invalid_va); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_2_single_ */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_2_single_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_3_the__singl */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_3_the__singl); /* size 0x25 */
	. = ALIGN(0x1); /* align for .rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_4_invalid_pa */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.rodata.src_http_modules_ngx_http_upstream_keepalive_module__str_4_invalid_pa); /* size 0x17 */
	. = ALIGN(0x8); /* align for .rodata.sysconf */
	"/usr/local/popcorn/aarch64/lib/libc.a(sysconf.o)"(.rodata.sysconf); /* size 0x50 */
	. = ALIGN(0x10); /* align for .rodata.src_conf_sysconf_c_sysconf_values */
	"/usr/local/popcorn/aarch64/lib/libc.a(sysconf.o)"(.rodata.src_conf_sysconf_c_sysconf_values); /* size 0x1f2 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha256_c___crypt_sha256_testkey */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256_c___crypt_sha256_testkey); /* size 0x12 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha256_c___crypt_sha256_testsetting */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256_c___crypt_sha256_testsetting); /* size 0x1e */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha256_c___crypt_sha256_testhash */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256_c___crypt_sha256_testhash); /* size 0x49 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha256__str___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256__str___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha256__str_1__5__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256__str_1__5__); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha256__str_2_rounds__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256__str_2_rounds__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha256__str_3_rounds__u_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256__str_3_rounds__u_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha256__str_4__5__s___s_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256__str_4__5__s___s_); /* size 0xb */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha256_c_sha256crypt_perm */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256_c_sha256crypt_perm); /* size 0x1e */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha256_c_K */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256_c_K); /* size 0x100 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha256_c_b64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha256.o)"(.rodata.src_crypt_crypt_sha256_c_b64); /* size 0x41 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha512_c___crypt_sha512_testkey */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512_c___crypt_sha512_testkey); /* size 0x12 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha512_c___crypt_sha512_testsetting */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512_c___crypt_sha512_testsetting); /* size 0x1e */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha512_c___crypt_sha512_testhash */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512_c___crypt_sha512_testhash); /* size 0x74 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha512__str___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512__str___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha512__str_1__6__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512__str_1__6__); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha512__str_2_rounds__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512__str_2_rounds__); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha512__str_3_rounds__u_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512__str_3_rounds__u_); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_sha512__str_4__6__s___s_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512__str_4__6__s___s_); /* size 0xb */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha512_c_sha512crypt_perm */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512_c_sha512crypt_perm); /* size 0x3f */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha512_c_K */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512_c_K); /* size 0x280 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_sha512_c_b64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_sha512.o)"(.rodata.src_crypt_crypt_sha512_c_b64); /* size 0x41 */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_); /* size 0x1 */
	. = ALIGN(0x10); /* align for .rodata.src_env___libc_start_main___init_libc_pfd_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main___init_libc_pfd_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_env___libc_start_main__str_1__dev_null_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.rodata.src_env___libc_start_main__str_1__dev_null_); /* size 0xa */
	. = ALIGN(0x10); /* align for .rodata.src_errno_strerror_c_errid */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.rodata.src_errno_strerror_c_errid); /* size 0x58 */
	. = ALIGN(0x10); /* align for .rodata.src_errno_strerror_c_errmsg */
	"/usr/local/popcorn/aarch64/lib/libc.a(strerror.o)"(.rodata.src_errno_strerror_c_errmsg); /* size 0x70c */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_malloc_c_bin_tab */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.rodata.src_malloc_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x10); /* align for .rodata.src_malloc_popcorn_malloc_c_bin_tab */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.rodata.src_malloc_popcorn_malloc_c_bin_tab); /* size 0x3c */
	. = ALIGN(0x1); /* align for .rodata.src_network_lookup_name__str___________ */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.rodata.src_network_lookup_name__str___________); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_network_lookup_name__str_1__etc_hosts */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.rodata.src_network_lookup_name__str_1__etc_hosts); /* size 0xb */
	. = ALIGN(0x10); /* align for .rodata.src_network_lookup_name_c_name_from_dns_afrr */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.rodata.src_network_lookup_name_c_name_from_dns_afrr); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.src_network_lookup_name_c_defpolicy */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.rodata.src_network_lookup_name_c_defpolicy); /* size 0x78 */
	. = ALIGN(0x4); /* align for .rodata.src_network_lookup_name_switch_table_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(lookup_name.o)"(.rodata.src_network_lookup_name_switch_table_); /* size 0x10 */
	. = ALIGN(0x4); /* align for .rodata.src_network_res_msend___res_msend_rc_sa_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(res_msend.o)"(.rodata.src_network_res_msend___res_msend_rc_sa_); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_network_res_msend__str___________ */
	"/usr/local/popcorn/aarch64/lib/libc.a(res_msend.o)"(.rodata.src_network_res_msend__str___________); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str__etc_resol */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str__etc_resol); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_1_options_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_1_options_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_2_ndots__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_2_ndots__); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_3_attempts__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_3_attempts__); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_4_timeout__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_4_timeout__); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_5_nameserver */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_5_nameserver); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_6_domain_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_6_domain_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_7_search_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_7_search_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_network_resolvconf__str_8_127_0_0_1_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(resolvconf.o)"(.rodata.src_network_resolvconf__str_8_127_0_0_1_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getgrent__str__etc_group */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.rodata.src_passwd_getgrent__str__etc_group); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getgrent__str_1_rbe_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.rodata.src_passwd_getgrent__str_1_rbe_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getgrouplist__str__etc_group */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrouplist.o)"(.rodata.src_passwd_getgrouplist__str__etc_group); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getgrouplist__str_1_rbe_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrouplist.o)"(.rodata.src_passwd_getgrouplist__str_1_rbe_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getpwent__str__etc_passw */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.rodata.src_passwd_getpwent__str__etc_passw); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getpwent__str_1_rbe_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.rodata.src_passwd_getpwent__str_1_rbe_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_nscd_query__str_r_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(nscd_query.o)"(.rodata.src_passwd_nscd_query__str_r_); /* size 0x2 */
	. = ALIGN(0x2); /* align for .rodata.src_passwd_nscd_query_c_addr */
	"/usr/local/popcorn/aarch64/lib/libc.a(nscd_query.o)"(.rodata.src_passwd_nscd_query_c_addr); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_regex_glob__str___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.rodata.src_regex_glob__str___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_regex_glob__str_1_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.rodata.src_regex_glob__str_1_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_regex_glob__str_2___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(glob.o)"(.rodata.src_regex_glob__str_2___); /* size 0x2 */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_all_mask */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.rodata.src_signal_block_c_all_mask); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.src_signal_block_c_app_mask */
	"/usr/local/popcorn/aarch64/lib/libc.a(block.o)"(.rodata.src_signal_block_c_app_mask); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio___fdopen__str_rwa_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__fdopen.o)"(.rodata.src_stdio___fdopen__str_rwa_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_fopen__str_rwa_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(fopen.o)"(.rodata.src_stdio_fopen__str_rwa_); /* size 0x4 */
	. = ALIGN(0x10); /* align for .rodata.src_stdlib_qsort_qsort_p_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(qsort.o)"(.rodata.src_stdlib_qsort_qsort_p_); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.src_thread_synccall___synccall_sa_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.rodata.src_thread_synccall___synccall_sa_); /* size 0x98 */
	. = ALIGN(0x1); /* align for .rodata.src_thread_synccall__str__proc_self */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.rodata.src_thread_synccall__str__proc_self); /* size 0x10 */
	. = ALIGN(0x8); /* align for .rodata.__strftime_fmt_1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.__strftime_fmt_1); /* size 0x2b0 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_1__m__d__y_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_1__m__d__y_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_2__2d_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_2__2d_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_3__Y__m__d_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_3__Y__m__d_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_4___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_4___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_5__H__M_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_5__H__M_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_6___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_6___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_7__H__M__S_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_7__H__M__S_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_8___lld_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_8___lld_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_9_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_9_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_10____2d__2d_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_10____2d__2d_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_11___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_11___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_time_strftime__str_12__0_lld_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(strftime.o)"(.rodata.src_time_strftime__str_12__0_lld_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_blowfish__str_8b________ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish__str_8b________); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_blowfish__str_1__2a_00_abc */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish__str_1__2a_00_abc); /* size 0x1e */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_blowfish_c___crypt_blowfish_test_hash */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish_c___crypt_blowfish_test_hash); /* size 0x44 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_blowfish__str_2___34____34 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish__str_2___34____34); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_blowfish__str_3___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish__str_3___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_blowfish_c_BF_crypt_flags_by_subtype */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish_c_BF_crypt_flags_by_subtype); /* size 0x1a */
	. = ALIGN(0x4); /* align for .rodata.src_crypt_crypt_blowfish_c_BF_init_state */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish_c_BF_init_state); /* size 0x1048 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_blowfish_c_BF_magic_w */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish_c_BF_magic_w); /* size 0x18 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_blowfish_c_BF_atoi64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish_c_BF_atoi64); /* size 0x60 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_blowfish_c_BF_itoa64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_blowfish.o)"(.rodata.src_crypt_crypt_blowfish_c_BF_itoa64); /* size 0x41 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_key_perm_maskl */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_key_perm_maskl); /* size 0x200 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_key_perm_maskr */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_key_perm_maskr); /* size 0x300 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_key_shifts */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_key_shifts); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_comp_maskl0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_comp_maskl0); /* size 0x80 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_comp_maskr0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_comp_maskr0); /* size 0x80 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_comp_maskl1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_comp_maskl1); /* size 0x100 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_comp_maskr1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_comp_maskr1); /* size 0x100 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_ip_maskl */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_ip_maskl); /* size 0x400 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_ip_maskr */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_ip_maskr); /* size 0x400 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_psbox */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_psbox); /* size 0x800 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_fp_maskl */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_fp_maskl); /* size 0x200 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_des__str___________ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des__str___________); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_des__str_1__0____9Zz_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des__str_1__0____9Zz_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_des__str_2__0____9ZzX */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des__str_2__0____9ZzX); /* size 0x15 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_des__str_3__x_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des__str_3__x_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_des__str_4__x22_wK52Z */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des__str_4__x22_wK52Z); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_des__str_5_x_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des__str_5_x_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_des__str_6___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des__str_6___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_des_c_ascii64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_des.o)"(.rodata.src_crypt_crypt_des_c_ascii64); /* size 0x41 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_md5_c___crypt_md5_testkey */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5_c___crypt_md5_testkey); /* size 0x12 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_md5_c___crypt_md5_testsetting */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5_c___crypt_md5_testsetting); /* size 0xd */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_md5_c___crypt_md5_testhash */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5_c___crypt_md5_testhash); /* size 0x23 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_md5__str___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5__str___); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_md5__str_1__1__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5__str_1__1__); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_crypt_crypt_md5_c_md5crypt_perm */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5_c_md5crypt_perm); /* size 0xf */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_md5_c_tab */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5_c_tab); /* size 0x100 */
	. = ALIGN(0x10); /* align for .rodata.src_crypt_crypt_md5_c_b64 */
	"/usr/local/popcorn/aarch64/lib/libc.a(crypt_md5.o)"(.rodata.src_crypt_crypt_md5_c_b64); /* size 0x41 */
	. = ALIGN(0x10); /* align for .rodata.src_internal_intscan_c_table */
	"/usr/local/popcorn/aarch64/lib/libc.a(intscan.o)"(.rodata.src_internal_intscan_c_table); /* size 0x101 */
	. = ALIGN(0x1); /* align for .rodata.src_internal_intscan__str__________ */
	"/usr/local/popcorn/aarch64/lib/libc.a(intscan.o)"(.rodata.src_internal_intscan__str__________); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_internal_procfdname__str__proc_self */
	"/usr/local/popcorn/aarch64/lib/libc.a(procfdname.o)"(.rodata.src_internal_procfdname__str__proc_self); /* size 0xf */
	. = ALIGN(0x8); /* align for .rodata.__nl_langinfo_l */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.__nl_langinfo_l); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_locale_langinfo__str_ASCII_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.src_locale_langinfo__str_ASCII_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_locale_langinfo__str_1_UTF_8_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.src_locale_langinfo__str_1_UTF_8_); /* size 0x6 */
	. = ALIGN(0x1); /* align for .rodata.src_locale_langinfo__str_2_C_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.src_locale_langinfo__str_2_C_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_locale_langinfo__str_3_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.src_locale_langinfo__str_3_); /* size 0x1 */
	. = ALIGN(0x1); /* align for .rodata.src_locale_langinfo_c_c_numeric */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.src_locale_langinfo_c_c_numeric); /* size 0x3 */
	. = ALIGN(0x10); /* align for .rodata.src_locale_langinfo_c_c_time */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.src_locale_langinfo_c_c_time); /* size 0x13c */
	. = ALIGN(0x10); /* align for .rodata.src_locale_langinfo_c_c_messages */
	"/usr/local/popcorn/aarch64/lib/libc.a(langinfo.o)"(.rodata.src_locale_langinfo_c_c_messages); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getgr_a__str__etc_group */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgr_a.o)"(.rodata.src_passwd_getgr_a__str__etc_group); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getgr_a__str_1_rbe_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgr_a.o)"(.rodata.src_passwd_getgr_a__str_1_rbe_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getpw_a__str__etc_passw */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpw_a.o)"(.rodata.src_passwd_getpw_a__str__etc_passw); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.src_passwd_getpw_a__str_1_rbe_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpw_a.o)"(.rodata.src_passwd_getpw_a__str_1_rbe_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_time___secs_to_tm_c___secs_to_tm_days_in_month */
	"/usr/local/popcorn/aarch64/lib/libc.a(__secs_to_tm.o)"(.rodata.src_time___secs_to_tm_c___secs_to_tm_days_in_month); /* size 0xc */
	. = ALIGN(0x1); /* align for .rodata.__gmt */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.rodata.__gmt); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_); /* size 0x1 */
	. = ALIGN(0x10); /* align for .rodata.src_time___tz_c_do_tzset_search */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.rodata.src_time___tz_c_do_tzset_search); /* size 0x36 */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_1_TZ_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_1_TZ_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_2__etc_local */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_2__etc_local); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_time___tz__str_3_TZif_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.rodata.src_time___tz__str_3_TZif_); /* size 0x5 */
	. = ALIGN(0x8); /* align for .rodata.iswctype */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswctype.o)"(.rodata.iswctype); /* size 0x60 */
	. = ALIGN(0x10); /* align for .rodata.src_ctype_iswctype_c_wctype_names */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswctype.o)"(.rodata.src_ctype_iswctype_c_wctype_names); /* size 0x49 */
	. = ALIGN(0x10); /* align for .rodata.src_ctype_iswpunct_c_table */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswpunct.o)"(.rodata.src_ctype_iswpunct_c_table); /* size 0xc60 */
	. = ALIGN(0x10); /* align for .rodata.src_ctype_iswspace_c_iswspace_spaces */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswspace.o)"(.rodata.src_ctype_iswspace_c_iswspace_spaces); /* size 0x58 */
	. = ALIGN(0x10); /* align for .rodata.src_ctype_towctrans_c_casemaps */
	"/usr/local/popcorn/aarch64/lib/libc.a(towctrans.o)"(.rodata.src_ctype_towctrans_c_casemaps); /* size 0xf4 */
	. = ALIGN(0x10); /* align for .rodata.src_ctype_towctrans_c_pairs */
	"/usr/local/popcorn/aarch64/lib/libc.a(towctrans.o)"(.rodata.src_ctype_towctrans_c_pairs); /* size 0x1e8 */
	. = ALIGN(0x8); /* align for .rodata.__inet_aton */
	"/usr/local/popcorn/aarch64/lib/libc.a(inet_aton.o)"(.rodata.__inet_aton); /* size 0x28 */
	. = ALIGN(0x8); /* align for .rodata.printf_core */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.printf_core); /* size 0x170 */
	. = ALIGN(0x8); /* align for .rodata.pop_arg */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.pop_arg); /* size 0x90 */
	. = ALIGN(0x10); /* align for .rodata.src_stdio_vfprintf_c_states */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf_c_states); /* size 0x1d0 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str______0X0x_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str______0X0x_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_1__null__ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_1__null__); /* size 0x7 */
	. = ALIGN(0x10); /* align for .rodata.src_stdio_vfprintf_c_xdigits */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf_c_xdigits); /* size 0x10 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_2__0X_0X_0X_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_2__0X_0X_0X_); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_3_inf_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_3_inf_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_4_INF_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_4_INF_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_5_nan_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_5_nan_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_6_NAN_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_6_NAN_); /* size 0x4 */
	. = ALIGN(0x1); /* align for .rodata.src_stdio_vfprintf__str_7___ */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfprintf.o)"(.rodata.src_stdio_vfprintf__str_7___); /* size 0x2 */
	. = ALIGN(0x10); /* align for .rodata.src_time___month_to_secs_c___month_to_secs_secs_through_month */
	"/usr/local/popcorn/aarch64/lib/libc.a(__month_to_secs.o)"(.rodata.src_time___month_to_secs_c___month_to_secs_secs_through_month); /* size 0x30 */
	. = ALIGN(0x10); /* align for .rodata.src_ctype_iswalpha_c_table */
	"/usr/local/popcorn/aarch64/lib/libc.a(iswalpha.o)"(.rodata.src_ctype_iswalpha_c_table); /* size 0xba0 */
	. = ALIGN(0x10); /* align for .rodata.__fsmu8 */
	"/usr/local/popcorn/aarch64/lib/libc.a(internal.o)"(.rodata.__fsmu8); /* size 0xcc */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_Destinatio */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_Destinatio); /* size 0x24 */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_1_0_____Unsu */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_1_0_____Unsu); /* size 0x21 */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_2_src_migrat */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_2_src_migrat); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_migrate___func_____migrate_shim_internal___migrate_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate___func_____migrate_shim_internal___migrate_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_3_Could_not_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_3_Could_not_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_migrate__str_4_Could_not_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate__str_4_Could_not_); /* size 0x1a */
	. = ALIGN(0x1); /* align for .rodata.src_migrate___func___get_thread_pointer_get_thread */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.rodata.src_migrate___func___get_thread_pointer_get_thread); /* size 0x13 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_POPCORN_TH */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_POPCORN_TH); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_1_thread_sch */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_1_thread_sch); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_2_r_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_2_r_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_3__lu__lu_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_3__lu__lu_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_mapping__str_4__d_ */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.rodata.src_mapping__str_4__d_); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_ST_AARCH64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_ST_AARCH64); /* size 0xf */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_1__s_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_1__s_aarch64); /* size 0xb */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_2_ST_POWERPC */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_2_ST_POWERPC); /* size 0x11 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_3__s_powerpc */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_3__s_powerpc); /* size 0xd */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_4_ST_X86_64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_4_ST_X86_64_); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_5__s_x86_64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_5__s_x86_64_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_6__proc__d_m */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_6__proc__d_m); /* size 0xe */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_7_r_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_7_r_); /* size 0x2 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_8__lx__lx__s */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_8__lx__lx__s); /* size 0x19 */
	. = ALIGN(0x1); /* align for .rodata.src_userspace__str_9__stack__ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace__str_9__stack__); /* size 0x8 */
	. = ALIGN(0x10); /* align for .rodata.src_userspace_switch_table_10_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.rodata.src_userspace_switch_table_10_); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str__stack_tra); /* size 0x1f */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_1__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_1__stack_tra); /* size 0x18 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_2__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_2__stack_tra); /* size 0x14 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_3__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_3__stack_tra); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_4__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_4__stack_tra); /* size 0x16 */
	. = ALIGN(0x1); /* align for .rodata.src_init__str_5__stack_tra */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(init.o)"(.rodata.src_init__str_5__stack_tra); /* size 0x1c */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str__src_rewri); /* size 0x42 */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str_1__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str_1__src_rewri); /* size 0x68 */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str_2__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str_2__src_rewri); /* size 0x54 */
	. = ALIGN(0x1); /* align for .rodata.src_rewrite__str_3__src_rewri */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.rodata.src_rewrite__str_3__src_rewri); /* size 0x61 */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_aarch64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_aarch64_); /* size 0x8 */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_1_powerpc64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_1_powerpc64_); /* size 0xa */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_2_x86_64_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_2_x86_64_); /* size 0x7 */
	. = ALIGN(0x1); /* align for .rodata.src_util__str_3_unknown_un */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(util.o)"(.rodata.src_util__str_3_unknown_un); /* size 0x21 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_aarch64_properties_c_callee_saved_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_aarch64_properties_c_callee_saved_aarch64); /* size 0x28 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_aarch64_properties_c_callee_saved_size_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_aarch64_properties_c_callee_saved_size_aarch64); /* size 0x28 */
	. = ALIGN(0x8); /* align for .rodata.properties_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.properties_aarch64); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_aarch64_properties__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_aarch64_properties__str__src_arch_); /* size 0x51 */
	. = ALIGN(0x8); /* align for .rodata.reg_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.reg_aarch64); /* size 0x300 */
	. = ALIGN(0x8); /* align for .rodata.regs_aarch64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.regs_aarch64); /* size 0xa8 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_aarch64_regs__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_aarch64_regs__str__src_arch_); /* size 0x4c */
	. = ALIGN(0x1); /* align for .rodata.src_arch_aarch64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_aarch64_regs__str_1__src_arch_); /* size 0x4c */
	. = ALIGN(0x8); /* align for .rodata.is_callee_saved_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.is_callee_saved_powerpc64); /* size 0x208 */
	. = ALIGN(0x8); /* align for .rodata.callee_reg_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.callee_reg_size_powerpc64); /* size 0x210 */
	. = ALIGN(0x10); /* align for .rodata.src_arch_powerpc64_properties_c_callee_saved_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_powerpc64_properties_c_callee_saved_powerpc64); /* size 0x4e */
	. = ALIGN(0x10); /* align for .rodata.src_arch_powerpc64_properties_c_callee_saved_size_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_powerpc64_properties_c_callee_saved_size_powerpc64); /* size 0x4c */
	. = ALIGN(0x8); /* align for .rodata.properties_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.properties_powerpc64); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_powerpc64_properties__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_powerpc64_properties__str__src_arch_); /* size 0x56 */
	. = ALIGN(0x8); /* align for .rodata.reg_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.reg_powerpc64); /* size 0x218 */
	. = ALIGN(0x8); /* align for .rodata.regs_powerpc64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.regs_powerpc64); /* size 0xa8 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_powerpc64_regs__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_powerpc64_regs__str__src_arch_); /* size 0x50 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_powerpc64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_powerpc64_regs__str_1__src_arch_); /* size 0x50 */
	. = ALIGN(0x2); /* align for .rodata.src_arch_x86_64_properties_c_callee_saved_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_x86_64_properties_c_callee_saved_x86_64); /* size 0xe */
	. = ALIGN(0x2); /* align for .rodata.src_arch_x86_64_properties_c_callee_saved_size_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_x86_64_properties_c_callee_saved_size_x86_64); /* size 0xe */
	. = ALIGN(0x8); /* align for .rodata.properties_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.properties_x86_64); /* size 0x38 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_properties__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(properties.o)"(.rodata.src_arch_x86_64_properties__str__src_arch_); /* size 0x4f */
	. = ALIGN(0x8); /* align for .rodata.reg_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.reg_x86_64); /* size 0x108 */
	. = ALIGN(0x8); /* align for .rodata.regs_x86_64 */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.regs_x86_64); /* size 0xa8 */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str__src_arch_); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str_1__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str_1__src_arch_); /* size 0x4b */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str_2__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str_2__src_arch_); /* size 0x4a */
	. = ALIGN(0x1); /* align for .rodata.src_arch_x86_64_regs__str_3__src_arch_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(regs.o)"(.rodata.src_arch_x86_64_regs__str_3__src_arch_); /* size 0x4a */
	. = ALIGN(0x8); /* align for .rodata.put_val_arch */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.put_val_arch); /* size 0xb0 */
	. = ALIGN(0x8); /* align for .rodata.points_to_stack */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.points_to_stack); /* size 0x28 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str__src_data_); /* size 0x50 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_1__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_1__src_data_); /* size 0x3d */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_2__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_2__src_data_); /* size 0x30 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_3__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_3__src_data_); /* size 0x49 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_4__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_4__src_data_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_5__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_5__src_data_); /* size 0x3d */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_6__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_6__src_data_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_7__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_7__src_data_); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_8__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_8__src_data_); /* size 0x37 */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_9__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_9__src_data_); /* size 0x3f */
	. = ALIGN(0x1); /* align for .rodata.src_data__str_10__src_data_ */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(data.o)"(.rodata.src_data__str_10__src_data_); /* size 0x3f */
	. = ALIGN(0x8); /* align for .rodata.elf_begin */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.elf_begin); /* size 0x40 */
	. = ALIGN(0x8); /* align for .rodata.begin_c__elf_init */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin_c__elf_init); /* size 0xe0 */
	. = ALIGN(0x1); /* align for .rodata.begin_c_fmag */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin_c_fmag); /* size 0x3 */
	. = ALIGN(0x1); /* align for .rodata.begin__str__ELF_ */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin__str__ELF_); /* size 0x5 */
	. = ALIGN(0x1); /* align for .rodata.begin__str_1___arch___ */
	"/usr/local/popcorn/aarch64/lib/libelf.a(begin.o)"(.rodata.begin__str_1___arch___); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.version__str_LIBELF_SAN */
	"/usr/local/popcorn/aarch64/lib/libelf.a(version.o)"(.rodata.version__str_LIBELF_SAN); /* size 0x15 */
	. = ALIGN(0x10); /* align for .rodata.32_xlatetof_c_xlate32_11 */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.xlatetof.o)"(.rodata.32_xlatetof_c_xlate32_11); /* size 0x220 */
	. = ALIGN(0x8); /* align for .rodata._elf_scn_type */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_scn_type); /* size 0x88 */
	. = ALIGN(0x8); /* align for .rodata._elf_cook */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_cook); /* size 0x110 */
	. = ALIGN(0x8); /* align for .rodata._elf_scn_init */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_scn_init); /* size 0xa0 */
	. = ALIGN(0x8); /* align for .rodata._elf_data_init */
	"/usr/local/popcorn/aarch64/lib/libelf.a(cook.o)"(.rodata._elf_data_init); /* size 0x58 */
	. = ALIGN(0x10); /* align for .rodata.64_xlatetof_c_xlate64_11 */
	"/usr/local/popcorn/aarch64/lib/libelf.a(64.xlatetof.o)"(.rodata.64_xlatetof_c_xlate64_11); /* size 0x220 */
	. = ALIGN(0x10); /* align for .rodata._elf_fmsize */
	"/usr/local/popcorn/aarch64/lib/libelf.a(32.fsize.o)"(.rodata._elf_fmsize); /* size 0x220 */
	. = ALIGN(0x1); /* align for .rodata.src_exit_assert__str_Assertion_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(assert.o)"(.rodata.src_exit_assert__str_Assertion_); /* size 0x23 */
	. = ALIGN(0x8); /* align for .rodata.stderr */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.rodata.stderr); /* size 0x8 */
	. = ALIGN(0x8); /* align for .rodata.vfscanf */
	"/usr/local/popcorn/aarch64/lib/libc.a(vfscanf.o)"(.rodata.vfscanf); /* size 0x338 */
	. = ALIGN(0x1); /* align for .rodata.src_internal_floatscan__str_infinity_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan__str_infinity_); /* size 0x9 */
	. = ALIGN(0x1); /* align for .rodata.src_internal_floatscan__str_1_nan_ */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan__str_1_nan_); /* size 0x4 */
	. = ALIGN(0x4); /* align for .rodata.src_internal_floatscan_c_decfloat_th */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan_c_decfloat_th); /* size 0x10 */
	. = ALIGN(0x10); /* align for .rodata.src_internal_floatscan_c_decfloat_p10s */
	"/usr/local/popcorn/aarch64/lib/libc.a(floatscan.o)"(.rodata.src_internal_floatscan_c_decfloat_p10s); /* size 0x20 */
	. = . + 0xd; /* padding after .rodata.src_core_ngx_cpuinfo__str_GenuineInt */
	. = . + 0xd; /* padding after .rodata.src_core_ngx_cpuinfo__str_1_AuthenticA */
	. = . + 0x6; /* padding before .rodata.src_arch_x86_64_regs_switch_table_ */
	. = . + 0x42; /* padding after .rodata.src_arch_x86_64_regs_switch_table_ */
	*(.rodata);
}
  
  .rodata1        : { *(.rodata1) }
  .eh_frame       : ONLY_IF_RO { KEEP (*(.eh_frame)) }
  
.data	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .data.src_core_nginx_c_ngx_core_module_ctx */
	"objs/arm_objs/src/core/nginx.o"(.data.src_core_nginx_c_ngx_core_module_ctx); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_nginx_c_ngx_core_commands */
	"objs/arm_objs/src/core/nginx.o"(.data.src_core_nginx_c_ngx_core_commands); /* size 0x380 */
	. = ALIGN(0x8); /* align for .data.ngx_core_module */
	"objs/arm_objs/src/core/nginx.o"(.data.ngx_core_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_core_nginx_c_ngx_debug_points */
	"objs/arm_objs/src/core/nginx.o"(.data.src_core_nginx_c_ngx_debug_points); /* size 0x48 */
	. = ALIGN(0x8); /* align for .data.src_core_ngx_log_c_ngx_errlog_module_ctx */
	"objs/arm_objs/src/core/ngx_log.o"(.data.src_core_ngx_log_c_ngx_errlog_module_ctx); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_log_c_ngx_errlog_commands */
	"objs/arm_objs/src/core/ngx_log.o"(.data.src_core_ngx_log_c_ngx_errlog_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.ngx_errlog_module */
	"objs/arm_objs/src/core/ngx_log.o"(.data.ngx_errlog_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.ngx_use_stderr */
	"objs/arm_objs/src/core/ngx_log.o"(.data.ngx_use_stderr); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_log_c_err_levels */
	"objs/arm_objs/src/core/ngx_log.o"(.data.src_core_ngx_log_c_err_levels); /* size 0x90 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_log_c_debug_levels */
	"objs/arm_objs/src/core/ngx_log.o"(.data.src_core_ngx_log_c_debug_levels); /* size 0x38 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_hex_dump_hex */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_hex_dump_hex); /* size 0x11 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_encode_base64_basis64 */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_encode_base64_basis64); /* size 0x41 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_decode_base64_basis64 */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_decode_base64_basis64); /* size 0x100 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_decode_base64url_basis64 */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_decode_base64url_basis64); /* size 0x100 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_hex */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_hex); /* size 0x11 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_uri */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_uri); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_args */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_args); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_uri_component */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_uri_component); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_html */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_html); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_refresh */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_refresh); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_memcached */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_memcached); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_escape_uri_map */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_escape_uri_map); /* size 0x38 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_sprintf_num_hex */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_sprintf_num_hex); /* size 0x11 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_string_c_ngx_sprintf_num_HEX */
	"objs/arm_objs/src/core/ngx_string.o"(.data.src_core_ngx_string_c_ngx_sprintf_num_HEX); /* size 0x11 */
	. = ALIGN(0x8); /* align for .data.ngx_temp_number */
	"objs/arm_objs/src/core/ngx_file.o"(.data.ngx_temp_number); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.ngx_random_number */
	"objs/arm_objs/src/core/ngx_file.o"(.data.ngx_random_number); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.ngx_crc32_table256 */
	"objs/arm_objs/src/core/ngx_crc32.o"(.data.ngx_crc32_table256); /* size 0x400 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_crc32_c_ngx_crc32_table16 */
	"objs/arm_objs/src/core/ngx_crc32.o"(.data.src_core_ngx_crc32_c_ngx_crc32_table16); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_crc32_table_short */
	"objs/arm_objs/src/core/ngx_crc32.o"(.data.ngx_crc32_table_short); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_times_c_week */
	"objs/arm_objs/src/core/ngx_times.o"(.data.src_core_ngx_times_c_week); /* size 0x38 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_times_c_months */
	"objs/arm_objs/src/core/ngx_times.o"(.data.src_core_ngx_times_c_months); /* size 0x60 */
	. = ALIGN(0x8); /* align for .data.src_core_ngx_cycle_c_error_log */
	"objs/arm_objs/src/core/ngx_cycle.o"(.data.src_core_ngx_cycle_c_error_log); /* size 0x10 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_conf_file_c_ngx_conf_commands */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.data.src_core_ngx_conf_file_c_ngx_conf_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.ngx_conf_module */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.data.ngx_conf_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_conf_file_c_argument_number */
	"objs/arm_objs/src/core/ngx_conf_file.o"(.data.src_core_ngx_conf_file_c_argument_number); /* size 0x40 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_resolver_c_ngx_resolver_strerror_errors */
	"objs/arm_objs/src/core/ngx_resolver.o"(.data.src_core_ngx_resolver_c_ngx_resolver_strerror_errors); /* size 0x28 */
	. = ALIGN(0x10); /* align for .data.src_core_ngx_crypt_c_ngx_crypt_to64_itoa64 */
	"objs/arm_objs/src/core/ngx_crypt.o"(.data.src_core_ngx_crypt_c_ngx_crypt_to64_itoa64); /* size 0x41 */
	. = ALIGN(0x8); /* align for .data.src_event_ngx_event_c_connection_counter */
	"objs/arm_objs/src/event/ngx_event.o"(.data.src_event_ngx_event_c_connection_counter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.ngx_connection_counter */
	"objs/arm_objs/src/event/ngx_event.o"(.data.ngx_connection_counter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_event_ngx_event_c_ngx_events_module_ctx */
	"objs/arm_objs/src/event/ngx_event.o"(.data.src_event_ngx_event_c_ngx_events_module_ctx); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_event_ngx_event_c_ngx_events_commands */
	"objs/arm_objs/src/event/ngx_event.o"(.data.src_event_ngx_event_c_ngx_events_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.ngx_events_module */
	"objs/arm_objs/src/event/ngx_event.o"(.data.ngx_events_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_event_ngx_event_c_event_core_name */
	"objs/arm_objs/src/event/ngx_event.o"(.data.src_event_ngx_event_c_event_core_name); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.ngx_event_core_module_ctx */
	"objs/arm_objs/src/event/ngx_event.o"(.data.ngx_event_core_module_ctx); /* size 0x68 */
	. = ALIGN(0x10); /* align for .data.src_event_ngx_event_c_ngx_event_core_commands */
	"objs/arm_objs/src/event/ngx_event.o"(.data.src_event_ngx_event_c_ngx_event_core_commands); /* size 0x1c0 */
	. = ALIGN(0x8); /* align for .data.ngx_event_core_module */
	"objs/arm_objs/src/event/ngx_event.o"(.data.ngx_event_core_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_event_ngx_event_accept_c_ngx_event_accept_use_accept4 */
	"objs/arm_objs/src/event/ngx_event_accept.o"(.data.src_event_ngx_event_accept_c_ngx_event_accept_use_accept4); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_os_unix_ngx_errno_c_ngx_unknown_error */
	"objs/arm_objs/src/os/unix/ngx_errno.o"(.data.src_os_unix_ngx_errno_c_ngx_unknown_error); /* size 0x10 */
	. = ALIGN(0x10); /* align for .data.signals */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.data.signals); /* size 0x1a0 */
	. = ALIGN(0x8); /* align for .data.ngx_os_io */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.data.ngx_os_io); /* size 0x30 */
	. = ALIGN(0x1); /* align for .data.src_os_unix_ngx_process_cycle_c_master_process */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.data.src_os_unix_ngx_process_cycle_c_master_process); /* size 0xf */
	. = ALIGN(0x8); /* align for .data.src_os_unix_ngx_process_cycle_c_ngx_cache_manager_ctx */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.data.src_os_unix_ngx_process_cycle_c_ngx_cache_manager_ctx); /* size 0x18 */
	. = ALIGN(0x8); /* align for .data.src_os_unix_ngx_process_cycle_c_ngx_cache_loader_ctx */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.data.src_os_unix_ngx_process_cycle_c_ngx_cache_loader_ctx); /* size 0x18 */
	. = ALIGN(0x8); /* align for .data.src_os_unix_ngx_linux_init_c_ngx_linux_io */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.data.src_os_unix_ngx_linux_init_c_ngx_linux_io); /* size 0x30 */
	. = ALIGN(0x8); /* align for .data.src_event_modules_ngx_epoll_module_c_epoll_name */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.data.src_event_modules_ngx_epoll_module_c_epoll_name); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.ngx_epoll_module_ctx */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.data.ngx_epoll_module_ctx); /* size 0x68 */
	. = ALIGN(0x10); /* align for .data.src_event_modules_ngx_epoll_module_c_ngx_epoll_commands */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.data.src_event_modules_ngx_epoll_module_c_ngx_epoll_commands); /* size 0xa8 */
	. = ALIGN(0x8); /* align for .data.ngx_epoll_module */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.data.ngx_epoll_module); /* size 0xc8 */
	. = ALIGN(0x4); /* align for .data.src_event_modules_ngx_epoll_module_c_ep */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.data.src_event_modules_ngx_epoll_module_c_ep); /* size 0x4 */
	. = ALIGN(0x10); /* align for .data.ngx_http_html_default_types */
	"objs/arm_objs/src/http/ngx_http.o"(.data.ngx_http_html_default_types); /* size 0x20 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_c_ngx_http_module_ctx */
	"objs/arm_objs/src/http/ngx_http.o"(.data.src_http_ngx_http_c_ngx_http_module_ctx); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_c_ngx_http_commands */
	"objs/arm_objs/src/http/ngx_http.o"(.data.src_http_ngx_http_c_ngx_http_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.ngx_http_module */
	"objs/arm_objs/src/http/ngx_http.o"(.data.ngx_http_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_module_ctx */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_core_module */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.ngx_http_core_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.ngx_http_core_get_method */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.ngx_http_core_get_method); /* size 0x10 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_default_types */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_default_types); /* size 0x80 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_client_temp_path */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_client_temp_path); /* size 0x28 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_text_html_type */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_text_html_type); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_image_gif_type */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_image_gif_type); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_image_jpeg_type */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_image_jpeg_type); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_pool_size_p */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_pool_size_p); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_conf_deprecated_optimize_server_names */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_conf_deprecated_optimize_server_names); /* size 0x18 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_request_body_in_file */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_request_body_in_file); /* size 0x60 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_lowat_post */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_lowat_post); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_keepalive_disable */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_keepalive_disable); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_satisfy */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_satisfy); /* size 0x48 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_conf_deprecated_satisfy_any */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_conf_deprecated_satisfy_any); /* size 0x18 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_lingering_close */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_lingering_close); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_if_modified_since */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_if_modified_since); /* size 0x60 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_core_module_c_ngx_conf_deprecated_open_file_cache_retest */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_conf_deprecated_open_file_cache_retest); /* size 0x18 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_http_core_commands */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_http_core_commands); /* size 0x10d8 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_core_module_c_ngx_methods_names */
	"objs/arm_objs/src/http/ngx_http_core_module.o"(.data.src_http_ngx_http_core_module_c_ngx_methods_names); /* size 0xf0 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_get_name */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_get_name); /* size 0x10 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_full_tail */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_full_tail); /* size 0x35 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_tail */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_tail); /* size 0x2f */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_pages */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_pages); /* size 0x270 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_msie_padding */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_msie_padding); /* size 0x193 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_301_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_301_page); /* size 0x85 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_302_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_302_page); /* size 0x6d */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_303_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_303_page); /* size 0x75 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_307_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_307_page); /* size 0x87 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_400_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_400_page); /* size 0x79 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_401_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_401_page); /* size 0x8f */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_402_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_402_page); /* size 0x83 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_403_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_403_page); /* size 0x75 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_404_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_404_page); /* size 0x75 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_405_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_405_page); /* size 0x79 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_406_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_406_page); /* size 0x7f */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_408_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_408_page); /* size 0x83 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_409_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_409_page); /* size 0x73 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_410_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_410_page); /* size 0x6b */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_411_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_411_page); /* size 0x81 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_412_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_412_page); /* size 0x89 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_413_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_413_page); /* size 0x93 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_414_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_414_page); /* size 0x8d */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_415_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_415_page); /* size 0x8f */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_416_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_416_page); /* size 0xa1 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_494_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_494_page); /* size 0xc5 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_495_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_495_page); /* size 0xb3 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_496_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_496_page); /* size 0xc9 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_497_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_497_page); /* size 0xdb */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_500_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_500_page); /* size 0x8d */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_501_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_501_page); /* size 0x81 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_502_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_502_page); /* size 0x79 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_503_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_503_page); /* size 0xa1 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_504_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_504_page); /* size 0x83 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_error_507_page */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_error_507_page); /* size 0x8b */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_msie_refresh_head */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_msie_refresh_head); /* size 0x38 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_special_response_c_ngx_http_msie_refresh_tail */
	"objs/arm_objs/src/http/ngx_http_special_response.o"(.data.src_http_ngx_http_special_response_c_ngx_http_msie_refresh_tail); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.ngx_http_headers_in */
	"objs/arm_objs/src/http/ngx_http_request.o"(.data.ngx_http_headers_in); /* size 0x260 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_request_c_ngx_http_client_errors */
	"objs/arm_objs/src/http/ngx_http_request.o"(.data.src_http_ngx_http_request_c_ngx_http_client_errors); /* size 0x18 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_parse_c_usual */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.data.src_http_ngx_http_parse_c_usual); /* size 0x20 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_parse_c_ngx_http_parse_header_line_lowcase */
	"objs/arm_objs/src/http/ngx_http_parse.o"(.data.src_http_ngx_http_parse_c_ngx_http_parse_header_line_lowcase); /* size 0x100 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_header_filter_module_c_ngx_http_header_filter_module_ctx */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.data.src_http_ngx_http_header_filter_module_c_ngx_http_header_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_header_filter_module */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.data.ngx_http_header_filter_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.ngx_http_headers_out */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.data.ngx_http_headers_out); /* size 0x108 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_header_filter_module_c_ngx_http_status_lines */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.data.src_http_ngx_http_header_filter_module_c_ngx_http_status_lines); /* size 0x270 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_header_filter_module_c_ngx_http_server_full_string */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.data.src_http_ngx_http_header_filter_module_c_ngx_http_server_full_string); /* size 0x16 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_header_filter_module_c_ngx_http_server_string */
	"objs/arm_objs/src/http/ngx_http_header_filter_module.o"(.data.src_http_ngx_http_header_filter_module_c_ngx_http_server_string); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_write_filter_module_c_ngx_http_write_filter_module_ctx */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.data.src_http_ngx_http_write_filter_module_c_ngx_http_write_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_write_filter_module */
	"objs/arm_objs/src/http/ngx_http_write_filter_module.o"(.data.ngx_http_write_filter_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_copy_filter_module_c_ngx_http_copy_filter_module_ctx */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.data.src_http_ngx_http_copy_filter_module_c_ngx_http_copy_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_copy_filter_module */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.data.ngx_http_copy_filter_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_copy_filter_module_c_ngx_http_copy_filter_commands */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.data.src_http_ngx_http_copy_filter_module_c_ngx_http_copy_filter_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_log_module_c_ngx_http_log_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.src_http_modules_ngx_http_log_module_c_ngx_http_log_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_log_module */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.ngx_http_log_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_log_module_c_ngx_http_combined_fmt */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.src_http_modules_ngx_http_log_module_c_ngx_http_combined_fmt); /* size 0x10 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_log_module_c_ngx_http_log_vars */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.src_http_modules_ngx_http_log_module_c_ngx_http_log_vars); /* size 0x140 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_log_module_c_ngx_http_log_escape_hex */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.src_http_modules_ngx_http_log_module_c_ngx_http_log_escape_hex); /* size 0x11 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_log_module_c_ngx_http_log_escape_escape */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.src_http_modules_ngx_http_log_module_c_ngx_http_log_escape_escape); /* size 0x20 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_log_module_c_ngx_http_access_log */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.src_http_modules_ngx_http_log_module_c_ngx_http_access_log); /* size 0x10 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_log_module_c_ngx_http_log_commands */
	"objs/arm_objs/src/http/modules/ngx_http_log_module.o"(.data.src_http_modules_ngx_http_log_module_c_ngx_http_log_commands); /* size 0xe0 */
	. = ALIGN(0x8); /* align for .data.ngx_http_variable_null_value */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.data.ngx_http_variable_null_value); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.ngx_http_variable_true_value */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.data.ngx_http_variable_true_value); /* size 0x10 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_variables_c_ngx_http_core_variables */
	"objs/arm_objs/src/http/ngx_http_variables.o"(.data.src_http_ngx_http_variables_c_ngx_http_core_variables); /* size 0xc40 */
	. = ALIGN(0x10); /* align for .data.ngx_http_upstream_headers_in */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.ngx_http_upstream_headers_in); /* size 0x578 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_upstream_c_ngx_http_upstream_module_ctx */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.src_http_ngx_http_upstream_c_ngx_http_upstream_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_upstream_module */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.ngx_http_upstream_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.ngx_http_upstream_cache_method_mask */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.ngx_http_upstream_cache_method_mask); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.ngx_http_upstream_ignore_headers_masks */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.ngx_http_upstream_ignore_headers_masks); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_upstream_c_ngx_http_upstream_vars */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.src_http_ngx_http_upstream_c_ngx_http_upstream_vars); /* size 0x150 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_upstream_c_ngx_http_upstream_commands */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.src_http_ngx_http_upstream_c_ngx_http_upstream_commands); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_upstream_c_ngx_http_upstream_next_errors */
	"objs/arm_objs/src/http/ngx_http_upstream.o"(.data.src_http_ngx_http_upstream_c_ngx_http_upstream_next_errors); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_parse_time_c_mday */
	"objs/arm_objs/src/http/ngx_http_parse_time.o"(.data.src_http_ngx_http_parse_time_c_mday); /* size 0x60 */
	. = ALIGN(0x8); /* align for .data.ngx_http_static_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_static_module.o"(.data.ngx_http_static_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_static_module */
	"objs/arm_objs/src/http/modules/ngx_http_static_module.o"(.data.ngx_http_static_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_index_module_c_ngx_http_index_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.data.src_http_modules_ngx_http_index_module_c_ngx_http_index_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_index_module */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.data.ngx_http_index_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_index_module_c_ngx_http_index_commands */
	"objs/arm_objs/src/http/modules/ngx_http_index_module.o"(.data.src_http_modules_ngx_http_index_module_c_ngx_http_index_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_chunked_filter_module_c_ngx_http_chunked_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.data.src_http_modules_ngx_http_chunked_filter_module_c_ngx_http_chunked_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_chunked_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.data.ngx_http_chunked_filter_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_range_filter_module_c_ngx_http_range_header_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.data.src_http_modules_ngx_http_range_filter_module_c_ngx_http_range_header_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_range_header_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.data.ngx_http_range_header_filter_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_range_filter_module_c_ngx_http_range_body_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.data.src_http_modules_ngx_http_range_filter_module_c_ngx_http_range_body_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_range_body_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.data.ngx_http_range_body_filter_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_headers_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.data.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_headers_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_headers_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.data.ngx_http_headers_filter_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_headers_filter_commands */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.data.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_headers_filter_commands); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_set_headers */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.data.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_set_headers); /* size 0x80 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_not_modified_filter_module_c_ngx_http_not_modified_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.data.src_http_modules_ngx_http_not_modified_filter_module_c_ngx_http_not_modified_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_not_modified_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.data.ngx_http_not_modified_filter_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.ngx_http_cache_status */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.data.ngx_http_cache_status); /* size 0x60 */
	. = ALIGN(0x1); /* align for .data.src_http_ngx_http_file_cache_c_ngx_http_file_cache_key */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.data.src_http_ngx_http_file_cache_c_ngx_http_file_cache_key); /* size 0x6 */
	. = ALIGN(0x10); /* align for .data.src_http_ngx_http_file_cache_c_ngx_http_file_cache_valid_set_slot_statuses */
	"objs/arm_objs/src/http/ngx_http_file_cache.o"(.data.src_http_ngx_http_file_cache_c_ngx_http_file_cache_valid_set_slot_statuses); /* size 0x18 */
	. = ALIGN(0x8); /* align for .data.src_http_ngx_http_postpone_filter_module_c_ngx_http_postpone_filter_module_ctx */
	"objs/arm_objs/src/http/ngx_http_postpone_filter_module.o"(.data.src_http_ngx_http_postpone_filter_module_c_ngx_http_postpone_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_postpone_filter_module */
	"objs/arm_objs/src/http/ngx_http_postpone_filter_module.o"(.data.ngx_http_postpone_filter_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_ssi_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.ngx_http_ssi_filter_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_vars */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_vars); /* size 0xa8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_commands */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_commands); /* size 0x1b8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_include_params */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_include_params); /* size 0xc0 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_echo_params */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_echo_params); /* size 0x80 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_config_params */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_config_params); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_set_params */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_set_params); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_if_params */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_if_params); /* size 0x40 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_block_params */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_block_params); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_none */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_none); /* size 0x10 */
	. = ALIGN(0x1); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_string */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_string); /* size 0x5 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_filter_commands */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.data.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_filter_commands); /* size 0x188 */
	. = ALIGN(0x10); /* align for .data.ngx_http_charset_default_types */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.data.ngx_http_charset_default_types); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_charset_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.data.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_charset_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_charset_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.data.ngx_http_charset_filter_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_charset_filter_commands */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.data.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_charset_filter_commands); /* size 0x150 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_filter_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_filter_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_userid_filter_module */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.ngx_http_userid_filter_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_got */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_got); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_set */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_set); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_reset */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_reset); /* size 0x10 */
	. = ALIGN(0x4); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_sequencer_v1 */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_sequencer_v1); /* size 0x4 */
	. = ALIGN(0x4); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_sequencer_v2 */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_sequencer_v2); /* size 0x4 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_expires */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_expires); /* size 0x26 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_state */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_state); /* size 0x78 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_domain_p */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_domain_p); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_path_p */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_path_p); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_p3p_p */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_p3p_p); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_commands */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.data.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_commands); /* size 0x1f8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_autoindex_module_c_ngx_http_autoindex_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.data.src_http_modules_ngx_http_autoindex_module_c_ngx_http_autoindex_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_autoindex_module */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.data.ngx_http_autoindex_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_autoindex_module_c_ngx_http_autoindex_handler_months */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.data.src_http_modules_ngx_http_autoindex_module_c_ngx_http_autoindex_handler_months); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_autoindex_module_c_title */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.data.src_http_modules_ngx_http_autoindex_module_c_title); /* size 0x1f */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_autoindex_module_c_header */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.data.src_http_modules_ngx_http_autoindex_module_c_header); /* size 0x37 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_autoindex_module_c_tail */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.data.src_http_modules_ngx_http_autoindex_module_c_tail); /* size 0x13 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_autoindex_module_c_ngx_http_autoindex_commands */
	"objs/arm_objs/src/http/modules/ngx_http_autoindex_module.o"(.data.src_http_modules_ngx_http_autoindex_module_c_ngx_http_autoindex_commands); /* size 0xe0 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_auth_basic_module_c_ngx_http_auth_basic_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.data.src_http_modules_ngx_http_auth_basic_module_c_ngx_http_auth_basic_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_auth_basic_module */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.data.ngx_http_auth_basic_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_auth_basic_module_c_ngx_http_auth_basic_p */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.data.src_http_modules_ngx_http_auth_basic_module_c_ngx_http_auth_basic_p); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_auth_basic_module_c_ngx_http_auth_basic_commands */
	"objs/arm_objs/src/http/modules/ngx_http_auth_basic_module.o"(.data.src_http_modules_ngx_http_auth_basic_module_c_ngx_http_auth_basic_commands); /* size 0xa8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_access_module_c_ngx_http_access_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.data.src_http_modules_ngx_http_access_module_c_ngx_http_access_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_access_module */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.data.ngx_http_access_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_access_module_c_ngx_http_access_commands */
	"objs/arm_objs/src/http/modules/ngx_http_access_module.o"(.data.src_http_modules_ngx_http_access_module_c_ngx_http_access_commands); /* size 0xa8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_limit_conn_module_c_ngx_http_limit_conn_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.data.src_http_modules_ngx_http_limit_conn_module_c_ngx_http_limit_conn_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_limit_conn_module */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.data.ngx_http_limit_conn_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_limit_conn_module_c_ngx_http_limit_conn_log_levels */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.data.src_http_modules_ngx_http_limit_conn_module_c_ngx_http_limit_conn_log_levels); /* size 0x78 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_limit_conn_module_c_ngx_http_limit_conn_commands */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.data.src_http_modules_ngx_http_limit_conn_module_c_ngx_http_limit_conn_commands); /* size 0x118 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_limit_conn_module_c_ngx_conf_deprecated_limit_zone */
	"objs/arm_objs/src/http/modules/ngx_http_limit_conn_module.o"(.data.src_http_modules_ngx_http_limit_conn_module_c_ngx_conf_deprecated_limit_zone); /* size 0x18 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_limit_req_module_c_ngx_http_limit_req_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.data.src_http_modules_ngx_http_limit_req_module_c_ngx_http_limit_req_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_limit_req_module */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.data.ngx_http_limit_req_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_limit_req_module_c_ngx_http_limit_req_log_levels */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.data.src_http_modules_ngx_http_limit_req_module_c_ngx_http_limit_req_log_levels); /* size 0x78 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_limit_req_module_c_ngx_http_limit_req_commands */
	"objs/arm_objs/src/http/modules/ngx_http_limit_req_module.o"(.data.src_http_modules_ngx_http_limit_req_module_c_ngx_http_limit_req_commands); /* size 0xe0 */
	. = ALIGN(0x8); /* align for .data.ngx_http_geo_module */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.data.ngx_http_geo_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_geo_module_c_ngx_http_geo_commands */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.data.src_http_modules_ngx_http_geo_module_c_ngx_http_geo_commands); /* size 0x70 */
	. = ALIGN(0x4); /* align for .data.src_http_modules_ngx_http_geo_module_c_ngx_http_geo_header */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.data.src_http_modules_ngx_http_geo_module_c_ngx_http_geo_header); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_map_module_c_ngx_http_map_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.data.src_http_modules_ngx_http_map_module_c_ngx_http_map_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_map_module */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.data.ngx_http_map_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_map_module_c_ngx_http_map_commands */
	"objs/arm_objs/src/http/modules/ngx_http_map_module.o"(.data.src_http_modules_ngx_http_map_module_c_ngx_http_map_commands); /* size 0xe0 */
	. = ALIGN(0x8); /* align for .data.ngx_http_split_clients_module */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.data.ngx_http_split_clients_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_split_clients_module_c_ngx_http_split_clients_commands */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.data.src_http_modules_ngx_http_split_clients_module_c_ngx_http_split_clients_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_referer_module_c_ngx_http_referer_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.data.src_http_modules_ngx_http_referer_module_c_ngx_http_referer_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_referer_module */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.data.ngx_http_referer_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_referer_module_c_ngx_http_referer_commands */
	"objs/arm_objs/src/http/modules/ngx_http_referer_module.o"(.data.src_http_modules_ngx_http_referer_module_c_ngx_http_referer_commands); /* size 0xe0 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_proxy_module */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.ngx_http_proxy_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_vars */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_vars); /* size 0x118 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_temp_path */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_temp_path); /* size 0x28 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_hide_headers */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_hide_headers); /* size 0x90 */
	. = ALIGN(0x1); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_version_11 */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_version_11); /* size 0xc */
	. = ALIGN(0x1); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_version */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_version); /* size 0xc */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_cache_headers */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_cache_headers); /* size 0x1c0 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_headers */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_headers); /* size 0x100 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_lowat_post */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_lowat_post); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_next_upstream_masks */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_next_upstream_masks); /* size 0x108 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_http_version */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_http_version); /* size 0x48 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_commands */
	"objs/arm_objs/src/http/modules/ngx_http_proxy_module.o"(.data.src_http_modules_ngx_http_proxy_module_c_ngx_http_proxy_commands); /* size 0x9a0 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_fastcgi_module */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.ngx_http_fastcgi_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_vars */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_vars); /* size 0xa8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_temp_path */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_temp_path); /* size 0x28 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_hide_headers */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_hide_headers); /* size 0x70 */
	. = ALIGN(0x1); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_request_start */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_request_start); /* size 0x14 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_cache_headers */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_cache_headers); /* size 0xe0 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_lowat_post */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_lowat_post); /* size 0x8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_next_upstream_masks */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_next_upstream_masks); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_commands */
	"objs/arm_objs/src/http/modules/ngx_http_fastcgi_module.o"(.data.src_http_modules_ngx_http_fastcgi_module_c_ngx_http_fastcgi_commands); /* size 0x888 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_uwsgi_module */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.ngx_http_uwsgi_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_temp_path */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_temp_path); /* size 0x28 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_hide_headers */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_hide_headers); /* size 0x60 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_cache_headers */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_cache_headers); /* size 0xe0 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_modifier_bounds */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_modifier_bounds); /* size 0x18 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_next_upstream_masks */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_next_upstream_masks); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_commands */
	"objs/arm_objs/src/http/modules/ngx_http_uwsgi_module.o"(.data.src_http_modules_ngx_http_uwsgi_module_c_ngx_http_uwsgi_commands); /* size 0x850 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_scgi_module */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.data.ngx_http_scgi_module); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_temp_path */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_temp_path); /* size 0x28 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_hide_headers */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_hide_headers); /* size 0x70 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_cache_headers */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_cache_headers); /* size 0xe0 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_next_upstream_masks */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_next_upstream_masks); /* size 0xd8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_commands */
	"objs/arm_objs/src/http/modules/ngx_http_scgi_module.o"(.data.src_http_modules_ngx_http_scgi_module_c_ngx_http_scgi_commands); /* size 0x7a8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_memcached_module */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.data.ngx_http_memcached_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_next_upstream_masks */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_next_upstream_masks); /* size 0x90 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_commands */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_commands); /* size 0x1f8 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_key */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_key); /* size 0x10 */
	. = ALIGN(0x1); /* align for .data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_end */
	"objs/arm_objs/src/http/modules/ngx_http_memcached_module.o"(.data.src_http_modules_ngx_http_memcached_module_c_ngx_http_memcached_end); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.ngx_http_empty_gif_module */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.data.ngx_http_empty_gif_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_empty_gif_module_c_ngx_http_empty_gif_commands */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.data.src_http_modules_ngx_http_empty_gif_module_c_ngx_http_empty_gif_commands); /* size 0x70 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_empty_gif_module_c_ngx_empty_gif */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.data.src_http_modules_ngx_http_empty_gif_module_c_ngx_empty_gif); /* size 0x2b */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_empty_gif_module_c_ngx_http_gif_type */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.data.src_http_modules_ngx_http_empty_gif_module_c_ngx_http_gif_type); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_browser_module_c_ngx_http_browser_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.data.src_http_modules_ngx_http_browser_module_c_ngx_http_browser_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_browser_module */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.data.ngx_http_browser_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_browser_module_c_ngx_http_browsers */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.data.src_http_modules_ngx_http_browser_module_c_ngx_http_browsers); /* size 0x80 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_browser_module_c_ngx_http_modern_browser_masks */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.data.src_http_modules_ngx_http_browser_module_c_ngx_http_modern_browser_masks); /* size 0x120 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_browser_module_c_ngx_http_browser_commands */
	"objs/arm_objs/src/http/modules/ngx_http_browser_module.o"(.data.src_http_modules_ngx_http_browser_module_c_ngx_http_browser_commands); /* size 0x118 */
	. = ALIGN(0x8); /* align for .data.ngx_http_upstream_ip_hash_module */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.data.ngx_http_upstream_ip_hash_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_upstream_ip_hash_module_c_ngx_http_upstream_ip_hash_commands */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.data.src_http_modules_ngx_http_upstream_ip_hash_module_c_ngx_http_upstream_ip_hash_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_upstream_least_conn_module_c_ngx_http_upstream_least_conn_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.data.src_http_modules_ngx_http_upstream_least_conn_module_c_ngx_http_upstream_least_conn_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_upstream_least_conn_module */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.data.ngx_http_upstream_least_conn_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_upstream_least_conn_module_c_ngx_http_upstream_least_conn_commands */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_least_conn_module.o"(.data.src_http_modules_ngx_http_upstream_least_conn_module_c_ngx_http_upstream_least_conn_commands); /* size 0x70 */
	. = ALIGN(0x8); /* align for .data.src_http_modules_ngx_http_upstream_keepalive_module_c_ngx_http_upstream_keepalive_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.data.src_http_modules_ngx_http_upstream_keepalive_module_c_ngx_http_upstream_keepalive_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .data.ngx_http_upstream_keepalive_module */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.data.ngx_http_upstream_keepalive_module); /* size 0xc8 */
	. = ALIGN(0x10); /* align for .data.src_http_modules_ngx_http_upstream_keepalive_module_c_ngx_http_upstream_keepalive_commands */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_keepalive_module.o"(.data.src_http_modules_ngx_http_upstream_keepalive_module_c_ngx_http_upstream_keepalive_commands); /* size 0x70 */
	. = ALIGN(0x10); /* align for .data.ngx_modules */
	"objs/arm_objs/ngx_modules.o"(.data.ngx_modules); /* size 0x160 */
	. = ALIGN(0x4); /* align for .data.src_prng_random_c_n */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.data.src_prng_random_c_n); /* size 0x4 */
	. = ALIGN(0x8); /* align for .data.src_prng_random_c_x */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.data.src_prng_random_c_x); /* size 0x8 */
	. = ALIGN(0x4); /* align for .data.src_prng_random_c_i */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.data.src_prng_random_c_i); /* size 0x4 */
	. = ALIGN(0x10); /* align for .data.src_prng_random_c_init */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.data.src_prng_random_c_init); /* size 0x80 */
	. = ALIGN(0x8); /* align for .data.src_time___tz_c_old_tz */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.data.src_time___tz_c_old_tz); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.src_time___tz_c_old_tz_size */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.data.src_time___tz_c_old_tz_size); /* size 0x8 */
	. = ALIGN(0x4); /* align for .data.src_migrate_c_origin_nid */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.data.src_migrate_c_origin_nid); /* size 0x4 */
	. = ALIGN(0x4); /* align for .data._elf_sanity_checks */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.data._elf_sanity_checks); /* size 0x4 */
	. = ALIGN(0x8); /* align for .data.src_stdio_stderr_c_f */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.data.src_stdio_stderr_c_f); /* size 0xe8 */
	. = ALIGN(0x8); /* align for .data.__stderr_used */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.data.__stderr_used); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.rel.ro.local */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.data.rel.ro.local); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.rel.ro.local */
	"/usr/local/popcorn/aarch64/lib/libc.a(exit.o)"(.data.rel.ro.local); /* size 0x10 */
	. = ALIGN(0x8); /* align for .data.rel.ro.local */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.data.rel.ro.local); /* size 0x8 */
	. = ALIGN(0x8); /* align for .data.rel.ro */
	"/usr/local/popcorn/aarch64/lib/crt1.o"(.data.rel.ro); /* size 0x10 */
	*(.data);
}
  
  .data1          : { *(.data1) }
  _edata = .; PROVIDE (edata = .);
/*   . = ALIGN(0x100);   . = .;*/
 
 __bss_start = .;
  __bss_start__ = .;
  
.bss	: ALIGN(0x100000)
{
	. = . + 1;
	. = ALIGN(0x1000);
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_show_version */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_show_version); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_show_help */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_show_help); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_show_configure */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_show_configure); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_prefix */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_prefix); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_max_module */
	"objs/arm_objs/src/core/nginx.o"(.bss.ngx_max_module); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_signal */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_signal); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_os_environ */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_os_environ); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_conf_file */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_conf_file); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_nginx_c_ngx_conf_params */
	"objs/arm_objs/src/core/nginx.o"(.bss.src_core_nginx_c_ngx_conf_params); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_log_c_ngx_log_file */
	"objs/arm_objs/src/core/ngx_log.o"(.bss.src_core_ngx_log_c_ngx_log_file); /* size 0x30 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_log_c_ngx_log */
	"objs/arm_objs/src/core/ngx_log.o"(.bss.src_core_ngx_log_c_ngx_log); /* size 0x30 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_file_c_temp_number */
	"objs/arm_objs/src/core/ngx_file.o"(.bss.src_core_ngx_file_c_temp_number); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_slab_c_ngx_slab_max_size */
	"objs/arm_objs/src/core/ngx_slab.o"(.bss.src_core_ngx_slab_c_ngx_slab_max_size); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_slab_c_ngx_slab_exact_size */
	"objs/arm_objs/src/core/ngx_slab.o"(.bss.src_core_ngx_slab_c_ngx_slab_exact_size); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_slab_c_ngx_slab_exact_shift */
	"objs/arm_objs/src/core/ngx_slab.o"(.bss.src_core_ngx_slab_c_ngx_slab_exact_shift); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_cached_err_log_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.ngx_cached_err_log_time); /* size 0x10 */
	. = ALIGN(0x8); /* align for .bss.ngx_cached_http_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.ngx_cached_http_time); /* size 0x10 */
	. = ALIGN(0x8); /* align for .bss.ngx_cached_http_log_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.ngx_cached_http_log_time); /* size 0x10 */
	. = ALIGN(0x8); /* align for .bss.ngx_cached_http_log_iso8601 */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.ngx_cached_http_log_iso8601); /* size 0x10 */
	. = ALIGN(0x10); /* align for .bss.src_core_ngx_times_c_cached_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_cached_time); /* size 0x600 */
	. = ALIGN(0x8); /* align for .bss.ngx_cached_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.ngx_cached_time); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_times_c_ngx_time_lock */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_ngx_time_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_current_msec */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.ngx_current_msec); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_times_c_slot */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_slot); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_core_ngx_times_c_cached_http_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_cached_http_time); /* size 0x780 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_times_c_cached_gmtoff */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_cached_gmtoff); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_core_ngx_times_c_cached_err_log_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_cached_err_log_time); /* size 0x500 */
	. = ALIGN(0x10); /* align for .bss.src_core_ngx_times_c_cached_http_log_time */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_cached_http_log_time); /* size 0x6c0 */
	. = ALIGN(0x10); /* align for .bss.src_core_ngx_times_c_cached_http_log_iso8601 */
	"objs/arm_objs/src/core/ngx_times.o"(.bss.src_core_ngx_times_c_cached_http_log_iso8601); /* size 0x680 */
	. = ALIGN(0x8); /* align for .bss.ngx_io */
	"objs/arm_objs/src/core/ngx_connection.o"(.bss.ngx_io); /* size 0x30 */
	. = ALIGN(0x8); /* align for .bss.ngx_test_config */
	"objs/arm_objs/src/core/ngx_cycle.o"(.bss.ngx_test_config); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_quiet_mode */
	"objs/arm_objs/src/core/ngx_cycle.o"(.bss.ngx_quiet_mode); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_cycle_c_ngx_temp_pool */
	"objs/arm_objs/src/core/ngx_cycle.o"(.bss.src_core_ngx_cycle_c_ngx_temp_pool); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_old_cycles */
	"objs/arm_objs/src/core/ngx_cycle.o"(.bss.ngx_old_cycles); /* size 0x28 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_cycle_c_ngx_cleaner_event */
	"objs/arm_objs/src/core/ngx_cycle.o"(.bss.src_core_ngx_cycle_c_ngx_cleaner_event); /* size 0x68 */
	. = ALIGN(0x8); /* align for .bss.src_core_ngx_cycle_c_dumb */
	"objs/arm_objs/src/core/ngx_cycle.o"(.bss.src_core_ngx_cycle_c_dumb); /* size 0xb8 */
	. = ALIGN(0x8); /* align for .bss.ngx_cycle */
	"objs/arm_objs/src/core/ngx_cycle.o"(.bss.ngx_cycle); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_event_ngx_event_c_ngx_timer_resolution */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.src_event_ngx_event_c_ngx_timer_resolution); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_use_accept_mutex */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_use_accept_mutex); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_accept_disabled */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_accept_disabled); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_accept_mutex_held */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_accept_mutex_held); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_accept_mutex_delay */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_accept_mutex_delay); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_event_actions */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_event_actions); /* size 0x50 */
	. = ALIGN(0x8); /* align for .bss.ngx_accept_mutex */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_accept_mutex); /* size 0x40 */
	. = ALIGN(0x8); /* align for .bss.ngx_event_flags */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_event_flags); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.ngx_event_timer_alarm */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_event_timer_alarm); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.ngx_accept_mutex_ptr */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_accept_mutex_ptr); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_accept_events */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_accept_events); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_accept_mutex_lock_file */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.ngx_accept_mutex_lock_file); /* size 0xc8 */
	. = ALIGN(0x8); /* align for .bss.src_event_ngx_event_c_ngx_event_max_module */
	"objs/arm_objs/src/event/ngx_event.o"(.bss.src_event_ngx_event_c_ngx_event_max_module); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_event_ngx_event_timer_c_ngx_event_timer_sentinel */
	"objs/arm_objs/src/event/ngx_event_timer.o"(.bss.src_event_ngx_event_timer_c_ngx_event_timer_sentinel); /* size 0x28 */
	. = ALIGN(0x8); /* align for .bss.ngx_event_timer_rbtree */
	"objs/arm_objs/src/event/ngx_event_timer.o"(.bss.ngx_event_timer_rbtree); /* size 0x18 */
	. = ALIGN(0x8); /* align for .bss.ngx_posted_accept_events */
	"objs/arm_objs/src/event/ngx_event_posted.o"(.bss.ngx_posted_accept_events); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_posted_events */
	"objs/arm_objs/src/event/ngx_event_posted.o"(.bss.ngx_posted_events); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_os_unix_ngx_errno_c_ngx_sys_errlist */
	"objs/arm_objs/src/os/unix/ngx_errno.o"(.bss.src_os_unix_ngx_errno_c_ngx_sys_errlist); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_pagesize */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.bss.ngx_pagesize); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_pagesize_shift */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.bss.ngx_pagesize_shift); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_cacheline_size */
	"objs/arm_objs/src/os/unix/ngx_alloc.o"(.bss.ngx_cacheline_size); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_last_process */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.bss.ngx_last_process); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.ngx_processes */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.bss.ngx_processes); /* size 0xc000 */
	. = ALIGN(0x4); /* align for .bss.ngx_channel */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.bss.ngx_channel); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.ngx_process_slot */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.bss.ngx_process_slot); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.ngx_argc */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.bss.ngx_argc); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.ngx_argv */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.bss.ngx_argv); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_os_argv */
	"objs/arm_objs/src/os/unix/ngx_process.o"(.bss.ngx_os_argv); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_os_unix_ngx_setproctitle_c_ngx_os_argv_last */
	"objs/arm_objs/src/os/unix/ngx_setproctitle.o"(.bss.src_os_unix_ngx_setproctitle_c_ngx_os_argv_last); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_ncpu */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.bss.ngx_ncpu); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.rlmt */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.bss.rlmt); /* size 0x10 */
	. = ALIGN(0x8); /* align for .bss.ngx_max_sockets */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.bss.ngx_max_sockets); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_inherited_nonblocking */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.bss.ngx_inherited_nonblocking); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_tcp_nodelay_and_tcp_nopush */
	"objs/arm_objs/src/os/unix/ngx_posix_init.o"(.bss.ngx_tcp_nodelay_and_tcp_nopush); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.ngx_new_binary */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_new_binary); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_sigalrm */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_sigalrm); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_reap */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_reap); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_terminate */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_terminate); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_quit */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_quit); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_reconfigure */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_reconfigure); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.ngx_noaccepting */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_noaccepting); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_restart */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_restart); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.ngx_reopen */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_reopen); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_change_binary */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_change_binary); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_noaccept */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_noaccept); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.ngx_process */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_process); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.ngx_pid */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_pid); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.ngx_threaded */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_threaded); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.ngx_sigio */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_sigio); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.ngx_debug_quit */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_debug_quit); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.ngx_exiting */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_exiting); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_inherited */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_inherited); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_daemonized */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.ngx_daemonized); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_os_unix_ngx_process_cycle_c_ngx_exit_log_file */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.src_os_unix_ngx_process_cycle_c_ngx_exit_log_file); /* size 0x30 */
	. = ALIGN(0x8); /* align for .bss.src_os_unix_ngx_process_cycle_c_ngx_exit_log */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.src_os_unix_ngx_process_cycle_c_ngx_exit_log); /* size 0x30 */
	. = ALIGN(0x8); /* align for .bss.src_os_unix_ngx_process_cycle_c_ngx_exit_cycle */
	"objs/arm_objs/src/os/unix/ngx_process_cycle.o"(.bss.src_os_unix_ngx_process_cycle_c_ngx_exit_cycle); /* size 0x1c0 */
	. = ALIGN(0x10); /* align for .bss.ngx_linux_kern_ostype */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.bss.ngx_linux_kern_ostype); /* size 0x32 */
	. = ALIGN(0x10); /* align for .bss.ngx_linux_kern_osrelease */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.bss.ngx_linux_kern_osrelease); /* size 0x32 */
	. = ALIGN(0x4); /* align for .bss.ngx_linux_rtsig_max */
	"objs/arm_objs/src/os/unix/ngx_linux_init.o"(.bss.ngx_linux_rtsig_max); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_event_modules_ngx_epoll_module_c_nevents */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.bss.src_event_modules_ngx_epoll_module_c_nevents); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_event_modules_ngx_epoll_module_c_event_list */
	"objs/arm_objs/src/event/modules/ngx_epoll_module.o"(.bss.src_event_modules_ngx_epoll_module_c_event_list); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_http_max_module */
	"objs/arm_objs/src/http/ngx_http.o"(.bss.ngx_http_max_module); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_http_top_header_filter */
	"objs/arm_objs/src/http/ngx_http.o"(.bss.ngx_http_top_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.ngx_http_top_body_filter */
	"objs/arm_objs/src/http/ngx_http.o"(.bss.ngx_http_top_body_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_ngx_http_copy_filter_module_c_ngx_http_next_body_filter */
	"objs/arm_objs/src/http/ngx_http_copy_filter_module.o"(.bss.src_http_ngx_http_copy_filter_module_c_ngx_http_next_body_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_ngx_http_script_c_ngx_http_script_exit_code */
	"objs/arm_objs/src/http/ngx_http_script.o"(.bss.src_http_ngx_http_script_c_ngx_http_script_exit_code); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_chunked_filter_module_c_ngx_http_next_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.bss.src_http_modules_ngx_http_chunked_filter_module_c_ngx_http_next_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_chunked_filter_module_c_ngx_http_next_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_chunked_filter_module.o"(.bss.src_http_modules_ngx_http_chunked_filter_module_c_ngx_http_next_body_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_range_filter_module_c_ngx_http_next_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.bss.src_http_modules_ngx_http_range_filter_module_c_ngx_http_next_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_range_filter_module_c_ngx_http_next_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_range_filter_module.o"(.bss.src_http_modules_ngx_http_range_filter_module_c_ngx_http_next_body_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_next_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_headers_filter_module.o"(.bss.src_http_modules_ngx_http_headers_filter_module_c_ngx_http_next_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_not_modified_filter_module_c_ngx_http_next_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_not_modified_filter_module.o"(.bss.src_http_modules_ngx_http_not_modified_filter_module_c_ngx_http_next_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_ngx_http_postpone_filter_module_c_ngx_http_next_body_filter */
	"objs/arm_objs/src/http/ngx_http_postpone_filter_module.o"(.bss.src_http_ngx_http_postpone_filter_module_c_ngx_http_next_body_filter); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_no_params */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_no_params); /* size 0x20 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_null_string */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_ssi_null_string); /* size 0x10 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_next_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_next_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_next_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_ssi_filter_module.o"(.bss.src_http_modules_ngx_http_ssi_filter_module_c_ngx_http_next_body_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_next_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.bss.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_next_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_next_body_filter */
	"objs/arm_objs/src/http/modules/ngx_http_charset_filter_module.o"(.bss.src_http_modules_ngx_http_charset_filter_module_c_ngx_http_next_body_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_reset_index */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.bss.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_userid_reset_index); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_http_modules_ngx_http_userid_filter_module_c_start_value */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.bss.src_http_modules_ngx_http_userid_filter_module_c_start_value); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_next_header_filter */
	"objs/arm_objs/src/http/modules/ngx_http_userid_filter_module.o"(.bss.src_http_modules_ngx_http_userid_filter_module_c_ngx_http_next_header_filter); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_geo_module_c_ngx_http_geo_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_geo_module.o"(.bss.src_http_modules_ngx_http_geo_module_c_ngx_http_geo_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_split_clients_module_c_ngx_http_split_clients_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_split_clients_module.o"(.bss.src_http_modules_ngx_http_split_clients_module_c_ngx_http_split_clients_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_empty_gif_module_c_ngx_http_empty_gif_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_empty_gif_module.o"(.bss.src_http_modules_ngx_http_empty_gif_module_c_ngx_http_empty_gif_module_ctx); /* size 0x40 */
	. = ALIGN(0x8); /* align for .bss.src_http_modules_ngx_http_upstream_ip_hash_module_c_ngx_http_upstream_ip_hash_module_ctx */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.bss.src_http_modules_ngx_http_upstream_ip_hash_module_c_ngx_http_upstream_ip_hash_module_ctx); /* size 0x40 */
	. = ALIGN(0x1); /* align for .bss.src_http_modules_ngx_http_upstream_ip_hash_module_c_ngx_http_upstream_ip_hash_pseudo_addr */
	"objs/arm_objs/src/http/modules/ngx_http_upstream_ip_hash_module.o"(.bss.src_http_modules_ngx_http_upstream_ip_hash_module_c_ngx_http_upstream_ip_hash_pseudo_addr); /* size 0x3 */
	. = ALIGN(0x8); /* align for .bss.__environ */
	"/usr/local/popcorn/aarch64/lib/libc.a(__environ.o)"(.bss.__environ); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__popcorn_stack_base */
	"/usr/local/popcorn/aarch64/lib/libc.a(__libc_start_main.o)"(.bss.__popcorn_stack_base); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname */
	"/usr/local/popcorn/aarch64/lib/libc.a(libc.o)"(.bss.__progname); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__progname_full */
	"/usr/local/popcorn/aarch64/lib/libc.a(libc.o)"(.bss.__progname_full); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_cur */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_cur); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_end */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_end); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_lite_malloc_c___simple_malloc_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(lite_malloc.o)"(.bss.src_malloc_lite_malloc_c___simple_malloc_lock); /* size 0x8 */
	. = ALIGN(0x1000); /* align for .bss.src_malloc_malloc_c_mal */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_mal); /* size 0x1000 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_expand_heap_heap_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_malloc_c_expand_heap_end */
	"/usr/local/popcorn/aarch64/lib/libc.a(malloc.o)"(.bss.src_malloc_malloc_c_expand_heap_end); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.bss.src_malloc_popcorn_malloc_c_expand_heap_heap_lock); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_popcorn_malloc_c_expand_heap_end */
	"/usr/local/popcorn/aarch64/lib/libc.a(popcorn_malloc.o)"(.bss.src_malloc_popcorn_malloc_c_expand_heap_end); /* size 0x100 */
	. = ALIGN(0x8); /* align for .bss.src_network_gethostbyname2_c_gethostbyname2_h */
	"/usr/local/popcorn/aarch64/lib/libc.a(gethostbyname2.o)"(.bss.src_network_gethostbyname2_c_gethostbyname2_h); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getgrent_c_f */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.bss.src_passwd_getgrent_c_f); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getgrent_c_gr */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.bss.src_passwd_getgrent_c_gr); /* size 0x20 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getgrent_c_line */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.bss.src_passwd_getgrent_c_line); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getgrent_c_mem */
	"/usr/local/popcorn/aarch64/lib/libc.a(getgrent.o)"(.bss.src_passwd_getgrent_c_mem); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getpwent_c_f */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.bss.src_passwd_getpwent_c_f); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getpwent_c_pw */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.bss.src_passwd_getpwent_c_pw); /* size 0x30 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getpwent_c_line */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.bss.src_passwd_getpwent_c_line); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_passwd_getpwent_c_size */
	"/usr/local/popcorn/aarch64/lib/libc.a(getpwent.o)"(.bss.src_passwd_getpwent_c_size); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_prng_random_c_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.bss.src_prng_random_c_lock); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_prng_random_c_j */
	"/usr/local/popcorn/aarch64/lib/libc.a(random.o)"(.bss.src_prng_random_c_j); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_signal_sigaction_c_handler_set */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.bss.src_signal_sigaction_c_handler_set); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_signal_sigaction_c_unmask_done */
	"/usr/local/popcorn/aarch64/lib/libc.a(sigaction.o)"(.bss.src_signal_sigaction_c_unmask_done); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_fflush_c_dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(fflush.o)"(.bss.src_stdio_fflush_c_dummy); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_stdio_ofl_c_ofl_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_stdio_ofl_c_ofl_head */
	"/usr/local/popcorn/aarch64/lib/libc.a(ofl.o)"(.bss.src_stdio_ofl_c_ofl_head); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_thread_synccall_c_dummy */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.bss.src_thread_synccall_c_dummy); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss.src_thread_synccall_c_synccall_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.bss.src_thread_synccall_c_synccall_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_thread_synccall_c_head */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.bss.src_thread_synccall_c_head); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_thread_synccall_c_callback */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.bss.src_thread_synccall_c_callback); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_thread_synccall_c_context */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.bss.src_thread_synccall_c_context); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_thread_synccall_c_target_tid */
	"/usr/local/popcorn/aarch64/lib/libc.a(synccall.o)"(.bss.src_thread_synccall_c_target_tid); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_time_localtime_c_localtime_tm */
	"/usr/local/popcorn/aarch64/lib/libc.a(localtime.o)"(.bss.src_time_localtime_c_localtime_tm); /* size 0x38 */
	. = ALIGN(0x8); /* align for .bss.src_env___init_tls_c_main_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_main_tls); /* size 0x30 */
	. = ALIGN(0x10); /* align for .bss.src_env___init_tls_c_builtin_tls */
	"/usr/local/popcorn/aarch64/lib/libc.a(__init_tls.o)"(.bss.src_env___init_tls_c_builtin_tls); /* size 0x1a8 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c___expand_heap_brk */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_brk); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c___expand_heap_mmap_step */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_mmap_step); /* size 0x4 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_arenas); /* size 0x100 */
	. = ALIGN(0x10); /* align for .bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c___expand_heap_node_node_sizes); /* size 0x100 */
	. = ALIGN(0x8); /* align for .bss.src_malloc_expand_heap_c_arena_start */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c_arena_start); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_malloc_expand_heap_c_set_arena_start_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(expand_heap.o)"(.bss.src_malloc_expand_heap_c_set_arena_start_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.__timezone */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.__timezone); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.__daylight */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.__daylight); /* size 0x4 */
	. = ALIGN(0x10); /* align for .bss.__tzname */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.__tzname); /* size 0x10 */
	. = ALIGN(0x4); /* align for .bss.src_time___tz_c_lock */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_lock); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_zi */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_zi); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_types */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_types); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_abbrevs */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_abbrevs); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_time___tz_c_r0 */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_r0); /* size 0x14 */
	. = ALIGN(0x10); /* align for .bss.src_time___tz_c_r1 */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_r1); /* size 0x14 */
	. = ALIGN(0x4); /* align for .bss.src_time___tz_c_dst_off */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_dst_off); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_abbrevs_end */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_abbrevs_end); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_map_size */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_map_size); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_trans */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_trans); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_time___tz_c_index */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_index); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_time___tz_c_std_name */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_std_name); /* size 0x7 */
	. = ALIGN(0x1); /* align for .bss.src_time___tz_c_dst_name */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_dst_name); /* size 0x7 */
	. = ALIGN(0x10); /* align for .bss.src_time___tz_c_old_tz_buf */
	"/usr/local/popcorn/aarch64/lib/libc.a(__tz.o)"(.bss.src_time___tz_c_old_tz_buf); /* size 0x20 */
	. = ALIGN(0x8); /* align for .bss.src_stdio___stdio_exit_c_dummy_file */
	"/usr/local/popcorn/aarch64/lib/libc.a(__stdio_exit.o)"(.bss.src_stdio___stdio_exit_c_dummy_file); /* size 0x8 */
	. = ALIGN(0x10); /* align for .bss.src_migrate_c_ni */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(migrate.o)"(.bss.src_migrate_c_ni); /* size 0x180 */
	. = ALIGN(0x4); /* align for .bss.src_mapping_c_default_node */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.bss.src_mapping_c_default_node); /* size 0x4 */
	. = ALIGN(0x8); /* align for .bss.src_mapping_c_mappings */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.bss.src_mapping_c_mappings); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_mapping_c_num_mappings */
	"/usr/local/popcorn/aarch64/lib/libmigrate.a(mapping.o)"(.bss.src_mapping_c_num_mappings); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.aarch64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.aarch64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.powerpc64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.powerpc64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.x86_64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.x86_64_fn); /* size 0x8 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_aarch64_handle */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_aarch64_handle); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_userspace_c_alloc_aarch64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_alloc_aarch64_fn); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_powerpc64_handle */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_powerpc64_handle); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_userspace_c_alloc_powerpc64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_alloc_powerpc64_fn); /* size 0x1 */
	. = ALIGN(0x8); /* align for .bss.src_userspace_c_x86_64_handle */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_x86_64_handle); /* size 0x8 */
	. = ALIGN(0x1); /* align for .bss.src_userspace_c_alloc_x86_64_fn */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.bss.src_userspace_c_alloc_x86_64_fn); /* size 0x1 */
	. = ALIGN(0x4); /* align for .bss._elf_version */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.bss._elf_version); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss._elf_errno */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.bss._elf_errno); /* size 0x4 */
	. = ALIGN(0x4); /* align for .bss._elf_fill */
	"/usr/local/popcorn/aarch64/lib/libelf.a(data.o)"(.bss._elf_fill); /* size 0x4 */
	. = ALIGN(0x1); /* align for .bss.src_stdio_stderr_c_buf */
	"/usr/local/popcorn/aarch64/lib/libc.a(stderr.o)"(.bss.src_stdio_stderr_c_buf); /* size 0x8 */
	. = ALIGN(0x4); /* align for .bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state */
	"/usr/local/popcorn/aarch64/lib/libc.a(mbrtowc.o)"(.bss.src_multibyte_mbrtowc_c_mbrtowc_internal_state); /* size 0x4 */
	*(.bss);
}
  
  _bss_end__ = . ; __bss_end__ = . ;
  . = ALIGN(32 / 8);
  . = ALIGN(32 / 8);
  __end__ = . ;
  _end = .; PROVIDE (end = .);
  . = DATA_SEGMENT_END (.);
  .eh_frame_hdr : { *(.eh_frame_hdr) }
  
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
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(userspace.o)"(.tbss.src_userspace_c_bounds); /* size 0x10 */
	. = ALIGN(0x8); /* align for .tbss.src_rewrite_c_src_ctx */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_src_ctx); /* size 0xb050 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_src_regs */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_src_regs); /* size 0x62000 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_src_callee */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_src_callee); /* size 0x2000 */
	. = ALIGN(0x8); /* align for .tbss.src_rewrite_c_dest_ctx */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_dest_ctx); /* size 0xb050 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_dest_regs */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_dest_regs); /* size 0x62000 */
	. = ALIGN(0x10); /* align for .tbss.src_rewrite_c_dest_callee */
	"/usr/local/popcorn/aarch64/lib/libstack-transform.a(rewrite.o)"(.tbss.src_rewrite_c_dest_callee); /* size 0x2000 */
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
    KEEP (*(SORT(.init_array.*)))
    KEEP (*(.init_array))
    PROVIDE_HIDDEN (__init_array_end = .);
  }
  .fini_array     :
  {
    PROVIDE_HIDDEN (__fini_array_start = .);
    KEEP (*(SORT(.fini_array.*)))
    KEEP (*(.fini_array))
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
  . = DATA_SEGMENT_RELRO_END (24, .);
  .got.plt        : { *(.got.plt)  *(.igot.plt) }
  .llvm_stackmaps : ALIGN(0x1000) { *(.llvm_stackmaps) }
/*  . = ALIGN(32 / 8);
  . = ALIGN(32 / 8);
  __end__ = . ;
  _end = .; PROVIDE (end = .);*/
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
  .debug_line     0 : { *(.debug_line) }
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
  .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) KEEP (*(.gnu.attributes)) }
  .note.gnu.arm.ident 0 : { KEEP (*(.note.gnu.arm.ident)) }
  /DISCARD/ : { *(.note.GNU-stack) *(.gnu_debuglink) *(.gnu.lto_*) *(.note.gnu.build-id) }
}
