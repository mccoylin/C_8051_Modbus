
#line 1 "main.c" /0
  
#line 1 "C:\Keil_v5\C51\Inc\stdio.h" /0






 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 typedef unsigned int size_t;
 
 
 #pragma SAVE
 #pragma REGPARMS
 extern char _getkey (void);
 extern char getchar (void);
 extern char ungetchar (char);
 extern char putchar (char);
 extern int printf   (const char *, ...);
 extern int sprintf  (char *, const char *, ...);
 extern int vprintf  (const char *, char *);
 extern int vsprintf (char *, const char *, char *);
 extern char *gets (char *, int n);
 extern int scanf (const char *, ...);
 extern int sscanf (char *, const char *, ...);
 extern int puts (const char *);
 
 #pragma RESTORE
 
 
 
#line 1 "main.c" /0
 
  
#line 1 "..\stdint.h" /0



























 
 
 
 
 
 
 
 
 
#error *** WARNING C322 IN LINE 36 OF ..\stdint.h: unknown identifier
#line 37 "..\stdint.h" /1
  
 
#line 39 "..\stdint.h" /0
 
 
 
 
 typedef signed char             int8_t;
 typedef short int               int16_t;
 typedef long int                int32_t;
 
#line 47 "..\stdint.h" /1
 
 
#line 49 "..\stdint.h" /0
 
 
 typedef unsigned char           uint8_t;
 typedef unsigned short int      uint16_t;
 typedef unsigned long int       uint32_t;
 
#line 55 "..\stdint.h" /1
 
 
#line 57 "..\stdint.h" /0
 
 
 
 
 typedef signed char             int_least8_t;
 typedef short int               int_least16_t;
 typedef long int                int_least32_t;
 
#line 65 "..\stdint.h" /1
 
 
#line 67 "..\stdint.h" /0
 
 
 typedef unsigned char           uint_least8_t;
 typedef unsigned short int      uint_least16_t;
 typedef unsigned long int       uint_least32_t;
 
#line 73 "..\stdint.h" /1
 
 
#line 75 "..\stdint.h" /0
 
 
 
 
 typedef signed char             int_fast8_t;
 typedef int                     int_fast16_t;
 typedef long int                int_fast32_t;
 
#line 83 "..\stdint.h" /1
 
 
#line 85 "..\stdint.h" /0
 
 
 typedef unsigned char           uint_fast8_t;
 typedef unsigned int            uint_fast16_t;
 typedef unsigned long int       uint_fast32_t;
 
#line 91 "..\stdint.h" /1
 
 
#line 93 "..\stdint.h" /0
 
 
 
#line 96 "..\stdint.h" /1
 
 
 
#line 99 "..\stdint.h" /0
 typedef int                   intptr_t;
 typedef unsigned int          uintptr_t;
 
 
 
 
 
 typedef long int                intmax_t;
 typedef unsigned long int       uintmax_t;
 
#line 109 "..\stdint.h" /1
 
 
 
#line 112 "..\stdint.h" /0
 
 
 
 
 
 
 
 
#line 120 "..\stdint.h" /1
  
 
#line 122 "..\stdint.h" /0
 
 
 
 
 
 
#line 128 "..\stdint.h" /1
  
 
#line 130 "..\stdint.h" /0
 
 
 
 
 
 
#line 136 "..\stdint.h" /1
  
 
#line 138 "..\stdint.h" /0
 
 
 
 
 
 
#line 144 "..\stdint.h" /1
  
 
#line 146 "..\stdint.h" /0
 
 
 
 
 
 
#line 152 "..\stdint.h" /1
  
 
#line 154 "..\stdint.h" /0
 
 
 
 
 
 
#line 160 "..\stdint.h" /1
  
 
#line 162 "..\stdint.h" /0
 
 
 
 
 
 
#line 168 "..\stdint.h" /1
  
 
#line 170 "..\stdint.h" /0
 
 
 
 
 
 
#line 176 "..\stdint.h" /1
  
 
#line 178 "..\stdint.h" /0
 
 
 
 
 
 
#line 184 "..\stdint.h" /1
  
 
#line 186 "..\stdint.h" /0
 
 
 
#line 189 "..\stdint.h" /1
  
  
  
 
#line 193 "..\stdint.h" /0
 
 
 
 
 
 
 
 
 
#line 202 "..\stdint.h" /1
  
 
#line 204 "..\stdint.h" /0
 
 
 
 
 
#line 209 "..\stdint.h" /1
  
 
#line 211 "..\stdint.h" /0
 
 
 
 
 
#line 216 "..\stdint.h" /1
  
 
#line 218 "..\stdint.h" /0
 
 
 
 
 
#line 223 "..\stdint.h" /1
  
  
 
#line 226 "..\stdint.h" /0
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#line 242 "..\stdint.h" /1
  
 
#line 244 "..\stdint.h" /0
 
 
 
 
 
 
#line 250 "..\stdint.h" /1
  
 
#line 252 "..\stdint.h" /0
 
 
 
 
 
 
 
 
 
#line 261 "..\stdint.h" /1
  
  
 
#line 264 "..\stdint.h" /0
 
 
 
 
 
 
#line 270 "..\stdint.h" /1
  
 
#line 272 "..\stdint.h" /0
 
 
 
#line 2 "main.c" /0
 
 
  
#line 1 "C:\Keil_v5\C51\Inc\Megawin\REG_MPC82G516.h" /0
 
 
 
 
 
 
 
 sfr ACC       = 0xE0;
 sfr B         = 0xF0;
 sfr SP        = 0x81;
 sfr DPL       = 0x82;
 sfr DPH       = 0x83;
 sfr PSW       = 0xD0;
 
 
 sfr IE        = 0xA8;
 sfr AUXIE     = 0xAD;
 sfr XICON     = 0xC0;
 sfr IP        = 0xB8;
 sfr IPH       = 0xB7;
 sfr AUXIP     = 0xAE;
 sfr AUXIPH    = 0xAF;
 
 
 sfr P0        = 0x80;
 sfr P1        = 0x90;
 sfr P2        = 0xA0;
 sfr P3        = 0xB0;
 sfr P4        = 0xE8;
 sfr P0M0      = 0x93;
 sfr P0M1      = 0x94;
 sfr P1M0      = 0x91;
 sfr P1M1      = 0x92;
 sfr P2M0      = 0x95;
 sfr P2M1      = 0x96;
 sfr P3M0      = 0xB1;
 sfr P3M1      = 0xB2;
 sfr P4M0      = 0xB3;
 sfr P4M1      = 0xB4;
 
 
 sfr TCON      = 0x88;
 sfr TMOD      = 0x89;
 sfr T2CON     = 0xC8;
 sfr T2MOD     = 0xC9;
 sfr RCAP2L    = 0xCA;
 sfr RCAP2H    = 0xCB;
 sfr TL0       = 0x8A;
 sfr TH0       = 0x8C;
 sfr TL1       = 0x8B;
 sfr TH1       = 0x8D;
 sfr TL2       = 0xCC;
 sfr TH2       = 0xCD;
 
 
 sfr SCON      = 0x98;
 sfr SBUF      = 0x99;
 sfr SADDR     = 0xA9;
 sfr SADEN     = 0xB9;
 sfr S2CON     = 0xAA;
 sfr S2BRT     = 0xBA;
 sfr S2BUF     = 0x9A;
 
 
 sfr ADCTL     = 0xC5;
 sfr ADCH      = 0xC6;
 sfr ADCL      = 0xBE;
 sfr ADC       = 0xC6;  
 
 
 sfr KBCON     = 0xD6;
 sfr KBPATN    = 0xD5;
 sfr KBMASK    = 0xD7;
 
 
 sfr SPICTL    = 0x85;
 sfr SPIDAT    = 0x86;
 sfr SPISTAT   = 0x84;
 
 
 sfr CCON      = 0xD8;
 sfr CMOD      = 0xD9;
 sfr CL        = 0xE9;
 sfr CH        = 0xF9;
 sfr CCAPM0    = 0xDA;
 sfr CCAPM1    = 0xDB;
 sfr CCAPM2    = 0xDC;
 sfr CCAPM3    = 0xDD;
 sfr CCAPM4    = 0xDE;
 sfr CCAPM5    = 0xDF;
 sfr CCAP0H    = 0xFA;
 sfr CCAP0L    = 0xEA;
 sfr CCAP1H    = 0xFB;
 sfr CCAP1L    = 0xEB;
 sfr CCAP2H    = 0xFC;
 sfr CCAP2L    = 0xEC;
 sfr CCAP3H    = 0xFD;
 sfr CCAP3L    = 0xED;
 sfr CCAP4H    = 0xFE;
 sfr CCAP4L    = 0xEE;
 sfr CCAP5H    = 0xFF;
 sfr CCAP5L    = 0xEF;
 sfr PCAPWM0   = 0xF2;
 sfr PCAPWM1   = 0xF3;
 sfr PCAPWM2   = 0xF4;
 sfr PCAPWM3   = 0xF5;
 sfr PCAPWM4   = 0xF6;
 sfr PCAPWM5   = 0xF7;
 
 
 sfr PCON      = 0x87;
 sfr PCON2     = 0xC7;
 sfr AUXR      = 0x8E;
 sfr AUXR1     = 0xA2;
 sfr AUXR2     = 0xA6;
 sfr STRETCH   = 0x8F;
 sfr EVRCR     = 0x97;
 sfr WDTCR     = 0xE1;
 
 
 sfr ISPCR     = 0xE7;
 sfr IFMT      = 0xE5;
 sfr IFD       = 0xE2;
 sfr IFADRH    = 0xE3;
 sfr IFADRL    = 0xE4;
 sfr SCMD      = 0xE6;
 
 
 sbit CY       = PSW^7;
 sbit AC       = PSW^6;
 sbit F0       = PSW^5;
 sbit RS1      = PSW^4;
 sbit RS0      = PSW^3;
 sbit OV       = PSW^2;
 sbit P        = PSW^0;
 
 
 sbit EA       = IE^7;
 sbit ET2      = IE^5;
 sbit ES       = IE^4;
 sbit ET1      = IE^3;
 sbit EX1      = IE^2;
 sbit ET0      = IE^1;
 sbit EX0      = IE^0;
 
 
 sbit PT2      = IP^5;
 sbit PS       = IP^4;
 sbit PT1      = IP^3;
 sbit PX1      = IP^2;
 sbit PT0      = IP^1;
 sbit PX0      = IP^0;
 
 
 sbit FE       = SCON^7;
 sbit SM0      = SCON^7;
 sbit SM1      = SCON^6;
 sbit SM2      = SCON^5;
 sbit REN      = SCON^4;
 sbit TB8      = SCON^3;
 sbit RB8      = SCON^2;
 sbit TI       = SCON^1;
 sbit RI       = SCON^0;
 
 
 sbit TF1      = TCON^7;
 sbit TR1      = TCON^6;
 sbit TF0      = TCON^5;
 sbit TR0      = TCON^4;
 sbit IE1      = TCON^3;
 sbit IT1      = TCON^2;
 sbit IE0      = TCON^1;
 sbit IT0      = TCON^0;
 
 
 sbit TF2      = T2CON^7;
 sbit EXF2     = T2CON^6;
 sbit RCLK     = T2CON^5;
 sbit TCLK     = T2CON^4;
 sbit EXEN2    = T2CON^3;
 sbit TR2      = T2CON^2;
 sbit C_T2     = T2CON^1;
 sbit CP_RL2   = T2CON^0;
 
 
 sbit CF       = CCON^7;
 sbit CR       = CCON^6;
 sbit CCF5     = CCON^5;
 sbit CCF4     = CCON^4;
 sbit CCF3     = CCON^3;
 sbit CCF2     = CCON^2;
 sbit CCF1     = CCON^1;
 sbit CCF0     = CCON^0;
 
 
 sbit PX3      = XICON^7;
 sbit EX3      = XICON^6;
 sbit IE3      = XICON^5;
 sbit IT3      = XICON^4;
 sbit PX2      = XICON^3;
 sbit EX2      = XICON^2;
 sbit IE2      = XICON^1;
 sbit IT2      = XICON^0;
 
 
 sbit P07      = P0^7;
 sbit P06      = P0^6;
 sbit P05      = P0^5;
 sbit P04      = P0^4;
 sbit P03      = P0^3;
 sbit P02      = P0^2;
 sbit P01      = P0^1;
 sbit P00      = P0^0;
 
 
 sbit P17      = P1^7;
 sbit P16      = P1^6;
 sbit P15      = P1^5;
 sbit P14      = P1^4;
 sbit P13      = P1^3;
 sbit P12      = P1^2;
 sbit P11      = P1^1;
 sbit P10      = P1^0;
 
 
 sbit P27      = P2^7;
 sbit P26      = P2^6;
 sbit P25      = P2^5;
 sbit P24      = P2^4;
 sbit P23      = P2^3;
 sbit P22      = P2^2;
 sbit P21      = P2^1;
 sbit P20      = P2^0;
 
 
 sbit P37      = P3^7;
 sbit P36      = P3^6;
 sbit P35      = P3^5;
 sbit P34      = P3^4;
 sbit P33      = P3^3;
 sbit P32      = P3^2;
 sbit P31      = P3^1;
 sbit P30      = P3^0;
 
 
 sbit P43      = P4^3;
 sbit P42      = P4^2;
 sbit P41      = P4^1;
 sbit P40      = P4^0;
 
 
 sbit T2EX     = P1^1;
 sbit T2       = P1^0;
 sbit S2TXD    = P1^3;
 sbit S2RXD    = P1^2;
 sbit SPI_CLK  = P1^7;
 sbit SPI_MISO = P1^6;
 sbit SPI_MOSI = P1^5;
 sbit SPI_SS   = P1^4;
 sbit CEX5     = P1^7;
 sbit CEX4     = P1^6;
 sbit CEX3     = P1^5;
 sbit CEX2     = P1^4;
 sbit CEX1     = P1^3;
 sbit CEX0     = P1^2;
 sbit ECI      = P1^1;
 
 
 sbit RD       = P3^7;
 sbit WR       = P3^6;
 sbit T1       = P3^5;
 sbit T0       = P3^4;
 sbit INT1     = P3^3;
 sbit INT0     = P3^2;
 sbit TXD      = P3^1;
 sbit RXD      = P3^0;
 sbit S2CKO    = P3^5;
 sbit T0CKO    = P3^4;
 
 
 sbit INT2     = P4^3;
 sbit INT3     = P4^2;
 
 
#line 4 "main.c" /0
 
 
  
#line 1 "main.h" /0
 
 
 
 
 
  
#line 1 "C:\Keil_v5\C51\Inc\Megawin\REG_MPC82G516.h" /0
 
#line 2 "C:\Keil_v5\C51\Inc\Megawin\REG_MPC82G516.h" /1
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#line 6 "main.h" /0
#line 6 "main.h" /0
 
 
 
 
 
 
 
 
 sbit RS485En  =  P3^2;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#line 6 "main.c" /0
 
  
#line 1 "modbus.h" /0
 
 
 
 
 
  
#line 1 "..\stdint.h" /0



























 
 
 
#line 31 "..\stdint.h" /1
  
 
 
 
 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
 
  
  
  
 
  
  
  
 
 
 
 
  
 
  
 
 
 
 
  
 
  
 
 
 
 
  
 
  
 
 
 
 
 
 
  
  
 
  
  
 
 
 
  
  
 
 
  
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
  
  
 
  
  
 
 
 
  
  
 
  
  
 
 
 
 
  
 
 
 
#line 274 "..\stdint.h" /0
 
#line 6 "modbus.h" /0
 
 
 
 
 
 
 
 
 
 
 
 extern uint8_t idata ascii_frame[60];  
 extern uint8_t idata data_count;
 extern uint8_t idata send_count;
 extern bit broadcast;
 
 
 
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
 
 
 
#line 7 "main.c" /0
 
  
#line 1 "slave.h" /0
 
 
 
 
  
#line 1 "..\stdint.h" /0



























 
 
 
#line 31 "..\stdint.h" /1
  
 
 
 
 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
 
  
  
  
 
  
  
  
 
 
 
 
  
 
  
 
 
 
 
  
 
  
 
 
 
 
  
 
  
 
 
 
 
 
 
  
  
 
  
  
 
 
 
  
  
 
 
  
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
  
  
 
  
  
 
 
 
  
  
 
  
  
 
 
 
 
  
 
 
 
#line 274 "..\stdint.h" /0
 
#line 5 "slave.h" /0
 
 
 
 
 
 
 
 
 
 
 
 
 extern uint8_t idata coils_array[1]; 
 extern uint8_t idata inputs_array[1];
 extern uint16_t idata holding_registers_array[2];
 extern uint16_t idata inputs_registers_array[2];
 
 
 uint8_t GetCoilValue(uint16_t adr);
 void SetCoilValue(uint16_t adr, uint8_t value);
 uint8_t GetInputValue(uint16_t adr);
 uint16_t GetHoldingRegisterValue(uint16_t);
 void SetHoldingRegisterValue(uint16_t, uint16_t);
 uint16_t GetInputRegisterValue(uint16_t);
 
 
 
#line 8 "main.c" /0
 
  
#line 1 "..\Delay.H" /0
 
 
 
 
 
 extern void delay_ms(unsigned int);
 extern void delay_1us(void);  
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













 
 
 
 
#line 9 "main.c" /0
 
 
 
 
 
 int level = 0;
 int cant = 1;
 int led_count = 0;
 int sec_count = 0;
 
 int last_data_count = 0;
 int last_hash       = 0;
 
 uint8_t idata _7seg[10] = {0x7E,0x42,0xEC,0xE6,0xD2,0xB6,0x9E,0x62,0xFE,0xF2};
 
 sbit LED1 = P1^3;
 sbit EN_D = P3^7;
 sbit ONE  = P2^0;
 uint8_t BUSY = 0;
 
 void Serial_PWM_Init(void)
 { 
 RS485En = 0;
 
 TMOD = 0x21;     
 
 TH1 = 0xF4;
 TL1 = 0xF4;   
 
 TH0 = 0xF7;   
 TL0 = 0x86;
 
 SetHoldingRegisterValue(1, 1);   
 level = 5;
 
 ET0 = 1;
 TR0 = 1;
 
 SCON = 0x50;     
 
 ES = 1;
 PS = 1;
 PT1 = 1;
 
 TR1 = 1; 
 }
 
 int make_hash(void) 
 {
 int i, h = 0;
 
 for ( i = 0; i < data_count; i++ ) 
 {
 h += (char)ascii_frame[i] * ( i + 1 );
 }
 return ( 19 * h ) % 1009;
 }
 
 
 
 
 
 
 
 
 
 
 
 
 void PWM(void) interrupt 1
 {
 int curr = 0;
 int off = GetCoilValue(0);
 
 TH0 = 0xF7;  
 TL0 = 0x86;
 
 if ( cant <= 0 )
 {
 EN_D = 1;
 }
 else
 {         
 EN_D = !(0 ^ off);
 }           
 
 if ( cant >= level )
 {     
 cant = level - 5;
 }
 
 cant++;
 
 led_count++;
 if (led_count == 500)    
 {
 led_count = 0;
 LED1 = ~LED1;         
 







 
 }
 
 TF0 = 0;   
 TR0 = 1;
 }
 
 void SerialPortInt(void) interrupt 4
 {
 uint8_t rx = 0;
 
 if( TI == 1 )
 {       
 TI = 0;
 if ( RS485En == 0 ) 
 {            
 return;
 }
 
 if ( send_count < data_count )
 {                       
 TB8 = 0;                    
 SBUF = ascii_frame[send_count];        
 send_count++;
 }
 else
 {                      
 RS485En = 0;     
 clear_frame();
 }
 
 }
 else if( RI == 1 )
 {
 if ( RS485En == 0 && BUSY == 1 )	 
 {           
 rx = SBUF;             
 RI = 0;
 if (rx == 0)
 {
 return;  
 }
 
 if ( data_count == 0 )
 {             
 if ( rx == ':' )     
 {                                  
 ascii_frame[data_count++] = rx;    
 }            
 }
 else  
 {
 ascii_frame[data_count++] = rx;     
 
 if ( data_count >= 9 )
 {                    
 if ( (ascii_frame[data_count-1] == 0x0A) && (ascii_frame[data_count-2] == 0x0D) )
 {                            
 BUSY = 0;    
 
 execute_modbus_command();
 
 BUSY = 1;    
 }
 }                      
 
 if ( data_count == 60 )    
 {                
 clear_frame();             
 }                                                       
 }
 }
 else
 {
 RI = 0;
 }
 }
 }
 
 void update_display(void)
 {    
 int x = (int)GetHoldingRegisterValue(0);  
 int L = (int)GetHoldingRegisterValue(1);  
 
 if ( x >= 0 && x <= 9 )
 {       
 P2 = _7seg[x]; 
 ONE = 0;     
 }      
 else
 {
 if ( x < 20 )
 {            
 x = x % 10;
 P2 = _7seg[x]; 
 ONE = 1;                    
 }   
 }
 
 if ( L >= 0 && L <= 5 )
 {
 level = L;
 }
 }
 
 void main(void)
 {        
 Serial_PWM_Init(); 
 
 SetCoilValue(0,1);        
 SetHoldingRegisterValue(0,1);      
 
 EN_D = 1;
 LED1 = 1;
 RS485En = 0;
 BUSY = 1;
 
 clear_frame();
 
 EA = 1;    
 
 while (1)
 {                     
 update_display();
 delay_ms(1000);
 }    
 }
