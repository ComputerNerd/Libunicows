%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetAddConnection3W@20
                    global WNetAddConnection3W
                    global _WNetAddConnection3W@20
                    global _Unicows_WNetAddConnection3W
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetAddConnection3W:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetAddConnection3W@20     ; place to save the pointer
                    push dword [_Unicows_WNetAddConnection3W]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetAddConnection3W      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetAddConnection3W:
_WNetAddConnection3W@20:
                    jmp [__imp__WNetAddConnection3W@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetAddConnection3W@20:   dd unicows_initial_stub_WNetAddConnection3W
_Unicows_WNetAddConnection3W:      dd 0
namestring_WNetAddConnection3W:    db 'WNetAddConnection3W',0
