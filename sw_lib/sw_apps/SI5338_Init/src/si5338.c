/*
-- Company: 		Trenz Electronic
-- Engineer: 		Oleksandr Kiyenko / John Hartfiel
 */
#include "si5338.h"
#include "xparameters.h"
#include "xiic.h"
#include "xil_io.h"
#include "xil_printf.h"
#include "register_map.h"



int si5338_write (char ChipAddr, char Addr, char Data)
{
	int Status;
	u8 SentByteCount;
	u8 Address = Addr;
	u8 WriteBuffer[2];

	WriteBuffer[0] = (u8) (Address);
	WriteBuffer[1] = (u8) (Data);
	Status = XST_SUCCESS;

	SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS, ChipAddr,
				WriteBuffer, 2,
				XIIC_STOP);

	if(SentByteCount != 2){	// All bits
		Status = XST_FAILURE;
	}
	return Status;
}

char si5338_read(char ChipAddr, char Addr)
{

	u8 ReceivedByteCount;
	u8 SentByteCount;
	u16 StatusReg;
	u8 Address = Addr;
	u8 rd_data;

	do {
		StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS, XIIC_SR_REG_OFFSET);
		if (!(StatusReg & XIIC_SR_BUS_BUSY_MASK)) {
			SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS,
							ChipAddr,
							(u8 *) &Address,
							1,
							XIIC_STOP);
		}

	} while (SentByteCount != 1);


	StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS, XIIC_SR_REG_OFFSET);

	while ((StatusReg & XIIC_SR_BUS_BUSY_MASK)) {
		StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS, XIIC_SR_REG_OFFSET);
	}

	do {
		/*
		 * Receive the data.
		 */
	ReceivedByteCount = XIic_DynRecv(IIC_BASE_ADDRESS,
						ChipAddr, &rd_data,
						1);
	} while (ReceivedByteCount != 1);

	return rd_data;
}

int si5338_write_mask(char ChipAddr, char Addr, char Data, char Mask)
{
	u8 reg_val;

	if(Mask == 0xFF){	// All bits
		si5338_write(ChipAddr, Addr, Data);
	}
	else{						// Write by mask
		reg_val = si5338_read(ChipAddr, Addr);
		reg_val &= ~Mask;	// Clear bits to write
		reg_val |= Data & Mask;	// Set bits by mask
		si5338_write(ChipAddr, Addr, reg_val);
	}
	return XST_SUCCESS;
}

int si5338_delay(int delay_ms)
{
	usleep(delay_ms*1000);
	// volatile int i;
	//for(i=0;i<(delay_ms*1000000);i++);
	return XST_SUCCESS;
}

int si5338_init(short DeviceID, char ChipAddr)
{
	int Status, i;
	u8 reg_val, SentByteCount, test_addr;
	Reg_Data rd;
	u32 StatusReg;

	/*
	 * Initialize the IIC Core.
	 */
	Status = XIic_DynInit(IIC_BASE_ADDRESS);
	if (Status != XST_SUCCESS) {
		xil_printf("Si5338 Controller Init failure\r\n");
		return XST_FAILURE;
	}

	/*
	 * Make sure all the Fifo's are cleared and Bus is Not busy.
	 */
	while (((StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS,
				XIIC_SR_REG_OFFSET)) &
				(XIIC_SR_RX_FIFO_EMPTY_MASK |
				XIIC_SR_TX_FIFO_EMPTY_MASK |
				XIIC_SR_BUS_BUSY_MASK)) !=
				(XIIC_SR_RX_FIFO_EMPTY_MASK |
				XIIC_SR_TX_FIFO_EMPTY_MASK)) {

	}


	// Check chip by reading Revision reg 0x00
	test_addr = 0x00;		// Address of test register
	SentByteCount = XIic_DynSend(IIC_BASE_ADDRESS, ChipAddr,
			(u8 *) &test_addr, 1,
			XIIC_STOP);

	if (SentByteCount != 1) {
		xil_printf("Si5338 XIic_DynSend failure\r\n");
		return XST_FAILURE;
	}

	StatusReg = XIic_ReadReg(IIC_BASE_ADDRESS, XIIC_SR_REG_OFFSET);
	if ((StatusReg & XIIC_SR_BUS_BUSY_MASK)) {
		xil_printf("Si5338 XIic_ReadReg failure\r\n");
		return XST_FAILURE;
	}


	// I2C Programming Procedure
	si5338_write(ChipAddr, 246, 0x01);					//Hard reset
	// Disable Outputs
	si5338_write_mask(ChipAddr, 230, EOB_ALL, EOB_ALL);	// EOB_ALL = 1
	// Pause LOL
	si5338_write_mask(ChipAddr, 241, DIS_LOL, DIS_LOL);	// DIS_LOL = 1
	// Write new configuration to device accounting for the write-allowed mask
	for(i=0; i<NUM_REGS_MAX; i++){
		rd = Reg_Store[i];
		si5338_write_mask(ChipAddr, rd.Reg_Addr, rd.Reg_Val, rd.Reg_Mask);
	}
	// Validate clock input status
	reg_val = si5338_read(ChipAddr , 218) & LOS_MASK;
	while(reg_val != 0){
		reg_val = si5338_read(ChipAddr, 218) & LOS_MASK;
	}
	// Configure PLL for locking
	si5338_write_mask(ChipAddr, 49, 0, FCAL_OVRD_EN);	//FCAL_OVRD_EN = 0
	// Initiate Locking of PLL
	si5338_write(ChipAddr, 246, SOFT_RESET);			//SOFT_RESET = 1
	si5338_delay(25);								// Wait 25 ms
	// Restart LOL
	si5338_write_mask(ChipAddr, 241, 0, DIS_LOL);		// DIS_LOL = 0
	si5338_write(ChipAddr, 241, 0x65);					// Set reg 241 = 0x65
	// Confirm PLL lock status
	reg_val = si5338_read(ChipAddr, 218) & LOCK_MASK;
	while(reg_val != 0){
		reg_val = si5338_read(ChipAddr, 218) & LOCK_MASK;
	}
	//copy FCAL values to active registers
	si5338_write_mask(ChipAddr, 47, si5338_read(ChipAddr, 237), 0x03);	// 237[1:0] to 47[1:0]
	si5338_write(ChipAddr, 46, si5338_read(ChipAddr, 236));	// 236[7:0] to 46[7:0]
	si5338_write(ChipAddr, 45, si5338_read(ChipAddr, 235));	// 235[7:0] to 45[7:0]
	si5338_write_mask(ChipAddr, 47, 0x14, 0xFC);		// Set 47[7:2] = 000101b
	// Set PLL to use FCAL values
	si5338_write_mask(ChipAddr, 49, FCAL_OVRD_EN, FCAL_OVRD_EN);	//FCAL_OVRD_EN = 1
	// Enable Outputs
	si5338_write(ChipAddr, 230, 0x00);					//EOB_ALL = 0
	xil_printf("Done\r\n");
	return XST_SUCCESS;
}

