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
	uint8_t buf[4];
	int32_t ret;

	buf[0] = 0x84;
	buf[1] = 0x80 | (reg_addr >> 8);
	buf[2] = reg_addr & 0xFF;
	buf[3] = 0x00;

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
	xil_printf("AD9517 PLL %s.\n", stat & 0x01 ? "ok" : "errors");

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

	xil_printf("\n\nAD9517 status\n");
	addr = 0x0000;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => SDO active: %d; LSB first: %d ; Soft reset: %d.\n", addr, stat & (1 << 0), stat & (1 << 1), stat & (1 << 3));

	addr = 0x0003;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Part ID: %d.\n", addr, stat & 0xFF);
	xil_printf("\nAD9517 PLL status\n");
	addr = 0x0010;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PDF polarity: %d, Charge pump %d, charge pump mode %d, PLL power-down. %d\n",addr,
			stat & (0x1 << 7), stat & (0x7 << 4), stat & (0x3 << 2), stat & (0x1));


	addr = 0x0011;
	ad9517_spi_read(dev, addr, &stat);
	addr = 0x0012;
	ad9517_spi_read(dev, addr, &stat2);
	xil_printf("%x => R counter %d\n", addr, stat + ((stat % 0x3F) << 8));

	addr = 0x0013;
	ad9517_spi_read(dev, addr, &stat2);
	xil_printf("%x => A counter %d\n", addr,((stat % 0x3F) ));

	addr = 0x0014;
	ad9517_spi_read(dev, addr, &stat);
	addr = 0x0015;
	ad9517_spi_read(dev, addr, &stat2);
	xil_printf("%x => B counter %d\n", addr,stat + ((stat % 0x1F) << 8));


	addr = 0x0016;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL1 -> Vcp/2: %d, Reset R %d, Reset A and B %d, Reset all %d, Bypass B %d, Prescaler %d\n", addr,
			stat & (0x1 << 7), stat & (0x1 << 6), stat & (0x1 << 5), stat &  (0x1 << 4), stat & (0x1 << 3), stat & (0x7));

	addr = 0x0017;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL2 -> STATUS pin control: %d, Antibacklash pulse width: %d\n", addr,
				stat & (0x1F << 2), stat & 0x3);

	addr = 0x0018;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL3 -> Lock detect counter: %d, Digital lock detect window: %d, Disable Digital lock detect window: %d, VCO calibration divider %d, VCO cal now %d\n", addr,
			stat & (0x3 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x3 << 1), stat & 0x1);
	addr = 0x0019;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL4 -> R, A, B counters: %d, R path delay: %d, N path delay %d\n", addr,
				stat & (0x3 << 6), stat & (0x7 << 3), stat & (0x7 << 0));

	addr = 0x001A;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL5 -> Reference frequency monitor threshold : %d, LD pin control %d\n", addr,
			stat & (0x1 << 6), stat & (0x3F << 1));
	addr = 0x001B;
		ad9517_spi_read(dev, addr, &stat);
		xil_printf("%x => PLL6 -> VCO frequency monitor: %d, REF2: %d, REF1 %d, REFMON %d\n", addr,
					stat & (0x1 << 7), stat & (0x1 << 6), stat & (0x1 << 5), stat & (0x1F << 0x0));

	addr = 0x001C;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL7 -> Disable switchover: %d, REF2: %d, REF_SEL: %d, REF2 power on %d, REF1 power on %d, Differential %d\n", addr,
					stat & (0x1 << 7), stat & (0x1 << 6), stat & (0x1 << 5), stat & (0x3 << 2), stat & (0x3 << 1), stat & 0x1);

	addr = 0x001D;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL7 -> PLL status: %d, LD pin comparator: %d, Holdover: %d, External Handover %d, External Handover enable %d\n", addr,
						stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x1 << 2), stat & (0x3 << 1), stat & 0x1);

	addr = 0x001D;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => PLL Status -> VCO cal: %d, Holdover: %d, REF2: %d, VCO > threshold %d, Ref2  > threshold %d, Ref1  > threshold %d, Digial lock %d\n", addr,
			stat & (0x1 << 6), stat & (0x1 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x1 << 2), stat & (0x3 << 1), stat & 0x1);


	xil_printf("\nAD9517 Fine Delay status\n");
	addr = 0x0A0;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("%x OUT4 delay bypass=> active: %d, ramp capacitors: %d, ramp current: %d,  delay fraction: %d\n", addr,
				stat & (0x1), stat2 & (0x7 << 3), stat2 & 0x7, stat3 & 0x7F);
	addr = 0x0A3;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("%x OUT5 delay bypass=> active: %d, ramp capacitors: %d, ramp current: %d,  delay fraction: %d\n", addr,
					stat & (0x1), stat2 & (0x7 << 3), stat2 & 0x7, stat3 & 0x7F);
	addr = 0x0A6;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("%x OUT6 delay bypass=> active: %d, ramp capacitors: %d, ramp current: %d,  delay fraction: %d\n", addr,
					stat & (0x1), stat2 & (0x7 << 3), stat2 & 0x7, stat3 & 0x7F);
	addr = 0x0A9;
	ad9517_spi_read(dev, addr, &stat);
	ad9517_spi_read(dev, addr+0x1, &stat2);
	ad9517_spi_read(dev, addr+0x2, &stat3);
	xil_printf("%x OUT7 delay bypass=> active: %d, ramp capacitors: %d, ramp current: %d,  delay fraction: %d\n", addr,
					stat & (0x1), stat2 & (0x7 << 3), stat2 & 0x7, stat3 & 0x7F);


	xil_printf("\nAD9517 LVPECL output status\n");
	addr = 0x0F0;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT0=> invert: %d, differential voltage: %d, power-down: %d\n", addr,
			stat & (0x1 << 4), stat & (0x3 << 2), stat & 0x3);
	addr = 0x0F1;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT1=> invert: %d, differential voltage: %d, power-down: %d\n", addr,
			stat & (0x1 << 4), stat & (0x3 << 2), stat & 0x3);
	addr = 0x0F4;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT2=> invert: %d, differential voltage: %d, power-down: %d\n", addr,
			stat & (0x1 << 4), stat & (0x3 << 2), stat & 0x3);
	addr = 0x0F5;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT3=> invert: %d, differential voltage: %d, power-down: %d\n", addr,
			stat & (0x1 << 4), stat & (0x3 << 2), stat & 0x3);


	xil_printf("\nAD9517 LVDS/CMOS output status\n");
	addr = 0x140;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT4=> CMOS polarity: %d, LVDS/CMOS polarity: %d, CMOS B: %d, Select LVDS/CMOS %d, output current  %d, power-down: %d\n", addr,
			stat & (0x3 << 6), stat & (0x1 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x3 << 1), stat & 0x1);
	addr = 0x141;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT5=> CMOS polarity: %d, LVDS/CMOS polarity: %d, CMOS B: %d, Select LVDS/CMOS %d, output current  %d, power-down: %d\n", addr,
			stat & (0x3 << 6), stat & (0x1 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x3 << 1), stat & 0x1);
	addr = 0x142;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT5=> CMOS polarity: %d, LVDS/CMOS polarity: %d, CMOS B: %d, Select LVDS/CMOS %d, output current  %d, power-down: %d\n", addr,
			stat & (0x3 << 6), stat & (0x1 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x3 << 1), stat & 0x1);
	addr = 0x143;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x OUTPUT5=> CMOS polarity: %d, LVDS/CMOS polarity: %d, CMOS B: %d, Select LVDS/CMOS %d, output current  %d, power-down: %d\n", addr,
			stat & (0x3 << 6), stat & (0x1 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x3 << 1), stat & 0x1);


	xil_printf("\nAD9517 LVPECL Channel Dividers status\n");
	addr = 0x190;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Divider 0 low cycles: %d, Divider 0 high cycles: %d\n", addr,
					stat & (0xF << 4), stat & 0xF);
	addr = 0x191;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Bypass Divider 0: %d, Divider 0 nosync: %d, Divider 0 force high: %d, Start High Divider 0  %d, Divider 0 phase offset  %d\n", addr,
			stat & (0x1 << 7), stat & (0x1 << 6), stat & (0x1 << 5), stat & (0x1 << 4), stat & 0xF);
	addr = 0x192;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Divider 0 direct2output: %d, Divider 0 DCCOFF: %d\n", addr,
						stat & (0x1 << 1), stat & 0x1);
	addr = 0x196;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Divider 1 low cycles: %d, Divider 1 high cycles: %d\n", addr,
					stat & (0xF << 4), stat & 0xF);
	addr = 0x197;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Bypass Divider 1: %d, Divider 1 nosync: %d, Divider 1 force high: %d, Start High Divider 1  %d, Divider 1 phase offset  %d\n", addr,
			stat & (0x1 << 7), stat & (0x1 << 6), stat & (0x1 << 5), stat & (0x1 << 4), stat & 0xF);
	addr = 0x198;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Divider 1 direct2output: %d, Divider 1 DCCOFF: %d\n", addr,
						stat & (0x1 << 1), stat & 0x1);


	xil_printf("\nAD9517 LVDS Channel Dividers status\n");
	addr = 0x199;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Low Cycles Divider 2.1: %d, High Cycles Divider 2.1: %d\n", addr,
				stat & (0xF << 4), stat & 0xF);
	addr = 0x19A;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Phase Offset Divider 2.2: %d, Phase Offset Divider 2.1: %d\n", addr,
				stat & (0xF << 4), stat & 0xF);
	addr = 0x19B;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Low Cycles Divider 2.2: %d, High Cycles Divider 2.2: %d\n", addr,
				stat & (0xF << 4), stat & 0xF);
	addr = 0x19C;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Bypass Divider 2.2: %d, Bypass Divider 2.1: %d, Divider 2 nosync: %d, Divider 2 force high: %d, Start High Divider 2.2  %d, Start High Divider 2.1  %d\n", addr,
			stat & (0x1 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x1 << 2), stat & (0x3 << 1), stat & 0x1);
	addr = 0x19D;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Divider 2 DCCOFF: %d\n", addr, stat & 0x1);
	addr = 0x19E;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Low Cycles Divider 3.1: %d, High Cycles Divider 3.1: %d\n", addr,
				stat & (0xF << 4), stat & 0xF);
	addr = 0x19F;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Phase Offset Divider 3.2: %d, Phase Offset Divider 3.1: %d\n", addr,
				stat & (0xF << 4), stat & 0xF);
	addr = 0x1A0;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Low Cycles Divider 3.2: %d, High Cycles Divider 3.2: %d\n", addr,
				stat & (0xF << 4), stat & 0xF);
	addr = 0x1A1;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Bypass Divider 3.2: %d, Bypass Divider 3.1: %d, Divider 3 nosync: %d, Divider 3 force high: %d, Start High Divider 3.2  %d, Start High Divider 3.1  %d\n", addr,
			stat & (0x1 << 5), stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x1 << 2), stat & (0x3 << 1), stat & 0x1);
	addr = 0x1A2;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Divider 3 DCCOFF: %d\n", addr, stat & 0x1);


	xil_printf("\nAD9517  VCO Divider and CLK Input\n");
	addr = 0x1E0;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Power down clock input: %d, Power down VCO clock interface: %d, Power down VCO and CLK: %d, Select VCO or CLK %d, Bypass VCO divider  %d\n", addr,
			stat & (0x1 << 4), stat & (0x1 << 3), stat & (0x1 << 2), stat & (0x3 << 1), stat & 0x1);

	addr = 0x230;
	ad9517_spi_read(dev, addr, &stat);
	xil_printf("%x => Power down sync: %d, distribution ref: %d, soft sync: %d\n", addr,
			stat & (0x1 << 2), stat & (0x3 << 1), stat & 0x1);
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
