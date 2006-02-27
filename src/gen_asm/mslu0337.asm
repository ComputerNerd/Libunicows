%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__FindResourceW@12
                    global FindResourceW
                    global _FindResourceW@12
                    global _Unicows_FindResourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_FindResourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__FindResourceW@12     ; place to save the pointer
                    push dword [_Unicows_FindResourceW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_FindResourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

FindResourceW:
_FindResourceW@12:
                    jmp [__imp__FindResourceW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__FindResourceW@12:   dd unicows_initial_stub_FindResourceW
_Unicows_FindResourceW:      dd 0
namestring_FindResourceW:    db 'FindResourceW',0