%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WinHelpW@16
                    global WinHelpW
                    global _WinHelpW@16
                    global _Unicows_WinHelpW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WinHelpW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WinHelpW@16     ; place to save the pointer
                    push dword [_Unicows_WinHelpW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_WinHelpW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WinHelpW:
_WinHelpW@16:
                    jmp [__imp__WinHelpW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WinHelpW@16:   dd unicows_initial_stub_WinHelpW
_Unicows_WinHelpW:      dd 0
namestring_WinHelpW:    db 'WinHelpW',0
