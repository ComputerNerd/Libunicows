%include "dll_names.inc"

                    global __imp__GetProfileIntW@12
                    global GetProfileIntW
                    global _GetProfileIntW@12
                    global _Unicows_GetProfileIntW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetProfileIntW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetProfileIntW@12     ; place to save the pointer
                    push dword [_Unicows_GetProfileIntW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetProfileIntW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetProfileIntW:
_GetProfileIntW@12:
                    jmp [__imp__GetProfileIntW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetProfileIntW@12:   dd unicows_initial_stub_GetProfileIntW
_Unicows_GetProfileIntW:      dd 0
namestring_GetProfileIntW:    db 'GetProfileIntW',0
