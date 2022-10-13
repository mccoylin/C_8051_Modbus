
#ifndef __MODBUS_SLAVE_H__
#define __MODBUS_SLAVE_H__

#include "..\stdint.h"

/* slave address 1 - 255 */
#define DIR 0x05    //slave dir 5d

/* data range */
#define MAX_COILS 1
#define MAX_INPUTS 1
#define MAX_HOLDING_REGISTERS 2
#define MAX_INPUTS_REGISTERS 2

/* internal slave memory data */
extern uint8_t idata coils_array[MAX_COILS]; 
extern uint8_t idata inputs_array[MAX_INPUTS];
extern uint16_t idata holding_registers_array[MAX_HOLDING_REGISTERS];
extern uint16_t idata inputs_registers_array[MAX_INPUTS_REGISTERS];

/* functions prototypes */
uint8_t GetCoilValue(uint16_t adr);
void SetCoilValue(uint16_t adr, uint8_t value);
uint8_t GetInputValue(uint16_t adr);
uint16_t GetHoldingRegisterValue(uint16_t);
void SetHoldingRegisterValue(uint16_t, uint16_t);
uint16_t GetInputRegisterValue(uint16_t);


#endif  //__MODBUS_SLAVE_H__
