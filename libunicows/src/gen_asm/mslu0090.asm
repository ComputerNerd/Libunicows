%include "dll_names.inc"

                    global __imp__OleUIBusyW@4
                    global OleUIBusyW
                    global _OleUIBusyW@4
                    global _Unicows_OleUIBusyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIBusyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIBusyW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIBusyW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIBusyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIBusyW:
_OleUIBusyW@4:
                    jmp [__imp__OleUIBusyW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIBusyW@4:   dd unicows_initial_stub_OleUIBusyW
_Unicows_OleUIBusyW:      dd 0
namestring_OleUIBusyW:    db 'OleUIBusyW',0
