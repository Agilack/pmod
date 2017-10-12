# PMOD modules

This repository contains multiple projects of PMOD modules. All of them are
used for communications.

## CAN

This module is a peripheral interface to connect a CAN bus.

![Picture of PMOD CAN](https://raw.githubusercontent.com/Agilack/pmod/master/comm-can/doc/img-top_components-mini.jpg)

## RS232

This module is a RS232 interface. The PMOD side is a type4a interface and
the other side is a DB9 male connector. The module contains a level shifter
(basically a MAX3232) to allow interfacing RS232 signal levels on a board
with TTL levels.

![Picture of PMOD RS232](https://raw.githubusercontent.com/Agilack/pmod/master/rs232/doc/top-mini.jpg)

## RS485

![Picture of PMOD RS485](https://raw.githubusercontent.com/Agilack/pmod/master/rs485/doc/top-mini.jpg)

## Midi (IN)

This module can be used to connect a MIDI device to a board with PMOD interface.
The MIDI port is an input, so only instruments that send datas can be connected
(tested with a keyboard)

![Picture of PMOD MIDI](https://raw.githubusercontent.com/Agilack/pmod/master/midi-in/doc/top-components-mini.jpg)

## USB Serial

This module is an usb-serial adapter (PMOD peripheral). Based on a Silicon Labs
chip, no specific driver is required to use it on most OS.

![Picture of PMOD USB-Serial](https://raw.githubusercontent.com/Agilack/pmod/master/usb-serial/doc/top-mini.jpg)

# License

All electronics parts are released under Creative Commons Attribution Share
Alike 3.0 license.

All firmwares and softwares included with modules are realeased under GNU
General Public Licence v3 (GNU GPLv3)
