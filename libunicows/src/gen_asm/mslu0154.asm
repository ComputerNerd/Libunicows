%include "dll_names.inc"

                    global __imp__GetClassInfoExW@12
                    global GetClassInfoExW
                    global _GetClassInfoExW@12
                    global _Unicows_GetClassInfoExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_GetClassInfoExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__GetClassInfoExW@12     ; place to save the pointer
                    push dword [_Unicows_GetClassInfoExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_GetClassInfoExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

GetClassInfoExW:
_GetClassInfoExW@12:
                    jmp [__imp__GetClassInfoExW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__GetClassInfoExW@12:   dd unicows_initial_stub_GetClassInfoExW
_Unicows_GetClassInfoExW:      dd 0
namestring_GetClassInfoExW:    db 'GetClassInfoExW',0
