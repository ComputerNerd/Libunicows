%include "dll_names.inc"

                    global __imp__EnumPropsExW@12
                    global EnumPropsExW
                    global _EnumPropsExW@12
                    global _Unicows_EnumPropsExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_EnumPropsExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__EnumPropsExW@12     ; place to save the pointer
                    push dword [_Unicows_EnumPropsExW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_EnumPropsExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

EnumPropsExW:
_EnumPropsExW@12:
                    jmp [__imp__EnumPropsExW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__EnumPropsExW@12:   dd unicows_initial_stub_EnumPropsExW
_Unicows_EnumPropsExW:      dd 0
namestring_EnumPropsExW:    db 'EnumPropsExW',0
