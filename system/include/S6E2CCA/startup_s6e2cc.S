
/************************************************************************/
/*  Startup for GNU toolchain                                           */
/*  Version     V1.0                                                    */
/*  Date        2014-09-30                                              */
/*  Target-mcu  S6E2xxx                                                 */
/************************************************************************/


/*
// <h> Stack Configuration
//   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
*/

	.equ Debug_RAM, 1

	.equ    Stack_Size, 0x00002000
    .section ".stack", "w"
    .align  3
    .globl  __FM4_stack_mem
    .globl  __FM4_stack_size
__FM4_stack_mem:
    .if     Stack_Size
    .space  Stack_Size
    .endif
    .size   __FM4_stack_mem,  . - __FM4_stack_mem
    .set    __FM4_stack_size, . - __FM4_stack_mem


/*
// <h> Heap Configuration
//   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
// </h>
*/

    .equ    Heap_Size,  0x00020000
    
    .section ".heap", "w"
    .align  3
    .globl  __FM4_heap_start
    .globl  __FM4_heap_end
__FM4_heap_start:
    .if     Heap_Size
    .space  Heap_Size
    .endif
__FM4_heap_end:


/* Vector Table */

    .section ".FM4.interrupt_vector"
    .globl  __FM4_interrupt_vector_cortex_m
    .type   __FM4_interrupt_vector_cortex_m, %object

__FM4_interrupt_vector_cortex_m:
    .long   __FM4_stack                 /* Top of Stack                 */
    .long   __FM4_reset                 /* Reset Handler                */
    .long   NMI_Handler                 /* NMI Handler                  */
    .long   HardFault_Handler           /* Hard Fault Handler           */
    .long   MemManage_Handler           /* MPU Fault Handler            */
    .long   BusFault_Handler            /* Bus Fault Handler            */
    .long   UsageFault_Handler          /* Usage Fault Handler          */
    .long   0                           /* Reserved                     */
    .long   0                           /* Reserved                     */
    .long   0                           /* Reserved                     */
    .long   0                           /* Reserved                     */
    .long   SVC_Handler                 /* SVCall Handler               */
    .long   DebugMon_Handler            /* Debug Monitor Handler        */
    .long   0                           /* Reserved                     */
    .long   PendSV_Handler              /* PendSV Handler               */
    .long   SysTick_Handler             /* SysTick Handler              */

    /* External Interrupts */

	.long     CSV_IRQHandler
	.long     SWDT_IRQHandler
	.long     LVD_IRQHandler
	.long     IRQ003SEL_IRQHandler
	.long     IRQ004SEL_IRQHandler
	.long     IRQ005SEL_IRQHandler
	.long     IRQ006SEL_IRQHandler
	.long     IRQ007SEL_IRQHandler
	.long     IRQ008SEL_IRQHandler
	.long     IRQ009SEL_IRQHandler
	.long     IRQ010SEL_IRQHandler
	.long     EXINT0_IRQHandler
	.long     EXINT1_IRQHandler
	.long     EXINT2_IRQHandler
	.long     EXINT3_IRQHandler
	.long     EXINT4_IRQHandler
	.long     EXINT5_IRQHandler
	.long     EXINT6_IRQHandler
	.long     EXINT7_IRQHandler
	.long     QPRC0_IRQHandler
	.long     QPRC1_IRQHandler
	.long     WFG0_DTIF0_IRQHandler
	.long     WFG1_DTIF1_IRQHandler
	.long     WFG2_DTIF2_IRQHandler
	.long     FRT0_PEAK_IRQHandler
	.long     FRT0_ZERO_IRQHandler
	.long     ICU0_IRQHandler
	.long     OCU0_IRQHandler
	.long     FRT1_PEAK_IRQHandler
	.long     FRT1_ZERO_IRQHandler
	.long     ICU1_IRQHandler
	.long     OCU1_IRQHandler
	.long     FRT2_PEAK_IRQHandler
	.long     FRT2_ZERO_IRQHandler
	.long     ICU2_IRQHandler
	.long     OCU2_IRQHandler
	.long     PPG00_02_04_IRQHandler
	.long     PPG08_10_12_IRQHandler
	.long     PPG16_18_20_IRQHandler
	.long     BT0_IRQHandler
	.long     BT1_IRQHandler
	.long     BT2_IRQHandler
	.long     BT3_IRQHandler
	.long     BT4_IRQHandler
	.long     BT5_IRQHandler
	.long     BT6_IRQHandler
	.long     BT7_IRQHandler
	.long     DT1_2_IRAHandler
	.long     WC_IRQHandler
	.long     EXTBUS_ERR_Handler
	.long     RTC_IRQHandler
	.long     EXTINT8_IRQHandler
	.long     EXTINT9_IRQHandler
	.long     EXTINT10_IRQHandler
	.long     EXTINT11_IRQHandler
	.long     EXTINT12_IRQHandler
	.long     EXTINT13_IRQHandler
	.long     EXTINT14_IRQHandler
	.long     EXTINT15_IRQHandler
	.long     TIM_IRQHandler
	.long     MFS0_RX_IRQHandler
	.long     MFS0_TX_IRQHandler
	.long     MFS1_RX_IRQHandler
	.long     MFS1_TX_IRQHandler
	.long     MFS2_RX_IRQHandler
	.long     MFS2_TX_IRQHandler
	.long     MFS3_RX_IRQHandler
	.long     MFS3_TX_IRQHandler
	.long     MFS4_RX_IRQHandler
	.long     MFS4_TX_IRQHandler
	.long     MFS5_RX_IRQHandler
	.long     MFS5_TX_IRQHandler
	.long     MFS6_RX_IRQHandler
	.long     MFS6_TX_IRQHandler
	.long     MFS7_RX_IRQHandler
	.long     MFS7_TX_IRQHandler
	.long     ADC0_IRQHandler
	.long     ADC1_IRQHandler
	.long     USB0_IRQHandler
	.long     USB0_HOST_IRQHandler
	.long     CAN0_IRQHandler
	.long     CAN1_CANFD_IRQHandler
	.long     ETHER0_IRQHandler
	.long     DMAC0_IRQHandler
	.long     DMAC1_IRQHandler
	.long     DMAC2_IRQHandler
	.long     DMAC3_IRQHandler
	.long     DMAC4_IRQHandler
	.long     DMAC5_IRQHandler
	.long     DMAC6_IRQHandler
	.long     DMAC7_IRQHandler
	.long     DSTC_IRQHandler
	.long     EXINT16_17_18_19_IRQHandler
	.long     EXINT20_21_22_23_IRQHandler
	.long     EXINT24_25_26_27_IRQHandler
	.long     EXINT28_29_30_31_IRQHandler
	.long     QPRC2_IRQHandler
	.long     QPRC3_IRQHandler
	.long     BT8_IRQHandler
	.long     BT9_IRQHandler
	.long     BT10_IRQHandler
	.long     BT11_IRQHandler
	.long     BT12_15_IRQHandler
	.long     MFS8_RX_IRQHandler
	.long     MFS8_TX_IRQHandler
	.long     MFS9_RX_IRQHandler
	.long     MFS9_TX_IRQHandler
	.long     MFS10_RX_IRQHandler
	.long     MFS10_TX_IRQHandler
	.long     MFS11_RX_IRQHandler
	.long     MFS11_TX_IRQHandler
	.long     ADC2_IRQHandler
	.long     DSTC_COMP_IRQHandler
	.long     USB1_HDMICEC0_IRQHandler
	.long     USB1_HOST_HDMICEC1_IRQHandler
	.long     HSSPI_IRQHandler
	.long     Dummy_Handler2
	.long     PRGCRC_I2S_IRQHandler
	.long     SD_IRQHandler
	.long     FLASHIF_IRQHandler
	.long     MFS12_RX_IRQHandler
	.long     MFS12_TX_IRQHandler
	.long     MFS13_RX_IRQHandler
	.long     MFS13_TX_IRQHandler
	.long     MFS14_RX_IRQHandler
	.long     MFS14_TX_IRQHandler
	.long     MFS15_RX_IRQHandler
	.long     MFS15_TX_IRQHandler

    .size   __FM4_interrupt_vector_cortex_m, . - __FM4_interrupt_vector_cortex_m


    .thumb


/* Reset Handler */

    .section .FM4.reset,"x",%progbits
    .thumb_func
    .globl  __FM4_reset_cortex_m
    .type   __FM4_reset_cortex_m, %function
__FM4_reset_cortex_m:
    .fnstart

    /*FPU settings*/
 	ldr     r0, =0xE000ED88           /* Enable CP10,CP11 */
 	ldr     r1,[r0]
 //	orr     r1, r1, #(0xF << 20)
 	ldr 	r2, =(0xF << 20)
 	orr		r1, r1, r2
 	str     r1,[r0]

.ifdef Debug_RAM
/* this routine is used for .bss sections initialization by RAM debugging "Debug_RAM = 1" */
/* Clear .bss section (Zero init) */
	MOV     R0, #0
	LDR     R1, =_sbss
	LDR     R2, =_ebss
	CMP     R1,R2
	BEQ     start_main
Loop_bss:
	CMP     R1, R2
	BHS		start_main
	STR   	R0, [R1]
	ADD		R1, #4
	BLO     Loop_bss

.else
/* this routine is used for .data and .bss sections initialization by ROM debugging "Debug_RAM = 0" */
init_data:
	LDR		R0, =_sdata
	LDR		R1, =_etext
	LDR		R2, =data_size
	MOV		R3, #0
loop_init_data:
	CMP		R3, R2
	BCS		zero_bss
    LDR		R4,[R1,#0]
	STR		R4,[R0,#0]
	ADD		R3, #4
	ADD		R1, #4
	ADD		R0, #4
	B		loop_init_data

/* Clear .bss section (Zero init) */

zero_bss:
	LDR		R0, =_sbss
	LDR		R2, =bss_size
	MOV		R3, #0
	MOV		R4, #0
loop_zero_bss:
	CMP		R3, R2
	BCS		start_main
	STR		R4,[R0,#0]
	ADD		R3, #4
	ADD		R0, #4
	B		loop_zero_bss
.endif
start_main:
	LDR     R0, =SystemInit
    BLX     R0
    LDR     R0,=main
    BX      R0

    .pool
    .cantunwind
    .fnend
    .size   __FM4_reset_cortex_m,.-__FM4_reset_cortex_m

    .section ".text"

/* Exception Handlers */

    .weak   NMI_Handler
    .type   NMI_Handler, %function
NMI_Handler:
    B       .
    .size   NMI_Handler, . - NMI_Handler

    .weak   HardFault_Handler
    .type   HardFault_Handler, %function
HardFault_Handler:
    B       .
    .size   HardFault_Handler, . - HardFault_Handler

    .weak   MemManage_Handler
    .type   MemManage_Handler, %function
MemManage_Handler:
    B       .
    .size   MemManage_Handler, . - MemManage_Handler

    .weak   BusFault_Handler
    .type   BusFault_Handler, %function
BusFault_Handler:
    B       .
    .size   BusFault_Handler, . - BusFault_Handler

    .weak   UsageFault_Handler
    .type   UsageFault_Handler, %function
UsageFault_Handler:
    B       .
    .size   UsageFault_Handler, . - UsageFault_Handler

    .weak   SVC_Handler
    .type   SVC_Handler, %function
SVC_Handler:
    B       .
    .size   SVC_Handler, . - SVC_Handler

    .weak   DebugMon_Handler
    .type   DebugMon_Handler, %function
DebugMon_Handler:
    B       .
    .size   DebugMon_Handler, . - DebugMon_Handler

    .weak   PendSV_Handler
    .type   PendSV_Handler, %function
PendSV_Handler:
    B       .
    .size   PendSV_Handler, . - PendSV_Handler

    .weak   SysTick_Handler
    .type   SysTick_Handler, %function
SysTick_Handler:
    B       .
    .size   SysTick_Handler, . - SysTick_Handler


/* IRQ Handlers */

    .globl  Default_Handler
    .type   Default_Handler, %function
Default_Handler:
    B       .
    .size   Default_Handler, . - Default_Handler

    .macro  IRQ handler
    .weak   \handler
    .set    \handler, Default_Handler
    .endm

	IRQ     CSV_IRQHandler
	IRQ     SWDT_IRQHandler
	IRQ     LVD_IRQHandler
	IRQ     IRQ003SEL_IRQHandler
	IRQ     IRQ004SEL_IRQHandler
	IRQ     IRQ005SEL_IRQHandler
	IRQ     IRQ006SEL_IRQHandler
	IRQ     IRQ007SEL_IRQHandler
	IRQ     IRQ008SEL_IRQHandler
	IRQ     IRQ009SEL_IRQHandler
	IRQ     IRQ010SEL_IRQHandler
	IRQ     EXINT0_IRQHandler
	IRQ     EXINT1_IRQHandler
	IRQ     EXINT2_IRQHandler
	IRQ     EXINT3_IRQHandler
	IRQ     EXINT4_IRQHandler
	IRQ     EXINT5_IRQHandler
	IRQ     EXINT6_IRQHandler
	IRQ     EXINT7_IRQHandler
	IRQ     QPRC0_IRQHandler
	IRQ     QPRC1_IRQHandler
	IRQ     WFG0_DTIF0_IRQHandler
	IRQ     WFG1_DTIF1_IRQHandler
	IRQ     WFG2_DTIF2_IRQHandler
	IRQ     FRT0_PEAK_IRQHandler
	IRQ     FRT0_ZERO_IRQHandler
	IRQ     ICU0_IRQHandler
	IRQ     OCU0_IRQHandler
	IRQ     FRT1_PEAK_IRQHandler
	IRQ     FRT1_ZERO_IRQHandler
	IRQ     ICU1_IRQHandler
	IRQ     OCU1_IRQHandler
	IRQ     FRT2_PEAK_IRQHandler
	IRQ     FRT2_ZERO_IRQHandler
	IRQ     ICU2_IRQHandler
	IRQ     OCU2_IRQHandler
	IRQ     PPG00_02_04_IRQHandler
	IRQ     PPG08_10_12_IRQHandler
	IRQ     PPG16_18_20_IRQHandler
	IRQ     BT0_IRQHandler
	IRQ     BT1_IRQHandler
	IRQ     BT2_IRQHandler
	IRQ     BT3_IRQHandler
	IRQ     BT4_IRQHandler
	IRQ     BT5_IRQHandler
	IRQ     BT6_IRQHandler
	IRQ     BT7_IRQHandler
	IRQ     DT1_2_IRAHandler
	IRQ     WC_IRQHandler
	IRQ     EXTBUS_ERR_Handler
	IRQ     RTC_IRQHandler
	IRQ     EXTINT8_IRQHandler
	IRQ     EXTINT9_IRQHandler
	IRQ     EXTINT10_IRQHandler
	IRQ     EXTINT11_IRQHandler
	IRQ     EXTINT12_IRQHandler
	IRQ     EXTINT13_IRQHandler
	IRQ     EXTINT14_IRQHandler
	IRQ     EXTINT15_IRQHandler
	IRQ     TIM_IRQHandler
	IRQ     MFS0_RX_IRQHandler
	IRQ     MFS0_TX_IRQHandler
	IRQ     MFS1_RX_IRQHandler
	IRQ     MFS1_TX_IRQHandler
	IRQ     MFS2_RX_IRQHandler
	IRQ     MFS2_TX_IRQHandler
	IRQ     MFS3_RX_IRQHandler
	IRQ     MFS3_TX_IRQHandler
	IRQ     MFS4_RX_IRQHandler
	IRQ     MFS4_TX_IRQHandler
	IRQ     MFS5_RX_IRQHandler
	IRQ     MFS5_TX_IRQHandler
	IRQ     MFS6_RX_IRQHandler
	IRQ     MFS6_TX_IRQHandler
	IRQ     MFS7_RX_IRQHandler
	IRQ     MFS7_TX_IRQHandler
	IRQ     ADC0_IRQHandler
	IRQ     ADC1_IRQHandler
	IRQ     USB0_IRQHandler
	IRQ     USB0_HOST_IRQHandler
	IRQ     CAN0_IRQHandler
	IRQ     CAN1_CANFD_IRQHandler
	IRQ     ETHER0_IRQHandler
	IRQ     DMAC0_IRQHandler
	IRQ     DMAC1_IRQHandler
	IRQ     DMAC2_IRQHandler
	IRQ     DMAC3_IRQHandler
	IRQ     DMAC4_IRQHandler
	IRQ     DMAC5_IRQHandler
	IRQ     DMAC6_IRQHandler
	IRQ     DMAC7_IRQHandler
	IRQ     DSTC_IRQHandler
	IRQ     EXINT16_17_18_19_IRQHandler
	IRQ     EXINT20_21_22_23_IRQHandler
	IRQ     EXINT24_25_26_27_IRQHandler
	IRQ     EXINT28_29_30_31_IRQHandler
	IRQ     QPRC2_IRQHandler
	IRQ     QPRC3_IRQHandler
	IRQ     BT8_IRQHandler
	IRQ     BT9_IRQHandler
	IRQ     BT10_IRQHandler
	IRQ     BT11_IRQHandler
	IRQ     BT12_15_IRQHandler
	IRQ     MFS8_RX_IRQHandler
	IRQ     MFS8_TX_IRQHandler
	IRQ     MFS9_RX_IRQHandler
	IRQ     MFS9_TX_IRQHandler
	IRQ     MFS10_RX_IRQHandler
	IRQ     MFS10_TX_IRQHandler
	IRQ     MFS11_RX_IRQHandler
	IRQ     MFS11_TX_IRQHandler
	IRQ     ADC2_IRQHandler
	IRQ     DSTC_COMP_IRQHandler
	IRQ     USB1_HDMICEC0_IRQHandler
	IRQ     USB1_HOST_HDMICEC1_IRQHandler
	IRQ     HSSPI_IRQHandler
	IRQ     Dummy_Handler2
	IRQ     PRGCRC_I2S_IRQHandler
	IRQ     SD_IRQHandler
	IRQ     FLASHIF_IRQHandler
	IRQ     MFS12_RX_IRQHandler
	IRQ     MFS12_TX_IRQHandler
	IRQ     MFS13_RX_IRQHandler
	IRQ     MFS13_TX_IRQHandler
	IRQ     MFS14_RX_IRQHandler
	IRQ     MFS14_TX_IRQHandler
	IRQ     MFS15_RX_IRQHandler
	IRQ     MFS15_TX_IRQHandler	

    .end
