%include "dll_names.inc"

                    global __imp__GetWindowTextW@12
                    global GetWindowTextW
                    global _GetWindowTextW@12
                    global _Unicows_GetWindowTextW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetWindowTextW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetWindowTextW@12     ; place to save the pointer
                    push dword [_Unicows_GetWindowTextW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetWindowTextW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetWindowTextW:
_GetWindowTextW@12:
                    jmp [__imp__GetWindowTextW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetWindowTextW@12:   dd unicows_initial_stub_GetWindowTextW
_Unicows_GetWindowTextW:      dd 0
namestring_GetWindowTextW:    db 'GetWindowTextW',0
