%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegOpenKeyW@12
                    global RegOpenKeyW
                    global _RegOpenKeyW@12
                    global _Unicows_RegOpenKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegOpenKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegOpenKeyW@12     ; place to save the pointer
                    push dword [_Unicows_RegOpenKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegOpenKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegOpenKeyW:
_RegOpenKeyW@12:
                    jmp [__imp__RegOpenKeyW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegOpenKeyW@12:   dd unicows_initial_stub_RegOpenKeyW
_Unicows_RegOpenKeyW:      dd 0
namestring_RegOpenKeyW:    db 'RegOpenKeyW',0
