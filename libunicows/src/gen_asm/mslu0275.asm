%include "dll_names.inc"

                    global __imp__RegReplaceKeyW@16
                    global RegReplaceKeyW
                    global _RegReplaceKeyW@16
                    global _Unicows_RegReplaceKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegReplaceKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegReplaceKeyW@16     ; place to save the pointer
                    push dword [_Unicows_RegReplaceKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegReplaceKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegReplaceKeyW:
_RegReplaceKeyW@16:
                    jmp [__imp__RegReplaceKeyW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegReplaceKeyW@16:   dd unicows_initial_stub_RegReplaceKeyW
_Unicows_RegReplaceKeyW:      dd 0
namestring_RegReplaceKeyW:    db 'RegReplaceKeyW',0
