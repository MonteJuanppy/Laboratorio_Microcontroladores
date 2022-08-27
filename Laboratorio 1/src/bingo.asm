;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.0.0 #11528 (Linux)
;--------------------------------------------------------
; PIC port for the 14-bit core
;--------------------------------------------------------
;	.file	"bingo.c"
	list	p=12f675
	radix dec
	include "p12f675.inc"
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ANSEL
	extern	_VRCON
	extern	_TRISIO
	extern	_ADCON0
	extern	_CMCON
	extern	_GPIO
	extern	_GPIObits
	extern	__sdcc_gsinit_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	global	_main
	global	_delay
	global	_desplegar_numero

	global PSAVE
	global SSAVE
	global WSAVE
	global STK12
	global STK11
	global STK10
	global STK09
	global STK08
	global STK07
	global STK06
	global STK05
	global STK04
	global STK03
	global STK02
	global STK01
	global STK00

sharebank udata_ovr 0x0020
PSAVE	res 1
SSAVE	res 1
WSAVE	res 1
STK12	res 1
STK11	res 1
STK10	res 1
STK09	res 1
STK08	res 1
STK07	res 1
STK06	res 1
STK05	res 1
STK04	res 1
STK03	res 1
STK02	res 1
STK01	res 1
STK00	res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
UDL_bingo_0	udata
r0x100D	res	1
r0x1006	res	1
r0x1005	res	1
r0x1007	res	1
r0x1008	res	1
r0x1009	res	1
r0x100A	res	1
r0x100B	res	1
r0x100C	res	1
r0x1001	res	1
r0x1000	res	1
r0x1004	res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------
;--------------------------------------------------------
; initialized absolute data
;--------------------------------------------------------
;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
STARTUP	code 0x0000
	nop
	pagesel __sdcc_gsinit_startup
	goto	__sdcc_gsinit_startup
;--------------------------------------------------------
; code
;--------------------------------------------------------
code_bingo	code
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _desplegar_numero
;   _delay
;   _desplegar_numero
;   _delay
;   _desplegar_numero
;   _delay
;   _desplegar_numero
;   _delay
;4 compiler assigned registers:
;   r0x100D
;   STK02
;   STK01
;   STK00
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	22; "bingo.c"	ANSEL  = 0x00;   // Set ports as digital I/O, not analog input
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	23; "bingo.c"	ADCON0 = 0x00;          // Shut off the A/D Converter
	BANKSEL	_ADCON0
	CLRF	_ADCON0
;	.line	24; "bingo.c"	CMCON  = 0x07;          // Deshabilita el comparador 
	MOVLW	0x07
	MOVWF	_CMCON
;	.line	25; "bingo.c"	VRCON  = 0x00;         // Shut off the Voltage Reference
	BANKSEL	_VRCON
	CLRF	_VRCON
;	.line	26; "bingo.c"	TRISIO = 0b00001000; //Se ponen los pines como salidas. Solo el GP3 es entrada por defecto
	MOVLW	0x08
	MOVWF	_TRISIO
;	.line	27; "bingo.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
_00105_DS_:
;	.line	32; "bingo.c"	while ( Boton !=1 )
	CLRF	r0x100D
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x100D,F
	MOVF	r0x100D,W
;	.line	35; "bingo.c"	desplegar_numero(8,0);
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00108_DS_
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x08
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	36; "bingo.c"	delay(time);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	37; "bingo.c"	desplegar_numero(5,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x05
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	38; "bingo.c"	delay(time);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
	GOTO	_00105_DS_
_00108_DS_:
;	.line	42; "bingo.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;8 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   STK01
;   r0x1002
;   STK02
;   r0x1003
;   r0x1004
;; Starting pCode block
S_bingo__desplegar_numero	code
_desplegar_numero:
; 2 exit points
;	.line	54; "bingo.c"	void desplegar_numero (unsigned int numero, unsigned int display)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
	MOVF	STK01,W
;;1	MOVWF	r0x1002
	MOVF	STK02,W
;;1	MOVWF	r0x1003
;	.line	56; "bingo.c"	GP5 = display; //Se asigna el display en el que se desplegará el número
	MOVWF	r0x1004
	RRF	r0x1004,W
	BTFSC	STATUS,0
	GOTO	_00001_DS_
	BANKSEL	_GPIObits
	BCF	_GPIObits,5
_00001_DS_:
	BTFSS	STATUS,0
	GOTO	_00002_DS_
	BANKSEL	_GPIObits
	BSF	_GPIObits,5
_00002_DS_:
;	.line	59; "bingo.c"	if (numero == 0)
	MOVF	r0x1000,W
	IORWF	r0x1001,W
	BTFSS	STATUS,2
	GOTO	_00183_DS_
;	.line	61; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	62; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	63; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	64; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00183_DS_:
;	.line	67; "bingo.c"	else if (numero == 1)
	MOVF	r0x1001,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00180_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00180_DS_
;	.line	69; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	70; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	71; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	72; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00180_DS_:
;	.line	75; "bingo.c"	else if (numero == 2)
	MOVF	r0x1001,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00177_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00177_DS_
;	.line	77; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	78; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	79; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	80; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00177_DS_:
;	.line	83; "bingo.c"	else if (numero == 3)
	MOVF	r0x1001,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00174_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00174_DS_
;	.line	85; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	86; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	87; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	88; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00174_DS_:
;	.line	91; "bingo.c"	else if (numero == 4)
	MOVF	r0x1001,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00171_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00171_DS_
;	.line	93; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	94; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	95; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	96; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00171_DS_:
;	.line	99; "bingo.c"	else if (numero == 5)
	MOVF	r0x1001,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00168_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00168_DS_
;	.line	101; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	102; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	103; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	104; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00168_DS_:
;	.line	107; "bingo.c"	else if (numero == 6)
	MOVF	r0x1001,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00165_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00165_DS_
;	.line	109; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	110; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	111; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	112; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00165_DS_:
;	.line	115; "bingo.c"	else if (numero == 7)
	MOVF	r0x1001,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00162_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00162_DS_
;	.line	117; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	118; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	119; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	120; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00185_DS_
_00162_DS_:
;	.line	123; "bingo.c"	else if (numero == 8)
	MOVF	r0x1001,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00159_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00159_DS_
;	.line	125; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	126; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	127; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	128; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00185_DS_
_00159_DS_:
;	.line	131; "bingo.c"	else if (numero == 9)
	MOVF	r0x1001,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00156_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00156_DS_
;	.line	133; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	134; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	135; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	136; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00185_DS_
_00156_DS_:
;	.line	141; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	142; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	143; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	144; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
_00185_DS_:
;	.line	146; "bingo.c"	}
	RETURN	
; exit point of _desplegar_numero

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1005
;   STK00
;   r0x1006
;   r0x1007
;   r0x1008
;   r0x1009
;   r0x100A
;   r0x100B
;   r0x100C
;; Starting pCode block
S_bingo__delay	code
_delay:
; 2 exit points
;	.line	45; "bingo.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1006
;	.line	50; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1007
	CLRF	r0x1008
_00129_DS_:
	MOVF	r0x1005,W
	SUBWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00150_DS_
	MOVF	r0x1006,W
	SUBWF	r0x1007,W
_00150_DS_:
	BTFSC	STATUS,0
	GOTO	_00131_DS_
;;genSkipc:3307: created from rifx:0x7fff290c3130
;	.line	51; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1009
	MOVLW	0x04
	MOVWF	r0x100A
_00127_DS_:
	MOVLW	0xff
	ADDWF	r0x1009,W
	MOVWF	r0x100B
	MOVLW	0xff
	MOVWF	r0x100C
	MOVF	r0x100A,W
	BTFSC	STATUS,0
	INCFSZ	r0x100A,W
	ADDWF	r0x100C,F
	MOVF	r0x100B,W
	MOVWF	r0x1009
	MOVF	r0x100C,W
	MOVWF	r0x100A
	MOVF	r0x100C,W
	IORWF	r0x100B,W
	BTFSS	STATUS,2
	GOTO	_00127_DS_
;	.line	50; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1007,F
	BTFSC	STATUS,2
	INCF	r0x1008,F
	GOTO	_00129_DS_
_00131_DS_:
;	.line	52; "bingo.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  224+   26 =   250 instructions (  552 byte)

	end
