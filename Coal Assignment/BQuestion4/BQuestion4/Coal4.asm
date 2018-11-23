Include Irvine32.inc
.data
s1  BYTE 15 DUP(?)
s2  BYTE "Not Palindrome. ",0
s3  BYTE "Palindrome. ",0
lengthString BYTE ?
Input BYTE "Enter String: ",0

.code
	main PROC
	mov EDX,offset Input
	call WriteString
	mov EDX,offset s1
	mov ECX,lengthof s1
	call ReadString
	mov CL,Al
	mov LengthString,Cl
	mov ESI,0
	L1:
		mov EAX,0
		mov Al,s1[ESI]
		push EAX
		inc ESI
	loop L1

	mov ESI,0
	mov CL,LengthString

	L2:
		pop EAX
		cmp AL,s1[ESI]
		jnz notPalindrome
		inc ESI
	Loop L2

	call crlf
	mov EDX,offset s3
	call WriteString
	call crlf
	exit

	notPalindrome:
		
		
		mov EDX,offset s2
		call WriteString

	exit
	main ENDP
END Main
