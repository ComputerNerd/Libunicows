%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OleUIAddVerbMenuW@36
                    global OleUIAddVerbMenuW
                    global _OleUIAddVerbMenuW@36
                    global _Unicows_OleUIAddVerbMenuW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIAddVerbMenuW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIAddVerbMenuW@36     ; place to save the pointer
                    push dword [_Unicows_OleUIAddVerbMenuW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIAddVerbMenuW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIAddVerbMenuW:
_OleUIAddVerbMenuW@36:
                    jmp [__imp__OleUIAddVerbMenuW@36]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIAddVerbMenuW@36:   dd unicows_initial_stub_OleUIAddVerbMenuW
_Unicows_OleUIAddVerbMenuW:      dd 0
namestring_OleUIAddVerbMenuW:    db 'OleUIAddVerbMenuW',0
