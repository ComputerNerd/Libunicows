%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegSaveKeyW@12
                    global RegSaveKeyW
                    global _RegSaveKeyW@12
                    global _Unicows_RegSaveKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegSaveKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegSaveKeyW@12     ; place to save the pointer
                    push dword [_Unicows_RegSaveKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegSaveKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegSaveKeyW:
_RegSaveKeyW@12:
                    jmp [__imp__RegSaveKeyW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegSaveKeyW@12:   dd unicows_initial_stub_RegSaveKeyW
_Unicows_RegSaveKeyW:      dd 0
namestring_RegSaveKeyW:    db 'RegSaveKeyW',0
