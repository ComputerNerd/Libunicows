%include "dll_names.inc"

                    global __imp__LoadMenuIndirectW@4
                    global LoadMenuIndirectW
                    global _LoadMenuIndirectW@4
                    global _Unicows_LoadMenuIndirectW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadMenuIndirectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadMenuIndirectW@4     ; place to save the pointer
                    push dword [_Unicows_LoadMenuIndirectW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadMenuIndirectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadMenuIndirectW:
_LoadMenuIndirectW@4:
                    jmp [__imp__LoadMenuIndirectW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadMenuIndirectW@4:   dd unicows_initial_stub_LoadMenuIndirectW
_Unicows_LoadMenuIndirectW:      dd 0
namestring_LoadMenuIndirectW:    db 'LoadMenuIndirectW',0
