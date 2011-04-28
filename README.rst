===============
HW_L1_48_MODULE
===============

This project is a 19mm x 52mm PCB to emulate a 600mil (0.6") wide 40-pin DIP package PCB that contains the XS1-L1-48TQFP and all required system support circuitry.

Files
--------

The following folders are provided in repository:

- design_files - schematics, BOM, gerbers and DxDesigner/PADS design files.

	- 1V0 - initial tested prototype board that uses the 7-pin JTAG header from an XTAG2
	- 1V1 - improved but untested design that allows an XTAG2 to mount directly onto the board
	
- photos - some photos of the hand soldered prototypes.

- software - example software that was used to check the operation of the boards on some breadboard.


Features
--------

- XMOS XS1-L1-TQFP48
- 8 x 100nF decouplers (4 per supply rail).
- 3V3->1V0 SMPS Regulator (NCP1521B)
- PLL loop filter (100nf + 4R7)
- 4 MBit Winbond W25X40 SPI FLASH.
- Reset circuit using dual Diodes Inc. APX803-29SR 2.9V voltage supervisors. There are many pin compatible supervisors available in this SOT23-3 package.
- It has TRST wired to RST, removing the need for the dual open-drain buffer. The JTAG tap is reset using 5 TCK clocks with TMS high.
- The system clock is a 25MHz 2.5x3.2mm oscillator (Pericom FKSSD1025).
- 7 pin JTAG header (as per XTAG2) to allow programming when integrated into a system (details of simple adapter in jtag_adpater directory).
- 3V3 power input only.
- Simple 2 layer PCB with 0.15mm/0.15mm track and gap and 0.3mm minimum hole size (can be made at PCBTrain for £57.75 for 10 on a 15 working day turn).
- Future provision could be made to make the module suitable for surface mount when the through hole pins are not populated.
- The module can be easily assembled by hand with a soldering iron, some fine solder and a hot air reflow gun (for the oscillator and L1-48 ground paddle).


Pinout
------

The module provides the following pinout:

- 28 pins I/O - 16 x 1, 8 x 1, 4(32) x 1
- 4 GND
- 2 3V3 power
- 6 JTAG signals (no DEBUG).


Board Revisions
---------------

0V9:

- Initial prototype.
- Board the same as 1V0.

1V0:

- Changed R3 from 10K to 1K to guarantee correct reset under all conditions and to allow for the current drawn by U5.
- Changed C2 to 100nF from 1uF.
- Changed U3 from a Winbond W25X10 to a Winbond W25X40, due to parts availability.

1V1:

- Changed the JTAG out connector to be compatible with the XTAG2. The top silkscreen has been changed to show the orientation required by the XTAG2 to connect onto the headers correctly. Due to reordering these pins, the pinout of the JTAG pins on the 40-pin DIP headers has changed.
- This board has been designed, but not build/tested - therefore manufacture this design at your own risk.
