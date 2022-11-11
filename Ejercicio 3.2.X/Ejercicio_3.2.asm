;Escribir un programa que sume dos valores guardados 
;en los Registros 21H y 22H con resultado en 23H y 24H
    
    LIST P=16F887
    
    INCLUDE <p16f887.inc>

 
;Defino las variables a utilizar 
VAL1	EQU 0x21
VAL2	EQU 0X22
RESL	EQU 0X23
RESH	EQU 0X24
 
 
	ORG	0X00
	GOTO	MAIN
 
	ORG	0X05
MAIN	
	BCF	STATUS,RP0
	BCF	STATUS,RP1
	MOVF	VAL1,W
	ADDWF	VAL2,W
	MOVWF	RESL
	CLRF	RESH
	BTFSC	STATUS,C
	INCF	RESH
	GOTO	$
 
	END
    
 