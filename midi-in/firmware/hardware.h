/**
 * @file  hardware.h
 * @brief Definitions and prototypes for low-level hardware configuration
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
#ifndef HARDWARE_H
#define HARDWARE_H
#include "types.h"

/* AHB-APB Bridge A */
#define PAC0_ADDR    ((u32)0x40000000)
#define PM_ADDR      ((u32)0x40000400)
#define SYSCTRL_ADDR ((u32)0x40000800)
#define GCLK_ADDR    ((u32)0x40000C00)
#define WDT_ADDR     ((u32)0x40001000)
#define RTC_ADDR     ((u32)0x40001400)
#define EIC_ADDR     ((u32)0x40001800)
/* AHB-APB Bridge B */
#define PAC1_ADDR    ((u32)0x41000000)
#define DSU_ADDR     ((u32)0x41002000)
#define NVM_ADDR     ((u32)0x41004000)
#define PORT_ADDR    ((u32)0x41004400)
#define DMAC_ADDR    ((u32)0x41004800)
#define MTB_ADDR     ((u32)0x41006000)
/* AHB-APB Bridge C */
#define PAC2_ADDR    ((u32)0x42000000)
#define EVSYS_ADDR   ((u32)0x42000400)
#define SERCOM0_ADDR ((u32)0x42000800)
#define SERCOM1_ADDR ((u32)0x42000C00)
#define TC1_ADDR     ((u32)0x42001800)
#define TC2_ADDR     ((u32)0x42001C00)
#define ADC_ADDR     ((u32)0x42002000)

void hw_init(void);

/**
 * @brief Read the value of a 32bits memory mapped register
 *
 * @param  reg Address of the register to read
 * @return u32 Value of the register (32 bits)
 */
static inline u32 reg_rd(u32 reg)
{
	return( *(volatile u32 *)reg );
}

/**
 * @brief Read the value of a 8bits memory mapped register
 *
 * @param  reg Address of the register to read
 * @return u8  Value of the register (8 bits)
 */
static inline u8 reg8_rd(u32 reg)
{
	return( *(volatile u8 *)reg );
}

/**
 * @brief Read the value of a 16bits memory mapped register
 *
 * @param  reg Address of the register to read
 * @return u16 Value of the register (16 bits)
 */
static inline u16 reg16_rd(u32 reg)
{
	return( *(volatile u16 *)reg );
}

/**
 * @brief Write a 32 bits value to a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value New value to write into the register
 */
static inline void reg_wr(u32 reg, u32 value)
{
	*(volatile u32 *)reg = value;
}

/**
 * @brief Write a 16bits value to a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value New (16 bits) value to write into the register
 */
static inline void reg16_wr (u32 reg, u16 value)
{
	*(volatile u16 *)reg = value;
}

/**
 * @brief Write a 8bits value to a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value New (8 bits) value to write into the register
 */
static inline void reg8_wr(u32 reg, u8 value)
{
	*(volatile u8 *)reg = value;
}

/**
 * @brief Set some bits into a memory mapped register
 *
 * @param reg   Address of the register to update
 * @param value Mask of bits to set into the register
 */
static inline void reg_set(u32 reg, u32 value)
{
  *(volatile u32 *)reg = (*(volatile u32 *)reg | value);
}

#endif
