%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegQueryValueW@16
                    global RegQueryValueW
                    global _RegQueryValueW@16
                    global _Unicows_RegQueryValueW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegQueryValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegQueryValueW@16     ; place to save the pointer
                    push dword [_Unicows_RegQueryValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegQueryValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegQueryValueW:
_RegQueryValueW@16:
                    jmp [__imp__RegQueryValueW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegQueryValueW@16:   dd unicows_initial_stub_RegQueryValueW
_Unicows_RegQueryValueW:      dd 0
namestring_RegQueryValueW:    db 'RegQueryValueW',0
