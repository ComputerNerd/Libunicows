%include "dll_names.inc"

                    global __imp__wsprintfW
                    global wsprintfW
                    global _wsprintfW
                    global _Unicows_wsprintfW
                  
                    extern _LoadUnicowsSymbol

%ifdef BORLAND
                    section  _TEXT class=CODE code  use32
%else
                    section .text
%endif

unicows_initial_stub_wsprintfW:
                    ; Load the symbol...
                    pusha
                    push dword __imp__wsprintfW     ; place to save the pointer
                    push dword [_Unicows_wsprintfW]      ; default proc, if any
                    push dword USER32                  ; dll id
                    push dword namestring_wsprintfW      ; name of the function
                    call _LoadUnicowsSymbol
                    add  esp,byte 16
                    popa

                    ; ...and skip to it (see following jmp instruction):

wsprintfW:
_wsprintfW:
                    jmp [__imp__wsprintfW]

%ifdef BORLAND
                    section  _DATA class=DATA data use32
%else
                    section .data
%endif

__imp__wsprintfW:   dd unicows_initial_stub_wsprintfW
_Unicows_wsprintfW:      dd 0
namestring_wsprintfW:    db 'wsprintfW',0
