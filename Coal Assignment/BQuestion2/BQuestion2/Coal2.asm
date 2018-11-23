include irvine32.inc

.data


sentence BYTE "I am a Fastian!",0

.code
main PROC

call clrscr
mov eax,1000
call Delay
mov ecx,15
mov esi,0
mov dh,11
mov dl,20

L1:

call gotoxy
mov al,sentence[ESI]
call WriteChar
mov al,cl
call setTextColor
inc esi
inc dl
Loop L1

call crlf

exit
main endp
end main
