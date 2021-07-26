// delay_intr.c

#include "audio.h"

#define N 24000 				 // Verzoegerung 0,5 Sekunden bei Fs = 48kHz

volatile int16_t audio_chR=0;    //16 bits audio data channel right
volatile int16_t audio_chL=0;    //16 bits audio data channel left

// Neue Variablen

float32_t x_n, y_n, delayed;
float32_t h = 0.5;
float32_t g = 0.707;

float32_t buffer[N] = {0.0};
int32_t ind = 0;

void I2S_HANDLER(void) {   /****** I2S Interruption Handler *****/
//	gpio_toggle(TEST_PIN);

	audio_IN = i2s_rx();
	audio_chL = (audio_IN & 0x0000FFFF);       //Separate 16 bits channel left
	audio_chR = ((audio_IN >>16)& 0x0000FFFF); //Separate 16 bits channel right

//Process
	x_n = (float32_t)(audio_chL/2 + audio_chR/2);	// 1.) Mittelwert aus links und rechts berechnen, auf float casten

	delayed = buffer[ind];							// 2.) alten Abtastwert aus Modulospeicher lesen
	buffer[ind] = x_n*h;							// 3.) Modulospeicher mit neuem Abtastwert beschreiben
	ind = (ind+1)%N;								// 4.) Index auf Modulospeicher inkrementieren
	y_n = x_n*g + delayed;							// 5.) Summe aus verzoegertem und unverzoegerten Signal

	audio_chL = (int16_t)y_n;						// 6.) Linken Kanal aus gecastetem Ausgangssignal bilden
	audio_chR = (int16_t)y_n;						// 7.) Linken Kanal aus gecastetem Ausgangssignal bilden
	
	audio_OUT = ((audio_chR<<16 & 0xFFFF0000)) + (audio_chL & 0x0000FFFF);	//Put the two channels together again
	i2s_tx(audio_OUT);
}


int main(void) {
	gpio_set_mode(TEST_PIN,Output);
	audio_init (hz48000, line_in, intr, I2S_HANDLER);

	int i;
//	for (i = 0; i < N; i++) {
//		buffer[i] = 0.0;		// Bufferwerte auf Null stetzen, sonst eventuell Anfangsgeraeusch
//	}

	while(1){
	}
}

