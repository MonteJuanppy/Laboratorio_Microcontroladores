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
; config word(s)
;--------------------------------------------------------
	__config 0x3fd7
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_ANSEL
	extern	_VRCON
	extern	_TRISIO
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
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
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
;8 compiler assigned registers:
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;   STK02
;   STK01
;   STK00
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	25; "bingo.c"	ANSEL  = 0x00;   //Se poenen los puertos como digitales, no analogicos
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	26; "bingo.c"	CMCON  = 0x07;   // Deshabilita el comparador 
	MOVLW	0x07
	BANKSEL	_CMCON
	MOVWF	_CMCON
;	.line	27; "bingo.c"	VRCON  = 0x00;   //Se quita le referencia de tension
	BANKSEL	_VRCON
	CLRF	_VRCON
;	.line	28; "bingo.c"	TRISIO = 0b00001000; //Se ponen los pines como salidas. Solo el GP3 es entrada por defecto
	MOVLW	0x08
	MOVWF	_TRISIO
;	.line	29; "bingo.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	32; "bingo.c"	unsigned int numero_0 = 15;//Valor por defecto, por lo que se despliega "F" en pantalla del display 0.
	MOVLW	0x0f
	MOVWF	r0x100D
	CLRF	r0x100E
;	.line	33; "bingo.c"	unsigned int numero_1 = 15;//Valor por defecto, por lo que se despliega "F" en pantalla del display 1.
	MOVLW	0x0f
	MOVWF	r0x100F
	CLRF	r0x1010
_00110_DS_:
;	.line	41; "bingo.c"	if ( Boton == 1)
	CLRF	r0x1011
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1011,F
	MOVF	r0x1011,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	44; "bingo.c"	desplegar_numero(numero_0,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x100D,W
	MOVWF	STK00
	MOVF	r0x100E,W
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	45; "bingo.c"	delay(tiempo);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	46; "bingo.c"	desplegar_numero(numero_1,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x100F,W
	MOVWF	STK00
	MOVF	r0x1010,W
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	47; "bingo.c"	delay(tiempo);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
_00106_DS_:
;	.line	50; "bingo.c"	if ( Boton != 1){
	CLRF	r0x1011
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x1011,F
	MOVF	r0x1011,W
;	.line	51; "bingo.c"	numero_0 = 2;
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00110_DS_
	MOVLW	0x02
	MOVWF	r0x100D
	CLRF	r0x100E
;	.line	52; "bingo.c"	numero_1 = 7;
	MOVLW	0x07
	MOVWF	r0x100F
	CLRF	r0x1010
	GOTO	_00110_DS_
;	.line	57; "bingo.c"	}
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
;	.line	69; "bingo.c"	void desplegar_numero (unsigned int numero, unsigned int display)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
	MOVF	STK01,W
;;1	MOVWF	r0x1002
	MOVF	STK02,W
;;1	MOVWF	r0x1003
;	.line	71; "bingo.c"	GP5 = display; //Se asigna el display en el que se desplegará el número
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
;	.line	74; "bingo.c"	if (numero == 0)
	MOVF	r0x1000,W
	IORWF	r0x1001,W
	BTFSS	STATUS,2
	GOTO	_00191_DS_
;	.line	76; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	77; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	78; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	79; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00191_DS_:
;	.line	82; "bingo.c"	else if (numero == 1)
	MOVF	r0x1001,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00188_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00188_DS_
;	.line	84; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	85; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	86; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	87; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00188_DS_:
;	.line	90; "bingo.c"	else if (numero == 2)
	MOVF	r0x1001,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00185_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00185_DS_
;	.line	92; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	93; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	94; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	95; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00185_DS_:
;	.line	98; "bingo.c"	else if (numero == 3)
	MOVF	r0x1001,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00182_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00182_DS_
;	.line	100; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	101; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	102; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	103; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00182_DS_:
;	.line	106; "bingo.c"	else if (numero == 4)
	MOVF	r0x1001,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00179_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00179_DS_
;	.line	108; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	109; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	110; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	111; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00179_DS_:
;	.line	114; "bingo.c"	else if (numero == 5)
	MOVF	r0x1001,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00176_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00176_DS_
;	.line	116; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	117; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	118; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	119; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00176_DS_:
;	.line	122; "bingo.c"	else if (numero == 6)
	MOVF	r0x1001,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00173_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00173_DS_
;	.line	124; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	125; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	126; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	127; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00173_DS_:
;	.line	130; "bingo.c"	else if (numero == 7)
	MOVF	r0x1001,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00170_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00170_DS_
;	.line	132; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	133; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	134; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	135; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00193_DS_
_00170_DS_:
;	.line	138; "bingo.c"	else if (numero == 8)
	MOVF	r0x1001,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00167_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00167_DS_
;	.line	140; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	141; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	142; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	143; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00193_DS_
_00167_DS_:
;	.line	146; "bingo.c"	else if (numero == 9)
	MOVF	r0x1001,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00164_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00164_DS_
;	.line	148; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	149; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	150; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	151; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00193_DS_
_00164_DS_:
;	.line	156; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	157; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	158; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	159; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
_00193_DS_:
;	.line	161; "bingo.c"	}
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
;	.line	60; "bingo.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1005
	MOVF	STK00,W
	MOVWF	r0x1006
;	.line	65; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1007
	CLRF	r0x1008
_00137_DS_:
	MOVF	r0x1005,W
	SUBWF	r0x1008,W
	BTFSS	STATUS,2
	GOTO	_00158_DS_
	MOVF	r0x1006,W
	SUBWF	r0x1007,W
_00158_DS_:
	BTFSC	STATUS,0
	GOTO	_00139_DS_
;;genSkipc:3307: created from rifx:0x7ffd7735f6d0
;	.line	66; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1009
	MOVLW	0x04
	MOVWF	r0x100A
_00135_DS_:
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
	GOTO	_00135_DS_
;	.line	65; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1007,F
	BTFSC	STATUS,2
	INCF	r0x1008,F
	GOTO	_00137_DS_
_00139_DS_:
;	.line	67; "bingo.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  242+   27 =   269 instructions (  592 byte)

	end
