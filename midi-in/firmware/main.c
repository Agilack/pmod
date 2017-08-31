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

int main(void)
{
	/* Initialize clocks and low-level hardware */
	hw_init();

	/* ToDo : replace this empty infinite loop with MIDI processing */
	while(1);

	return(0);
}
/* EOF */
