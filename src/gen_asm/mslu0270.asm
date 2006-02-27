%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegCreateKeyExW@36
                    global RegCreateKeyExW
                    global _RegCreateKeyExW@36
                    global _Unicows_RegCreateKeyExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegCreateKeyExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegCreateKeyExW@36     ; place to save the pointer
                    push dword [_Unicows_RegCreateKeyExW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegCreateKeyExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegCreateKeyExW:
_RegCreateKeyExW@36:
                    jmp [__imp__RegCreateKeyExW@36]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegCreateKeyExW@36:   dd unicows_initial_stub_RegCreateKeyExW
_Unicows_RegCreateKeyExW:      dd 0
namestring_RegCreateKeyExW:    db 'RegCreateKeyExW',0
