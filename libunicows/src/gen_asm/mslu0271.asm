%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegCreateKeyW@12
                    global RegCreateKeyW
                    global _RegCreateKeyW@12
                    global _Unicows_RegCreateKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegCreateKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegCreateKeyW@12     ; place to save the pointer
                    push dword [_Unicows_RegCreateKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegCreateKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegCreateKeyW:
_RegCreateKeyW@12:
                    jmp [__imp__RegCreateKeyW@12]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegCreateKeyW@12:   dd unicows_initial_stub_RegCreateKeyW
_Unicows_RegCreateKeyW:      dd 0
namestring_RegCreateKeyW:    db 'RegCreateKeyW',0
