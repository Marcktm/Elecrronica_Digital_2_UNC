;Escribir un programa que sume dos números de 16 bits 
;A (20H 21H) y B (22H y 23H) 
;y al resultado colocarlo en A.
    
    LIST P=16F887
    INCLUDE <p16f887.inc>
    
LOWA	EQU 0x20
HIGHA	EQU 0x21
LOWB	EQU 0x22
HIGHB	EQU 0x23
	
	ORG 0x00
	GOTO MAIN
	ORG 0x05
	
MAIN	
	BCF	STATUS,RP0
	BCF	STATUS,RP1
	MOVF    LOWB,W
	ADDWF   LOWA,F
	BTFSC   STATUS,C
	INCF    HIGHA	    ;INCREMENTA EN 1 PARTE ALTA SI C=1
	MOVF    HIGHB,W
	ADDWF   HIGHA,F
	    
	GOTO    $
	END


