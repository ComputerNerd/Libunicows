%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegSetValueW@20
                    global RegSetValueW
                    global _RegSetValueW@20
                    global _Unicows_RegSetValueW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegSetValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegSetValueW@20     ; place to save the pointer
                    push dword [_Unicows_RegSetValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegSetValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegSetValueW:
_RegSetValueW@20:
                    jmp [__imp__RegSetValueW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegSetValueW@20:   dd unicows_initial_stub_RegSetValueW
_Unicows_RegSetValueW:      dd 0
namestring_RegSetValueW:    db 'RegSetValueW',0
