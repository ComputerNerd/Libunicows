%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__RegEnumValueW@32
                    global RegEnumValueW
                    global _RegEnumValueW@32
                    global _Unicows_RegEnumValueW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_RegEnumValueW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__RegEnumValueW@32     ; place to save the pointer
                    push dword [_Unicows_RegEnumValueW]      ; default proc, if any
                    push dword ADVAPI32                  ; dll id
                    push dword namestring_RegEnumValueW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

RegEnumValueW:
_RegEnumValueW@32:
                    jmp [__imp__RegEnumValueW@32]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__RegEnumValueW@32:   dd unicows_initial_stub_RegEnumValueW
_Unicows_RegEnumValueW:      dd 0
namestring_RegEnumValueW:    db 'RegEnumValueW',0
