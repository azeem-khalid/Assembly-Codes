Include Irvine32.inc
.data
Message1 BYTE "Enter Hardness: ",0
Message2 BYTE "Enter Carbon Content: ",0
Message3 BYTE "Enter Tensile Strength: ",0
Hardness DWORD ?
CarbonContent DWORD ? 
TensileStrength DWORD ?

gr0 BYTE "Grade 10",0
gr1 BYTE "Grade 9",0
gr2 BYTE "Grade 8",0
gr3 BYTE "Grade 7",0
gr4 BYTE "Grade 6",0
gr5 BYTE "Grade 5",0

.code
	main PROC
	mov EAX,0
	mov EDX,offset Message1
	call WriteString
	call ReadInt
	mov Hardness,EAX

	mov EAX,0
	mov EDX,offset Message2
	call WriteString
	call ReadInt
	mov CarbonContent,EAX

	mov EAX,0
	mov EDX,offset Message3
	call WriteString
	call ReadInt
	mov TensileStrength,EAX

	cmp Hardness,50
	jg Grade10

	Next:
	cmp Hardness,50
	jg Grade9

	Next1:
	cmp CarbonContent,70
	jb Grade8

	Next2:
	cmp Hardness,50
	jg Grade7

	Next3:
	 jmp Grade6

	mov EDX,offset gr5
	call WriteString
	call crlf
	exit

	Grade10:
		cmp CarbonContent,70
		jb Grade10A
		ja Next

	Grade10A:
		cmp TensileStrength,5600
		ja Grade10C
		jb Next

	Grade10B:
		mov EDX,offset gr0
		call WriteString
		call crlf
		exit


	Grade9:
		cmp CarbonContent,70
		jae Next1
		mov EDX,offset gr1
		call WriteString
		call crlf
		exit

	Grade8:
		cmp TensileStrength,5600
		jb Next2
		mov EDX,offset gr2
		call WriteString
		call crlf
		exit
	
	Grade7:
		cmp TensileStrength,5600
		jb Next3
		mov EDX,offset gr3
		call WriteString
		call crlf
		exit

		
	
	Grade6:
		cmp TensileStrength,5600
		jg Grade6C
		cmp CarbonContent,70
		jb Grade6C
		cmp Hardness,50
		jg Grade6C
		
	Grade6C:
		mov EDX,offset gr4
		call WriteString
		call crlf
		exit


	exit
	main ENDP
END Main