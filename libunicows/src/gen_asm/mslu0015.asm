%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetGetResourceParentW@12
                    global WNetGetResourceParentW
                    global _WNetGetResourceParentW@12
                    global _Unicows_WNetGetResourceParentW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetGetResourceParentW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetResourceParentW@12     ; place to save the pointer
                    push dword [_Unicows_WNetGetResourceParentW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetResourceParentW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetGetResourceParentW:
_WNetGetResourceParentW@12:
                    jmp [__imp__WNetGetResourceParentW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetGetResourceParentW@12:   dd unicows_initial_stub_WNetGetResourceParentW
_Unicows_WNetGetResourceParentW:      dd 0
namestring_WNetGetResourceParentW:    db 'WNetGetResourceParentW',0
