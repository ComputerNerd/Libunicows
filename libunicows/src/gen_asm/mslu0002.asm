%include "dll_names.inc"

                    global __imp__WNetAddConnection2W@16
                    global WNetAddConnection2W
                    global _WNetAddConnection2W@16
                    global _Unicows_WNetAddConnection2W
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetAddConnection2W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetAddConnection2W@16     ; place to save the pointer
                    push dword [_Unicows_WNetAddConnection2W]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetAddConnection2W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetAddConnection2W:
_WNetAddConnection2W@16:
                    jmp [__imp__WNetAddConnection2W@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetAddConnection2W@16:   dd unicows_initial_stub_WNetAddConnection2W
_Unicows_WNetAddConnection2W:      dd 0
namestring_WNetAddConnection2W:    db 'WNetAddConnection2W',0
