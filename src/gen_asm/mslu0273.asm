%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegDeleteValueW@8
                    global RegDeleteValueW
                    global _RegDeleteValueW@8
                    global _Unicows_RegDeleteValueW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegDeleteValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegDeleteValueW@8     ; place to save the pointer
                    push dword [_Unicows_RegDeleteValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegDeleteValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegDeleteValueW:
_RegDeleteValueW@8:
                    jmp [__imp__RegDeleteValueW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegDeleteValueW@8:   dd unicows_initial_stub_RegDeleteValueW
_Unicows_RegDeleteValueW:      dd 0
namestring_RegDeleteValueW:    db 'RegDeleteValueW',0
