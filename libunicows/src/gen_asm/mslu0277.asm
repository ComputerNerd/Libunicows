%include "dll_names.inc"

                    global __imp__RegSetValueExW@24
                    global RegSetValueExW
                    global _RegSetValueExW@24
                    global _Unicows_RegSetValueExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegSetValueExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegSetValueExW@24     ; place to save the pointer
                    push dword [_Unicows_RegSetValueExW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegSetValueExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegSetValueExW:
_RegSetValueExW@24:
                    jmp [__imp__RegSetValueExW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegSetValueExW@24:   dd unicows_initial_stub_RegSetValueExW
_Unicows_RegSetValueExW:      dd 0
namestring_RegSetValueExW:    db 'RegSetValueExW',0
