%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OleUIChangeSourceW@4
                    global OleUIChangeSourceW
                    global _OleUIChangeSourceW@4
                    global _Unicows_OleUIChangeSourceW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIChangeSourceW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIChangeSourceW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIChangeSourceW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIChangeSourceW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIChangeSourceW:
_OleUIChangeSourceW@4:
                    jmp [__imp__OleUIChangeSourceW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIChangeSourceW@4:   dd unicows_initial_stub_OleUIChangeSourceW
_Unicows_OleUIChangeSourceW:      dd 0
namestring_OleUIChangeSourceW:    db 'OleUIChangeSourceW',0
