%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegUnLoadKeyW@8
                    global RegUnLoadKeyW
                    global _RegUnLoadKeyW@8
                    global _Unicows_RegUnLoadKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegUnLoadKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegUnLoadKeyW@8     ; place to save the pointer
                    push dword [_Unicows_RegUnLoadKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegUnLoadKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegUnLoadKeyW:
_RegUnLoadKeyW@8:
                    jmp [__imp__RegUnLoadKeyW@8]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegUnLoadKeyW@8:   dd unicows_initial_stub_RegUnLoadKeyW
_Unicows_RegUnLoadKeyW:      dd 0
namestring_RegUnLoadKeyW:    db 'RegUnLoadKeyW',0
