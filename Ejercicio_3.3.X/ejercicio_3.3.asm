;Escribir un programa que resuelva la ecuación: 
;       (A + B) ? C (posiciones 21H, 22H y 23H) 

	list	P=16F887
	include <p16f887.inc>
	
varA	EQU 0x21
varB	EQU 0x22
varC	EQU 0x23
resL	EQU 0x24
resH	EQU 0x25
	
	ORG 0x00
	GOTO MAIN
	ORG 0x05
MAIN	
	BCF	STATUS,RP0
	BCF	STATUS,RP1
	MOVF	varA,W
	ADDWF	varB,W
	MOVWF	resL
	CLRF	resH
	BTFSC	STATUS,C
	GOTO	CONTINUE
	INCF	resH
	BCF	STATUS,C
CONTINUE    
	MOVF	varC,W
	SUBWF	resL,F
	BTFSS	STATUS,C
	GOTO	SIN_CARRY
	GOTO	FIN
	
SIN_CARRY
	BCF	STATUS,C
	BTFSC	resH,0
	DECF	resH
	GOTO	FIN
	
FIN	
	GOTO	$
	
	END
	
	
	

