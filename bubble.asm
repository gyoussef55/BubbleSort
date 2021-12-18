TITLE BUBBLE SORT ALGORITHM
; Author : Youssef Gamal
;-------------------------------------------------------------------------------------------------
; Bubble sort works by repeatedly swapping the adjacent elements if they are in wrong order 
; Time complexity  worst case O(n^2)
; Space comlexity O(1)
;-------------------------------------------------------------------------------------------------
.386
.MODEL FLAT
ExitProcess PROTO NEAR32 stdcall , dwExitCode:DWORD
INCLUDE io.h 
cr EQU 0dh
Lf EQU 0ah


.STACK 4096

.DATA
result     BYTE 11 DUP (?),cr,Lf,0
string     BYTE 20 DUP (?)
arr        DWORD 50,40,20,30,10
siz  =  ($-arr)/4
siz_outter DWORD 0
siz_inner  DWORD 0
prm        BYTE "enter number : ",0
flag       DWORD 0


.CODE
_start:

comment !
;////////////////////////
; if you want to enter array elements    UNCOMMENT 
lea esi , arr
mov ecx,siz

_printARR
output prm
input string 
atod string 
mov [esi],eax
add esi,4
loop _printArr
;////////////////////////

!


mov eax,siz
mov siz_outter,eax
mov siz_inner,eax
dec siz_outter
dec siz_inner 

;///////////////////////////////

lea ebx,arr
mov esi,0
_for:

cmp esi , siz_outter
je end_for



mov edi,0
mov flag,0
_xfor:
cmp edi,siz_inner
je end_xfor


mov edx,edi
inc edx
mov ecx,[ebx+edx*4]
mov eax,[ebx+edi*4]



cmp eax,ecx
jl  oka
mov [ebx+edi*4],ecx
mov [ebx+edx*4],eax
inc flag

oka:

inc edi

jmp _xfor
end_xfor:

cmp flag,0
je end_for

inc esi
dec siz_inner
jmp _for

end_for:

;///////////////////////////////


;////////////////////////////
; * Printing array elements 

lea esi , arr
mov ecx,siz

_printARR:
dtoa result,[esi]
output result
add esi,4
loop _printArr
;////////////////////////////


invoke EXITPROCESS,0 
PUBLIC _start
END
