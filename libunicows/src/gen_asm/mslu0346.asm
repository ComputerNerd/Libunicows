%include "dll_names.inc"

                    global __imp__GetFullPathNameW@16
                    global GetFullPathNameW
                    global _GetFullPathNameW@16
                    global _Unicows_GetFullPathNameW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetFullPathNameW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetFullPathNameW@16     ; place to save the pointer
                    push dword [_Unicows_GetFullPathNameW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_GetFullPathNameW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetFullPathNameW:
_GetFullPathNameW@16:
                    jmp [__imp__GetFullPathNameW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetFullPathNameW@16:   dd unicows_initial_stub_GetFullPathNameW
_Unicows_GetFullPathNameW:      dd 0
namestring_GetFullPathNameW:    db 'GetFullPathNameW',0
