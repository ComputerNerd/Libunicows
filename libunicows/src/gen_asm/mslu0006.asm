%include "dll_names.inc"

                    global __imp__WNetCancelConnectionW@8
                    global WNetCancelConnectionW
                    global _WNetCancelConnectionW@8
                    global _Unicows_WNetCancelConnectionW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetCancelConnectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetCancelConnectionW@8     ; place to save the pointer
                    push dword [_Unicows_WNetCancelConnectionW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetCancelConnectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetCancelConnectionW:
_WNetCancelConnectionW@8:
                    jmp [__imp__WNetCancelConnectionW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetCancelConnectionW@8:   dd unicows_initial_stub_WNetCancelConnectionW
_Unicows_WNetCancelConnectionW:      dd 0
namestring_WNetCancelConnectionW:    db 'WNetCancelConnectionW',0
