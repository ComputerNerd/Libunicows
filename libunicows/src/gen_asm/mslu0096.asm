%include "dll_names.inc"

                    global __imp__OleUIObjectPropertiesW@4
                    global OleUIObjectPropertiesW
                    global _OleUIObjectPropertiesW@4
                    global _Unicows_OleUIObjectPropertiesW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIObjectPropertiesW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIObjectPropertiesW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIObjectPropertiesW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIObjectPropertiesW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIObjectPropertiesW:
_OleUIObjectPropertiesW@4:
                    jmp [__imp__OleUIObjectPropertiesW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIObjectPropertiesW@4:   dd unicows_initial_stub_OleUIObjectPropertiesW
_Unicows_OleUIObjectPropertiesW:      dd 0
namestring_OleUIObjectPropertiesW:    db 'OleUIObjectPropertiesW',0
