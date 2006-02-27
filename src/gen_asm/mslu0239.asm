%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__ExtractIconExW@20
                    global ExtractIconExW
                    global _ExtractIconExW@20
                    global _Unicows_ExtractIconExW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_ExtractIconExW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__ExtractIconExW@20     ; place to save the pointer
                    push dword [_Unicows_ExtractIconExW]      ; default proc, if any
                    push dword SHELL32                  ; dll id
                    push dword namestring_ExtractIconExW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

ExtractIconExW:
_ExtractIconExW@20:
                    jmp [__imp__ExtractIconExW@20]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__ExtractIconExW@20:   dd unicows_initial_stub_ExtractIconExW
_Unicows_ExtractIconExW:      dd 0
namestring_ExtractIconExW:    db 'ExtractIconExW',0
