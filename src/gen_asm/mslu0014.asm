%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetGetResourceInformationW@16
                    global WNetGetResourceInformationW
                    global _WNetGetResourceInformationW@16
                    global _Unicows_WNetGetResourceInformationW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetGetResourceInformationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetResourceInformationW@16     ; place to save the pointer
                    push dword [_Unicows_WNetGetResourceInformationW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetResourceInformationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetGetResourceInformationW:
_WNetGetResourceInformationW@16:
                    jmp [__imp__WNetGetResourceInformationW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetGetResourceInformationW@16:   dd unicows_initial_stub_WNetGetResourceInformationW
_Unicows_WNetGetResourceInformationW:      dd 0
namestring_WNetGetResourceInformationW:    db 'WNetGetResourceInformationW',0
