%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegEnumKeyW@16
                    global RegEnumKeyW
                    global _RegEnumKeyW@16
                    global _Unicows_RegEnumKeyW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegEnumKeyW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegEnumKeyW@16     ; place to save the pointer
                    push dword [_Unicows_RegEnumKeyW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegEnumKeyW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegEnumKeyW:
_RegEnumKeyW@16:
                    jmp [__imp__RegEnumKeyW@16]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegEnumKeyW@16:   dd unicows_initial_stub_RegEnumKeyW
_Unicows_RegEnumKeyW:      dd 0
namestring_RegEnumKeyW:    db 'RegEnumKeyW',0
