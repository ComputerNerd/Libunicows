%include "dll_names.inc"

                    global __imp__RegDeleteKeyW@8
                    global RegDeleteKeyW
                    global _RegDeleteKeyW@8
                    global _Unicows_RegDeleteKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegDeleteKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegDeleteKeyW@8     ; place to save the pointer
                    push dword [_Unicows_RegDeleteKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegDeleteKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegDeleteKeyW:
_RegDeleteKeyW@8:
                    jmp [__imp__RegDeleteKeyW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegDeleteKeyW@8:   dd unicows_initial_stub_RegDeleteKeyW
_Unicows_RegDeleteKeyW:      dd 0
namestring_RegDeleteKeyW:    db 'RegDeleteKeyW',0
