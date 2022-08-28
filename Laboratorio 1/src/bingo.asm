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
	global	_desplegar_prolongado

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
r0x1012	res	1
r0x1013	res	1
r0x1014	res	1
r0x1015	res	1
r0x1016	res	1
r0x1017	res	1
r0x1018	res	1
r0x1019	res	1
r0x101A	res	1
r0x101B	res	1
r0x101C	res	1
r0x101D	res	1
r0x101E	res	1
r0x1001	res	1
r0x1000	res	1
r0x1002	res	1
r0x1003	res	1
r0x1004	res	1
r0x1005	res	1
r0x1006	res	1
r0x1007	res	1
r0x1009	res	1
r0x1008	res	1
r0x100B	res	1
r0x100A	res	1
r0x100D	res	1
r0x100C	res	1
r0x100E	res	1
r0x100F	res	1
r0x1010	res	1
r0x1011	res	1
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
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_numero
;   _delay
;   _desplegar_numero
;   _delay
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;   _desplegar_prolongado
;18 compiler assigned registers:
;   r0x1012
;   r0x1013
;   r0x1014
;   r0x1015
;   r0x1016
;   r0x1017
;   r0x1018
;   r0x1019
;   r0x101A
;   r0x101B
;   r0x101C
;   r0x101D
;   r0x101E
;   STK02
;   STK01
;   STK00
;   STK04
;   STK03
;; Starting pCode block
S_bingo__main	code
_main:
; 2 exit points
;	.line	26; "bingo.c"	ANSEL  = 0x00;   //Se poenen los puertos como digitales, no analogicos
	BANKSEL	_ANSEL
	CLRF	_ANSEL
;	.line	27; "bingo.c"	CMCON  = 0x07;   // Deshabilita el comparador 
	MOVLW	0x07
	BANKSEL	_CMCON
	MOVWF	_CMCON
;	.line	28; "bingo.c"	VRCON  = 0x00;   //Se quita le referencia de tension
	BANKSEL	_VRCON
	CLRF	_VRCON
;	.line	29; "bingo.c"	TRISIO = 0b00001000; //Se ponen los pines como salidas. Solo el GP3 es entrada por defecto
	MOVLW	0x08
	MOVWF	_TRISIO
;	.line	30; "bingo.c"	GPIO = 0x00; //Poner pines en bajo
	BANKSEL	_GPIO
	CLRF	_GPIO
;	.line	33; "bingo.c"	unsigned int numero_0 = 15;//Valor por defecto, por lo que se despliega "F" en pantalla del display 0.
	MOVLW	0x0f
	MOVWF	r0x1012
	CLRF	r0x1013
;	.line	34; "bingo.c"	unsigned int numero_1 = 15;//Valor por defecto, por lo que se despliega "F" en pantalla del display 1.
	MOVLW	0x0f
	MOVWF	r0x1014
	CLRF	r0x1015
;	.line	35; "bingo.c"	unsigned int contador = 0;
	CLRF	r0x1016
	CLRF	r0x1017
;	.line	36; "bingo.c"	unsigned int random = 0;
	CLRF	r0x1018
	CLRF	r0x1019
;	.line	37; "bingo.c"	unsigned int random2 = 0;
	CLRF	r0x101A
	CLRF	r0x101B
;	.line	38; "bingo.c"	unsigned int sumar = 0;
	CLRF	r0x101C
	CLRF	r0x101D
_00118_DS_:
;	.line	44; "bingo.c"	random +=1;
	INCF	r0x1018,F
	BTFSC	STATUS,2
	INCF	r0x1019,F
;	.line	45; "bingo.c"	random2 +=random;
	MOVF	r0x1018,W
	ADDWF	r0x101A,F
	MOVF	r0x1019,W
	BTFSC	STATUS,0
	INCFSZ	r0x1019,W
	ADDWF	r0x101B,F
;	.line	47; "bingo.c"	if ( Boton == 1)
	CLRF	r0x101E
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x101E,F
	MOVF	r0x101E,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00106_DS_
;	.line	49; "bingo.c"	sumar = 1;
	MOVLW	0x01
	MOVWF	r0x101C
	CLRF	r0x101D
;	.line	51; "bingo.c"	desplegar_numero(numero_0,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1012,W
	MOVWF	STK00
	MOVF	r0x1013,W
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	52; "bingo.c"	delay(tiempo);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	53; "bingo.c"	desplegar_numero(numero_1,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1014,W
	MOVWF	STK00
	MOVF	r0x1015,W
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	54; "bingo.c"	delay(tiempo);
	MOVLW	0x01
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;;unsigned compare: left < lit(0xA=10), size=2
_00106_DS_:
;	.line	57; "bingo.c"	if (random >=10)
	MOVLW	0x00
	SUBWF	r0x1019,W
	BTFSS	STATUS,2
	GOTO	_00150_DS_
	MOVLW	0x0a
	SUBWF	r0x1018,W
_00150_DS_:
	BTFSS	STATUS,0
	GOTO	_00108_DS_
;;genSkipc:3307: created from rifx:0x7ffff014d130
;	.line	59; "bingo.c"	random = 0;
	CLRF	r0x1018
	CLRF	r0x1019
;;unsigned compare: left < lit(0xA=10), size=2
_00108_DS_:
;	.line	62; "bingo.c"	if (random2 >=10)
	MOVLW	0x00
	SUBWF	r0x101B,W
	BTFSS	STATUS,2
	GOTO	_00151_DS_
	MOVLW	0x0a
	SUBWF	r0x101A,W
_00151_DS_:
	BTFSS	STATUS,0
	GOTO	_00110_DS_
;;genSkipc:3307: created from rifx:0x7ffff014d130
;	.line	64; "bingo.c"	random2 = 0;
	CLRF	r0x101A
	CLRF	r0x101B
_00110_DS_:
;	.line	68; "bingo.c"	if ( Boton != 1){
	CLRF	r0x101E
	BANKSEL	_GPIObits
	BTFSC	_GPIObits,3
	INCF	r0x101E,F
	MOVF	r0x101E,W
;	.line	69; "bingo.c"	if (sumar ==1)
	XORLW	0x01
	BTFSC	STATUS,2
	GOTO	_00114_DS_
	MOVF	r0x101C,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00112_DS_
	MOVF	r0x101D,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00112_DS_
;	.line	71; "bingo.c"	contador +=1;
	INCF	r0x1016,F
	BTFSC	STATUS,2
	INCF	r0x1017,F
;	.line	72; "bingo.c"	sumar = 0;
	CLRF	r0x101C
	CLRF	r0x101D
_00112_DS_:
;	.line	74; "bingo.c"	numero_1 = (unsigned int)(random);
	MOVF	r0x1018,W
	MOVWF	r0x1014
	MOVF	r0x1019,W
	MOVWF	r0x1015
;	.line	75; "bingo.c"	numero_0 = (unsigned int)(random2);
	MOVF	r0x101A,W
	MOVWF	r0x1012
	MOVF	r0x101B,W
	MOVWF	r0x1013
_00114_DS_:
;	.line	78; "bingo.c"	if (contador == 17){
	MOVF	r0x1016,W
	XORLW	0x11
	BTFSS	STATUS,2
	GOTO	_00118_DS_
	MOVF	r0x1017,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00118_DS_
;	.line	79; "bingo.c"	desplegar_prolongado(9,tiempo,70);
	MOVLW	0x46
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	80; "bingo.c"	desplegar_prolongado(0,tiempo,50);
	MOVLW	0x32
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	81; "bingo.c"	desplegar_prolongado(9,tiempo,70);
	MOVLW	0x46
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	82; "bingo.c"	desplegar_prolongado(0,tiempo,50);
	MOVLW	0x32
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	83; "bingo.c"	desplegar_prolongado(9,tiempo,70);
	MOVLW	0x46
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	84; "bingo.c"	desplegar_prolongado(0,tiempo,50);
	MOVLW	0x32
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	85; "bingo.c"	desplegar_prolongado(9,tiempo,70);
	MOVLW	0x46
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	86; "bingo.c"	desplegar_prolongado(0,tiempo,50);
	MOVLW	0x32
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	87; "bingo.c"	desplegar_prolongado(9,tiempo,70);
	MOVLW	0x46
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	88; "bingo.c"	desplegar_prolongado(0,tiempo,50);
	MOVLW	0x32
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	89; "bingo.c"	desplegar_prolongado(9,tiempo,70);
	MOVLW	0x46
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x09
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	90; "bingo.c"	desplegar_prolongado(0,tiempo,50);
	MOVLW	0x32
	MOVWF	STK04
	MOVLW	0x00
	MOVWF	STK03
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVLW	0x00
	MOVWF	STK00
	MOVLW	0x00
	PAGESEL	_desplegar_prolongado
	CALL	_desplegar_prolongado
	PAGESEL	$
;	.line	91; "bingo.c"	numero_0 = 15;
	MOVLW	0x0f
	MOVWF	r0x1012
	CLRF	r0x1013
;	.line	92; "bingo.c"	numero_1 = 15;
	MOVLW	0x0f
	MOVWF	r0x1014
	CLRF	r0x1015
;	.line	93; "bingo.c"	contador = 0;
	CLRF	r0x1016
	CLRF	r0x1017
	GOTO	_00118_DS_
;	.line	98; "bingo.c"	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
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
;15 compiler assigned registers:
;   r0x1008
;   STK00
;   r0x1009
;   STK01
;   r0x100A
;   STK02
;   r0x100B
;   STK03
;   r0x100C
;   STK04
;   r0x100D
;   r0x100E
;   r0x100F
;   r0x1010
;   r0x1011
;; Starting pCode block
S_bingo__desplegar_prolongado	code
_desplegar_prolongado:
; 2 exit points
;	.line	203; "bingo.c"	void desplegar_prolongado (unsigned int numero, unsigned int tiempo, unsigned int i){
	MOVWF	r0x1008
	MOVF	STK00,W
	MOVWF	r0x1009
	MOVF	STK01,W
	MOVWF	r0x100A
	MOVF	STK02,W
	MOVWF	r0x100B
	MOVF	STK03,W
	MOVWF	r0x100C
	MOVF	STK04,W
	MOVWF	r0x100D
;	.line	204; "bingo.c"	for (int j = 0; j < i; j++)
	CLRF	r0x100E
	CLRF	r0x100F
_00226_DS_:
	MOVF	r0x100E,W
	MOVWF	r0x1010
	MOVF	r0x100F,W
	MOVWF	r0x1011
	MOVF	r0x100C,W
	SUBWF	r0x1011,W
	BTFSS	STATUS,2
	GOTO	_00239_DS_
	MOVF	r0x100D,W
	SUBWF	r0x1010,W
_00239_DS_:
	BTFSC	STATUS,0
	GOTO	_00228_DS_
;;genSkipc:3307: created from rifx:0x7ffff014d130
;	.line	206; "bingo.c"	desplegar_numero(numero,0);
	MOVLW	0x00
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVF	r0x1008,W
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	207; "bingo.c"	delay(tiempo);
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	208; "bingo.c"	desplegar_numero(numero,1);
	MOVLW	0x01
	MOVWF	STK02
	MOVLW	0x00
	MOVWF	STK01
	MOVF	r0x1009,W
	MOVWF	STK00
	MOVF	r0x1008,W
	PAGESEL	_desplegar_numero
	CALL	_desplegar_numero
	PAGESEL	$
;	.line	209; "bingo.c"	delay(tiempo);
	MOVF	r0x100B,W
	MOVWF	STK00
	MOVF	r0x100A,W
	PAGESEL	_delay
	CALL	_delay
	PAGESEL	$
;	.line	204; "bingo.c"	for (int j = 0; j < i; j++)
	INCF	r0x100E,F
	BTFSC	STATUS,2
	INCF	r0x100F,F
	GOTO	_00226_DS_
_00228_DS_:
;	.line	212; "bingo.c"	}
	RETURN	
; exit point of _desplegar_prolongado

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
;	.line	109; "bingo.c"	void desplegar_numero (unsigned int numero, unsigned int display)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
	MOVF	STK01,W
;;1	MOVWF	r0x1002
	MOVF	STK02,W
;;1	MOVWF	r0x1003
;	.line	111; "bingo.c"	GP5 = display; //Se asigna el display en el que se desplegará el número
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
;	.line	114; "bingo.c"	if (numero == 0)
	MOVF	r0x1000,W
	IORWF	r0x1001,W
	BTFSS	STATUS,2
	GOTO	_00217_DS_
;	.line	116; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	117; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	118; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	119; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00217_DS_:
;	.line	122; "bingo.c"	else if (numero == 1)
	MOVF	r0x1001,W
	XORLW	0x01
	BTFSS	STATUS,2
	GOTO	_00214_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00214_DS_
;	.line	124; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	125; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	126; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	127; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00214_DS_:
;	.line	130; "bingo.c"	else if (numero == 2)
	MOVF	r0x1001,W
	XORLW	0x02
	BTFSS	STATUS,2
	GOTO	_00211_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00211_DS_
;	.line	132; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	133; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	134; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	135; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00211_DS_:
;	.line	138; "bingo.c"	else if (numero == 3)
	MOVF	r0x1001,W
	XORLW	0x03
	BTFSS	STATUS,2
	GOTO	_00208_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00208_DS_
;	.line	140; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	141; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	142; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	143; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00208_DS_:
;	.line	146; "bingo.c"	else if (numero == 4)
	MOVF	r0x1001,W
	XORLW	0x04
	BTFSS	STATUS,2
	GOTO	_00205_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00205_DS_
;	.line	148; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	149; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	150; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	151; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00205_DS_:
;	.line	154; "bingo.c"	else if (numero == 5)
	MOVF	r0x1001,W
	XORLW	0x05
	BTFSS	STATUS,2
	GOTO	_00202_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00202_DS_
;	.line	156; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	157; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	158; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	159; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00202_DS_:
;	.line	162; "bingo.c"	else if (numero == 6)
	MOVF	r0x1001,W
	XORLW	0x06
	BTFSS	STATUS,2
	GOTO	_00199_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00199_DS_
;	.line	164; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	165; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	166; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	167; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00199_DS_:
;	.line	170; "bingo.c"	else if (numero == 7)
	MOVF	r0x1001,W
	XORLW	0x07
	BTFSS	STATUS,2
	GOTO	_00196_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00196_DS_
;	.line	172; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	173; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	174; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	175; "bingo.c"	GP4 = 0;
	BCF	_GPIObits,4
	GOTO	_00219_DS_
_00196_DS_:
;	.line	178; "bingo.c"	else if (numero == 8)
	MOVF	r0x1001,W
	XORLW	0x08
	BTFSS	STATUS,2
	GOTO	_00193_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00193_DS_
;	.line	180; "bingo.c"	GP0 = 0;
	BANKSEL	_GPIObits
	BCF	_GPIObits,0
;	.line	181; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	182; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	183; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00219_DS_
_00193_DS_:
;	.line	186; "bingo.c"	else if (numero == 9)
	MOVF	r0x1001,W
	XORLW	0x09
	BTFSS	STATUS,2
	GOTO	_00190_DS_
	MOVF	r0x1000,W
	XORLW	0x00
	BTFSS	STATUS,2
	GOTO	_00190_DS_
;	.line	188; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	189; "bingo.c"	GP1 = 0;
	BCF	_GPIObits,1
;	.line	190; "bingo.c"	GP2 = 0;
	BCF	_GPIObits,2
;	.line	191; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
	GOTO	_00219_DS_
_00190_DS_:
;	.line	196; "bingo.c"	GP0 = 1;
	BANKSEL	_GPIObits
	BSF	_GPIObits,0
;	.line	197; "bingo.c"	GP1 = 1;
	BSF	_GPIObits,1
;	.line	198; "bingo.c"	GP2 = 1;
	BSF	_GPIObits,2
;	.line	199; "bingo.c"	GP4 = 1;
	BSF	_GPIObits,4
_00219_DS_:
;	.line	201; "bingo.c"	}
	RETURN	
; exit point of _desplegar_numero

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;9 compiler assigned registers:
;   r0x1000
;   STK00
;   r0x1001
;   r0x1002
;   r0x1003
;   r0x1004
;   r0x1005
;   r0x1006
;   r0x1007
;; Starting pCode block
S_bingo__delay	code
_delay:
; 2 exit points
;	.line	101; "bingo.c"	void delay(unsigned int tiempo)
	MOVWF	r0x1000
	MOVF	STK00,W
	MOVWF	r0x1001
;	.line	105; "bingo.c"	for(i=0;i<tiempo;i++)
	CLRF	r0x1002
	CLRF	r0x1003
_00163_DS_:
	MOVF	r0x1000,W
	SUBWF	r0x1003,W
	BTFSS	STATUS,2
	GOTO	_00184_DS_
	MOVF	r0x1001,W
	SUBWF	r0x1002,W
_00184_DS_:
	BTFSC	STATUS,0
	GOTO	_00165_DS_
;;genSkipc:3307: created from rifx:0x7ffff014d130
;	.line	106; "bingo.c"	for(j=0;j<1275;j++);
	MOVLW	0xfb
	MOVWF	r0x1004
	MOVLW	0x04
	MOVWF	r0x1005
_00161_DS_:
	MOVLW	0xff
	ADDWF	r0x1004,W
	MOVWF	r0x1006
	MOVLW	0xff
	MOVWF	r0x1007
	MOVF	r0x1005,W
	BTFSC	STATUS,0
	INCFSZ	r0x1005,W
	ADDWF	r0x1007,F
	MOVF	r0x1006,W
	MOVWF	r0x1004
	MOVF	r0x1007,W
	MOVWF	r0x1005
	MOVF	r0x1007,W
	IORWF	r0x1006,W
	BTFSS	STATUS,2
	GOTO	_00161_DS_
;	.line	105; "bingo.c"	for(i=0;i<tiempo;i++)
	INCF	r0x1002,F
	BTFSC	STATUS,2
	INCF	r0x1003,F
	GOTO	_00163_DS_
_00165_DS_:
;	.line	107; "bingo.c"	}
	RETURN	
; exit point of _delay


;	code size estimation:
;	  511+   59 =   570 instructions ( 1258 byte)

	end
