%include "dll_names.inc"

                    global __imp__GetCharABCWidthsW@16
                    global GetCharABCWidthsW
                    global _GetCharABCWidthsW@16
                    global _Unicows_GetCharABCWidthsW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetCharABCWidthsW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetCharABCWidthsW@16     ; place to save the pointer
                    push dword [_Unicows_GetCharABCWidthsW]      ; default proc, if any
                    push dword GDI32                  ; dll id
                    push dword namestring_GetCharABCWidthsW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetCharABCWidthsW:
_GetCharABCWidthsW@16:
                    jmp [__imp__GetCharABCWidthsW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetCharABCWidthsW@16:   dd unicows_initial_stub_GetCharABCWidthsW
_Unicows_GetCharABCWidthsW:      dd 0
namestring_GetCharABCWidthsW:    db 'GetCharABCWidthsW',0
