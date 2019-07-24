/*
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko / John Hartfiel
 */



/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */
#define IIC_BASE_ADDRESS	XPAR_IIC_0_BASEADDR

//

#ifndef SI5338_H_
#define SI5338_H_

#define code

#include "xiic.h"

#define IIC_SCLK_RATE			400000
#define IIC_ADDR				0x70

#define LOS_MASK_IN1IN2IN3		0x04
#define LOS_MASK				LOS_MASK_IN1IN2IN3
#define PLL_LOL					0x10
#define LOS_FDBK				0x08
#define LOS_CLKIN				0x04
#define SYS_CAL					0x01
#define LOCK_MASK				(PLL_LOL | LOS_CLKIN | SYS_CAL)
#define FCAL_OVRD_EN			0x80
#define SOFT_RESET				0x02
#define EOB_ALL					0x10
#define DIS_LOL					0x80

int si5338_init (short DeviceID, char ChipAddr);
int si5338_write (char ChipAddr, char Addr, char Data);

#endif /* SI5338_H_ */
