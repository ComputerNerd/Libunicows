%include "dll_names.inc"

                    global __imp__LoadMenuW@8
                    global LoadMenuW
                    global _LoadMenuW@8
                    global _Unicows_LoadMenuW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadMenuW@8     ; place to save the pointer
                    push dword [_Unicows_LoadMenuW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadMenuW:
_LoadMenuW@8:
                    jmp [__imp__LoadMenuW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadMenuW@8:   dd unicows_initial_stub_LoadMenuW
_Unicows_LoadMenuW:      dd 0
namestring_LoadMenuW:    db 'LoadMenuW',0
