%include "dll_names.inc"

                    global __imp__GetPrivateProfileStringW@24
                    global GetPrivateProfileStringW
                    global _GetPrivateProfileStringW@24
                    global _Unicows_GetPrivateProfileStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetPrivateProfileStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetPrivateProfileStringW@24     ; place to save the pointer
                    push dword [_Unicows_GetPrivateProfileStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetPrivateProfileStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetPrivateProfileStringW:
_GetPrivateProfileStringW@24:
                    jmp [__imp__GetPrivateProfileStringW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetPrivateProfileStringW@24:   dd unicows_initial_stub_GetPrivateProfileStringW
_Unicows_GetPrivateProfileStringW:      dd 0
namestring_GetPrivateProfileStringW:    db 'GetPrivateProfileStringW',0
