%include "dll_names.inc"

                    global __imp__RegQueryValueExW@24
                    global RegQueryValueExW
                    global _RegQueryValueExW@24
                    global _Unicows_RegQueryValueExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegQueryValueExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegQueryValueExW@24     ; place to save the pointer
                    push dword [_Unicows_RegQueryValueExW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegQueryValueExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegQueryValueExW:
_RegQueryValueExW@24:
                    jmp [__imp__RegQueryValueExW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegQueryValueExW@24:   dd unicows_initial_stub_RegQueryValueExW
_Unicows_RegQueryValueExW:      dd 0
namestring_RegQueryValueExW:    db 'RegQueryValueExW',0
