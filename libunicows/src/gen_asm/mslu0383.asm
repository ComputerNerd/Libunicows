%include "dll_names.inc"

%ifdef DIGITALMARS
                    group FLAT _TEXT _DATA
    ; DM is otherwise same as Borland:
    %define BORLAND 1
%endif

                    global __imp__MultiByteToWideChar@24
                    global MultiByteToWideChar
                    global _MultiByteToWideChar@24
                    global _Unicows_MultiByteToWideChar
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_MultiByteToWideChar:
                    ; Load the symbol...
                    pusha
                    push dword __imp__MultiByteToWideChar@24     ; place to save the pointer
                    push dword [_Unicows_MultiByteToWideChar]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_MultiByteToWideChar      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

MultiByteToWideChar:
_MultiByteToWideChar@24:
                    jmp [__imp__MultiByteToWideChar@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__MultiByteToWideChar@24:   dd unicows_initial_stub_MultiByteToWideChar
_Unicows_MultiByteToWideChar:      dd 0
namestring_MultiByteToWideChar:    db 'MultiByteToWideChar',0
