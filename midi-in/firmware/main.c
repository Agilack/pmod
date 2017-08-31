/**
 * @file  main.c
 * @brief Entry point of the C code (main)
 *
 * @author Saint-Genest Gwenael <gwen@cowlab.fr>
 * @copyright Cowlab (c) 2017
 *
 * @page License
 * This firmware is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation. You should have received a
 * copy of the GNU General Public License along with this program, see
 * LICENSE.md file for more details.
 * This program is distributed WITHOUT ANY WARRANTY.
 */
#include "hardware.h"
#include "uart.h"

int main(void)
{
	/* Initialize clocks and low-level hardware */
	hw_init();
	/* Initialize UARTs */
	uart_init();

	while(1)
	{
		u8 byte;

		/* Try to get a byte from MIDI port */
		if (uart_midi_getc(&byte) == 0)
			continue;

		/* Read INTFLAG and wait DRE (Data Register Empty) */
		while ( (reg8_rd(SERCOM0_ADDR + 0x18) & 0x01) == 0)
			;
		/* Write data */
		reg16_wr((SERCOM0_ADDR + 0x28), byte);
		/* Toggle GPIO */
		reg_wr(0x60000000 + 0x1C, (1 << 2));
	}

	return(0);
}
/* EOF */
