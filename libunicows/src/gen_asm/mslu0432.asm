%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__WriteProfileStringW@12
                    global WriteProfileStringW
                    global _WriteProfileStringW@12
                    global _Unicows_WriteProfileStringW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_WriteProfileStringW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__WriteProfileStringW@12     ; place to save the pointer
                    push dword [_Unicows_WriteProfileStringW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_WriteProfileStringW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

WriteProfileStringW:
_WriteProfileStringW@12:
                    jmp [__imp__WriteProfileStringW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__WriteProfileStringW@12:   dd unicows_initial_stub_WriteProfileStringW
_Unicows_WriteProfileStringW:      dd 0
namestring_WriteProfileStringW:    db 'WriteProfileStringW',0
