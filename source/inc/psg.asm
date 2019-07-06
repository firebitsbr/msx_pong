;***********************************************************
; Rutinas de acceso al PSG (Programable Sound Generator)
; ASM Z80 MSX
;***********************************************************



; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	$A0 = Reg Select	$A1 = Write Data	$A2 = Read Data
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;										Register Bits
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	Reg.	Function		7		6		5		4		3		2		1		0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R0	Channel A Period	pa7		pa6		pa5		pa4		pa3		pa2		pa1		pa0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R1	Channel A Period	-		-		-		-		paB		paA		pa9		pa8
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R2	Channel B Period	pb7		pb6		pb5		pb4		pb3		pb2		pb1		pb0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R3	Channel B Period	-		-		-		-		pbB		pbA		pb9		pb8
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R4	Channel C Period	pc7		pc6		pc5		pc4		pc3		pc2		pc1		pc0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R5	Channel C Period	-		-		-		-		pcB		pcA		pc9		pc8
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R6	Noise Tone		-		-		-		n4		n3		n2		n1		n0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R7	/Enable			Port B Dir.	Port A Dir.	C Noise		B Noise		A Noise		C Tone		B Tone		A Tone
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R8	Channel A Volume	-		-		-		A Mode		va3		va2		va1		va0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R9	Channel B Volume	-		-		-		B Mode		vb3		vb2		vb1		vb0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R10	Channel C Volume	-		-		-		C Mode		vc3		vc2		vc1		vc0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R11	Envelope Period		ep7		ep6		ep5		ep4		ep3		ep2		ep1		ep0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R12	Envelope Period		epF		epE		epD		epC		epB		epA		ep9		ep8
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R13	Envelope Wave Shape	-		-		-		-		es3		es2		es1		es0
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R14	I/O Port A		Cas Input	Kbd Mode	Joy Trg.B	Joy Trg.A	Joy Right	Joy Left	Joy Back	Joy Fwd
; --------------------------------------------------------------------------------------------------------------------------------------------------------------
;	R15	I/O Port B		Kana LED	Joy Sel		Pulse 2		Pulse 1		1		1		1		1
; --------------------------------------------------------------------------------------------------------------------------------------------------------------

; --------------------------------------------------------------------------------------------------------------------------------------------------------------
; Important note: the PSG registers R14 and R15 can be programmed for input or output. On MSX, R14 must be ever programmed for input and, R15, for output.
; Thus, bit 6 of R7 must ever be set to "0" (input) and, bit 7, to "1" (output). Programming them otherwise may cause severe damage to the machine, putting
; active coupling circuitry connected to R14 and R15 in short-circuit. More details on PSG register 7 section.
; --------------------------------------------------------------------------------------------------------------------------------------------------------------



; ----------------------------------------------------------
; Envia comandos al PSG
; B = Registro
; C = Dato
; ----------------------------------------------------------

PSG_COMMAND:

	ld a, b
	out ($A0), a		; Selecciona el registro
	ld a, c
	out ($A1), a		; Escribe el dato

	; Vuelve
	ret



; ----------------------------------------------------------
; Inicializa el PSG
; Habilita los 3 canales de Melodia
; No asignes ruido a ningun canal
; Volumen al maximo en todos los canales
; ----------------------------------------------------------

PSG_INIT:

	; Configura el I/O del PSG mediante el registro n�7
	ld a, 7
	out ($A0), a

	; Datos a enviar al registro 7
	ld a, 56	; Canales A, B y C como melodia
	and 63		; Proteccion al PSG, los BITs 6 y 7 a 0		[00xxxxxx]
	or 128		; Pon el BIT 7 a 1 y el BIT 6 a 0		[10xxxxxx]
	out ($A1), a	; Escribe los datos en el registro

	ld a, 8		; Volumen del canal A
	out ($A0), a
	ld a, 15	; Volumen a 15 (sin modulacion)
	out ($A1), a

	ld a, 9		; Volumen del canal B
	out ($A0), a
	ld a, 15	; Volumen a 15 (sin modulacion)
	out ($A1), a

	ld a, 10	; Volumen del canal C
	out ($A0), a
	ld a, 15	; Volumen a 15 (sin modulacion)
	out ($A1), a


	; Vuelve
	ret





; ----------------------------------------------------------
; Lee los puertos de JoyStick usando el PSG
; ----------------------------------------------------------

; Lectura del puerto 1

READ_JOY1:

	; Seleccion del Puerto 1
	ld a, 15	; Seleccion del registro 15
	out ($A0), a
	out ($A1), a	; Puerto 1 seleccionado [00001111] = 15

	; Selecciona el registro de datos de puerto de JoyStick [14]
	ld a, 14
	out ($A0), a

	; Guarda la informacion de este Joystick en el registro C
	in a, ($A2)
	ld c, a

	; JOY1: ARRIBA		[BIT 0]
	ld hl, JOY1_UP
	ld b, 1
	call READ_JOYKEY

	; JOY1: ABAJO		[BIT 1]
	ld hl, JOY1_DOWN
	ld b, 2
	call READ_JOYKEY

	; JOY1: IZQUIERDA	[BIT 2]
	ld hl, JOY1_LEFT
	ld b, 4
	call READ_JOYKEY

	; JOY1: DERECHA		[BIT 3]
	ld hl, JOY1_RIGHT
	ld b, 8
	call READ_JOYKEY

	; JOY1: BOTON A		[BIT 4]
	ld hl, JOY1_TG1
	ld b, 16
	call READ_JOYKEY

	; JOY1: BOTON B		[BIT 5]
	ld hl, JOY1_TG2
	ld b, 32
	call READ_JOYKEY

	; Sal de la rutina
	ret



; Lectura del puerto 2

READ_JOY2:

	; Seleccion del Puerto 2
	ld a, 15	; Seleccion del registro 15
	out ($A0), a
	ld a, 79	; Puerto 1 seleccionado [01001111] = 79
	out ($A1), a

	; Selecciona el registro de datos de puerto de JoyStick [14]
	ld a, 14
	out ($A0), a

	; Guarda la informacion de este Joystick en el registro C
	in a, ($A2)
	ld c, a

	; JOY2: ARRIBA		[BIT 0]
	ld hl, JOY2_UP
	ld b, 1
	call READ_JOYKEY

	; JOY2: ABAJO		[BIT 1]
	ld hl, JOY2_DOWN
	ld b, 2
	call READ_JOYKEY

	; JOY2: IZQUIERDA	[BIT 2]
	ld hl, JOY2_LEFT
	ld b, 4
	call READ_JOYKEY

	; JOY2: DERECHA		[BIT 3]
	ld hl, JOY2_RIGHT
	ld b, 8
	call READ_JOYKEY

	; JOY2: BOTON A		[BIT 4]
	ld hl, JOY2_TG1
	ld b, 16
	call READ_JOYKEY

	; JOY2: BOTON B		[BIT 5]
	ld hl, JOY2_TG2
	ld b, 32
	call READ_JOYKEY

	; Sal de la rutina
	ret



; Lee un valor en concreto

; Lee el estado de la tecla solicitada usando el puerto $A2
; BC = Datos de la tecla del Joystick		B = BIT		C = Datos
; HL = Direccion de la variable asignada a la tecla

READ_JOYKEY:		
			
	ld a, c				; Carga los datos guardados del puerto
	and b				; Comparalos con el bit correspondiente

	jr z, JOYKEY_HELD		; En caso de que se haya pulsado, salta
	
	; Si no se ha pulsado
	ld [hl], $00			; Todos los BITs a 0
	ret
	
	; Si se ha pulsado
	JOYKEY_HELD:
	ld a, [hl]			; Carga el estado anterior
	and $04				; Si no estava pulsada...
	jr z, JOYKEY_PRESS		; Salta a NEW PRESS
	ld [hl], $05			; Si ya estava pulsada, pon a 1 los BITS 0 (HELD) y 1 (TEMP) y a 0 el BIT 1 (PRESS)
	ret

	; Si era una nueva pulsacion
	JOYKEY_PRESS:
	ld [hl], $07			; Todos los BITs a 1
	ret