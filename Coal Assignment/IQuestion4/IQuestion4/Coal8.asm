Include Irvine32.inc
.data
x WORD 3 DUP (?)
y WORD 3 DUP (?)
z WORD 3 DUP (?)
Message1 BYTE "Enter X ",0
Message2 BYTE "Enter Y ",0
Message3 BYTE "Enter Z ",0
Sides WORD 3 DUP (?)
Equi BYTE "Equilateral Triangle ",0
Isos BYTE "Isosceles Triangle ",0
Scal BYTE "Scalene Triangle ",0
.code
	main PROC
	mov ECX,3
	mov ESI,0
	L1:
		call clrscr
		mov EAX,0
		mov EDX,offset Message1
		call WriteString
		call ReadInt
		mov x[ESI],AX

		mov EDX,offset Message2
		call WriteString
		call ReadInt
		mov y[ESI],AX

		mov EDX,offset Message3
		call WriteString
		call ReadInt
		mov z[ESI],AX

		add ESI,Type x
	Loop L1
	mov ESI,0
	mov ECX,2
	L2:
		mov EAX,0
		mov AX,x[ESI]
		sub AX,x[ESI+2]
		mul EAX
		mov Sides[ESI],AX
		movzx EAX,y[ESI]
		sub AX,y[ESI+2]
		mul EAX
		add Sides[ESI],AX
		movzx EAX,z[ESI]
		sub AX,z[ESI+2]
		mul EAX
		add Sides[ESI],AX
		add ESI,Type x
	Loop L2

		mov EAX,0
		mov AX,x[0]
		sub AX,x[4]
		mul EAX
		mov Sides[4],AX
		movzx EAX,y[0]
		sub AX,y[4]
		mul EAX
		add Sides[4],AX
		movzx EAX,z[0]
		sub AX,z[4]
		mul EAX
		add Sides[0],AX
		movzx EAX,Sides[4]
		
	mov ECX,3
	mov ESI,0

	mov EAX,Sides[0]
	cmp Sides[2],EAX
	jz FirstEqual
	jnz FirstNotEqual


	FirstEqual:
		mov EAX,Sides[2]
		cmp EAX,Sides[4]
		jz Equilateral
		jnz Isosceles

	FirstNotEqual:
		mov EAX,Sides[2]
		cmp EAX,Sides[4]
		jz Isosceles
		jnz SecondThirdNotEqual

	SecondThirdNotEqual:
		mov EAX,Sides[0]
		cmp EAX,Sides[4]
		jz Isosceles
		jnz Scalene

	Equilateral:
		call clrscr
		mov EDX,offset Equi
		call WriteString
		exit

	
	Isosceles:
		call clrscr
		mov EDX,offset Isos
		call WriteString
		exit

	Scalene:
		call clrscr
		mov EDX,offset Scal
		call WriteString
		exit


	exit
	main ENDP
END Main