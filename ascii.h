
#ifndef __ASCII_H__
#define __ASCII_H__


#include "stdint.h"

//typedef unsigned char   uint8;
//typedef unsigned int    uint16;
//typedef unsigned long   uint32;

/* ascii temp vars */
extern uint8_t ascii[4];
extern uint8_t hexa[4];

/* functions prototypes */
void ByteToAscii(uint8_t);
uint8_t NibbleToAscii(uint8_t);
uint8_t AsciiToByte(uint8_t, uint8_t);
void TwoByteToAscii(uint16_t);
uint16_t AsciiToTwoByte(void);


#endif  //__ASCII_H__
