%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetConnectionDialog1W@4
                    global WNetConnectionDialog1W
                    global _WNetConnectionDialog1W@4
                    global _Unicows_WNetConnectionDialog1W
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetConnectionDialog1W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetConnectionDialog1W@4     ; place to save the pointer
                    push dword [_Unicows_WNetConnectionDialog1W]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetConnectionDialog1W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetConnectionDialog1W:
_WNetConnectionDialog1W@4:
                    jmp [__imp__WNetConnectionDialog1W@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetConnectionDialog1W@4:   dd unicows_initial_stub_WNetConnectionDialog1W
_Unicows_WNetConnectionDialog1W:      dd 0
namestring_WNetConnectionDialog1W:    db 'WNetConnectionDialog1W',0
