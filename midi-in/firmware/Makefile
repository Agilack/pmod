##
 # @file  Makefile
 # @brief Script to compile sources and create flat binary using "make" program
 #
 # @author Saint-Genest Gwenael <gwen@cowlab.fr>
 # @copyright Cowlab (c) 2017
 #
 # @page License
 # This firmware is free software: you can redistribute it and/or modify
 # it under the terms of the GNU General Public License version 3 as
 # published by the Free Software Foundation. You should have received a
 # copy of the GNU General Public License along with this program, see
 # LICENSE.md file for more details.
 # This program is distributed WITHOUT ANY WARRANTY.
##
CROSS=arm-none-eabi-
TARGET=pmod-midi-fw

SRC  = main.c hardware.c uart.c
ASRC = startup.s

CC = $(CROSS)gcc
OC = $(CROSS)objcopy
OD = $(CROSS)objdump
EDBG = edbg

CFLAGS  = -mcpu=cortex-m0plus -mthumb
CFLAGS += -nostdlib -Os -ffunction-sections
CFLAGS += -fno-builtin-memcpy -fno-builtin-memset
CFLAGS += -Wall -pedantic

LDFLAGS = -nostartfiles -T pmod-midi.ld -Wl,-Map=$(TARGET).map,--cref,--gc-sections -static

_COBJ =  $(SRC:.c=.o)
COBJ = $(patsubst %, %,$(_COBJ))
_AOBJ =  $(ASRC:.s=.o)
AOBJ = $(patsubst %, %,$(_AOBJ))

## Directives ##################################################################

all: $(AOBJ) $(COBJ)
	@echo "  [LD] $(TARGET)"
	@$(CC) $(CFLAGS) $(LDFLAGS) -o $(TARGET).elf $(AOBJ) $(COBJ)
	@echo "  [OC] $(TARGET).bin"
	@$(OC) -S $(TARGET).elf -O binary $(TARGET).bin
	@echo "  [OD] $(TARGET).dis"
	@$(OD) -D $(TARGET).elf > $(TARGET).dis

clean:
	@echo "  [RM] $(TARGET).*"
	@rm -f $(TARGET).elf $(TARGET).map $(TARGET).bin $(TARGET).dis
	@echo "  [RM] Temporary object (*.o)"
	@rm -f *.o
	@rm -f *~

$(AOBJ) : %.o : %.s
	@echo "  [AS] $@"
	@$(CC) $(CFLAGS) -c $< -o $@

$(COBJ) : %.o: %.c
	@echo "  [CC] $@"
	@$(CC) $(CFLAGS) -c $< -o $@

# Use ataradov/edbg program to load the firmware using CMSIS-DAP probe
load:
	$(EDBG) -bpv -t atmel_cm0p -f $(TARGET).bin
