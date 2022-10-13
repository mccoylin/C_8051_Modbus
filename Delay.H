
#ifndef __DELAY_H__
#define __DELAY_H__
/*** Functions used by other modules ***/

extern void delay_ms(unsigned int);
extern void delay_1us(void); //! only for 1T 8051
extern void delay_2us(void);
extern void delay_5us(void);
extern void delay_6us(void);

extern void delay_7us(void);
extern void delay_10us(void);
extern void delay_20us(void);
extern void delay_50us(void);
extern void delay_100us(void);
extern void delay_200us(void);
extern void delay_500us(void);
/*
for C51, #include "Delay.h"

  (1) delay_ms(unsigned int No_of_ms);
  (2) delay_1us();
  (3) delay_2us();
  (4) delay_5us();
  (5) delay_10us();
  (6) delay_20us();
  (7) delay_50us();
  (8) delay_100us();
  (9) delay_200us();
 (10) delay_500us();
*/

#endif  //__DELAY_H__

