%include "dll_names.inc"

                    global __imp__WNetGetUniversalNameW@16
                    global WNetGetUniversalNameW
                    global _WNetGetUniversalNameW@16
                    global _Unicows_WNetGetUniversalNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetGetUniversalNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetUniversalNameW@16     ; place to save the pointer
                    push dword [_Unicows_WNetGetUniversalNameW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetUniversalNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetGetUniversalNameW:
_WNetGetUniversalNameW@16:
                    jmp [__imp__WNetGetUniversalNameW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetGetUniversalNameW@16:   dd unicows_initial_stub_WNetGetUniversalNameW
_Unicows_WNetGetUniversalNameW:      dd 0
namestring_WNetGetUniversalNameW:    db 'WNetGetUniversalNameW',0
