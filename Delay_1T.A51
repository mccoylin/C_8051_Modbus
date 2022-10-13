;******************************************************************************
; Delay_1T.A51
; (delay time based on Fosc=12MHz/1T, 1/12us per clock, or
;  delay time based on Fosc=24MHz/1T, 1/24us per clock)
;******************************************************************************

Fosc_11M0592Hz       EQU  1 
Fosc_12MHz           EQU  0 ;! use this option for Bench Module test
Fosc_24MHz           EQU  0

PUBLIC   _delay_ms

PUBLIC   delay_1us,delay_2us,delay_5us
PUBLIC   delay_10us,delay_20us,delay_50us
PUBLIC   delay_100us,delay_200us,delay_500us

;;ACC      DATA   0E0h

;==============================================================================
code_delay SEGMENT CODE
         RSEG   code_delay
         USING  0

;------------------------------------------------------------------------------
; Miscellaneous delay time at Fosc=24MHz/12T, 0.5us/mc
;------------------------------------------------------------------------------
;
;!!! Note: With formal parameter, need to be '_'prefixed
_delay_ms:
         PUSH   ACC
         PUSH   AR1
         PUSH   AR0

         MOV    AR1,R6     ;int's MSB from C51
         MOV    AR0,R7     ;int's LSB from C51

         MOV    A,AR0
         JZ     ndLSB
  LSB_loop:
         CALL   delay_unit_1ms
         DJNZ   AR0,LSB_loop
  ndLSB:
         MOV    A,AR1
         JZ     ndMSB
  MSB_loop1:
         MOV    AR0,#00h
  MSB_loop0:
         CALL   delay_unit_1ms
         DJNZ   AR0,MSB_loop0
         DJNZ   AR1,MSB_loop1
  ndMSB:
         POP    AR0
         POP    AR1
         POP    ACC
         RET
;
delay_unit_1ms:
         CALL   delay_500us
         CALL   delay_200us
         CALL   delay_200us
         CALL   delay_50us
         CALL   delay_20us
         CALL   delay_20us
         CALL   delay_5us
         NOP
         NOP
         RET

;------------------------------
NOPs     MACRO  n
           REPT n
           NOP
           ENDM
         ENDM

;------------------------------
IF Fosc_11M0592Hz
delay_1us: ;12 clocks, 11.0592MHz 1/11.0592x 12 = 1.085
         NOPs   4
         RET
ENDIF

IF Fosc_12MHz
delay_1us: ;12 clocks, CALL+RET=10 clocks
         NOPs   2
         RET
ENDIF

IF Fosc_24MHz
delay_1us: ;24 clocks, CALL+RET=10 clocks
         NOPs   14
         RET
ENDIF

;------------------------------
IF Fosc_11M0592Hz
delay_2us: ;23 clocks  11.0592MHz 1/11.0592x 23 = 2.07
         NOPs   23
         RET
ENDIF

IF Fosc_12MHz
delay_2us: ;24 clocks, CALL+RET=10 clocks
         NOPs   14
         RET
ENDIF

IF Fosc_24MHz
delay_2us: ;48 clocks, CALL+RET=10 clocks
         PUSH   AR7     ;4
         MOV    AR7,#5  ;3
         DJNZ   AR7,$   ;5x5
         POP    AR7     ;3
         NOPs   3
         RET
ENDIF

;------------------------------
IF Fosc_11M0592Hz
delay_5us: ;55 clocks , 11.0592MHz 1/11.0592x 56 = 5.08
         PUSH   AR7     ;4
         MOV    AR7,#7  ;3
         DJNZ   AR7,$   ;5x7
         POP    AR7     ;3
         NOPs   1
         RET
ENDIF

IF Fosc_12MHz
delay_5us: ;60 clocks, CALL+RET=10 clocks
         PUSH   AR7     ;4
         MOV    AR7,#8  ;3
         DJNZ   AR7,$   ;5x8
         POP    AR7     ;3
         RET
ENDIF

IF Fosc_24MHz
delay_5us: ;120 clocks, CALL+RET=10 clocks
         PUSH   AR7     ;4
         MOV    AR7,#20 ;3
         DJNZ   AR7,$   ;5x20
         POP    AR7     ;3
         RET
ENDIF

;------------------------------
IF Fosc_11M0592Hz
delay_10us: ;112 clocks , 11.0592MHz 1/11.0592x 112 = 10.08
         PUSH   AR7     ;4
         MOV    AR7,#18 ;3
         DJNZ   AR7,$   ;5x18
         POP    AR7     ;3
         NOPs   2
         RET
ENDIF

IF Fosc_12MHz
delay_10us: ;120 clocks, CALL+RET=10 clocks
         PUSH   AR7     ;4
         MOV    AR7,#20 ;3
         DJNZ   AR7,$   ;5x20
         POP    AR7     ;3
         RET
ENDIF

IF Fosc_24MHz
delay_10us: ;240 clocks, CALL+RET=10 clocks
         PUSH   AR7     ;4
         MOV    AR7,#44 ;3
         DJNZ   AR7,$   ;5x44
         POP    AR7     ;3
         RET
ENDIF

;------------------------------
IF Fosc_11M0592Hz
delay_20us: ;223 clocks , 11.0592MHz 1/11.0592x 223 = 20.07
         PUSH   AR7     ;4
         MOV    AR7,#40 ;3
         DJNZ   AR7,$   ;5x40
         POP    AR7     ;3
         NOPs   3
         RET
ENDIF

IF Fosc_12MHz
delay_20us: ;240 clocks, CALL+RET=10 clocks
         PUSH   AR7     ;4
         MOV    AR7,#44 ;3
         DJNZ   AR7,$   ;5x44
         POP    AR7     ;3
         RET
ENDIF

IF Fosc_24MHz
delay_20us: ;480 clocks, CALL+RET=10 clocks
         PUSH   AR7     ;4
         MOV    AR7,#92 ;3
         DJNZ   AR7,$   ;5x92
         POP    AR7     ;3
         RET
ENDIF

;------------------------------
IF Fosc_11M0592Hz
delay_50us: ;556 clocks , 11.0592MHz 1/11.0592x 556 = 50.04
         PUSH   AR7      ;4
         MOV    AR7,#107 ;3
         DJNZ   AR7,$    ;5x107
         POP    AR7      ;3
         NOPs   1
         RET
ENDIF

IF Fosc_12MHz
delay_50us: ;600 clocks, CALL+RET=10 clocks
         PUSH   AR7      ;4
         MOV    AR7,#116 ;3
         DJNZ   AR7,$    ;5x116
         POP    AR7      ;3
         RET
ENDIF

IF Fosc_24MHz
delay_50us: ;1200 clocks, CALL+RET=10 clocks
         PUSH   AR7      ;4
         MOV    AR7,#236 ;3
         DJNZ   AR7,$    ;5x236
         POP    AR7      ;3
         RET
ENDIF

;------------------------------
IF Fosc_11M0592Hz
delay_100us: ;1112 clocks , 11.0592MHz 1/11.0592x 1112 = 100.08
         PUSH   AR7      ;4
         MOV    AR7,#218 ;3
         DJNZ   AR7,$    ;5x218
         POP    AR7      ;3
         NOPs   2
         RET
ENDIF

IF Fosc_12MHz
delay_100us: ;1200 clocks, CALL+RET=10 clocks
         PUSH   AR7      ;4
         MOV    AR7,#236 ;3
         DJNZ   AR7,$    ;5x236
         POP    AR7      ;3
         RET
ENDIF

IF Fosc_24MHz
delay_100us: ;2400 clocks, CALL+RET=10 clocks
         PUSH   AR7      ;4
         MOV    AR7,#255 ;3
         DJNZ   AR7,$    ;5x255
         MOV    AR7,#220 ;3
         DJNZ   AR7,$    ;5x220
         POP    AR7      ;3
         NOPs   2
         RET
ENDIF

;------------------------------
IF Fosc_11M0592Hz
delay_200us: ;2223 clocks , 11.0592MHz 1/11.0592x 2223 = 200.07
         PUSH   AR7      ;4
         MOV    AR7,#255 ;3
         DJNZ   AR7,$    ;5x255
         MOV    AR7,#185 ;3
         DJNZ   AR7,$    ;5x185
         POP    AR7      ;3
         NOPs   2
         RET
ENDIF

IF Fosc_12MHz
delay_200us: ;2400 clocks, CALL+RET=10 clocks
         PUSH   AR7      ;4
         MOV    AR7,#255 ;3
         DJNZ   AR7,$    ;5x255
         MOV    AR7,#220 ;3
         DJNZ   AR7,$    ;5x220
         POP    AR7      ;3
         NOPs   2
         RET
ENDIF

IF Fosc_24MHz
delay_200us: ;4800 clocks, CALL+RET=10 clocks
         PUSH   AR7      ;4
         MOV    AR7,#255 ;3
         DJNZ   AR7,$    ;5x255
         MOV    AR7,#255 ;3
         DJNZ   AR7,$    ;5x255
         MOV    AR7,#255 ;3
         DJNZ   AR7,$    ;5x255
         MOV    AR7,#189 ;3
         DJNZ   AR7,$    ;5x189
         POP    AR7      ;3
         NOP
         RET
ENDIF

;------------------------------
delay_500us:
         CALL   delay_200us
         CALL   delay_200us
         CALL   delay_100us
         RET
;
;------------------------------
;==============================================================================

         END

