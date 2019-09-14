/***************************************************************************//**
* @file ad9517.c
* @brief Implementation of AD9517 Driver.
* @author DBogdan (dragos.bogdan@analog.com)
********************************************************************************
* Copyright 2014(c) Analog Devices, Inc.
*
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
* - Redistributions of source code must retain the above copyright
* notice, this list of conditions and the following disclaimer.
* - Redistributions in binary form must reproduce the above copyright
* notice, this list of conditions and the following disclaimer in
* the documentation and/or other materials provided with the
* distribution.
* - Neither the name of Analog Devices, Inc. nor the names of its
* contributors may be used to endorse or promote products derived
* from this software without specific prior written permission.
* - The use of this software may or may not infringe the patent rights
* of one or more patent holders. This license does not release you
* from the requirement that you obtain separate licenses from these
* patent holders to use this software.
* - Use of the software either in source or binary form, must be run
* on or directly connected to an Analog Devices Inc. component.
*
* THIS SOFTWARE IS PROVIDED BY ANALOG DEVICES "AS IS" AND ANY EXPRESS OR
* IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, NON-INFRINGEMENT,
* MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
* IN NO EVENT SHALL ANALOG DEVICES BE LIABLE FOR ANY DIRECT, INDIRECT,
* INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
* LIMITED TO, INTELLECTUAL PROPERTY RIGHTS, PROCUREMENT OF SUBSTITUTE GOODS OR
* SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
* CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
* OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
* OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*******************************************************************************/

/******************************************************************************/
/***************************** Include Files **********************************/
/******************************************************************************/
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include "platform_drivers.h"
#include "ad9517.h"

/******************************************************************************/
/************************ Variables Definitions *******************************/
/******************************************************************************/
uint8_t ad9517_slave_select;

/***************************************************************************//**
* @brief ad9517_spi_read
*******************************************************************************/
int32_t ad9517_spi_read(struct ad9517_dev *dev,
						uint16_t reg_addr,
						uint8_t *reg_data)
{
	uint8_t buf[5];
	int32_t ret;

	buf[0] = 0x84;
	buf[1] = 0x80 | (reg_addr >> 8);
	buf[2] = reg_addr & 0xFF;
	buf[3] = 0x00;
	buf[4] = 0x00;

	ret = spi_write_and_read(dev->spi_desc, buf, 4);
	*reg_data = buf[3];

	return ret;
}

/***************************************************************************//**
* @brief ad9517_spi_write
*******************************************************************************/
int32_t ad9517_spi_write(struct ad9517_dev *dev,
						 uint16_t reg_addr,
						 uint8_t reg_data)
{
	uint8_t buf[4];
	int32_t ret;

	buf[0] = 0x84;
	buf[1] = reg_addr >> 8;
	buf[2] = reg_addr & 0xFF;
	buf[3] = reg_data;

	ret = spi_write_and_read(dev->spi_desc, buf, 4);

	return ret;
}

/***************************************************************************//**
* @brief ad9517_setup
*******************************************************************************/
int32_t ad9517_setup(struct ad9517_dev **device,
					 struct ad9517_init_param init_param)
{
	uint8_t stat;
	int32_t ret;
	struct ad9517_dev *dev;

	/* Allocate memory for device descriptor */
	dev = (struct ad9517_dev *)malloc(sizeof(*dev));
	if (!dev)
		return -1;

	/* Setup SPI descriptor */
	ret = spi_init(&dev->spi_desc, &init_param.spi_init);

	ad9517_spi_write(dev, 0x0010, 0x7c);
	ad9517_spi_write(dev, 0x0014, 0x05);
	ad9517_spi_write(dev, 0x0016, 0x05);
	ad9517_spi_write(dev, 0x001c, 0x02);
	ad9517_spi_write(dev, 0x00f1, 0x08);
	ad9517_spi_write(dev, 0x00f5, 0x08);
	ad9517_spi_write(dev, 0x0140, 0x42);
	ad9517_spi_write(dev, 0x0141, 0x42);
	ad9517_spi_write(dev, 0x0142, 0x42);
	ad9517_spi_write(dev, 0x0143, 0x43);
	ad9517_spi_write(dev, 0x0190, 0x21);
	ad9517_spi_write(dev, 0x0191, 0x00);
	ad9517_spi_write(dev, 0x0197, 0x80);
	ad9517_spi_write(dev, 0x0198, 0x02);
	ad9517_spi_write(dev, 0x0199, 0x21);
	ad9517_spi_write(dev, 0x019c, 0x20);
	ad9517_spi_write(dev, 0x019e, 0x21);
	ad9517_spi_write(dev, 0x01a0, 0x11);
	ad9517_spi_write(dev, 0x01a1, 0x20);
	ad9517_spi_write(dev, 0x01e0, 0x00);
	ad9517_spi_write(dev, 0x01e1, 0x02);
	ad9517_spi_write(dev, 0x0232, 0x01);
	ad9517_spi_write(dev, 0x0018, 0x06);
	ad9517_spi_write(dev, 0x0232, 0x01);
	mdelay(50);

	ad9517_spi_write(dev, 0x0018, 0x07);
	ad9517_spi_write(dev, 0x0232, 0x01);
	mdelay(50);

	ad9517_spi_read(dev, 0x001f, &stat);


	xil_printf("AD9517 PLL %s (0x%x).\n", stat & 0x01 ? "ok" : "errors", stat);
	ad9517_status(dev);


	*device = dev;

	return ret;
}

/***************************************************************************//**
* @brief ad9517_setup
*******************************************************************************/
int32_t ad9517_status(struct ad9517_dev *dev)
{
	uint8_t stat;
	uint8_t stat2;
	uint8_t stat3;
	uint16_t addr;

	xil_printf("\n\nAD9517 status\n==========================\n");
	addr = 0x0000;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x"
			"\n\tSDO active: 0x%z; "
			"\n\tLSB first: 0x%x; "
			"\n\tSoft reset: 0x%x\n", addr, stat,
			stat & 0x1, (stat >> 0x1) & 0x1,  (stat >> 3) & 0x1 );

	addr = 0x0003;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => \n\tPart ID: 0x%x.\n", addr, stat & 0xFF);


	xil_printf("\nAD9517 PLL status\n");
	addr = 0x0010;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x"
			"\n\tPDF polarity: 0x%x, "
			"\n\tCharge pump: 0x%x, "
			"\n\tcharge pump mode: 0x%x, "
			"\n\tPLL power-down: 0x%x\n",addr, stat,
			(stat >> 7) & 0x1, (stat >> 4) & 0x7,
			(stat >> 2) & 0x3 , stat & (0x3));


	addr = 0x0011;
	ad9517_spi_read(dev, addr, &stat);
	addr = 0x0012;
	ad9517_spi_read(dev, addr, &stat2);
	xil_printf("ADDR 0x%x => \n\tR counter: 0x%x\n", addr, stat + ((stat2 & 0x3F) << 8));

	addr = 0x0013;
	ad9517_spi_read(dev, addr, &stat2);
	xil_printf("ADDR 0x%x => \n\tA counter: 0x%x\n", addr, ((stat2 & 0x3F)));

	addr = 0x0014;
	ad9517_spi_read(dev, addr, &stat);
	addr = 0x0015;
	ad9517_spi_read(dev, addr, &stat2);
	xil_printf("ADDR 0x%x => \n\tB Counter: 0x%x\n", addr, stat + ((stat2 & 0x1F) << 8));

    return 0;
	addr = 0x0016;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL1 -> 0x%x"
			"\n\tVcp/2: 0x%x, \n\tReset R: 0x%x, "
			"\n\tReset A and B: 0x%x, \n\tReset all: 0x%x, "
			"\n\tBypass B: 0x%x, \n\tPrescaler: 0x%x\n", addr, stat,
			 0x1 & (stat >> 7), 0x1 & (stat >> 6), 0x1 & (stat >> 5), 0x1 &  (stat >> 4), 0x1 & (stat >> 3), 0x1 & (stat));

	addr = 0x0017;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL2 -> 0x%x"
			"\n\tSTATUS pin control: 0x%x, "
			"\n\tAntibacklash pulse width: 0x%x\n", addr, stat,
				0x1F & (stat >> 2), stat & 0x3);

	addr = 0x0018;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL3 -> 0x%x"
			"\n\tLock detect counter: 0x%x, "
			"\n\tDigital lock detect window: 0x%x, "
			"\n\tDisable Digital lock detect window: 0x%x, "
			"\n\tVCO calibration divider: 0x%x, "
			"\n\tVCO cal now: 0x%x\n", addr, stat,
			0x3 & ( stat >> 5), 0x1 & ( stat >> 4), 0x1 & ( stat >> 3), 0x3 & ( stat >> 1), stat & 0x1);
	addr = 0x0019;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL4 -> 0x%x"
			"\n\tR, A, B counters: 0x%x, "
			"\n\tR path delay: 0x%x, \n\t"
			"N path delay: 0x%x\n", addr, stat,
			0x3 & (stat >> 6), 0x7 & (stat >> 3), 0x7 & (stat >> 0));

	addr = 0x001A;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL5 -> 0x%x\n\t"
			"Reference frequency monitor threshold : 0x%x, \n\t"
			"LD pin control 0x%x\n", addr, stat,
			0x3F & (stat >> 6), 0x3F & (stat));
	addr = 0x001B;
		ad9517_spi_read(dev, addr, &stat);
		xil_printf("ADDR 0x%x => PLL6 -> \n\t"
				"VCO frequency monitor: %d, \n\t"
				"REF2: %d, REF1: 0x%x, \n\t"
				"REFMON: 0x%x\n", addr, stat,
				0x1 & (stat >> 7), 0x1 & (stat >> 6), 0x1 & (stat >> 5), 0x1F & (stat >> 0x0));

	addr = 0x001C;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL7 -> 0x%x\n\t"
			"Disable switchover: 0x%x \n\t"
			"REF2: 0x%x \n\t"
			"REF_SEL: 0x%x \n\t"
			"REF2 power on: 0x%x \n\t"
			"REF1 power on: 0x%x \n\t"
			"Differential: 0x%x\n", addr, stat,
			0x1 & (stat >> 7), 0x1 & (stat >> 6), 0x1 & (stat >> 5), 0x1 & (stat >> 2), 0x1 & (stat >> 1), stat & 0x1);

	addr = 0x001D;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL8 -> 0x%x\n\t"
			"PLL status: 0x%x \n\t"
			"LD pin comparator: 0x%x \n\t"
			"Holdover: 0x%x, External "
			"Handover: 0x%x, \n\t"
			"External Handover enable: 0x%x\n", addr, stat,
			0x1 & (stat >> 4), 0x1 & (stat >> 3), 0x1 & (stat >> 2), 0x1 & (stat >> 1), stat & 0x1);

	addr = 0x001F;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => PLL Status -> 0x%x\n\t"
			"VCO cal: 0x%x \n\t"
			"Holdover: 0x%x \n\t"
			"REF2: 0x%x \n\t"
			"VCO > threshold: 0x%x \n\t"
			"Ref2  > threshold: 0x%x \n\t"
			"Ref1  > threshold: 0x%x \n\t"
			"Digtial lock: 0x%x\n", addr, stat,
			0x1 & (stat >> 6), 0x1 & (stat >> 5), 0x1 & (stat >> 4), 0x1 & (stat >> 3), 0x1 & (stat >> 2), 0x1 & (stat >> 1), stat & 0x1);


	xil_printf("ADDR 0x\nAD9517 Fine Delay status\n");
	addr = 0x0A0;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("ADDR 0x%x OUT4 delay bypass=> 0x%x\n\t"
			"active: 0x%x, \n\t"
			"ramp capacitors: 0x%x, \n\t"
			"ramp current: 0x%x  \n\t"
			"delay fraction: 0x%x\n", addr, stat,
				stat & (0x1), 0x7  & (stat2 >> 3), 0x7 & stat2, stat3 & 0x7F);
	addr = 0x0A3;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("ADDR 0x%x OUT5 delay bypass=> 0x%x\n\t"
			"active: 0x%x, \n\t"
			"ramp capacitors: 0x%x, \n\t"
			"ramp current: 0x%x  \n\t"
			"delay fraction: 0x%x\n", addr, stat,
			stat & (0x1), 0x7  & (stat2 >> 3), 0x7 & stat2, stat3 & 0x7F);
	addr = 0x0A6;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("ADDR 0x%x OUT6 delay bypass=> 0x%x\n\t"
			"active: 0x%x, \n\t"
			"ramp capacitors: 0x%x, \n\t"
			"ramp current: 0x%x  \n\t"
			"delay fraction: 0x%x\n", addr, stat,
			stat & (0x1), 0x7  & (stat2 >> 3), 0x7 & stat2, stat3 & 0x7F);
	addr = 0x0A9;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("ADDR 0x%x OUT7 delay bypass=> 0x%x\n\t"
			"active: 0x%x, \n\t"
			"ramp capacitors: 0x%x, \n\t"
			"ramp current: 0x%x  \n\t"
			"delay fraction: 0x%x\n", addr, stat,
			stat & (0x1), 0x7  & (stat2 >> 3), 0x7 & stat2, stat3 & 0x7F);


	xil_printf("\nAD9517 LVPECL output status\n");
	addr = 0x0F0;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT0=> 0x%x\n\t"
			"invert: 0x%x \n\t"
			"differential voltage: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x1 & (stat2 >> 4), 0x3 & (stat2 >> 2), stat & 0x3);
	addr = 0x0F1;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT1=> 0x%x\n\t"
			"invert: 0x%x \n\t"
			"differential voltage: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x1 & (stat2 >> 4), 0x3 & (stat2 >> 2), stat & 0x3);
	addr = 0x0F4;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT2=> 0x%x\n\t"
			"invert: 0x%x \n\t"
			"differential voltage: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x1 & (stat2 >> 4), 0x3 & (stat2 >> 2), stat & 0x3);
	addr = 0x0F5;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT3=> 0x%x\n\t"
			"invert: 0x%x \n\t"
			"differential voltage: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x1 & (stat2 >> 4), 0x3 & (stat2 >> 2), stat & 0x3);


	xil_printf("\nAD9517 LVDS/CMOS output status\n");
	addr = 0x140;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT4=> 0x%x\n\t"
			"CMOS polarity: 0x%x \n\t"
			"LVDS/CMOS polarity: 0x%x \n\t"
			"CMOS B: %d, Select LVDS/CMOS: 0x%x \n\t"
			"output current: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x3 & (stat2 >> 6), 0x1 & (stat2 >> 5), 0x1 & (stat2 >> 4), 0x1 & (stat2 >> 3), 0x3 & (stat2 >> 1), stat & 0x1);
	addr = 0x141;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT5=> 0x%x\n\t"
			"CMOS polarity: 0x%x \n\t"
			"LVDS/CMOS polarity: 0x%x \n\t"
			"CMOS B: %d, Select LVDS/CMOS: 0x%x \n\t"
			"output current: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x3 & (stat2 >> 6), 0x1 & (stat2 >> 5), 0x1 & (stat2 >> 4), 0x1 & (stat2 >> 3), 0x3 & (stat2 >> 1), stat & 0x1);
	addr = 0x142;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT5=> 0x%x\n\t"
			"CMOS polarity: 0x%x \n\t"
			"LVDS/CMOS polarity: 0x%x \n\t"
			"CMOS B: %d, Select LVDS/CMOS: 0x%x \n\t"
			"output current: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x3 & (stat2 >> 6), 0x1 & (stat2 >> 5), 0x1 & (stat2 >> 4), 0x1 & (stat2 >> 3), 0x3 & (stat2 >> 1), stat & 0x1);
	addr = 0x143;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x OUTPUT5=> 0x%x\n\t"
			"CMOS polarity: 0x%x \n\t"
			"LVDS/CMOS polarity: 0x%x \n\t"
			"CMOS B: %d, Select LVDS/CMOS: 0x%x \n\t"
			"output current: 0x%x \n\t"
			"power-down: 0x%x\n", addr, stat,
			0x3 & (stat2 >> 6), 0x1 & (stat2 >> 5), 0x1 & (stat2 >> 4), 0x1 & (stat2 >> 3), 0x3 & (stat2 >> 1), stat & 0x1);


	xil_printf("\nAD9517 LVPECL Channel Dividers status\n");
	addr = 0x190;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => 0x%x\n\t"
			"Divider 0 low cycles: 0x%x \n\t"
			"Divider 0 high cycles: 0x%x\n", addr, stat,
			0xF & (stat >> 4), stat & 0xF);
	addr = 0x191;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Bypass Divider 0: 0x%x \n\t"
			"Divider 0 nosync: 0x%x \n\t"
			"Divider 0 force high: 0x%x \n\t"
			"Start High Divider 0:  0x%x \n\t"
			"Divider 0 phase offset: 0x%x\n", addr, stat,
			0x1 & (stat >> 7), 0x1 & (stat >> 6), 0x1 & (stat >> 5), 0x1 & (stat >> 4), stat & 0xF);
	addr = 0x192;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => Divider 0 0x%x \n\t"
			"direct2output: 0x%x \n\t"
			"Divider 0 DCCOFF: 0x%x\n", addr, stat,
			0x1 & (stat >> 1), stat & 0x1);
	addr = 0x196;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => Divider 1 0x%x \n\t"
			"low cycles: 0x%x \n\t"
			"Divider 1 high cycles: 0x%x\n", addr, stat,
			0xF & (stat >> 4), stat & 0xF);
	addr = 0x197;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Bypass Divider 1: 0x%x \n\t"
			"Divider 1 nosync: 0x%x \n\t"
			"Divider 1 force high: 0x%x \n\t"
			"Start High Divider 1: 0x%x \n\t"
			"Divider 1 phase offset: 0x%x\n", addr, stat,
			0x1 & (stat >> 7), 0x1 & (stat >> 6), 0x1 & (stat >> 5), 0x1 & (stat >> 4), stat & 0xF);
	addr = 0x198;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Divider 1 direct2output: 0x%x, \n\t"
			"Divider 1 DCCOFF: 0x%x\n", addr, stat,
			0x1 & (stat >> 1), stat & 0x1);


	xil_printf("\nAD9517 LVDS Channel Dividers status\n");
	addr = 0x199;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Low Cycles Divider 2.1: 0x%x \n\t"
			"High Cycles Divider 2.1: 0x%x\n", addr, stat,
			0xF  & (stat >> 4), stat & 0xF);
	addr = 0x19A;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Phase Offset Divider 2.2: 0x%x \n\t"
			"Phase Offset Divider 2.1: 0x%x\n", addr, stat,
			0xF  & (stat >> 4), stat & 0xF);
	addr = 0x19B;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Low Cycles Divider 2.2: 0x%x \n\t"
			"High Cycles Divider 2.2: 0x%x\n", addr, stat,
			0xF  & (stat >> 4), stat & 0xF);
	addr = 0x19C;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Bypass Divider 2.2: 0x%x \n\t"
			"Bypass Divider 2.1: 0x%x \n\t"
			"Divider 2 nosync: 0x%x \n\t"
			"Divider 2 force high: 0x%x \n\t"
			"Start High Divider 2.2: 0x%x \n\t"
			"Start High Divider 2.1: 0x%x\n", addr, stat,
			0x1 & (stat >> 5), 0x1 & (stat >> 4), 0x1 & (stat >> 3), 0x1 & (stat >> 2), 0x1 & (stat >> 1), stat & 0x1);
	addr = 0x19D;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => Divider 2 \n\t"
			"DCCOFF: %d\n", addr, stat & 0x1);
	addr = 0x19E;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x \n\t"
			"Low Cycles Divider 3.1: 0x%x \n\t"
			"High Cycles Divider 3.1: 0x%x\n", addr, stat,
			0xF  & (stat >> 4), stat & 0xF);
	addr = 0x19F;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x \n\t"
			"Phase Offset Divider 3.2: 0x%x \n\t"
			"Phase Offset Divider 3.1: 0x%x\n", addr, stat,
			0xF  & (stat >> 4), stat & 0xF);
	addr = 0x1A0;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Low Cycles Divider 3.2: 0x%x\n\t"
			"High Cycles Divider 3.2: 0x%x\n", addr, stat,
			0xF  & (stat >> 4), stat & 0xF);
	addr = 0x1A1;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Bypass Divider 3.2: 0x%x\n\t"
			"Bypass Divider 3.1: 0x%x\n\t"
			"Divider 3 nosync: 0x%x\n\t"
			"Divider 3 force high: 0x%x\n\t"
			"Start High Divider 3.2: 0x%x\n\t"
			"Start High Divider 3.1: 0x%x\n", addr, stat,
			0x1 & (stat >> 5), 0x1 & (stat >> 4), 0x1 & (stat >> 3), 0x1 & (stat >> 2), 0x1 & (stat >> 1), stat & 0x1);
	addr = 0x1A2;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => Divider 3 \n\t"
			"DCCOFF: 0x%x\n", addr, stat & 0x1);


	xil_printf("\nAD9517  VCO Divider and CLK Input\n");
	addr = 0x1E0;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Power down clock input: 0x%x\n\t"
			"Power down VCO clock interface: 0x%x\n\t"
			"Power down VCO and CLK: 0x%x\n\t"
			"Select VCO or CLK: 0x%x\n\t"
			"Bypass VCO divider: 0x%x\n", addr, stat,
			0x1 & (stat >> 4), 0x1 & (stat >> 3), 0x1 & (stat >> 2), 0x1 & (stat >> 1), stat & 0x1);

	addr = 0x230;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("ADDR 0x%x => 0x%x\n\t"
			"Power down sync: 0x%x\n\t"
			"distribution ref: 0x%x\n\t"
			"soft sync: 0x%x\n", addr, stat,
			0x1 & (stat >> 2), 0x1 & (stat >> 1), stat & 0x1);
	return 0;
}


/***************************************************************************//**
* @brief ad9517_remove
*******************************************************************************/
int32_t ad9517_remove(struct ad9517_dev *dev)
{
	int32_t ret;

	ret = spi_remove(dev->spi_desc);

	free(dev);

	return ret;
}