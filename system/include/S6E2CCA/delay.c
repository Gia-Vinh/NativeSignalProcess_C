#include <platform.h>
#include <stdint.h>
#include "delay.h"

void delay_ms(unsigned int ms) {
 unsigned int max_step = 1000 * (UINT32_MAX / CLK_FREQ);
 unsigned int max_sleep_cycles = max_step * (CLK_FREQ / 1000);
 while (ms > max_step) {
  ms -= max_step;
  delay_cycles(max_sleep_cycles);
 }
 delay_cycles(ms * (CLK_FREQ / 1000));
}

void delay_us(unsigned int us) {
 unsigned int max_step = 1000000 * (UINT32_MAX / CLK_FREQ);
 unsigned int max_sleep_cycles = max_step * (CLK_FREQ / 1000000);
 while (us > max_step) {
  us -= max_step;
  delay_cycles(max_sleep_cycles);
 }
 delay_cycles(us * (CLK_FREQ / 1000000));
}

void delay_cycles(unsigned int cycles) {
	asm("LSRS r0, #2");
	asm("BEQ done");
	asm("loop:");
	asm("SUBS r0, #1");
#if __CORTEX_M == 3 || __CORTEX_M == 4
	asm("NOP");
#endif
	asm("BNE loop");
	asm("done:");
 	//asm("BX lr");
}

// *******************************ARM University Program Copyright © ARM Ltd 2014*************************************
