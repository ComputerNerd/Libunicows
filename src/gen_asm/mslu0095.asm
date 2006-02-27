%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OleUIEditLinksW@4
                    global OleUIEditLinksW
                    global _OleUIEditLinksW@4
                    global _Unicows_OleUIEditLinksW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIEditLinksW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIEditLinksW@4     ; place to save the pointer
                    push dword [_Unicows_OleUIEditLinksW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIEditLinksW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIEditLinksW:
_OleUIEditLinksW@4:
                    jmp [__imp__OleUIEditLinksW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIEditLinksW@4:   dd unicows_initial_stub_OleUIEditLinksW
_Unicows_OleUIEditLinksW:      dd 0
namestring_OleUIEditLinksW:    db 'OleUIEditLinksW',0
