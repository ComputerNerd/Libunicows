%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetGetNetworkInformationW@8
                    global WNetGetNetworkInformationW
                    global _WNetGetNetworkInformationW@8
                    global _Unicows_WNetGetNetworkInformationW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetGetNetworkInformationW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetNetworkInformationW@8     ; place to save the pointer
                    push dword [_Unicows_WNetGetNetworkInformationW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetNetworkInformationW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetGetNetworkInformationW:
_WNetGetNetworkInformationW@8:
                    jmp [__imp__WNetGetNetworkInformationW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetGetNetworkInformationW@8:   dd unicows_initial_stub_WNetGetNetworkInformationW
_Unicows_WNetGetNetworkInformationW:      dd 0
namestring_WNetGetNetworkInformationW:    db 'WNetGetNetworkInformationW',0
