%include "dll_names.inc"

                    global __imp__LoadIconW@8
                    global LoadIconW
                    global _LoadIconW@8
                    global _Unicows_LoadIconW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadIconW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadIconW@8     ; place to save the pointer
                    push dword [_Unicows_LoadIconW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadIconW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadIconW:
_LoadIconW@8:
                    jmp [__imp__LoadIconW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadIconW@8:   dd unicows_initial_stub_LoadIconW
_Unicows_LoadIconW:      dd 0
namestring_LoadIconW:    db 'LoadIconW',0
