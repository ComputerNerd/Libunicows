%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ChooseColorW@4
                    global ChooseColorW
                    global _ChooseColorW@4
                    global _Unicows_ChooseColorW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ChooseColorW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ChooseColorW@4     ; place to save the pointer
                    push dword [_Unicows_ChooseColorW]      ; default proc, if any
                    push dword COMDLG32                  ; dll id
                    push dword namestring_ChooseColorW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ChooseColorW:
_ChooseColorW@4:
                    jmp [__imp__ChooseColorW@4]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ChooseColorW@4:   dd unicows_initial_stub_ChooseColorW
_Unicows_ChooseColorW:      dd 0
namestring_ChooseColorW:    db 'ChooseColorW',0
