%include "dll_names.inc"

                    global __imp__OleUIInsertObjectW@4
                    global OleUIInsertObjectW
                    global _OleUIInsertObjectW@4
                    global _Unicows_OleUIInsertObjectW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIInsertObjectW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIInsertObjectW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIInsertObjectW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIInsertObjectW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIInsertObjectW:
_OleUIInsertObjectW@4:
                    jmp [__imp__OleUIInsertObjectW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIInsertObjectW@4:   dd unicows_initial_stub_OleUIInsertObjectW
_Unicows_OleUIInsertObjectW:      dd 0
namestring_OleUIInsertObjectW:    db 'OleUIInsertObjectW',0
