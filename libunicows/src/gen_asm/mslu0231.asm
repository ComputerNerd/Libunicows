%include "dll_names.inc"

                    global __imp__UnregisterClassW@8
                    global UnregisterClassW
                    global _UnregisterClassW@8
                    global _Unicows_UnregisterClassW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_UnregisterClassW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__UnregisterClassW@8     ; place to save the pointer
                    push dword [_Unicows_UnregisterClassW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_UnregisterClassW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

UnregisterClassW:
_UnregisterClassW@8:
                    jmp [__imp__UnregisterClassW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__UnregisterClassW@8:   dd unicows_initial_stub_UnregisterClassW
_Unicows_UnregisterClassW:      dd 0
namestring_UnregisterClassW:    db 'UnregisterClassW',0
