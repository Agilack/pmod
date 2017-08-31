/**
 * @file  uart.h
 * @brief Definitions and prototypes for UART functions
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
#ifndef UART_H
#define UART_H

#include "types.h"

void uart_crlf(void);
void uart_dump(u8 *d, int l);
void uart_init(void);
int  uart_midi_getc(u8 *c);
void uart_putc(unsigned char c);
void uart_puts(char *s);
void uart_puthex  (const u32 c);
void uart_puthex8 (const u8  c);
void uart_puthex16(const u16 c);

#endif
/* EOF */
