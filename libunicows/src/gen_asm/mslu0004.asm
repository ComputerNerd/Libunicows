%include "dll_names.inc"

                    global __imp__WNetAddConnectionW@12
                    global WNetAddConnectionW
                    global _WNetAddConnectionW@12
                    global _Unicows_WNetAddConnectionW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetAddConnectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetAddConnectionW@12     ; place to save the pointer
                    push dword [_Unicows_WNetAddConnectionW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetAddConnectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetAddConnectionW:
_WNetAddConnectionW@12:
                    jmp [__imp__WNetAddConnectionW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetAddConnectionW@12:   dd unicows_initial_stub_WNetAddConnectionW
_Unicows_WNetAddConnectionW:      dd 0
namestring_WNetAddConnectionW:    db 'WNetAddConnectionW',0
