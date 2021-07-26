// loop_dma.c

#include "audio.h"

void DMA_HANDLER (void) { /****** DMA Interruption Handler*****/

	if (dstc_state(0)) { //check interrupt status on channel 0
		if(tx_proc_buffer == (PONG)) {
			dstc_src_memory (0,(uint32_t)&(dma_tx_buffer_pong));    //Source address
			tx_proc_buffer = PING;
		}
		else {
			dstc_src_memory (0,(uint32_t)&(dma_tx_buffer_ping));    //Source address
			tx_proc_buffer = PONG;
		}
		tx_buffer_empty = 1;                                        //Signal to main() that tx buffer empty
       
		dstc_reset(0);			                                        //Clean the interrup flag
    }
    if (dstc_state(1)) { //check interrupt status on channel 1
    	if(rx_proc_buffer == PONG) {
    		dstc_dest_memory (1,(uint32_t)&(dma_rx_buffer_pong));   //Destination address
			rx_proc_buffer = PING;
		}
		else {
			dstc_dest_memory (1,(uint32_t)&(dma_rx_buffer_ping));   //Destination address
			rx_proc_buffer = PONG;
		}
		rx_buffer_full = 1;
						
		dstc_reset(1);
    }
}

void process_buffer(void) {
	int ii;
	uint32_t *txbuf, *rxbuf;

	if(tx_proc_buffer == PING) {
		txbuf = dma_tx_buffer_ping;
	}
	else {
		txbuf = dma_tx_buffer_pong;
	}
	if(rx_proc_buffer == PING) {
		rxbuf = dma_rx_buffer_ping;
	}
	else {
		rxbuf = dma_rx_buffer_pong;
	}
	
	for(ii=0; ii<DMA_BUFFER_SIZE ; ii++) {
		//Process
		
		*txbuf++ = *rxbuf++;
	}
	tx_buffer_empty = 0;
	rx_buffer_full = 0;
}

int main (void) {    //Main function

	gpio_set_mode(TEST_PIN,Output);
	audio_init ( hz48000, line_in, dma, DMA_HANDLER);

	while(1){
		while (!(rx_buffer_full && tx_buffer_empty)){};
		gpio_set(TEST_PIN, HIGH);
		process_buffer();
		gpio_set(TEST_PIN, LOW);
	}
}
