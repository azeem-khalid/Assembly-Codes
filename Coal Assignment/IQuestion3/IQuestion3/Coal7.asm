Include Irvine32.inc

.data
var1 dword ?

.code
main PROC
mov ecx,10
L1:
	mov eax,25
	push ecx
	call RandomRange
	mov var1,eax
	call writedec
	mov ecx,var1
	L2:
		mov al,'*'
		call WriteChar
	Loop L2
	pop ecx
	call Crlf
	Loop L1

exit
main ENDP
end main
