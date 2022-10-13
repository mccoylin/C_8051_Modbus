
#ifndef __MODBUS_H__
#define __MODBUS_H__


#include "..\stdint.h"


/* ASCII FRAME size */
#define ASCII_FRAME_SIZE 60   //CHANGE  

/* ASCII FRAME END CHARS */
#define CR 0x0D
#define LF 0x0A         

/* ASCII FRAME */
extern uint8_t idata ascii_frame[ASCII_FRAME_SIZE]; // max size = 255
extern uint8_t idata data_count;
extern uint8_t idata send_count;
extern bit broadcast;


/* functions prototypes*/
void execute_modbus_command(void);
void gen_lrc(void);
void clear_frame(void);
uint8_t lrc_calc(void);
void tx_assci_frame(void);

void ResponseReadCoilsStatus_01(void);
void ResponseReadInputStatus_02(void);
void ResponseReadHoldingRegisters_03(void);
void ResponseReadInputRegisters_04(void);
void ResponseForceSingleCoil_05(void);
void ResponsePresetSingleRegister_06(void);
void ResponseForceMultipleCoils_15(void);
void ResponsePresetMultipleRegisters_16(void);


#endif  //__MODBUS_H__
