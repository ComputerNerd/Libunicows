%include "dll_names.inc"

                    global __imp__GetShortPathNameW@12
                    global GetShortPathNameW
                    global _GetShortPathNameW@12
                    global _Unicows_GetShortPathNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetShortPathNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetShortPathNameW@12     ; place to save the pointer
                    push dword [_Unicows_GetShortPathNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetShortPathNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetShortPathNameW:
_GetShortPathNameW@12:
                    jmp [__imp__GetShortPathNameW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetShortPathNameW@12:   dd unicows_initial_stub_GetShortPathNameW
_Unicows_GetShortPathNameW:      dd 0
namestring_GetShortPathNameW:    db 'GetShortPathNameW',0
