%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WNetUseConnectionW@32
                    global WNetUseConnectionW
                    global _WNetUseConnectionW@32
                    global _Unicows_WNetUseConnectionW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WNetUseConnectionW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WNetUseConnectionW@32     ; place to save the pointer
                    push dword [_Unicows_WNetUseConnectionW]      ; default proc, if any
                    push dword MPR                  ; dll id
                    push dword namestring_WNetUseConnectionW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WNetUseConnectionW:
_WNetUseConnectionW@32:
                    jmp [__imp__WNetUseConnectionW@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WNetUseConnectionW@32:   dd unicows_initial_stub_WNetUseConnectionW
_Unicows_WNetUseConnectionW:      dd 0
namestring_WNetUseConnectionW:    db 'WNetUseConnectionW',0
