%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetGetProviderNameW@12
                    global WNetGetProviderNameW
                    global _WNetGetProviderNameW@12
                    global _Unicows_WNetGetProviderNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetGetProviderNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetGetProviderNameW@12     ; place to save the pointer
                    push dword [_Unicows_WNetGetProviderNameW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetGetProviderNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetGetProviderNameW:
_WNetGetProviderNameW@12:
                    jmp [__imp__WNetGetProviderNameW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetGetProviderNameW@12:   dd unicows_initial_stub_WNetGetProviderNameW
_Unicows_WNetGetProviderNameW:      dd 0
namestring_WNetGetProviderNameW:    db 'WNetGetProviderNameW',0
