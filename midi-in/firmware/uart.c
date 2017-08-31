/**
 * @file  uart.c
 * @brief Handle UART port (using sercom peripheral)
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

#define UART_ADDR      SERCOM0_ADDR
#define UART_MIDI_ADDR SERCOM1_ADDR
#define UART_PMOD_ADDR SERCOM0_ADDR

#define MIDI_BAUD   31250
#define PMOD_BAUD  115200
#define UART_GCLK 8000000
#define CONF_MIDI_BAUD  (65536 - ((65536 * 16.0f * MIDI_BAUD) / UART_GCLK))
#define CONF_PMOD_BAUD  (65536 - ((65536 * 16.0f * PMOD_BAUD) / UART_GCLK))

static const u8 hex[16] = "0123456789ABCDEF";

static void uart_midi_init(void);
static void uart_pmod_init(void);

/**
 * @brief Send end-of-line string CR-LF over UART
 *
 */
void uart_crlf(void)
{
	uart_putc('\r');
	uart_putc('\n');
}

/**
 * @brief Initialize and configure UART port
 *
 */
void uart_init(void)
{
	uart_midi_init();
	uart_pmod_init();
}

int uart_midi_getc(u8 *c)
{
	u8  status;
	u16 data;
	
	status = reg8_rd(UART_MIDI_ADDR + 0x18);
	if (status & 0x04)
	{
		data = reg16_rd(UART_MIDI_ADDR + 0x28);
		if (c)
			*c = (u8)(data & 0xFF);
		return(1);
	}
	return(0);
}

static void uart_midi_init(void)
{
	/* 1) Enable peripheral and set clocks */

	/* Enable SERCOM1 clock (APBCMASK) */
	reg_set(PM_ADDR + 0x20, (1 << 3));
	/* Set GCLK for SERCOM1 (generic clock generator 0) */
	reg16_wr (GCLK_ADDR + 0x02, (1 << 14) | (0 << 8) | 15);

	/* 2) Initialize UART block   */

	/* Reset UART (set SWRST)     */
	reg_wr((UART_MIDI_ADDR + 0x00), 0x01);
	/* Wait end of software reset */
	while( reg_rd(UART_MIDI_ADDR + 0x00) & 0x01)
		;
	/* Configure UART */
	reg_wr(UART_MIDI_ADDR + 0x00, 0x40310004);
	reg_wr(UART_MIDI_ADDR + 0x04, 0x00030000);
	/* Configure Baudrate */
	reg16_wr(UART_MIDI_ADDR + 0x0C, CONF_MIDI_BAUD);
	/* Set ENABLE into CTRLA */
	reg_set( (UART_MIDI_ADDR + 0x00), (1 << 1) );

	/* 3) Configure pins (IOs) */

	/* PINCFG: Enable PMUX for RX/TX pins */
	reg8_wr(0x60000000 + 0x58, 0x01); /* PA24 : TX */
	reg8_wr(0x60000000 + 0x59, 0x01); /* PA25 : RX */
	/* Set peripheral function C (SERCOM) for PA24 and PA25 */
	reg8_wr(0x60000000 + 0x3C, (0x02 << 4) | (0x02 << 0));
}

static void uart_pmod_init(void)
{
	/* 1) Enable peripheral and set clocks */

	/* Enable SERCOM0 clock (APBCMASK) */
	reg_set(PM_ADDR + 0x20, (1 << 2));
	/* Set GCLK for SERCOM0 (generic clock generator 0) */
	reg16_wr (GCLK_ADDR + 0x02, (1 << 14) | (0 << 8) | 14);

	/* 2) Initialize UART block   */

	/* Reset UART (set SWRST)     */
	reg_wr((UART_PMOD_ADDR + 0x00), 0x01);
	/* Wait end of software reset */
	while( reg_rd(UART_PMOD_ADDR + 0x00) & 0x01)
		;
	/* Configure UART */
	reg_wr(UART_PMOD_ADDR + 0x00, 0x40100004);
	reg_wr(UART_PMOD_ADDR + 0x04, 0x00030000);
	/* Configure Baudrate */
	reg16_wr(UART_PMOD_ADDR + 0x0C, CONF_PMOD_BAUD);
	/* Set ENABLE into CTRLA */
	reg_set( (UART_PMOD_ADDR + 0x00), (1 << 1) );

	/* 3) Configure pins (IOs) */

	/* PINCFG: Enable PMUX for RX/TX pins */
	reg8_wr(0x60000000 + 0x4E, 0x01); /* PA14 : TX */
	reg8_wr(0x60000000 + 0x4F, 0x01); /* PA15 : RX */
	/* Set peripheral function C (SERCOM) for PA14 and PA15 */
	reg8_wr(0x60000000 + 0x37, (0x02 << 4) | (0x02 << 0));
}

/**
 * @brief Send a single byte over UART
 *
 * @param c Character (or binary byte) to send
 */
void uart_putc(unsigned char c)
{
	/* Read INTFLAG and wait DRE (Data Register Empty) */
	while ( (reg_rd(UART_ADDR + 0x18) & 0x01) == 0)
		;
	/* Write data */
	reg_wr((UART_ADDR + 0x28), c);
}

/**
 * @brief Send a text-string over UART
 *
 * @param s Pointer to the null terminated text string
 */
void uart_puts(char *s)
{
	/* Loop to process each character */
	while(*s)
	{
		/* Send one byte */
		uart_putc(*s);
		/* Move pointer to next byte */
		s++;
	}
}

/**
 * @brief Send the hexadecimal representation of a byte
 *
 * @param c Binary byte to show as hex
 */
void uart_puthex8(const u8 c)
{
	uart_putc( hex[(c >>  4) & 0xF] );
	uart_putc( hex[(c      ) & 0xF] );
}

/**
 * @brief Send the hexadecimal representation of a 16bits word
 *
 * @param c Binary word (16 bits) to show as hex
 */
void uart_puthex16(const u16 c)
{
	uart_puthex8(c >>  8);
	uart_puthex8(c >>  0);
}

/**
 * @brief Send the hexadecimal representation of a 32bits word
 *
 * @param c Binary word (32 bits) to show as hex
 */
void uart_puthex(const u32 c)
{
	uart_puthex8(c >> 24);
	uart_puthex8(c >> 16);
	uart_puthex8(c >>  8);
	uart_puthex8(c >>  0);
}

/**
 * @brief Send an hexadecimal dump of a buffer (or memory location)
 *
 * @param buffer Pointer to the memory location to dump
 * @param len    Number of bytes to dump
 */
void uart_dump(u8 *buffer, int len)
{
	u8 *p;
	int pos;
	int i;

	p = buffer;
	pos = 0;
	while(pos < len)
	{
		uart_puthex(pos);
		uart_putc(' ');

		for (i = 0; i < 16; i++)
		{
			uart_puthex8( *p );
			uart_putc(' ');
			p++;
			pos ++;
			if (pos == len)
				break;
		}
		uart_crlf();
	}
	uart_crlf();
}
/* EOF */
