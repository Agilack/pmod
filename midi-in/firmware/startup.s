/**
 * @file  startup.s
 * @brief Processor vector table and interrupts handlers (including reset)
 *
 * @author Saint-Genest Gwenael <gwen@cowlab.fr>
 * @copyright Cowlab (c) 2017
 *
 * @page License
 * This license is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License version 3 as
 * published by the Free Software Foundation. You should have received a
 * copy of the GNU General Public License along with this program, see
 * LICENSE.md file for more details.
 * This program is distributed WITHOUT ANY WARRANTY.
 */

    .syntax unified
    .arch armv6-m

/* -- Stack and Head sections ---------------------------------------------- */
    .section .stack
    .align 3
    .equ    Stack_Size, 0x100
    .globl    __StackTop
    .globl    __StackLimit
__StackLimit:
    .space    Stack_Size
    .size __StackLimit, . - __StackLimit
__StackTop:
    .size __StackTop, . - __StackTop

/* -- Vector Table --------------------------------------------------------- */

    .section .isr_vector
    .align 2
    .globl __isr_vector
__isr_vector:
    /* Cortex M0 Handlers */
    .long   __StackTop                  /* Top of Stack                     */
    .long   Reset_Handler               /* Reset Handler                    */
    .long   NMI_Handler                 /* NMI Handler                      */
    .long   HardFault_Handler           /* Hard Fault Handler               */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   SVC_Handler                 /* SVCall Handler                   */
    .long   0                           /* Debug Monitor Handler            */
    .long   0                           /* Reserved                         */
    .long   PendSV_Handler              /* PendSV Handler                   */
    .long   SysTick_Handler             /* SysTick Handler                  */
    /* SAMD09 Peripherals Handlers */
    .long   PM_Handler                  /* Power Manager Handler            */
    .long   SYSCTRL_Handler             /* System Control Handler           */
    .long   WDT_Handler                 /* Watchdog Timer Handler           */
    .long   RTC_Handler                 /* Real-Time Counter Handler        */
    .long   EIC_Handler                 /* External Interrupt Controller    */
    .long   NVMCTRL_Handler             /* Non-Volatile Memory Controller   */
    .long   DMAC_Handler                /* Direct Memory Access Controller  */
    .long   0                           /* Reserved                         */
    .long   EVSYS_Handler               /* Event System Interface           */
    .long   SERCOM0_Handler             /* Serial Communication Interface 0 */
    .long   SERCOM1_Handler             /* Serial Communication Interface 1 */
    .long   0	                        /* Reserved                         */
    .long   0                           /* Reserved                         */ 
    .long   TC1_Handler                 /* Timer Counter 1                  */
    .long   TC2_Handler                 /* Timer Counter 2                  */
    .long   ADC_Handler                 /* Analog Digital Converter         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .long   0                           /* Reserved                         */
    .size    __isr_vector, . - __isr_vector

/**
 *
 */
    .text
    .thumb
    .thumb_func
    .align 2
    .globl    Reset_Handler
    .type    Reset_Handler, %function
Reset_Handler:
    /* Call C code entry ("main" function) */
    bl  main

/**
 * @brief Default handler is an infinite loop for all unsupported events
 *
 */
.section	.text.Default_Handler,"ax",%progbits
Default_Handler:
Infinite_Loop:
	b	Infinite_Loop
	.size	Default_Handler, .-Default_Handler

/*    Macro to define default handlers. Default handler
 *    will be weak symbol and just dead loops. They can be
 *    overwritten by other handlers */
    .macro    def_default_handler    handler_name
    .align 1
    .thumb_func
    .weak    \handler_name
    .thumb_set \handler_name,Default_Handler
    .endm

    /* Default handlers for Cortex M0 internal blocks */
    def_default_handler    NMI_Handler
    def_default_handler    HardFault_Handler
    def_default_handler    SVC_Handler
    def_default_handler    PendSV_Handler
    def_default_handler    SysTick_Handler
    /* Default handlers for SAMD09 peripherals */
    def_default_handler    PM_Handler
    def_default_handler    SYSCTRL_Handler
    def_default_handler    WDT_Handler
    def_default_handler    RTC_Handler
    def_default_handler    EIC_Handler
    def_default_handler    NVMCTRL_Handler
    def_default_handler    DMAC_Handler
    def_default_handler    EVSYS_Handler
    def_default_handler    SERCOM0_Handler
    def_default_handler    SERCOM1_Handler
    def_default_handler    TC1_Handler
    def_default_handler    TC2_Handler
    def_default_handler    ADC_Handler

    .end
