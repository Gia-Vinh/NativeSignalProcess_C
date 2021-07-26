/* 
INPUT (& &)
OUTPUT_FORMAT ("elf32-littlearm", "elf32-bigarm", "elf32-littlearm")
ENTRY(_FM4_reset_cortex_m)
SEARCH_DIR(.)
GROUP(-lgcc -lc)
*/

MEMORY
{
  rom (rx)  : ORIGIN = 0x00000000, LENGTH = 2048K
  ram (rwx) : ORIGIN = 0x1FFF0000, LENGTH =  192K
/* Only SRAM0 specified - add other SRAM Segments as needed */
}

/* These force the linker to search for particular symbols from
 * the start of the link process and thus ensure the user's
 * overrides are picked up
 */
EXTERN(__FM4_reset_cortex_m)
EXTERN(__FM4_interrupt_vector_cortex_m)
EXTERN(__FM4_start_c main __FM4_stack __FM4_stack_size __FM4_heap_end)

PROVIDE(__FM4_stack = __FM4_region_start_ram + __FM4_region_size_ram);
PROVIDE(__FM4_stack_size = __FM4_region_start_ram + __FM4_region_size_ram - _end);
PROVIDE(__FM4_heap_start = _end);
PROVIDE(__FM4_heap_end = __FM4_region_start_ram + __FM4_region_size_ram);

SECTIONS
{
  .text :
  {
    CREATE_OBJECT_SYMBOLS
    __FM4_region_start_rom = .;
    *(.FM4.region-head.rom)
    __FM4_interrupt_vector = __FM4_interrupt_vector_cortex_m;
    *(.FM4.interrupt_vector)
    /* Make sure we pulled in an interrupt vector.  */
    ASSERT (. != __FM4_interrupt_vector_cortex_m, "No interrupt vector");
    *(.ram)
    *(.ram.b)

    __FM4_reset = __FM4_reset_cortex_m;
    *(.FM4.reset)
    /* Make sure we pulled in some reset code.  */
    ASSERT (. != __FM4_reset, "No reset code");

    *(.text .text.* .gnu.linkonce.t.*)
    *(.plt)
    *(.gnu.warning)
    *(.glue_7t) *(.glue_7) *(.vfp11_veneer)

    *(.rodata .rodata.* .gnu.linkonce.r.*)

    *(.ARM.extab* .gnu.linkonce.armextab.*)
    *(.gcc_except_table)
    *(.eh_frame_hdr)
    *(.eh_frame)

    . = ALIGN(4);
    __FM4_regions = .;
    LONG (0)
    LONG (__FM4_region_init_ram)
    LONG (__FM4_region_start_ram)
    LONG (__FM4_region_init_size_ram)
    LONG (__FM4_region_zero_size_ram)
  }

  /* .ARM.exidx is sorted, so has to go in its own output section.  */
  __exidx_start = .;
  .ARM.exidx :
  {
    *(.ARM.exidx* .gnu.linkonce.armexidx.*)
  } >ram
  __exidx_end = .;
  .text.align :
  {
    . = ALIGN(8);
    _etext = .;
  } >ram
  __FM4_region_size_ram = LENGTH(ram);
  __FM4_region_num = 1;

  .data :
  {
    _sdata = .;
    __FM4_region_start_ram = .;
    *(.FM4.region-head.ram)
    KEEP(*(.jcr))
    *(.got.plt) *(.got)
    *(.shdata)
    *(.data .data.* .gnu.linkonce.d.*)
    *(.ram)
    . = ALIGN (8);
    _edata = .;
  } >ram AT>ram
  data_size = _edata - _sdata;
  .bss :
  {
    _sbss = .;
    *(.shbss)
    *(.bss .bss.* .gnu.linkonce.b.*)
    *(COMMON)
    *(.ram.b)
    . = ALIGN (8);
    _ebss = .;
    _end = .;
    __end = .;
  } >ram AT>ram
  bss_size = _ebss - _sbss;
  
  PROVIDE ( end = _ebss );
  PROVIDE ( _end = _ebss );
  
  .heap :
  {
    *(.heap)
  } >ram
  .stack (__FM4_stack - __FM4_stack_size) :
  {
    *(.stack)
  } >ram
  __FM4_region_init_ram = LOADADDR (.data);
  __FM4_region_init_size_ram = _edata - __FM4_region_start_ram;
  __FM4_region_zero_size_ram = _end - _edata;
  __FM4_region_size_ram = LENGTH(ram);
  __FM4_region_num = 1;

  .stab 0 (NOLOAD) : { *(.stab) }
  .stabstr 0 (NOLOAD) : { *(.stabstr) }
  /* DWARF debug sections.
   * Symbols in the DWARF debugging sections are relative to the beginning
   * of the section so we begin them at 0.  */
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

  .note.gnu.arm.ident 0 : { KEEP (*(.note.gnu.arm.ident)) }
  .ARM.attributes 0 : { KEEP (*(.ARM.attributes)) }
  /DISCARD/ : { *(.note.GNU-stack) }
}
