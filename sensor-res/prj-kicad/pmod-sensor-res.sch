EESchema Schematic File Version 2
LIBS:pmod-sensor-res
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "PMOD - Resistive sensor"
Date "2019-01-09"
Rev "0.1"
Comp "Agilack"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L PMOD P1
U 1 1 5BC65734
P 1800 3400
F 0 "P1" H 2000 3700 60  0000 C CNN
F 1 "PMOD" H 2050 3100 60  0000 C CNN
F 2 "" H 1800 3400 60  0001 C CNN
F 3 "" H 1800 3400 60  0000 C CNN
	1    1800 3400
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR01
U 1 1 5BC657F3
P 1800 3900
F 0 "#PWR01" H 1800 3900 30  0001 C CNN
F 1 "GND" H 1800 3830 30  0001 C CNN
F 2 "" H 1800 3900 60  0000 C CNN
F 3 "" H 1800 3900 60  0000 C CNN
	1    1800 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3900 1800 3850
Wire Wire Line
	1750 3850 1850 3850
Wire Wire Line
	1750 3850 1750 3800
Wire Wire Line
	1850 3850 1850 3800
Connection ~ 1800 3850
Wire Wire Line
	1800 2900 1800 2950
Wire Wire Line
	1700 2950 1900 2950
Wire Wire Line
	1700 2950 1700 3000
Wire Wire Line
	1900 2950 1900 3000
Connection ~ 1800 2950
$Comp
L +3.3V #PWR02
U 1 1 5BC65834
P 1800 2900
F 0 "#PWR02" H 1800 2860 30  0001 C CNN
F 1 "+3.3V" H 1800 3010 30  0000 C CNN
F 2 "" H 1800 2900 60  0000 C CNN
F 3 "" H 1800 2900 60  0000 C CNN
	1    1800 2900
	1    0    0    -1  
$EndComp
$Comp
L CONN_2 P2
U 1 1 5BC65884
P 10250 3400
F 0 "P2" H 10250 3100 50  0000 C CNN
F 1 "CONN_2" V 10250 3400 50  0000 C CNN
F 2 "" H 10250 3400 60  0001 C CNN
F 3 "" H 10250 3400 60  0000 C CNN
	1    10250 3400
	1    0    0    1   
$EndComp
$Comp
L R R3
U 1 1 5BC6596E
P 9400 2600
F 0 "R3" V 9500 2600 50  0000 C CNN
F 1 "10k" V 9400 2600 45  0000 C CNN
F 2 "" H 9400 2600 60  0001 C CNN
F 3 "" H 9400 2600 60  0000 C CNN
	1    9400 2600
	1    0    0    -1  
$EndComp
$Comp
L +VSensor #PWR03
U 1 1 5BC65A36
P 9100 2150
F 0 "#PWR03" H 9100 2110 30  0001 C CNN
F 1 "+VSensor" H 9100 2260 30  0000 C CNN
F 2 "" H 9100 2150 60  0000 C CNN
F 3 "" H 9100 2150 60  0000 C CNN
	1    9100 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 2250 9400 2350
Wire Wire Line
	9400 3300 10000 3300
Wire Wire Line
	9400 3750 9400 3500
Wire Wire Line
	9400 3500 10000 3500
$Comp
L GND #PWR04
U 1 1 5BC65A8A
P 9100 3850
F 0 "#PWR04" H 9100 3850 30  0001 C CNN
F 1 "GND" H 9100 3780 30  0001 C CNN
F 2 "" H 9100 3850 60  0000 C CNN
F 3 "" H 9100 3850 60  0000 C CNN
	1    9100 3850
	1    0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5BC65B0B
P 8800 2600
F 0 "R1" V 8900 2600 50  0000 C CNN
F 1 "10k" V 8800 2600 45  0000 C CNN
F 2 "" H 8800 2600 60  0001 C CNN
F 3 "" H 8800 2600 60  0000 C CNN
	1    8800 2600
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 2150 9100 2250
Wire Wire Line
	8800 2250 9400 2250
Wire Wire Line
	8800 2350 8800 2250
Connection ~ 9100 2250
$Comp
L R R2
U 1 1 5BC65BA1
P 8800 3400
F 0 "R2" V 8900 3400 50  0000 C CNN
F 1 "100" V 8800 3400 45  0000 C CNN
F 2 "" H 8800 3400 60  0001 C CNN
F 3 "" H 8800 3400 60  0000 C CNN
	1    8800 3400
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 3750 8800 3650
Wire Wire Line
	9100 2950 9400 2950
Connection ~ 9400 2950
Wire Wire Line
	8200 2950 8800 2950
Connection ~ 8800 2950
Wire Wire Line
	8800 3750 9400 3750
Wire Wire Line
	9100 3750 9100 3850
Connection ~ 9100 3750
$Comp
L AD8237 U1
U 1 1 5BC664E8
P 7300 3000
F 0 "U1" H 7650 3150 50  0000 C CNN
F 1 "AD8237" H 7200 3000 25  0000 C CNN
F 2 "" H 7100 3000 50  0001 C CNN
F 3 "" H 7650 2600 50  0000 C CNN
	1    7300 3000
	-1   0    0    -1  
$EndComp
Text Label 8450 2950 0    45   ~ 0
S_REF
Wire Wire Line
	9100 2950 9100 3050
Wire Wire Line
	9100 3050 8200 3050
Wire Wire Line
	8200 3050 8200 3150
Wire Wire Line
	8200 2950 8200 2850
Wire Wire Line
	8200 2850 7600 2850
Wire Wire Line
	8200 3150 7600 3150
Wire Wire Line
	8800 2850 8800 3150
Wire Wire Line
	9400 2850 9400 3300
Text Label 8450 3050 0    45   ~ 0
S_IN
$Comp
L GND #PWR05
U 1 1 5BC6691D
P 7350 3450
F 0 "#PWR05" H 7350 3450 30  0001 C CNN
F 1 "GND" H 7350 3380 30  0001 C CNN
F 2 "" H 7350 3450 60  0000 C CNN
F 3 "" H 7350 3450 60  0000 C CNN
	1    7350 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3450 7350 3350
Wire Wire Line
	7350 2550 7350 2650
$Comp
L +3.3V #PWR06
U 1 1 5BC669AE
P 7350 2550
F 0 "#PWR06" H 7350 2510 30  0001 C CNN
F 1 "+3.3V" H 7350 2660 30  0000 C CNN
F 2 "" H 7350 2550 60  0000 C CNN
F 3 "" H 7350 2550 60  0000 C CNN
	1    7350 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR07
U 1 1 5BC66A97
P 7050 2700
F 0 "#PWR07" H 7050 2700 30  0001 C CNN
F 1 "GND" H 7050 2630 30  0001 C CNN
F 2 "" H 7050 2700 60  0000 C CNN
F 3 "" H 7050 2700 60  0000 C CNN
	1    7050 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 2700 7050 2650
Wire Wire Line
	7050 2650 7200 2650
Wire Wire Line
	7200 2650 7200 2750
$Comp
L R R4
U 1 1 5BC66D5C
P 6600 3350
F 0 "R4" V 6700 3350 50  0000 C CNN
F 1 "R" V 6600 3350 50  0000 C CNN
F 2 "" H 6600 3350 60  0001 C CNN
F 3 "" H 6600 3350 60  0000 C CNN
	1    6600 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	6600 3650 6850 3650
Wire Wire Line
	6850 3650 6850 3350
Wire Wire Line
	6850 3350 7100 3350
Wire Wire Line
	7100 3350 7100 3250
$Comp
L R R5
U 1 1 5BC66F51
P 6900 3800
F 0 "R5" V 7000 3800 50  0000 C CNN
F 1 "R" V 6900 3800 50  0000 C CNN
F 2 "" H 6900 3800 60  0001 C CNN
F 3 "" H 6900 3800 60  0000 C CNN
	1    6900 3800
	0    1    1    0   
$EndComp
Wire Wire Line
	6650 3800 6600 3800
Wire Wire Line
	6600 3800 6600 3600
Connection ~ 6600 3650
Wire Wire Line
	7200 3250 7200 3800
Wire Wire Line
	7150 3800 7350 3800
Wire Wire Line
	6600 3000 6600 3100
$Comp
L MAX6126 U2
U 1 1 5BC99EDB
P 7200 5100
F 0 "U2" H 7300 5450 60  0000 C CNN
F 1 "MAX6126" H 7500 4750 60  0000 C CNN
F 2 "" H 7200 5100 60  0001 C CNN
F 3 "" H 7200 5100 60  0000 C CNN
	1    7200 5100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR08
U 1 1 5BC9A03F
P 7100 4600
F 0 "#PWR08" H 7100 4560 30  0001 C CNN
F 1 "+3.3V" H 7100 4710 30  0000 C CNN
F 2 "" H 7100 4600 60  0000 C CNN
F 3 "" H 7100 4600 60  0000 C CNN
	1    7100 4600
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 5BC9A0A2
P 6750 5500
F 0 "C4" H 6800 5600 50  0000 L CNN
F 1 "100nF" H 6800 5400 50  0000 L CNN
F 2 "" H 6750 5500 60  0001 C CNN
F 3 "" H 6750 5500 60  0000 C CNN
	1    6750 5500
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR09
U 1 1 5BC9A12B
P 6750 5750
F 0 "#PWR09" H 6750 5750 30  0001 C CNN
F 1 "GND" H 6750 5680 30  0001 C CNN
F 2 "" H 6750 5750 60  0000 C CNN
F 3 "" H 6750 5750 60  0000 C CNN
	1    6750 5750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR010
U 1 1 5BC9A153
P 7200 5600
F 0 "#PWR010" H 7200 5600 30  0001 C CNN
F 1 "GND" H 7200 5530 30  0001 C CNN
F 2 "" H 7200 5600 60  0000 C CNN
F 3 "" H 7200 5600 60  0000 C CNN
	1    7200 5600
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR011
U 1 1 5BC9A17B
P 7850 5450
F 0 "#PWR011" H 7850 5450 30  0001 C CNN
F 1 "GND" H 7850 5380 30  0001 C CNN
F 2 "" H 7850 5450 60  0000 C CNN
F 3 "" H 7850 5450 60  0000 C CNN
	1    7850 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 5300 7850 5450
Wire Wire Line
	7550 5350 7850 5350
Wire Wire Line
	7850 4750 7850 4900
Wire Wire Line
	7550 4850 7900 4850
$Comp
L +VSensor #PWR012
U 1 1 5BC9A223
P 7850 4750
F 0 "#PWR012" H 7850 4710 30  0001 C CNN
F 1 "+VSensor" H 7850 4860 30  0000 C CNN
F 2 "" H 7850 4750 60  0000 C CNN
F 3 "" H 7850 4750 60  0000 C CNN
	1    7850 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 5000 7700 5000
Wire Wire Line
	7700 5000 7700 4850
Connection ~ 7700 4850
Wire Wire Line
	6750 5750 6750 5700
Wire Wire Line
	6750 5300 6750 5200
Wire Wire Line
	6750 5200 6850 5200
$Comp
L C C5
U 1 1 5BC9A0FF
P 7850 5100
F 0 "C5" H 7900 5200 50  0000 L CNN
F 1 "1uF" H 7900 5000 50  0000 L CNN
F 2 "" H 7850 5100 60  0001 C CNN
F 3 "" H 7850 5100 60  0000 C CNN
	1    7850 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7200 5600 7200 5550
Wire Wire Line
	7100 4600 7100 4650
Connection ~ 7850 4850
Connection ~ 7850 5350
$Comp
L C C3
U 1 1 5BC9A840
P 6400 5100
F 0 "C3" H 6450 5200 50  0000 L CNN
F 1 "100nF" H 6450 5000 50  0000 L CNN
F 2 "" H 6400 5100 60  0001 C CNN
F 3 "" H 6400 5100 60  0000 C CNN
	1    6400 5100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR013
U 1 1 5BC9A8BB
P 6400 5350
F 0 "#PWR013" H 6400 5350 30  0001 C CNN
F 1 "GND" H 6400 5280 30  0001 C CNN
F 2 "" H 6400 5350 60  0000 C CNN
F 3 "" H 6400 5350 60  0000 C CNN
	1    6400 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	6400 5350 6400 5300
Wire Wire Line
	6400 4850 6400 4900
$Comp
L +3.3V #PWR014
U 1 1 5BC9A9D6
P 6400 4850
F 0 "#PWR014" H 6400 4810 30  0001 C CNN
F 1 "+3.3V" H 6400 4960 30  0000 C CNN
F 2 "" H 6400 4850 60  0000 C CNN
F 3 "" H 6400 4850 60  0000 C CNN
	1    6400 4850
	1    0    0    -1  
$EndComp
$Comp
L +VSensor #PWR015
U 1 1 5BC9ABBB
P 7350 3700
F 0 "#PWR015" H 7350 3660 30  0001 C CNN
F 1 "+VSensor" H 7350 3810 30  0000 C CNN
F 2 "" H 7350 3700 60  0000 C CNN
F 3 "" H 7350 3700 60  0000 C CNN
	1    7350 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 3800 7350 3700
Connection ~ 7200 3800
$Comp
L CONN_1 TP1
U 1 1 5BC9AFDC
P 8050 4850
F 0 "TP1" H 8130 4850 40  0000 L CNN
F 1 "CONN_1" H 8050 4905 30  0001 C CNN
F 2 "" H 8050 4850 60  0001 C CNN
F 3 "" H 8050 4850 60  0000 C CNN
	1    8050 4850
	1    0    0    -1  
$EndComp
$Comp
L MAX11201 U3
U 1 1 5BCA0852
P 4500 3200
F 0 "U3" H 4750 3700 60  0000 C CNN
F 1 "MAX11201" H 4800 2700 60  0000 C CNN
F 2 "" H 4500 3200 60  0001 C CNN
F 3 "" H 4500 3200 60  0000 C CNN
	1    4500 3200
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5BCA0A75
P 5050 3150
F 0 "#PWR016" H 5050 3150 30  0001 C CNN
F 1 "GND" H 5050 3080 30  0001 C CNN
F 2 "" H 5050 3150 60  0000 C CNN
F 3 "" H 5050 3150 60  0000 C CNN
	1    5050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 3100 5050 3150
Wire Wire Line
	4950 3000 6800 3000
Connection ~ 6600 3000
$Comp
L +VSensor #PWR017
U 1 1 5BCA0B98
P 5250 3350
F 0 "#PWR017" H 5250 3310 30  0001 C CNN
F 1 "+VSensor" H 5250 3460 30  0000 C CNN
F 2 "" H 5250 3350 60  0000 C CNN
F 3 "" H 5250 3350 60  0000 C CNN
	1    5250 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 3100 5050 3100
Wire Wire Line
	4950 3400 5250 3400
Wire Wire Line
	5250 3400 5250 3350
Wire Wire Line
	5250 3550 5250 3500
Wire Wire Line
	5250 3500 4950 3500
$Comp
L GND #PWR018
U 1 1 5BCA0D60
P 5250 3550
F 0 "#PWR018" H 5250 3550 30  0001 C CNN
F 1 "GND" H 5250 3480 30  0001 C CNN
F 2 "" H 5250 3550 60  0000 C CNN
F 3 "" H 5250 3550 60  0000 C CNN
	1    5250 3550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5BCA1034
P 4500 3800
F 0 "#PWR019" H 4500 3800 30  0001 C CNN
F 1 "GND" H 4500 3730 30  0001 C CNN
F 2 "" H 4500 3800 60  0000 C CNN
F 3 "" H 4500 3800 60  0000 C CNN
	1    4500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4500 3800 4500 3750
$Comp
L +3.3V #PWR020
U 1 1 5BCA1121
P 4400 2600
F 0 "#PWR020" H 4400 2560 30  0001 C CNN
F 1 "+3.3V" H 4400 2710 30  0000 C CNN
F 2 "" H 4400 2600 60  0000 C CNN
F 3 "" H 4400 2600 60  0000 C CNN
	1    4400 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2600 4400 2650
$Comp
L INDUCTOR L1
U 1 1 5BCA135C
P 3300 2050
F 0 "L1" V 3450 2050 60  0000 C CNN
F 1 "FB100" V 3250 2050 40  0000 C CNN
F 2 "" H 3300 2050 60  0001 C CNN
F 3 "" H 3300 2050 60  0000 C CNN
	1    3300 2050
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 5BCA13D8
P 3700 2300
F 0 "C6" H 3750 2400 50  0000 L CNN
F 1 "100nF" H 3750 2200 50  0000 L CNN
F 2 "" H 3700 2300 60  0001 C CNN
F 3 "" H 3700 2300 60  0000 C CNN
	1    3700 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR021
U 1 1 5BCA1445
P 3700 2550
F 0 "#PWR021" H 3700 2550 30  0001 C CNN
F 1 "GND" H 3700 2480 30  0001 C CNN
F 2 "" H 3700 2550 60  0000 C CNN
F 3 "" H 3700 2550 60  0000 C CNN
	1    3700 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3700 2550 3700 2500
Wire Wire Line
	3600 2050 4600 2050
Wire Wire Line
	3700 2050 3700 2100
Wire Wire Line
	4600 2050 4600 2650
Connection ~ 3700 2050
Wire Wire Line
	2800 1950 2800 2050
Wire Wire Line
	2800 2050 3000 2050
$Comp
L +3.3V #PWR022
U 1 1 5BCA1671
P 2800 1950
F 0 "#PWR022" H 2800 1910 30  0001 C CNN
F 1 "+3.3V" H 2800 2060 30  0000 C CNN
F 2 "" H 2800 1950 60  0000 C CNN
F 3 "" H 2800 1950 60  0000 C CNN
	1    2800 1950
	1    0    0    -1  
$EndComp
Text GLabel 1350 3550 0    45   Output ~ 0
SPI_SCK
Text GLabel 1350 3450 0    45   Input ~ 0
SPI_MISO
Wire Wire Line
	1350 3450 1450 3450
Wire Wire Line
	1450 3550 1350 3550
NoConn ~ 1450 3250
NoConn ~ 1450 3350
NoConn ~ 2150 3250
NoConn ~ 2150 3350
NoConn ~ 2150 3450
NoConn ~ 2150 3550
Text GLabel 3950 3050 0    45   Input ~ 0
SPI_SCK
Text GLabel 3950 3200 0    45   Output ~ 0
SPI_MISO
Wire Wire Line
	3950 3200 4050 3200
Wire Wire Line
	4050 3050 3950 3050
$Comp
L C C1
U 1 1 5BCA36CA
P 1800 5100
F 0 "C1" H 1850 5200 50  0000 L CNN
F 1 "10uF" H 1850 5000 50  0000 L CNN
F 2 "" H 1800 5100 60  0001 C CNN
F 3 "" H 1800 5100 60  0000 C CNN
	1    1800 5100
	1    0    0    -1  
$EndComp
$Comp
L C C2
U 1 1 5BCAEE4D
P 2100 5100
F 0 "C2" H 2150 5200 50  0000 L CNN
F 1 "100nF" H 2150 5000 50  0000 L CNN
F 2 "" H 2100 5100 60  0001 C CNN
F 3 "" H 2100 5100 60  0000 C CNN
	1    2100 5100
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR023
U 1 1 5BCAF3D5
P 1800 4800
F 0 "#PWR023" H 1800 4760 30  0001 C CNN
F 1 "+3.3V" H 1800 4910 30  0000 C CNN
F 2 "" H 1800 4800 60  0000 C CNN
F 3 "" H 1800 4800 60  0000 C CNN
	1    1800 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 4800 1800 4900
Wire Wire Line
	1800 4850 3600 4850
Wire Wire Line
	2100 4850 2100 4900
Connection ~ 1800 4850
$Comp
L GND #PWR024
U 1 1 5BCAF4E7
P 1800 5350
F 0 "#PWR024" H 1800 5350 30  0001 C CNN
F 1 "GND" H 1800 5280 30  0001 C CNN
F 2 "" H 1800 5350 60  0000 C CNN
F 3 "" H 1800 5350 60  0000 C CNN
	1    1800 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 5350 1800 5300
Wire Wire Line
	2100 5350 2100 5300
$Comp
L GND #PWR025
U 1 1 5BCAF600
P 2100 5350
F 0 "#PWR025" H 2100 5350 30  0001 C CNN
F 1 "GND" H 2100 5280 30  0001 C CNN
F 2 "" H 2100 5350 60  0000 C CNN
F 3 "" H 2100 5350 60  0000 C CNN
	1    2100 5350
	1    0    0    -1  
$EndComp
$Comp
L C C7
U 1 1 5BCAFD0A
P 2400 5100
F 0 "C7" H 2450 5200 50  0000 L CNN
F 1 "100nF" H 2450 5000 50  0000 L CNN
F 2 "" H 2400 5100 60  0001 C CNN
F 3 "" H 2400 5100 60  0000 C CNN
	1    2400 5100
	1    0    0    -1  
$EndComp
$Comp
L C C8
U 1 1 5BCAFD64
P 2700 5100
F 0 "C8" H 2750 5200 50  0000 L CNN
F 1 "100nF" H 2750 5000 50  0000 L CNN
F 2 "" H 2700 5100 60  0001 C CNN
F 3 "" H 2700 5100 60  0000 C CNN
	1    2700 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2400 4850 2400 4900
Connection ~ 2100 4850
Wire Wire Line
	2700 4850 2700 4900
Connection ~ 2400 4850
$Comp
L GND #PWR026
U 1 1 5BCB0BC3
P 2400 5350
F 0 "#PWR026" H 2400 5350 30  0001 C CNN
F 1 "GND" H 2400 5280 30  0001 C CNN
F 2 "" H 2400 5350 60  0000 C CNN
F 3 "" H 2400 5350 60  0000 C CNN
	1    2400 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR027
U 1 1 5BCB0BFF
P 2700 5350
F 0 "#PWR027" H 2700 5350 30  0001 C CNN
F 1 "GND" H 2700 5280 30  0001 C CNN
F 2 "" H 2700 5350 60  0000 C CNN
F 3 "" H 2700 5350 60  0000 C CNN
	1    2700 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5350 2700 5300
Wire Wire Line
	2400 5350 2400 5300
$Comp
L R R6
U 1 1 5BCB1818
P 5850 3100
F 0 "R6" V 5950 3100 50  0000 C CNN
F 1 "0" V 5850 3100 45  0000 C CNN
F 2 "" H 5850 3100 60  0001 C CNN
F 3 "" H 5850 3100 60  0000 C CNN
	1    5850 3100
	0    1    1    0   
$EndComp
Wire Wire Line
	5600 3100 5550 3100
Wire Wire Line
	5550 3100 5550 3000
Connection ~ 5550 3000
Wire Wire Line
	6100 3100 6150 3100
Wire Wire Line
	6150 3100 6150 3000
Connection ~ 6150 3000
$Comp
L OSC X1
U 1 1 5BCB29B4
P 4500 5100
F 0 "X1" H 4700 5400 60  0000 C CNN
F 1 "OSC" H 4700 4800 60  0000 C CNN
F 2 "" H 4500 5100 60  0001 C CNN
F 3 "" H 4500 5100 60  0000 C CNN
	1    4500 5100
	1    0    0    -1  
$EndComp
Text GLabel 4950 5100 2    45   Output ~ 0
MCLK
Wire Wire Line
	4950 5100 4850 5100
Wire Wire Line
	4500 5450 4500 5400
Wire Wire Line
	4500 4750 4500 4800
NoConn ~ 4150 5100
$Comp
L +3.3V #PWR028
U 1 1 5BCB2C83
P 4500 4750
F 0 "#PWR028" H 4500 4710 30  0001 C CNN
F 1 "+3.3V" H 4500 4860 30  0000 C CNN
F 2 "" H 4500 4750 60  0000 C CNN
F 3 "" H 4500 4750 60  0000 C CNN
	1    4500 4750
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR029
U 1 1 5BCB2CC3
P 4500 5450
F 0 "#PWR029" H 4500 5450 30  0001 C CNN
F 1 "GND" H 4500 5380 30  0001 C CNN
F 2 "" H 4500 5450 60  0000 C CNN
F 3 "" H 4500 5450 60  0000 C CNN
	1    4500 5450
	1    0    0    -1  
$EndComp
Text GLabel 3950 3450 0    45   Input ~ 0
MCLK
Wire Wire Line
	3950 3450 4050 3450
$Comp
L C C9
U 1 1 5BCB5C13
P 3000 5100
F 0 "C9" H 3050 5200 50  0000 L CNN
F 1 "100nF" H 3050 5000 50  0000 L CNN
F 2 "" H 3000 5100 60  0001 C CNN
F 3 "" H 3000 5100 60  0000 C CNN
	1    3000 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3000 4850 3000 4900
Connection ~ 2700 4850
Wire Wire Line
	3000 5350 3000 5300
$Comp
L GND #PWR030
U 1 1 5BCB5D6A
P 3000 5350
F 0 "#PWR030" H 3000 5350 30  0001 C CNN
F 1 "GND" H 3000 5280 30  0001 C CNN
F 2 "" H 3000 5350 60  0000 C CNN
F 3 "" H 3000 5350 60  0000 C CNN
	1    3000 5350
	1    0    0    -1  
$EndComp
$Comp
L CONN_1 TP2
U 1 1 5BCB68D8
P 2200 5750
F 0 "TP2" H 2280 5750 40  0000 L CNN
F 1 "CONN_1" H 2200 5805 30  0001 C CNN
F 2 "" H 2200 5750 60  0001 C CNN
F 3 "" H 2200 5750 60  0000 C CNN
	1    2200 5750
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR031
U 1 1 5BCB69B7
P 2450 5850
F 0 "#PWR031" H 2450 5850 30  0001 C CNN
F 1 "GND" H 2450 5780 30  0001 C CNN
F 2 "" H 2450 5850 60  0000 C CNN
F 3 "" H 2450 5850 60  0000 C CNN
	1    2450 5850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 5850 2450 5750
Wire Wire Line
	2450 5750 2350 5750
$Comp
L CP C10
U 1 1 5BCB7245
P 3300 5100
F 0 "C10" H 3350 5200 50  0000 L CNN
F 1 "2,2uF" H 3350 5000 50  0000 L CNN
F 2 "" H 3300 5100 60  0001 C CNN
F 3 "" H 3300 5100 60  0000 C CNN
	1    3300 5100
	1    0    0    -1  
$EndComp
$Comp
L CP C11
U 1 1 5BCB729A
P 3600 5100
F 0 "C11" H 3650 5200 50  0000 L CNN
F 1 "2,2uF" H 3650 5000 50  0000 L CNN
F 2 "" H 3600 5100 60  0001 C CNN
F 3 "" H 3600 5100 60  0000 C CNN
	1    3600 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 4850 3300 4900
Connection ~ 3000 4850
Wire Wire Line
	3600 4850 3600 4900
Connection ~ 3300 4850
$Comp
L GND #PWR032
U 1 1 5BCB74F0
P 3300 5350
F 0 "#PWR032" H 3300 5350 30  0001 C CNN
F 1 "GND" H 3300 5280 30  0001 C CNN
F 2 "" H 3300 5350 60  0000 C CNN
F 3 "" H 3300 5350 60  0000 C CNN
	1    3300 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 5350 3300 5300
Wire Wire Line
	3600 5350 3600 5300
$Comp
L GND #PWR033
U 1 1 5BCB77C6
P 3600 5350
F 0 "#PWR033" H 3600 5350 30  0001 C CNN
F 1 "GND" H 3600 5280 30  0001 C CNN
F 2 "" H 3600 5350 60  0000 C CNN
F 3 "" H 3600 5350 60  0000 C CNN
	1    3600 5350
	1    0    0    -1  
$EndComp
$EndSCHEMATC