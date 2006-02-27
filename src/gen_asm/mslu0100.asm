%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__OleUIUpdateLinksW@16
                    global OleUIUpdateLinksW
                    global _OleUIUpdateLinksW@16
                    global _Unicows_OleUIUpdateLinksW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_OleUIUpdateLinksW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__OleUIUpdateLinksW@16     ; place to save the pointer
                    push dword [_Unicows_OleUIUpdateLinksW]      ; default proc, if any
                    push dword OLEDLG                  ; dll id
                    push dword namestring_OleUIUpdateLinksW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

OleUIUpdateLinksW:
_OleUIUpdateLinksW@16:
                    jmp [__imp__OleUIUpdateLinksW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__OleUIUpdateLinksW@16:   dd unicows_initial_stub_OleUIUpdateLinksW
_Unicows_OleUIUpdateLinksW:      dd 0
namestring_OleUIUpdateLinksW:    db 'OleUIUpdateLinksW',0
