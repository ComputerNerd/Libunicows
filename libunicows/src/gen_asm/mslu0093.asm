%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OleUIConvertW@4
                    global OleUIConvertW
                    global _OleUIConvertW@4
                    global _Unicows_OleUIConvertW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIConvertW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIConvertW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIConvertW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIConvertW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIConvertW:
_OleUIConvertW@4:
                    jmp [__imp__OleUIConvertW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIConvertW@4:   dd unicows_initial_stub_OleUIConvertW
_Unicows_OleUIConvertW:      dd 0
namestring_OleUIConvertW:    db 'OleUIConvertW',0
