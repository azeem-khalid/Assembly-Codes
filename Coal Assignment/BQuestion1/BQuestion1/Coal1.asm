Include Irvine32.inc

.data
arr dword 3 DUP(?)
Sentence1 BYTE "Enter First Number: ",0
Sentence2 BYTE "Enter Second Number: ",0
Sentence3 BYTE "Enter Third Number: ",0
.code
	main PROC
	mov EAX,0
	mov EDX,offset Sentence1
	call WriteString
	call ReadInt
	mov arr[0],eax

	mov EDX,offset Sentence2
	call WriteString
	call ReadInt
	mov arr[4],EAX

	mov EDX,offset Sentence3
	call WriteString
	call ReadInt
	mov arr[8],EAX

	call Small

	call WriteInt

	exit
	main ENDP

	Small PROC
	mov ESI,0
	mov EAX,arr[ESI]
	mov ECX,2
	L1:
		add ESI,Type arr
		cmp EAX,arr[ESI]
		ja bubble
		L2:

	Loop L1

	ret

	bubble :
		mov EAX,arr[ESI]
		jmp L2
	Small ENDP

END main