%include "dll_names.inc"

                    global __imp__RegQueryInfoKeyW@48
                    global RegQueryInfoKeyW
                    global _RegQueryInfoKeyW@48
                    global _Unicows_RegQueryInfoKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegQueryInfoKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegQueryInfoKeyW@48     ; place to save the pointer
                    push dword [_Unicows_RegQueryInfoKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegQueryInfoKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegQueryInfoKeyW:
_RegQueryInfoKeyW@48:
                    jmp [__imp__RegQueryInfoKeyW@48]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegQueryInfoKeyW@48:   dd unicows_initial_stub_RegQueryInfoKeyW
_Unicows_RegQueryInfoKeyW:      dd 0
namestring_RegQueryInfoKeyW:    db 'RegQueryInfoKeyW',0
