Include Irvine32.inc
temp=12
buf=128

.data
s1 byte "Enter text: ",0
s2 byte "Encrypt text: ",0
buff byte buf+1 DUP(0)
s3 dword ?

.code
main proc
mov edx,offset s1
call writestring
mov ecx,offset sizeof buff
mov edx,offset buff
call readstring
mov s3,eax
call encrpt
mov edx,offset s1
call writestring
mov edx,offset buff
call writestring
call crlf
exit
main endp

encrpt PROC
mov ecx,sizeof buff
mov esi,0
l1:
xor buffer[esi],temp
inc esi
Loop l1
ret
encrpt endp

end main