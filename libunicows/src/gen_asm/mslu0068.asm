%include "dll_names.inc"

                    global __imp__mciSendStringW@16
                    global mciSendStringW
                    global _mciSendStringW@16
                    global _Unicows_mciSendStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_mciSendStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__mciSendStringW@16     ; place to save the pointer
                    push dword [_Unicows_mciSendStringW]      ; default proc, if any
                    push dword WINMM                  ; dll id
                    push dword namestring_mciSendStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

mciSendStringW:
_mciSendStringW@16:
                    jmp [__imp__mciSendStringW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__mciSendStringW@16:   dd unicows_initial_stub_mciSendStringW
_Unicows_mciSendStringW:      dd 0
namestring_mciSendStringW:    db 'mciSendStringW',0
