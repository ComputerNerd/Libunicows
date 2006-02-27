%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetGetLastErrorW@20
                    global WNetGetLastErrorW
                    global _WNetGetLastErrorW@20
                    global _Unicows_WNetGetLastErrorW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetGetLastErrorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetLastErrorW@20     ; place to save the pointer
                    push dword [_Unicows_WNetGetLastErrorW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetLastErrorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetGetLastErrorW:
_WNetGetLastErrorW@20:
                    jmp [__imp__WNetGetLastErrorW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetGetLastErrorW@20:   dd unicows_initial_stub_WNetGetLastErrorW
_Unicows_WNetGetLastErrorW:      dd 0
namestring_WNetGetLastErrorW:    db 'WNetGetLastErrorW',0
