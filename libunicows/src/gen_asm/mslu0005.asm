%include "dll_names.inc"

                    global __imp__WNetCancelConnection2W@12
                    global WNetCancelConnection2W
                    global _WNetCancelConnection2W@12
                    global _Unicows_WNetCancelConnection2W
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetCancelConnection2W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetCancelConnection2W@12     ; place to save the pointer
                    push dword [_Unicows_WNetCancelConnection2W]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetCancelConnection2W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetCancelConnection2W:
_WNetCancelConnection2W@12:
                    jmp [__imp__WNetCancelConnection2W@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetCancelConnection2W@12:   dd unicows_initial_stub_WNetCancelConnection2W
_Unicows_WNetCancelConnection2W:      dd 0
namestring_WNetCancelConnection2W:    db 'WNetCancelConnection2W',0
