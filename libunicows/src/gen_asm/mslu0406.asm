%include "dll_names.inc"

                    global __imp__SetLocaleInfoW@12
                    global SetLocaleInfoW
                    global _SetLocaleInfoW@12
                    global _Unicows_SetLocaleInfoW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SetLocaleInfoW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SetLocaleInfoW@12     ; place to save the pointer
                    push dword [_Unicows_SetLocaleInfoW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SetLocaleInfoW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SetLocaleInfoW:
_SetLocaleInfoW@12:
                    jmp [__imp__SetLocaleInfoW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SetLocaleInfoW@12:   dd unicows_initial_stub_SetLocaleInfoW
_Unicows_SetLocaleInfoW:      dd 0
namestring_SetLocaleInfoW:    db 'SetLocaleInfoW',0
