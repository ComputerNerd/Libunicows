%include "dll_names.inc"

                    global __imp__SearchPathW@24
                    global SearchPathW
                    global _SearchPathW@24
                    global _Unicows_SearchPathW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_SearchPathW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__SearchPathW@24     ; place to save the pointer
                    push dword [_Unicows_SearchPathW]      ; default proc, if any
                    push dword KERNEL32                  ; dll id
                    push dword namestring_SearchPathW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

SearchPathW:
_SearchPathW@24:
                    jmp [__imp__SearchPathW@24]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__SearchPathW@24:   dd unicows_initial_stub_SearchPathW
_Unicows_SearchPathW:      dd 0
namestring_SearchPathW:    db 'SearchPathW',0
