%include "dll_names.inc"

                    global __imp__LoadCursorW@8
                    global LoadCursorW
                    global _LoadCursorW@8
                    global _Unicows_LoadCursorW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_LoadCursorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__LoadCursorW@8     ; place to save the pointer
                    push dword [_Unicows_LoadCursorW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_LoadCursorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

LoadCursorW:
_LoadCursorW@8:
                    jmp [__imp__LoadCursorW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__LoadCursorW@8:   dd unicows_initial_stub_LoadCursorW
_Unicows_LoadCursorW:      dd 0
namestring_LoadCursorW:    db 'LoadCursorW',0
