/*
 * loop_intr_flag.c
 *
 *  Created on: 13-12-2016
 *      Author: Christian Langen
 */

#include "audio.h"

volatile int16_t audio_chR=0;    //16 bits audio data channel right
volatile int16_t audio_chL=0;    //16 bits audio data channel left

int flag = 0;

void I2S_HANDLER(void) {   		 // Dummy I2S Interruption Handler
								 // Does nothing
	flag = 1;
//	audio_IN = i2s_rx();
	i2s_tx(audio_OUT);
}


int main(void) {
//	gpio_set_mode(TEST_PIN,Output);
	audio_init ( hz48000, line_in, intr, I2S_HANDLER);

	while(1){

		if (flag == 1) {
			flag = 0;
			audio_IN = i2s_rx();
			audio_chL = (audio_IN & 0x0000FFFF);       //Separate 16 bits channel left
			audio_chR = ((audio_IN >>16)& 0x0000FFFF); //Separate 16 bits channel right

	//Process

			audio_OUT = ((audio_chR<<16 & 0xFFFF0000)) + (audio_chL & 0x0000FFFF);	//Put the two channels together again
//			i2s_tx(audio_OUT);
		}
	}
	return 0;
}
