%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__DefDlgProcW@16
                    global DefDlgProcW
                    global _DefDlgProcW@16
                    global _Unicows_DefDlgProcW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_DefDlgProcW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__DefDlgProcW@16     ; place to save the pointer
                    push dword [_Unicows_DefDlgProcW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_DefDlgProcW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

DefDlgProcW:
_DefDlgProcW@16:
                    jmp [__imp__DefDlgProcW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__DefDlgProcW@16:   dd unicows_initial_stub_DefDlgProcW
_Unicows_DefDlgProcW:      dd 0
namestring_DefDlgProcW:    db 'DefDlgProcW',0
