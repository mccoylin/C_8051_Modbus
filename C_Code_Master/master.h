
#ifndef __MASTER_H__
#define __MASTER_H__


#include "..\\stdint.h"


/* ASCII FRAME size */
#define ASCII_FRAME_SIZE 60  //CHANGE  

/* ASCII FRAME END CHARS */
#define CR 0x0D
#define LF 0x0A


/* ASCII FRAME */
extern uint8_t idata ascii_frame[ASCII_FRAME_SIZE]; // !!!size = 255
extern uint8_t idata data_count;

extern uint8_t idata send_count;

extern bit broadcast;

/* functions codes parameters */
extern uint16_t idata parameters[10];
extern uint8_t byte_count;


/* functions prototypes*/
void gen_start(void);
void gen_dir(uint8_t);
void gen_function(uint8_t);
void gen_lrc(void);
void clear_frame(void);
uint8_t lrc_calc(void);
void tx_assci_frame(void);

/* functions Prototypes */
void ReadCoilStatus_01(uint8_t, uint16_t, uint16_t);
void ReadInputStatus_02(uint8_t, uint16_t, uint16_t);
void ReadHoldingRegisters_03(uint8_t, uint16_t, uint16_t);
void ReadInputRegisters_04(uint8_t, uint16_t, uint16_t);
void ForceSingleCoil_05(uint8_t, uint16_t, uint8_t);
void PresetSingleRegister_06(uint8_t, uint16_t, uint16_t);
void ForceMultipleCoils_15(uint8_t, uint16_t, uint16_t);
void PresetMultipleRegisters_16(uint8_t, uint16_t, uint16_t);

#endif  //__MASTER_H__
