%include "dll_names.inc"

                    global __imp__GetCharWidthFloatW@16
                    global GetCharWidthFloatW
                    global _GetCharWidthFloatW@16
                    global _Unicows_GetCharWidthFloatW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCharWidthFloatW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCharWidthFloatW@16     ; place to save the pointer
                    push dword [_Unicows_GetCharWidthFloatW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetCharWidthFloatW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCharWidthFloatW:
_GetCharWidthFloatW@16:
                    jmp [__imp__GetCharWidthFloatW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCharWidthFloatW@16:   dd unicows_initial_stub_GetCharWidthFloatW
_Unicows_GetCharWidthFloatW:      dd 0
namestring_GetCharWidthFloatW:    db 'GetCharWidthFloatW',0
