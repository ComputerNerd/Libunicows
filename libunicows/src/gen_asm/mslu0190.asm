%include "dll_names.inc"

                    global __imp__LoadImageW@24
                    global LoadImageW
                    global _LoadImageW@24
                    global _Unicows_LoadImageW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadImageW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadImageW@24     ; place to save the pointer
                    push dword [_Unicows_LoadImageW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadImageW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadImageW:
_LoadImageW@24:
                    jmp [__imp__LoadImageW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadImageW@24:   dd unicows_initial_stub_LoadImageW
_Unicows_LoadImageW:      dd 0
namestring_LoadImageW:    db 'LoadImageW',0
