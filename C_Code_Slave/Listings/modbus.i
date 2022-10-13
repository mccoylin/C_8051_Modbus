
#line 1 "modbus.c" /0
 
 
  
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
 
 
 
#line 3 "modbus.c" /0
 
 
  
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
 
 
#line 5 "modbus.c" /0
 
 
  
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
 
 
 
#line 7 "modbus.c" /0
 
  
#line 1 "main.h" /0
 
 
 
 
 
  
#line 1 "C:\Keil_v5\C51\Inc\Megawin\REG_MPC82G516.h" /0
 
#line 2 "C:\Keil_v5\C51\Inc\Megawin\REG_MPC82G516.h" /1
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#line 6 "main.h" /0
#line 6 "main.h" /0
 
 
 
 
 
 
 
 
 sbit RS485En  =  P3^2;
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
#line 8 "modbus.c" /0
 
  
#line 1 "..\ascii.h" /0
 
 
 
 
 
  
#line 1 "\C_8051_Modbus\stdint.h" /0



























 
 
 
#line 31 "\C_8051_Modbus\stdint.h" /1
  
 
 
 
 
 
  
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
 
 
  
  
  
 
  
  
  
 
 
 
 
  
 
  
 
 
 
 
  
 
  
 
 
 
 
  
 
  
 
 
 
 
 
 
  
  
 
  
  
 
 
 
  
  
 
 
  
 
 
  
  
  
 
  
 
 
 
  
  
  
 
  
 
 
  
  
 
  
  
 
 
 
  
  
 
  
  
 
 
 
 
  
 
 
 
#line 274 "\C_8051_Modbus\stdint.h" /0
 
#line 6 "..\ascii.h" /0
 
 
 
 
 
 
 
 extern uint8_t ascii[4];
 extern uint8_t hexa[4];
 
 
 void ByteToAscii(uint8_t);
 uint8_t NibbleToAscii(uint8_t);
 uint8_t AsciiToByte(uint8_t, uint8_t);
 void TwoByteToAscii(uint16_t);
 uint16_t AsciiToTwoByte(void);
 
 
 
#line 9 "modbus.c" /0
 
  
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
 
 
 
#line 10 "modbus.c" /0
 
 
 
 
 uint8_t idata ascii_frame[60];  
 uint8_t idata data_count = 0;
 uint8_t idata send_count = 0;
 bit broadcast = 0;
 
 
 void execute_modbus_command(void)   
 {
 uint8_t is_me = 0, fun = 0, lrc = 0;         
 
 if ( data_count < 9 )
 {     
 clear_frame();   
 return;
 }
 data_count -= 2;  
 lrc = AsciiToByte(ascii_frame[data_count-2], ascii_frame[data_count-1]);
 data_count -= 2;  
 fun = lrc_calc(); 
 if ( fun != lrc )
 {     
 clear_frame();   
 return;
 }
 
 
 is_me = AsciiToByte(ascii_frame[1], ascii_frame[2]); 
 if ( is_me == 0 )
 {
 broadcast = 1;    
 }
 else
 {
 broadcast = 0;
 if ( 0x05 != is_me )
 {
 clear_frame();
 return;   
 }
 }
 
 fun = AsciiToByte(ascii_frame[3], ascii_frame[4]);    
 switch ( fun )
 {
 case 1:
 {                 
 ResponseReadCoilsStatus_01();            
 break;        
 }
 case 2:
 {
 ResponseReadInputStatus_02();
 break;
 }
 case 3:
 {        
 ResponseReadHoldingRegisters_03();
 break;
 }
 case 4:
 {
 ResponseReadInputRegisters_04();
 break;
 }
 case 5:
 {           
 ResponseForceSingleCoil_05();            
 break;
 }
 case 6:
 {
 ResponsePresetSingleRegister_06();            
 break;
 }
 case 15:
 {                     
 ResponseForceMultipleCoils_15();
 break;            
 }        
 case 16:
 {              
 ResponsePresetMultipleRegisters_16();
 break;            
 }        
 default: 
 {
 break;
 }
 }
 }
 
 void gen_lrc(void)
 {
 ByteToAscii(lrc_calc());
 ascii_frame[data_count++] = ascii[0];
 ascii_frame[data_count++] = ascii[1];
 
 ascii_frame[data_count++] = 0x0D;
 ascii_frame[data_count++] = 0x0A;    
 }
 
 void clear_frame(void)
 {    
 uint8_t i = 0;
 
 data_count = 0;
 send_count = 0;
 for ( i = 0; i < 60; i++ )
 {
 ascii_frame[i] = 0;
 }
 }
 
 void tx_assci_frame(void)
 {
 if ( broadcast == 1 )
 {
 RS485En = 0;     
 broadcast = 0;
 clear_frame();
 return ;    
 }
 
 RS485En = 1;  
 send_count = 1;
 TI = 0;
 TB8 = 0;        
 SBUF = ascii_frame[0];
 }
 
 uint8_t lrc_calc(void) 
 {
 uint8_t result = 0, i = 0;            
 
 for ( i = 1; i < data_count; i+=2 )
 {
 result += AsciiToByte(ascii_frame[i], ascii_frame[i+1]);
 }
 result = ~result;
 return ( result + 1 );
 }
 
 
 void ResponseReadCoilsStatus_01(void)  
 {
 uint16_t start = 0, cant = 0;
 uint16_t i = 0, limit = 0;
 uint8_t coils = 0, k = 0, new_data_count = 0;
 
 data_count = 7;   
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }    
 start = AsciiToTwoByte();
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9];
 }    
 cant = AsciiToTwoByte();    
 limit = start + cant;
 
 
 for ( i = start; i < limit; i += 8 )
 {
 k = 0;
 coils = 0;    
 while ( k < 8 && i + k < limit)            
 {        
 uint8_t val = GetCoilValue(i + k);     
 if ( val == 1 )  
 {
 coils |= (1 << k);            
 }                
 k++;
 }            
 ByteToAscii(coils);
 ascii_frame[data_count++] = ascii[0];
 ascii_frame[data_count++] = ascii[1];        
 new_data_count++;      
 }
 
 ByteToAscii(new_data_count);
 ascii_frame[5] = ascii[0];
 ascii_frame[6] = ascii[1];
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
 
 void ResponseReadInputStatus_02(void)  
 {
 uint16_t start = 0, cant = 0;
 uint16_t i = 0, limit = 0;
 uint8_t inputs = 0, k = 0, new_data_count = 0;
 
 data_count = 7;   
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }    
 start = AsciiToTwoByte();
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9];
 }
 
 cant = AsciiToTwoByte();    
 limit = start + cant;
 
 
 for ( i = start; i < limit; i += 8 )
 {
 k = 0;
 inputs = 0;    
 while ( k < 8 && i + k < limit)            
 {        
 uint8_t val = GetInputValue(i + k);     
 
 if ( val == 1 )  
 {
 inputs |= (1 << k);            
 }                
 k++;
 }            
 ByteToAscii(inputs);
 ascii_frame[data_count++] = ascii[0];
 ascii_frame[data_count++] = ascii[1];
 
 new_data_count++;      
 }
 
 ByteToAscii(new_data_count);
 ascii_frame[5] = ascii[0];
 ascii_frame[6] = ascii[1];
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
 
 void ResponseReadHoldingRegisters_03(void)   
 {
 uint16_t start = 0, cant = 0;
 uint16_t i = 0, limit = 0, status = 0;
 uint8_t new_data_count = 0;
 
 data_count = 7;   
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }    
 start = AsciiToTwoByte();
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9];
 }    
 cant = AsciiToTwoByte();    
 limit = start + cant;
 
 
 for ( i = start; i < limit; i++ )
 {
 status = GetHoldingRegisterValue(i);       
 TwoByteToAscii(status);
 
 ascii_frame[data_count++] = ascii[3];
 ascii_frame[data_count++] = ascii[2];
 ascii_frame[data_count++] = ascii[1];
 ascii_frame[data_count++] = ascii[0];                          
 
 new_data_count+=2;      
 }
 
 ByteToAscii(new_data_count);
 ascii_frame[5] = ascii[0];
 ascii_frame[6] = ascii[1];
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
 
 void ResponseReadInputRegisters_04(void)   
 {
 uint16_t start = 0, cant = 0;
 uint16_t i = 0, limit = 0, status = 0;
 uint8_t new_data_count = 0;
 
 data_count = 7;   
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }    
 start = AsciiToTwoByte();
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9];
 }
 
 cant = AsciiToTwoByte();    
 limit = start + cant;
 
 
 for ( i = start; i < limit; i++ )
 {
 status = GetInputRegisterValue(i);
 
 TwoByteToAscii(status);
 ascii_frame[data_count++] = ascii[3];
 ascii_frame[data_count++] = ascii[2];
 ascii_frame[data_count++] = ascii[1];
 ascii_frame[data_count++] = ascii[0];
 
 new_data_count+=2;      
 }
 
 ByteToAscii(new_data_count);
 ascii_frame[5] = ascii[0];
 ascii_frame[6] = ascii[1];
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
 
 void ResponseForceSingleCoil_05(void)  
 {
 uint16_t coilID = 0;
 uint16_t value =  0;    
 uint16_t i = 0;            
 
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }   
 coilID = AsciiToTwoByte();      
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9]; 
 }    
 value = AsciiToTwoByte();        
 if ( value == 0 || value == 65280 )      
 {    
 SetCoilValue(coilID, value > 0);
 }
 else
 {
 clear_frame();
 return ;    
 }
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
 
 void ResponsePresetSingleRegister_06(void)   
 {
 uint16_t registerID = 0;
 uint16_t value =  0;    
 uint16_t i = 0;           
 
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }   
 registerID = AsciiToTwoByte();      
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9];
 }    
 value = AsciiToTwoByte();           
 SetHoldingRegisterValue(registerID, value);
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
 
 void ResponseForceMultipleCoils_15(void)  
 {
 uint16_t start = 0, cant = 0;
 uint16_t i = 0, limit = 0;
 uint8_t coils = 0, k = 0, new_data_count = 0, tempAdr = 0;
 uint8_t index = 0, offset = 0;       
 uint16_t idata parameters[20];
 uint8_t idata byte_count;    
 
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }   
 start = AsciiToTwoByte();    
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9];
 }    
 cant = AsciiToTwoByte();        
 limit = start + cant;
 
 new_data_count = AsciiToByte(ascii_frame[13], ascii_frame[14] );
 data_count = 15;
 
 
 byte_count = 0;    
 for ( i = 0; i < new_data_count; i++ )
 {
 coils = AsciiToByte(ascii_frame[data_count], ascii_frame[data_count+1]);
 data_count += 2;        
 parameters[byte_count++] = coils;      
 }
 
 
 for ( i = start; i < limit; i++ )
 {        
 tempAdr = i - start;        
 index = tempAdr / 8;
 offset = tempAdr % 8;        
 k = ( parameters[index] & ( 1 << offset ) );    
 SetCoilValue(i, k > 0);     
 }
 
 data_count = 13;
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
 
 void ResponsePresetMultipleRegisters_16(void)    
 {
 uint16_t start = 0, cant = 0;
 uint16_t i = 0, limit = 0, reg_value = 0;
 signed char j = 0;
 uint8_t idata byte_count;          
 
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 5];
 }   
 start = AsciiToTwoByte();        
 for ( i = 0; i < 4; i++ )
 {
 ascii[i] = ascii_frame[i + 9];
 }    
 cant = AsciiToTwoByte();        
 limit = start + cant;
 
 byte_count = AsciiToByte(ascii_frame[13], ascii_frame[14] );
 data_count = 15;
 
 
 byte_count /= 2;
 for ( i = 0; i < byte_count; i++ )
 {       
 for ( j = 0; j < 4; j++ )
 {     
 ascii[j] = ascii_frame[data_count++];        
 }        
 reg_value = AsciiToTwoByte();        
 holding_registers_array[start++] = reg_value;           
 }
 
 data_count = 13;
 
 gen_lrc();
 
 tx_assci_frame();
 return;
 }
