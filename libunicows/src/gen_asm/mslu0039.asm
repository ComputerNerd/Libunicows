%include "dll_names.inc"

                    global __imp__GetCharWidthW@16
                    global GetCharWidthW
                    global _GetCharWidthW@16
                    global _Unicows_GetCharWidthW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCharWidthW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCharWidthW@16     ; place to save the pointer
                    push dword [_Unicows_GetCharWidthW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetCharWidthW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCharWidthW:
_GetCharWidthW@16:
                    jmp [__imp__GetCharWidthW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCharWidthW@16:   dd unicows_initial_stub_GetCharWidthW
_Unicows_GetCharWidthW:      dd 0
namestring_GetCharWidthW:    db 'GetCharWidthW',0
